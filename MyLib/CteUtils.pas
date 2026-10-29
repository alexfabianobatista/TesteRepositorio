unit CteUtils;

interface

uses
  CteTypes, Cte, CteOS, Envolvido, IdeCte, IdeCteOS, InfCteNorm, InfCteComp, InfCteAnu, InfCarga, Rodo, Occ, RodoOS, ICMSCte, Cobr, CTeConsts, Toma,
  Compl, XMLUtils, Dialogs, EnderecoCte, DocAnt, EventoCTe;

type
  TCteUtils = class
  public                             
    class function GeraChaveAcesso(CodUF: Integer; DtEmissao: TDateTime;
      TpEmis, CNPJ: string; Modelo, Serie, NumeroCT: Integer): string;
    class function GeraCTe(CodCT: Integer): TCTe;
    class function GeraCTeOS(CodCT: Integer): TCTeOS;
    class function GeraXMLCTe(CodCT: Integer): String; overload;
    class function GeraXMLCTe(CTe: TCTe): String; overload;
    class function GeraXMLCTeOS(CodCT: Integer): String; overload;
    class function GeraXMLCTeOS(CTe: TCTeOS): String; overload;
    class function GeraCTeEvento(wTpEvento: Integer): TEventoCTe;
    class function GeraXMLCTeEvento(wTpEvento: Integer): String; overload;
    class function GeraXMLCTeEvento(CTeEvento: TEventoCTe): String; overload;
  end;

implementation

uses UNfe_cl, SysUtils, CteVersao, DB, DateUtils, UBiblioteca, StrUtils, Variants, Classes, UParamSistema_cl,
  UConhecimento_cl, UOracle_cl, TomaICMS, IBSCBSCTe;

{ TCteUtils }

class function TCteUtils.GeraChaveAcesso(CodUF: Integer; DtEmissao: TDateTime; TpEmis, CNPJ: string;
  Modelo, Serie, NumeroCT: integer): string;
var
  emissao: string[10];
  chave: string;
  CodigoNumerico: Integer;
begin
  emissao := FormatDateTime('DD/MM/YY', dtEmissao);

// Essa parte do código gera o Código Numérico (Aleatório)
//para que funcione inclua a unit "Math" na cláusule Uses.
  Randomize;
  CodigoNumerico := Random(99999999);
  chave := IntToStr(codUF) + copy(emissao, 7, 2) + copy(emissao, 4, 2) +
    Bib.LimpaNumero(CNPJ) + Bib.StrZero2(Modelo, 2, 0) + Bib.StrZero2(Serie, 3, 0) +
    Bib.StrZero2(NumeroCT, 9, 0) + TpEmis + Bib.StrZero2(CodigoNumerico, 8, 0);
  Result := chave + Bib.Modulo11(chave);
end;

class function TCteUtils.GeraCTe(CodCT: Integer): TCTe;
var
  wInfNF: TInfNF;
  wInfNFe: TInfNFe;
  wInfOutros: TInfOutros;
  wComp: TComp;
  wCompComp: TCompComp;
  Icm: TICMSCte;
  Int: Integer;
  wInfQ: TInfQ;
  wEmiDocAnt: TEmiDocAnt;
  wIdDocAnt: TIdDocAnt;
  wIdDocAntPap: TIdDocAntPap;
  wIdDocAntEle: TIdDocAntEle;
  wSeg: TSeg;
  wAutXML: TAutXML;
  Dup: TDup;
  wVeic: TVeic;
  wLacRodo: TLacRodo;
  wLacresAux: TStringList;
  wMoto: TMoto;
  i: Integer;
  chave: String;
  wAliquotaDiferencial: Real;
  wOcc: TOcc;
begin
  Result := nil;
  with DMNfe do
  begin
    QGeraCte.Close;
    QGeraCte.ClearVariables;
    QGeraCte.SetVariable('COD_CONHECIMENTO', CodCT);
    QGeraCte.Open;

    DMParamSistema.QParamSistema.Close;
    DMParamSistema.QParamSistema.Open;
    QTitulos.Close;
    QTitulos.Open;
    QDocOriginario.Close;
    QDocOriginario.Open;
    QDocAnterior.Close;
    QDocAnterior.Open;
    QVeiculoCTe.Close;
    QVeiculoCTe.Open;
    QMotoristaCTe.Close;
    QMotoristaCTe.Open;
    QOccCTe.Close;
    QOccCTe.Open;

    //verifica se nf-e nao foi gerada anteriormente
    ValidaCte;

    if (QGeraCte.Eof) then
      Exit;

    Result := TCTe.Create('', TCteVersaoFactory.GetCteVersao(QGeraCteDESC_VERSAO_CTE.Value));
    with Result.InfCte do
    begin
      Ide := TIde.Create;
      Id := QGeraCteDESC_CHAVE_ACESSO_CTE.Value; //Atribuindo aqui, para pegar o cDV automaticamente no SetId.
      Ide.CUF := QGeraCteCOD_UF_IBGE_FILIAL.Value;
      Ide.CFOP := QGeraCteNUM_CFOP.AsInteger;
      Ide.NatOp := QGeraCteDESC_OPERACAO.Value;

      Ide.Mod_ := QGeraCteCOD_SERIE_MODELO.AsInteger;
      Ide.Serie := QGeraCteCOD_SERIE.AsInteger;
      Ide.NCT := QGeraCteNUM_CONHECIMENTO.Value;

      if (Result.InfCte.Versao = '3.00') or (Result.InfCte.Versao = '4.00') then
      begin
        Ide.DhEmi := TCTeDataHora.Create(QGeraCteDT_EMISSAO.Value +
          DMOracle.HoraServ).ToString + GetFuso(QGeraCteUF_FILIAL.Value);
        Ide.IndGlobalizado := Bib.ift(QGeraCteIND_GLOBALIZADO.Value = 'SIM',1,0);
        if (QGeraCteCOD_PAIS_IBGE_TOM.Value <> 1058) then
          Ide.IndIEToma := 9
        else
        begin
          if QGeraCteIND_FISICA_JURIDICA_TOM.Value = 'F' then
          begin
            Ide.IndIEToma := 9;
            if QGeraCteINSCRICAO_MUN_TOM.Value <> '' then
              Ide.IndIEToma := 1;
          end
          else
          begin
            if (QGeraCteINSCRICAO_TOM.Value = '') or
                ((QGeraCteINSCRICAO_TOM.Value = 'ISENTO') and
                 (QGeraCteIND_CONTRIBUINTE_TOM.Value = 'NAO')) then
              Ide.IndIEToma := 9
            else if (QGeraCteINSCRICAO_TOM.Value = 'ISENTO') then
              Ide.IndIEToma := 2
            else
              Ide.IndIEToma := 1;
          end;
        end;
      end
      else
      begin
        Ide.ForPag := QGeraCteIND_FORMA_PGTO.Text;
        Ide.DhEmi := TCTeDataHora.Create(QGeraCteDT_EMISSAO.Value +
          DMOracle.HoraServ).ToString;
        if QGeraCteIND_TIPO_SERVICO.Value = 1 then
          Ide.RefCTE := QGeraCteDESC_CHAVE_ACESSO_REF.Value;
      end;
      Ide.TpImp := 1; //Tipo de Impressão --  1 - Retrato / 2 - Paisagem
      Ide.TpEmis := QGeraCteIND_CONTINGENCIA_CTE_FILIAL.AsInteger;
      Ide.TpAmb := QGeraCteIND_AMBIENTE_CTE_FILIAL.Value;
      Ide.TpCTe := QGeraCteIND_TIPO_CTE.Value;
      Ide.ProcEmi := 0; // Identificador do Processo de Emissão --
                        // 0 - Aplicativo do Contribuinte / 1 - Avulsa pelo Fisco /
                        // 2 - Avulsa pelo site do Fisco / 3 - Aplicativo Fisco
      Ide.VerProc := '1.3.8';

      Ide.CMunEnv := StrToInt('0' + qgeractecod_uf_IBGE_ORIG.Text + QGeraCteCOD_CIDADE_IBGE_ORIG.Text);
      Ide.XMunEnv := QGeraCteDESC_CIDADE_ORIG.Value;
      Ide.UFEnv := QGeraCteUF_ORIG.Value;
      Ide.Modal := TCTeIntegerComZero.Create(1,2);
      Ide.TpServ := QGeraCteIND_TIPO_SERVICO.Value;
      Ide.CMunIni := StrToInt('0' + qgeractecod_uf_IBGE_ORIG.Text + QGeraCteCOD_CIDADE_IBGE_ORIG.Text);
      Ide.XMunIni:= QGeraCteDESC_CIDADE_ORIG.Value;
      Ide.UFIni := QGeraCteUF_ORIG.Value;
      Ide.CMunFim := StrToInt('0' + QGeraCteCOD_UF_IBGE_DESTINO.Text + QGeraCteCOD_CIDADE_IBGE_DESTINO.Text);
      Ide.XMunFim := QGeraCteDESC_CIDADE_DESTINO.Value;
      Ide.UFFim := QGeraCteUF_DESTINO.Value;
      Ide.Retira := 1; //Recebedor retira -- 0 - sim; 1 - não
      if QGeraCteIND_TOMADOR_SERVICO.Value = 4 then      // Terminar Depois
      begin
        Ide.Toma4 := TToma4.Create;
        with Ide.Toma4 do
        begin

          XNome := Trim(QGeraCteNOME_TOM.Value);
          Fone := Bib.LimpaNumero(QGeraCteTELEFONE_TOM.Value);
          EnderToma := TEnderecoCTe.Create;
          with EnderToma do
          begin
            XLgr := Trim(Bib.RemoveNumEndereco(QGeraCteENDERECO_TOM.Value, Nro));
            Nro := Bib.NumEndereco(QGeraCteENDERECO_TOM.Value);
            XCpl := Trim(QGeraCteCOMPLEMENTO_TOM.Value);
            XBairro := Trim(QGeraCteBAIRRO_TOM.Value);
            CMun := StrToInt('0' + QGeraCteCOD_UF_IBGE_TOM.Text + QGeraCteCOD_CIDADE_IBGE_TOM.Value);
            XMun := Trim(QGeraCteCIDADE_TOM.Value);
            CEP := TCteIntegerComZero.Create(StrToInt('0' + Bib.LimpaNumero(QGeraCteCEP_TOM.Value)),8);
            UF := QGeraCteUF_TOM.Value;
            CPais := QGeraCteCOD_PAIS_IBGE_TOM.AsInteger;
            XPais := Trim(QGeraCtePAIS_TOM.Value);
          end;
          if QGeraCteIND_FISICA_JURIDICA_TOM.Value = 'F' then
          begin
            CPF := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_TOM.Value));
            if Bib.LimpaNumero(QGeraCteINSCRICAO_MUN_TOM.Value) <> '' then
              IE := Trim(Bib.LimpaNumero(QGeraCteINSCRICAO_MUN_TOM.Value));
          end
          else
          begin
            if EnderToma.CMun = 9999999 then
              CNPJ := '00000000000000'
            else
              CNPJ := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_TOM.Value));
            IE := IfThen((QGeraCteINSCRICAO_TOM.Value = 'ISENTO') and
               (QGeraCteIND_CONTRIBUINTE_TOM.Value = 'NAO'),'',
               IfThen(QGeraCteINSCRICAO_TOM.Value = 'ISENTO','ISENTO',
               Bib.LimpaNumero(QGeraCteINSCRICAO_TOM.Value)));
          end;
          Email := LeftStr(Trim(QGeraCteEMAIL_TOM.Value), 60);
        end;
      end
      else
      begin
        if (QGeraCteDESC_VERSAO_CTE.Value = '3.00') or (QGeraCteDESC_VERSAO_CTE.Value = '4.00') then
        begin
          Ide.Toma3 := TToma03.Create;
          Ide.Toma3.Toma := QGeraCteIND_TOMADOR_SERVICO.Value;
        end
        else
        begin
          Ide.Toma03 := TToma03.Create;
          Ide.Toma03.Toma := QGeraCteIND_TOMADOR_SERVICO.Value;
        end;
      end;
      Compl := TCompl.Create;
      with Compl do
      begin
        XCaracAd := QGeraCteDESC_CARAC_ADICIONAL_TRANSP.Value;
        XCaracSer := QGeraCteDESC_CARAC_ADICIONAL_SERV.Value;
        XEmi := QGeraCteDESC_FUNC_EMISSOR_CTE.Value;
        OrigCalc := Trim(QGeraCteDESC_CIDADE_ORIG.Value);
        DestCalc := Trim(QGeraCteDESC_CIDADE_DESTINO.Value);
        XObs := '';
        if (QGeraCteSVAL_TOTAL_TRIBUTOS.Value > 0) then
          XObs := 'Valor Aprox. Total dos Tributos: ' + FormatFloat('#,##0.00', QGeraCteSVAL_TOTAL_TRIBUTOS.Value)+ '\n';
        if trim(QGeraCteDESC_OBS.Value) <> '' then
          XObs := XObs + Trim(QGeraCteDESC_OBS.Value) + ' \n';
        if trim(QGeraCteOBS_TRIBUTACAO.Value) <> '' then
          XObs := XObs + trim(QGeraCteOBS_TRIBUTACAO.Value) + ' \n';
        if (DMParamSistema.CodEmpresa = 'ESPINDOLA') then
          XObs := 'Valor Aprox. Total dos Tributos: ' + FormatFloat('#,##0.00', QGeraCteSVAL_TOTAL_TRIBUTOS.Value)+ '\n';

        if QGeraCtePERC_ALIQ_CRED_ICMSSN.Value > 0 then
          XObs := XObs + 'PERMITE O APROVEITAMENTO DO CREDITO DE ICMS NO VALOR DE R$ ' +
                  FormatFloat('#,##0.00', (QGeraCteVAL_TOTAL_CTE.Value * QGeraCtePERC_ALIQ_CRED_ICMSSN.Value) /100) +
                  ' CORRESPONDENTE A ALIQUOTA DE ' + QGeraCtePERC_ALIQ_CRED_ICMSSN.Text +
                  '%, NOS TERMOS DO ARTIGO 23 DA LC 123 \n';

        if (QGeraNfeCOD_MENSAGEM.Value > 0) then
        begin
          QMensagem.Close;
          QMensagem.SetVariable('COD_MENSAGEM', QGeraNfeCOD_MENSAGEM.Value);
          QMensagem.Open;
          if (QMensagemDESC_MENSAGEM.Value <> '') then
            XObs := Trim(XObs + QMensagemDESC_MENSAGEM.Value);
          if (QMensagemDESC_COMPLEMENTO.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO.Value);
          if (QMensagemDESC_COMPLEMENTO1.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO1.Value);
          if (QMensagemDESC_COMPLEMENTO2.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO2.Value);
          if (QMensagemDESC_COMPLEMENTO3.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO3.Value);
          if (QMensagemDESC_COMPLEMENTO4.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO4.Value);
          if (QMensagemDESC_COMPLEMENTO5.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO5.Value);
          if (QMensagemDESC_COMPLEMENTO6.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO6.Value);
          if (QMensagemDESC_COMPLEMENTO7.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO7.Value);
        end;
      end;
      Emit := TEmit.Create;
      with Emit do
      begin
        Emit.CNPJ := Bib.LimpaNumero(QGeraCteCPF_CNPJ_FILIAL.Value);
        Emit.XNome := Trim(QGeraCteNOME_FILIAL.Value);
        Emit.XFant := Trim(QGeraCteNOME_FILIAL.Value);
        Emit.IE := IfThen(Trim(QGeraCteINSCRICAO_FILIAL.Value) = 'ISENTO', 'ISENTO',
                    Bib.LimpaNumero(QGeraCteINSCRICAO_FILIAL.Value));
        if Result.InfCte.Versao = '4.00' then
          Emit.CRT := QGeraCteIND_REGIME_TRIBUTARIO.Value;
        Ender := TEnderecoCTe.Create;
        with Ender do
        begin
          XLgr := Trim(QGeraCteENDERECO_FILIAL.Value);
          Nro := IfThen((QGeraCteNUM_ENDERECO_FILIAL.Text <> ''),QGeraCteNUM_ENDERECO_FILIAL.Text,'SN');
          XCpl := Trim(QGeraCteCOMPLEMENTO_FILIAL.Value);
          XBairro := QGeraCteBAIRRO_FILIAL.Value;
          CMun := StrToInt('0' + QGeraCteCOD_UF_IBGE_FILIAL.Text + QGeraCteCOD_CIDADE_IBGE_FILIAL.Value);
          XMun := Trim(QGeraCteCIDADE_FILIAL.Value);
          CEP := TCteIntegerComZero.Create(StrToInt('0' + Bib.LimpaNumero(QGeraCteCEP_FILIAL.Value)),8);
          UF := QGeraCteUF_FILIAL.Value;
          Fone := Bib.LimpaNumero(QGeraCteTELEFONE_FILIAL.Value);
        end;
      end;
      if not QGeraCteCOD_CADASTRO_REMETENTE.IsNull then
      begin
        Rem := TRem.Create;
        with Rem do
        begin
          XNome := Trim(QGeraCteNOME_REM.Value);
          XFant := Trim(QGeraCteFANTASIA_REM.Value);
          Fone := Bib.LimpaNumero(QGeraCteTELEFONE_REM.Value);
          Ender := TEnderecoCTe.Create;
          with Ender do
          begin
            XLgr := Trim(Bib.RemoveNumEndereco(QGeraCteENDERECO_REM.Value, Nro));
            Nro := Bib.NumEndereco(QGeraCteENDERECO_REM.Value);
            XCpl := Trim(QGeraCteCOMPLEMENTO_REM.Value);
            XBairro := Trim(QGeraCteBAIRRO_REM.Value);
            CMun := StrToInt('0' + QGeraCteCOD_UF_IBGE_REM.Text + QGeraCteCOD_CIDADE_IBGE_REM.Value);
            XMun := Trim(QGeraCteCIDADE_REM.Value);
            CEP := TCteIntegerComZero.Create(StrToInt('0' + Bib.LimpaNumero(QGeraCteCEP_REM.Value)),8);
            UF := QGeraCteUF_REM.Value;
            CPais := QGeraCteCOD_PAIS_IBGE_REM.AsInteger;
            XPais := Trim(QGeraCtePAIS_REM.Value);
          end;
          if QGeraCteIND_FISICA_JURIDICA_REM.Value = 'F' then
          begin
            CPF := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_REM.Value));
            if Bib.LimpaNumero(QGeraCteINSCRICAO_MUN_REM.Value) <> '' then
              IE := Trim(Bib.LimpaNumero(QGeraCteINSCRICAO_MUN_REM.Value));
          end
          else
          begin
            if Ender.CMun = 9999999 then
              CNPJ := '00000000000000'
            else
              CNPJ := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_REM.Value));
            IE := IfThen((QGeraCteINSCRICAO_REM.Value = 'ISENTO') and
               (QGeraCteIND_CONTRIBUINTE_REM.Value = 'NAO'),'',
               IfThen(QGeraCteINSCRICAO_REM.Value = 'ISENTO','ISENTO',
               Bib.LimpaNumero(QGeraCteINSCRICAO_REM.Value)));
          end;
          Email := LeftStr(Trim(QGeraCteEMAIL_REM.Value), 60); 
        end;
      end;
      if not QGeraCteCOD_CADASTRO_EXPEDIDOR.IsNull then
      begin
        Exped := TExped.Create;
        with Exped do
        begin
          XNome := Trim(QGeraCteNOME_EXP.Value);
          Fone := Bib.LimpaNumero(QGeraCteTELEFONE_EXP.Value);
          Ender := TEnderecoCTe.Create;
          with Ender do
          begin
            XLgr := Trim(Bib.RemoveNumEndereco(QGeraCteENDERECO_EXP.Value, Nro));
            Nro := Bib.NumEndereco(QGeraCteENDERECO_EXP.Value);
            XCpl := Trim(QGeraCteCOMPLEMENTO_EXP.Value);
            XBairro := Trim(QGeraCteBAIRRO_EXP.Value);
            CMun := StrToInt('0' + QGeraCteCOD_UF_IBGE_EXP.Text + QGeraCteCOD_CIDADE_IBGE_EXP.Value);
            XMun := Trim(QGeraCteCIDADE_EXP.Value);
            CEP := TCteIntegerComZero.Create(StrToInt('0' + Bib.LimpaNumero(QGeraCteCEP_EXP.Value)),8);
            UF := QGeraCteUF_EXP.Value;
            CPais := QGeraCteCOD_PAIS_IBGE_EXP.AsInteger;
            XPais := Trim(QGeraCtePAIS_EXP.Value);
          end;
          if QGeraCteIND_FISICA_JURIDICA_EXP.Value = 'F' then
            CPF := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_EXP.Value))
          else
          begin
            if Ender.CMun = 9999999 then
              CNPJ := '00000000000000'
            else
              CNPJ := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_EXP.Value));
            IE := IfThen((QGeraCteINSCRICAO_EXP.Value = 'ISENTO') and
               (QGeraCteIND_CONTRIBUINTE_EXP.Value = 'NAO'),'',
               IfThen(QGeraCteINSCRICAO_EXP.Value = 'ISENTO','ISENTO',
               Bib.LimpaNumero(QGeraCteINSCRICAO_EXP.Value)));
          end;
          Email := LeftStr(Trim(QGeraCteEMAIL_EXP.Value), 60);
        end;
      end;
      if not QGeraCteCOD_CADASTRO_RECEBEDOR.IsNull then
      begin
        Receb := TReceb.Create;
        with Receb do
        begin
          XNome := Trim(QGeraCteNOME_REC.Value);
          Fone := Bib.LimpaNumero(QGeraCteTELEFONE_REC.Value);
          Ender := TEnderecoCTe.Create;
          with Ender do
          begin
            XLgr := Trim(Bib.RemoveNumEndereco(QGeraCteENDERECO_REC.Value, Nro));
            Nro := Bib.NumEndereco(QGeraCteENDERECO_REC.Value);
            XCpl := Trim(QGeraCteCOMPLEMENTO_REC.Value);
            XBairro := Trim(QGeraCteBAIRRO_REC.Value);
            CMun := StrToInt('0' + QGeraCteCOD_UF_IBGE_REC.Text + QGeraCteCOD_CIDADE_IBGE_REC.Value);
            XMun := Trim(QGeraCteCIDADE_REC.Value);
            CEP := TCteIntegerComZero.Create(StrToInt('0' + Bib.LimpaNumero(QGeraCteCEP_REC.Value)),8);
            UF := QGeraCteUF_REC.Value;
            CPais := QGeraCteCOD_PAIS_IBGE_REC.AsInteger;
            XPais := Trim(QGeraCtePAIS_REC.Value);
          end;
          if QGeraCteIND_FISICA_JURIDICA_REC.Value = 'F' then
            CPF := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_REC.Value))
          else
          begin
            if Ender.CMun = 9999999 then
              CNPJ := '00000000000000'
            else
              CNPJ := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_REC.Value));
            IE := IfThen((QGeraCteINSCRICAO_REC.Value = 'ISENTO') and
               (QGeraCteIND_CONTRIBUINTE_REC.Value = 'NAO'),'',
               IfThen(QGeraCteINSCRICAO_REC.Value = 'ISENTO','ISENTO',
               Bib.LimpaNumero(QGeraCteINSCRICAO_REC.Value)));
          end;
          Email := LeftStr(Trim(QGeraCteEMAIL_REC.Value), 60);
        end;
      end;
      if not QGeraCteCOD_CADASTRO_DESTINATARIO.IsNull then
      begin
        Dest := TDest.Create;
        with Dest do
        begin
          XNome := Trim(QGeraCteNOME_DEST.Value);
          Fone := Bib.LimpaNumero(QGeraCteTELEFONE_DEST.Value);
          Ender := TEnderecoCTe.Create;
          with Ender do
          begin
            XLgr := Trim(Bib.RemoveNumEndereco(QGeraCteENDERECO_DEST.Value, Nro));
            Nro := Bib.NumEndereco(QGeraCteENDERECO_DEST.Value);
            XCpl := Trim(QGeraCteCOMPLEMENTO_DEST.Value);
            XBairro := Trim(QGeraCteBAIRRO_DEST.Value);
            CMun := StrToInt('0' + QGeraCteCOD_UF_IBGE_DEST.Text + QGeraCteCOD_CIDADE_IBGE_DEST.Value);
            XMun := Trim(QGeraCteCIDADE_DEST.Value);
            CEP := TCteIntegerComZero.Create(StrToInt('0' + Bib.LimpaNumero(QGeraCteCEP_DEST.Value)),8);
            UF := QGeraCteUF_DEST.Value;
            CPais := QGeraCteCOD_PAIS_IBGE_DEST.AsInteger;
            XPais := Trim(QGeraCtePAIS_DEST.Value);
          end;
          if QGeraCteIND_FISICA_JURIDICA_DEST.Value = 'F' then
          begin
            CPF := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_DEST.Value));
            if Bib.LimpaNumero(QGeraCteINSCRICAO_MUN_DEST.Value) <> '' then
              IE := Trim(Bib.LimpaNumero(QGeraCteINSCRICAO_MUN_DEST.Value));
          end
          else
          begin
            if Ender.CMun = 9999999 then
              CNPJ := '00000000000000'
            else
              CNPJ := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_DEST.Value));
            IE := IfThen((QGeraCteINSCRICAO_DEST.Value = 'ISENTO') and
               (QGeraCteIND_CONTRIBUINTE_DEST.Value = 'NAO'),'',
               IfThen(QGeraCteINSCRICAO_DEST.Value = 'ISENTO','ISENTO',
               Bib.LimpaNumero(QGeraCteINSCRICAO_DEST.Value)));
          end;
          Email := LeftStr(Trim(QGeraCteEMAIL_DEST.Value), 60);
        end;
      end;
      VPrest := TVPrest.Create;
      with VPrest do
      begin
        VTPrest := TCTeFloat2.Create(QGeraCteVAL_TOTAL_CTE.Value);
        VRec := TCTeFloat2.Create(QGeraCteVAL_A_RECEBER.Value);

        Comp := TCTeElementItems.Create;
        if QGeraCteVAL_FRETE_PESO.Value > 0 then
        begin
          wComp := TComp.Create;
          wComp.XNome := 'FRETE PESO';
          wComp.VComp := TCTeFloat2.Create(QGeraCteVAL_FRETE_PESO.Value);
          Comp.AddItem(wComp);
        end;
        if QGeraCteVAL_FRETE.Value > 0 then
        begin
          wComp := TComp.Create;
          wComp.XNome := 'FRETE VALOR';
          wComp.VComp := TCTeFloat2.Create(QGeraCteVAL_FRETE.Value);
          Comp.AddItem(wComp);
        end;

        if QGeraCteVAL_DESPACHO.Value > 0 then
        begin
          wComp := TComp.Create;
          wComp.XNome := 'DESPACHO';
          wComp.VComp := TCTeFloat2.Create(QGeraCteVAL_DESPACHO.Value);
          Comp.AddItem(wComp);
        end;

        if QGeraCteVAL_GRIS.Value > 0 then
        begin
          wComp := TComp.Create;
          wComp.XNome := 'GRIS';
          wComp.VComp := TCTeFloat2.Create(QGeraCteVAL_GRIS.Value);
          Comp.AddItem(wComp);
        end;

        if QGeraCteVAL_PEDAGIO.Value > 0 then
        begin
          wComp := TComp.Create;
          wComp.XNome := 'PEDAGIO';
          wComp.VComp := TCTeFloat2.Create(QGeraCteVAL_PEDAGIO.Value);
          Comp.AddItem(wComp);
        end;
        if QGeraCteVAL_FRETE_POR_TON.Value > 0 then
        begin
          wComp := TComp.Create;
          wComp.XNome := 'TARIFA P/ TON';
          wComp.VComp := TCTeFloat2.Create(QGeraCteVAL_FRETE_POR_TON.Value);
          Comp.AddItem(wComp);
        end;
      end;
      Icm := nil;
      Imp := TImpCte.Create;
      Imp.ICMS := TICMSImposto.Create;
      if Length(QGeraCteCST.Value) > 2 then
          Int := StrToInt('0' + Copy(QGeraCteCST.Value, 2, 2))
        else
          Int := StrToInt('0' + QGeraCteCST.Value);
      if (QGeraCteIND_REGIME_TRIBUTARIO.Value = 1) then
      begin
        if (Result.InfCte.Versao = '3.00') or (Result.InfCte.Versao = '4.00') then
          Icm := TICMSSN.Create(CST_ICMS_TRIB_OUTROS)
        else
          Icm := TICMSSN.Create
      end
      else
      begin
        if Int in [40, 41, 51] then
          Icm := TICMS45.Create(Int)
        else
        begin
          case Int of
            0:
            begin
              Icm := TICMS00.Create;
              with Icm as TICMS00 do
              begin
                PICMS := TCTeFloat2.Create(Bib.ift(QGeraCtePERC_TRIBUTADO_NOTA.Value > 0,QGeraCtePERC_TRIBUTADO_NOTA.Value,QGeraCtePERC_ALIQUOTA.Value));
                VBC := TCTeFloat2.Create(QGeraCteVAL_BASE_ICMS.Value);
                VICMS := TCTeFloat2.Create(QGeraCteVAL_ICMS.Value);
              end;
            end;
            20:
            begin
              Icm := TICMS20.Create;
              with Icm as TICMS20 do
              begin
                PRedBC := TCTeFloat2.Create(100 - QGeraCtePERC_TRIBUTADO.Value); //100 - valor da tabela de tributacao
                PICMS := TCTeFloat2.Create(Bib.ift(QGeraCtePERC_TRIBUTADO_NOTA.Value > 0,QGeraCtePERC_TRIBUTADO_NOTA.Value,QGeraCtePERC_ALIQUOTA.Value));
                VBC := TCTeFloat2.Create(QGeraCteVAL_BASE_ICMS.Value);
                VICMS := TCTeFloat2.Create(QGeraCteVAL_ICMS.Value);
              end;
            end;
            60:
            begin
              Icm := TICMS60.Create;
              with Icm as TICMS60 do
              begin
                VBCSTRet := TCTeFloat2.Create(QGeraCteVAL_BASE_ICMS_SUBST.Value);
                VICMSSTRet := TCTeFloat2.Create(QGeraCteVAL_ICMS_SUBST.Value);
                PICMSSTRet := TCTeFloat2.Create(QGeraCtePERC_ALIQUOTA.Value);
              end;
            end;
            90:
            begin
              if Emit.Ender.UF = ide.UFIni then
              begin
                Icm := TICMS90.Create;
                with Icm as TICMS90 do
                begin
                  if QGeraCtePERC_TRIBUTADO.Value <= 100 then
                    PRedBC := TCTeFloat2.Create( 100 - QGeraCtePERC_TRIBUTADO.Value);
                  PICMS := TCTeFloat2.Create(Bib.ift(QGeraCtePERC_TRIBUTADO_NOTA.Value > 0,QGeraCtePERC_TRIBUTADO_NOTA.Value,QGeraCtePERC_ALIQUOTA.Value));
                  VBC := TCTeFloat2.Create(QGeraCteVAL_BASE_ICMS.Value);
                  VICMS := TCTeFloat2.Create(QGeraCteVAL_ICMS.Value);
                end;
              end
              else
              begin
                Icm := TICMSOutraUF.Create;
                with Icm as TICMSOutraUF do
                begin
                  if QGeraCtePERC_TRIBUTADO.Value <= 100 then
                  begin
                    if (100 - QGeraCtePERC_TRIBUTADO.Value) > 0 then
                      PRedBCOutraUF := TCTeFloat2.Create( 100 - QGeraCtePERC_TRIBUTADO.Value);
                  end;
                  PICMSOutraUF := TCTeFloat2.Create(Bib.ift(QGeraCtePERC_TRIBUTADO_NOTA.Value > 0,QGeraCtePERC_TRIBUTADO_NOTA.Value,QGeraCtePERC_ALIQUOTA.Value));
                  VBCOutraUF := TCTeFloat2.Create(QGeraCteVAL_BASE_ICMS.Value);
                  VICMSOutraUF := TCTeFloat2.Create(QGeraCteVAL_ICMS.Value);
                end;
              end;
            end;
          end;
        end;
      end;
      Imp.ICMS.Icms := Icm;
      Imp.VTotTrib := TCTeFloat2.Create(QGeraCteSVAL_TOTAL_TRIBUTOS.Value);
      Imp.InfAdFisco := Trim(QGeraCteDESC_INF_ADIC_FISCO.Value);

      if (Ide.TpCTe <> 2) and
         (Ide.TpServ = 0) and
         (((QGeraCteIND_FISICA_JURIDICA_DEST.Value = 'F') and
           (QGeraCteINSCRICAO_MUN_DEST.Value = '')) or
          ((QGeraCteINSCRICAO_DEST.Value = '') or
           ((QGeraCteINSCRICAO_DEST.Value = 'ISENTO') and
            (QGeraCteIND_CONTRIBUINTE_DEST.Value = 'NAO')))) and
         (QGeraCteCOD_CADASTRO_REMETENTE.Value <> QGeraCteCOD_CADASTRO_TOMADOR.Value) and
         (Ide.IndIEToma = 9) and
         (QGeraCteUF_ORIG.Value <> QGeraCteUF_DESTINO.Value) then
      begin
        imp.ICMSUFFim := TICMSUFFim.Create;
        with imp.ICMSUFFim do
        begin
          VBCUFFim := TCTeFloat2.Create(QGeraCteVAL_BASE_ICMS.Value);
          PFCPUFFim := TCTeFloat2.Create(0);
          PICMSUFFim := TCTeFloat2.Create(QGeraCtePERC_ALIQUOTA_DIFERENCIAL.Value);
          PICMSInter := TCTeFloat2.Create(QGeraCtePERC_ALIQUOTA.Value);
          if QGeraCtePERC_ALIQUOTA.Value = 0 then
          begin
            if (pos(QGeraCteCOD_ESTADO_TOM.Value,',AC,AL,AM,AP,BA,CE,DF,ES,GO,MA,MT,MS,'+
                'PA,PB,PE,PI,RN,RO,RR,SE,TO,') > 0) and
               (pos(QGeraCteUF_FILIAL.Value,',MG,PR,RS,RJ,SC,SP,') > 0) then
              PICMSInter := TCTeFloat2.Create(7)
            else
              PICMSInter := TCTeFloat2.Create(12);
          end;
          //case StrToInt(FormatDateTime('yyyy',QGeraCteDT_EMISSAO.Value)) of
//            2016: PICMSInterPart := TCTeFloat2.Create(40);
//            2017: PICMSInterPart := TCTeFloat2.Create(60);
//            2018: PICMSInterPart := TCTeFloat2.Create(80);
//            else PICMSInterPart := TCTeFloat2.Create(100);
//          end;
          wAliquotaDiferencial := ABS(PICMSInter.Valor - PICMSUFFim.Valor);
          VICMSUFFim := TCTeFloat2.Create(VBCUFFim.Valor * wAliquotaDiferencial /100);
          VICMSUFIni := TCTeFloat2.Create(0);
          VFCPUFFim := TCTeFloat2.Create(0);
        end;
      end;
      if (Emit.CRT = 3) and (QGeraCteVAL_CBS_TOTAL.Value >= 0) then
      begin
        Imp.IBSCBS := TIBSCBS.Create;
        with Imp.IBSCBS do
        begin
          CST := QGeraCteNUM_CST_IBS_CBS.Value;               //'000'
          CClassTrib := QGeraCteNUM_CLASS_TRIB_IBS_CBS.Value; //'000001'
          if (CST <> '410') then
          begin
            GIBSCBS := TGIBSCBS.Create;
            with GIBSCBS do
            begin
              VBC := TCTeFloat2.Create(QGeraCteVAL_BC_IBS_CBS.Value);

              GIBSUF := TGIBSUF.Create;
              //GIBSUF.PIBSUF := TCTeFloat4.Create(0.1);
              GIBSUF.PIBSUF := TCTeFloat4.Create(QGeraCtePERC_IBS_UF_DESTINO.Value);
              GIBSUF.VIBSUF := TCTeFloat2.Create(QGeraCteVAL_IBS_EST.Value);

              GIBSMun := TGIBSMun.Create;
              //GIBSMun.PIBSMun := TCTeFloat4.Create(0);
              GIBSMun.PIBSMun := TCTeFloat4.Create(QGeraCtePERC_IBS_MUN_DESTINO.Value);
              GIBSMun.VIBSMun := TCTeFloat2.Create(QGeraCteVAL_IBS_MUN.Value);

              if QGeraCtePERC_REDUCAO_IBS.Value > 0 then
              begin
                GIBSUF.GRed := TGRed.Create;
                GIBSUF.GRed.PRedAliq := TCTeFloat4.Create(QGeraCtePERC_REDUCAO_IBS.Value);
                GIBSUF.GRed.PAliqEfet := TCTeFloat4.Create(QGeraCtePERC_IBS_UF_DESTINO.Value - (QGeraCtePERC_IBS_UF_DESTINO.Value * (QGeraCtePERC_REDUCAO_IBS.Value/100)));

                GIBSMun.GRed := TGRed.Create;
                GIBSMun.GRed.PRedAliq := TCTeFloat4.Create(QGeraCtePERC_REDUCAO_IBS.Value);
                GIBSMun.GRed.PAliqEfet := TCTeFloat4.Create(QGeraCtePERC_IBS_MUN_DESTINO.Value - (QGeraCtePERC_IBS_MUN_DESTINO.Value * (QGeraCtePERC_REDUCAO_IBS.Value/100)));
              end;

              GCBS := TGCBS.Create;
              //GCBS.PCBS := TCTeFloat4.Create(0.9);
              GCBS.PCBS := TCTeFloat4.Create(QGeraCtePERC_CBS.Value);
              GCBS.VCBS := TCTeFloat2.Create(QGeraCteVAL_CBS_TOTAL.Value);
              VIBS := TCTeFloat2.Create(QGeraCteVAL_IBS_EST.Value + QGeraCteVAL_IBS_MUN.Value);

              if QGeraCtePERC_REDUCAO_CBS.Value > 0 then
              begin
                GCBS.GRed := TGRed.Create;
                GCBS.GRed.PRedAliq := TCTeFloat4.Create(QGeraCtePERC_REDUCAO_CBS.Value);
                GCBS.GRed.PAliqEfet := TCTeFloat4.Create(QGeraCtePERC_CBS.Value - (QGeraCtePERC_CBS.Value * (QGeraCtePERC_REDUCAO_CBS.Value/100)));
              end;
            end;
          end;
        end;
      end;
      Imp.VTotDFe := TCTeFloat2.Create(QGeraCteVAL_TOTAL_CTE.Value); // implementação futura a partir de 2027 => + Imp.IBSCBS.GIBSCBS.VIBS.Valor + QGeraCteVAL_CBS_TOTAL.Value);
      if (QGeraCteIND_TIPO_CTE.Value = 0) or (QGeraCteIND_TIPO_CTE.Value = 3) then
      begin
        InfCteNorm := TInfCTeNorm.Create;
        with InfCTeNorm do
        begin
          InfCarga := TInfCarga.Create;
          with InfCarga do
          begin
            VCarga := TCTeFloat2.Create(QGeraCteVAL_TOTAL_CARGA.Value);
            ProPred := Trim(QGeraCteDESC_PRODUTO.Value);
            XOutCat := Trim(QGeraCteDESC_OUT_CARAC_CARGA.Value);
            InfQ := TCTeElementItems.Create;
            if QGeraCteQT_VOLUMES.Value > 0 then
            begin
              wInfQ := TInfQ.Create;
              wInfQ.CUnid := TCTeIntegerComZero.Create(3,2);
              wInfQ.TpMed := 'QTDE VOLUMES';
              wInfQ.QCarga := TCTeFloat4.Create(QGeraCteQT_VOLUMES.Value);
              InfQ.AddItem(wInfQ);
            end;
            if QGeraCteNUM_CUBAGEM.Value > 0 then
            begin
              wInfQ := TInfQ.Create;
              wInfQ.CUnid := TCTeIntegerComZero.Create(0,2);
              wInfQ.TpMed := 'CUBAGEM';
              wInfQ.QCarga := TCTeFloat4.Create(QGeraCteNUM_CUBAGEM.Value);
              InfQ.AddItem(wInfQ);
            end;
            if QGeraCteNUM_PESO_BRUTO.Value > 0 then
            begin
              wInfQ := TInfQ.Create;
              wInfQ.CUnid := TCTeIntegerComZero.Create(1,2);
              wInfQ.TpMed := 'PESO BRUTO';
              wInfQ.QCarga := TCTeFloat4.Create(QGeraCteNUM_PESO_BRUTO.Value);
              InfQ.AddItem(wInfQ);
            end;
            if QGeraCteNUM_PESO_BC.Value > 0 then
            begin
              wInfQ := TInfQ.Create;
              wInfQ.CUnid := TCTeIntegerComZero.Create(1,2);
              wInfQ.TpMed := 'PESO BASE DE CÁLCULO';
              wInfQ.QCarga := TCTeFloat4.Create(QGeraCteNUM_PESO_BC.Value);
              InfQ.AddItem(wInfQ);
            end;
            if QGeraCteNUM_PESO_AFERIDO.Value > 0 then
            begin
              wInfQ := TInfQ.Create;
              wInfQ.CUnid := TCTeIntegerComZero.Create(1,2);
              wInfQ.TpMed := 'PESO AFERIDO';
              wInfQ.QCarga := TCTeFloat4.Create(QGeraCteNUM_PESO_AFERIDO.Value);
              InfQ.AddItem(wInfQ);
            end;
            //if QGeraCteVAL_SEGURO.Value > 0 then
//              VCargaAverb := TCTeFloat2.Create(QGeraCteVAL_SEGURO.Value);
          end;
          InfDoc := TInfDoc.Create;
          with InfDoc do
          begin
            InfNF := TCTeElementItems.Create;
            InfNFe := TCTeElementItems.Create;
            InfOutros := TCTeElementItems.Create;                                
            while not QDocOriginario.Eof do
            begin
              if QDocOriginarioCOD_SERIE_MODELO.Value = '55' then
              begin
                wInfNFe := TInfNFe.Create;
                wInfNFe.Chave := QDocOriginarioDESC_CHAVE_ACESSO.Value;
                InfNFe.AddItem(wInfNFe);
                QDocOriginario.Next;
              end
              else if (QDocOriginarioCOD_SERIE_MODELO.Value = '01') or
                      (QDocOriginarioCOD_SERIE_MODELO.Value = '04') then
              begin
                wInfNF := TInfNF.Create;
                with wInfNF do
                begin
                  NRoma := QDocOriginarioNUM_ROMANEIO.Text;
                  NPed := QDocOriginarioNUM_PEDIDO.Text;
                  Mod_ := TCTeIntegerComZero.Create(QDocOriginarioCOD_SERIE_MODELO.AsInteger,2);
                  Serie := QDocOriginarioCOD_SERIE.Value;
                  NDoc := QDocOriginarioNUM_DOCUMENTO.Text;
                  DEmi := TCTeData.Create(QDocOriginarioDT_EMISSAO.Value);
                  VBC := TCTeFloat2.Create(QDocOriginarioVAL_BASE_ICMS.Value);
                  VICMS := TCTeFloat2.Create(QDocOriginarioVAL_ICMS.Value);
                  VBCST := TCTeFloat2.Create(QDocOriginarioVAL_BASE_ICMS_SUBST.Value);
                  VST := TCTeFloat2.Create(QDocOriginarioVAL_ICMS_SUBST.Value);
                  VProd := TCTeFloat2.Create(QDocOriginarioVAL_TOTAL_PRODUTOS.Value);
                  VNF := TCTeFloat2.Create(QDocOriginarioVAL_TOTAL.Value);
                  NCFOP := QDocOriginarioNUM_CFOP.AsInteger;
                end;
                InfNF.AddItem(wInfNF);
                QDocOriginario.Next;
              end
              else if (QDocOriginarioCOD_SERIE_MODELO.Value = '00') or
                      (QDocOriginarioCOD_SERIE_MODELO.Value = '10') or
                      (QDocOriginarioCOD_SERIE_MODELO.Value = '99') then
              begin
                wInfOutros := TInfOutros.Create;
                with wInfOutros do
                begin
                  TpDoc := TCTeIntegerComZero.Create(QDocOriginarioCOD_SERIE_MODELO.AsInteger,2);
                  NDoc := QDocOriginarioNUM_DOCUMENTO.Text;
                  DEmi := TCTeData.Create(QDocOriginarioDT_EMISSAO.Value);
                  if QDocOriginarioVAL_TOTAL.Value > 0 then
                    VDocFisc := TCTeFloat2.Create(QDocOriginarioVAL_TOTAL.Value);
                end;
                InfOutros.AddItem(wInfOutros);
                QDocOriginario.Next;
              end;
            end;
          end;
          if QGeraCteIND_TIPO_SERVICO.Value <> 0 then
          begin
            DocAnt := TDocAnt.Create;
            DocAnt.EmiDocAnt := TCTeElementItems.Create;
            wEmiDocAnt := TEmiDocAnt.Create;
            with wEmiDocAnt do
            begin   
              if QGeraCteIND_FISICA_JURIDICA_TOM.Value = 'F' then
                CPF := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_TOM.Value))
              else
              begin
                CNPJ := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_TOM.Value));
                IE := Bib.LimpaNumero(QGeraCteINSCRICAO_TOM.Value);
              end;
              UF := QGeraCteUF_TOM.Value;
              XNome := Trim(QGeraCteNOME_TOM.Value);
              IdDocAnt := TCTeElementItems.Create;
              wIdDocAnt := TIdDocAnt.Create;
              wIdDocAnt.IdDocAntPap := TCTeElementItems.Create;
              wIdDocAnt.IdDocAntEle := TCTeElementItems.Create;
              while not QDocAnterior.Eof do
              begin
                if QDocAnteriorIND_TP_DOC.Value = '57' then
                begin
                  wIdDocAntEle := TIdDocAntEle.Create;
                  if (Result.InfCte.Versao = '3.00') or (Result.InfCte.Versao = '4.00') then
                    wIdDocAntEle.ChCTe := QDocAnteriorDESC_CHAVE_ACESSO.Value
                  else
                    wIdDocAntEle.Chave := QDocAnteriorDESC_CHAVE_ACESSO.Value;
                  wIdDocAnt.IdDocAntEle.AddItem(wIdDocAntEle);
                  QDocAnterior.Next;
                end
                else
                begin
                  wIdDocAntPap := TIdDocAntPap.Create;
                  with wIdDocAntPap do
                  begin
                    DEmi := TCTeData.Create(QDocAnteriorDT_EMISSAO.Value);
                    NDoc := QDocAnteriorNUM_DOCUMENTO.Text;
                    Serie := QDocAnteriorCOD_SERIE.Value;
                    Subser := QDocAnteriorCOD_SUB_SERIE.Value;
                    TpDoc := QDocAnteriorIND_TP_DOC.Value; 
                  end;
                  wIdDocAnt.IdDocAntPap.AddItem(wIdDocAntPap);
                  QDocAnterior.Next;
                end;
              end;
            end;
            wEmiDocAnt.IdDocAnt.AddItem(wIdDocAnt);
            DocAnt.EmiDocAnt.AddItem(wEmiDocAnt);                 
          end;

          InfModal := TInfModal.Create;
          InfModal.VersaoModal := QGeraCteDESC_VERSAO_CTE.Value;
          InfModal.Rodo := TRodo.Create;
          with InfModal.Rodo do
          begin
            RNTRC := Trim(QGeraCteDESC_RNTRC.Value);
            if (InfModal.VersaoModal = '4.00') or (InfModal.VersaoModal = '4.00') then
            begin
              Compl.XObs := Compl.XObs + IfThen(QVeiculoCTe.RecordCount = 0, '',
                '\nVeículos: ');
              QVeiculoCTe.First;
              while not QVeiculoCTe.Eof do
              begin
                Compl.XObs := Compl.XObs +
                  StringReplace(QVeiculoCTeDESC_PLACA.Value, ' ', '', [rfReplaceAll])+
                  IfThen(QVeiculoCTe.RecNo = QVeiculoCTe.RecordCount, '', ', ');
                QVeiculoCTe.Next;
              end;
            end;
            if InfModal.VersaoModal = '2.00' then
            begin
              Seg := TCTeElementItems.Create;
              wSeg := TSeg.Create;

              with wSeg do
              begin
                RespSeg := QGeraCteIND_RESP_SEGURO.Text;
                XSeg := Trim(QGeraCteDESC_SEGURADORA.Value);
                NApol := Trim(QGeraCteNUM_APOLICE_SEGURO.Value);
                NAver := Trim(QGeraCteNUM_AVERBACAO_SEGURO.Value);
                if QGeraCteVAL_SEGURO.Value > 0 then
                  VCarga := TCTeFloat2.Create(QGeraCteVAL_SEGURO.Value);
                Seg.AddItem(wSeg);
              end;
              DPrev := TCTeData.Create(QGeraCteDT_PREVISAO_ENTREGA.Value);
              Lota := QGeraCteIND_LOTACAO.Value;
              CIOT := Trim(QGeraCteDESC_CIOT.Value);
              QVeiculoCTe.First;
              Veic := TCTeElementItems.Create;
              while not QVeiculoCTe.Eof do
              begin
                wVeic := TVeic.Create;
                with wVeic do
                begin
                  //CInt :=
                  if trim(QVeiculoCTeDESC_RENAVAN.Value) <> '' then
                    RENAVAM := IntToStr(StrToInt(Bib.LimpaNumero(QVeiculoCTeDESC_RENAVAN.Value)));
                  Placa := StringReplace(QVeiculoCTeDESC_PLACA.Value, ' ', '', [rfReplaceAll]);
                  Placa := StringReplace(Placa, '-', '', [rfReplaceAll]);
                  Tara := QVeiculoCTeNUM_TARA.Value;
                  CapKG := QVeiculoCTeVAL_MAX_CARGA.Value;
                  CapM3 := QVeiculoCTeVAL_VOLUME.AsInteger;
                  TpProp := QVeiculoCTeIND_TIPO_PROPRIEDADE.Value;
                  TpVeic := QVeiculoCTeIND_TIPO_VEICULO.Value;
                  TpRod := TCTeIntegerComZero.Create(QVeiculoCTeIND_TIPO_RODADO.AsInteger,2);
                  TpCar := TCTeIntegerComZero.Create(QVeiculoCTeIND_TIPO_CARROCERIA.AsInteger,2);
                  UF := QVeiculoCTeCOD_ESTADO.Value;
                end;
                Veic.AddItem(wVeic);
                QVeiculoCTe.Next;
              end;
              wLacresAux := TStringList.Create;
              wLacresAux.Delimiter := ',';
              wLacresAux.DelimitedText := Trim(QGeraCteDESC_LACRES.Value);
              LacRodo := TCTeElementItems.Create;
              for i := 0 to wLacresAux.Count - 1 do
              begin
                wLacRodo := TLacRodo.Create;
                wLacRodo.NLacre := wLacresAux[i];
                LacRodo.AddItem(wLacRodo);
              end;
              QMotoristaCTe.first;
              Moto := TCTeElementItems.Create;
              while not QMotoristaCTe.Eof do
              begin
                wMoto := TMoto.Create;
                wMoto.XNome := Trim(QMotoristaCTeNOME.Value);
                wMoto.CPF := Bib.LimpaNumero(QMotoristaCTeNUM_CGC_CPF.Value);
                Moto.AddItem(wMoto);
                QMotoristaCTe.Next;
              end;
            end;
            Occ := TCTeElementItems.Create;
            while not QOccCTe.Eof do
            begin
              wOcc := TOcc.Create;
              with wOcc do
              begin
                Serie := QOccCTeDESC_SERIE.Value;
                NOcc :=  StrToInt(QOccCTeNUM_OCC.Value);
                DEmi := TCTeData.Create(QOccCTeDT_EMI.Value);
                EmiOcc := TEmiOcc.Create;
                with EmiOcc do
                begin
                  CNPJ := QOccCTeNUM_CGC_CPF.Value;
                  IE := QOccCTeNUM_INSCRICAO.Value;
                  UF := QOccCTeCOD_ESTADO.Value;
                  Fone := QOccCTeDESC_TELEFONE.Value;
                end;
              end;
              Occ.AddItem(wOcc);
            end;
          end;
          Cobr := TCobr.Create;
          Cobr.Fat := TFat.Create;
          Cobr.Fat.NFat := QGeraCteNUM_CONHECIMENTO.AsInteger;
          if QGeraCteVAL_TOTAL_CTE.Value > 0 then
          begin
            Cobr.Fat.VOrig := TCTeFloat2.Create(QGeraCteVAL_TOTAL_CTE.Value);
            //Cobr.Fat.VDesc := TCTeFloat2.Create(0);
            Cobr.Fat.VLiq := TCTeFloat2.Create(QGeraCteVAL_TOTAL_CTE.Value);
          end;

          QTitulos.First;
          Cobr.Dup := TCteElementItems.Create;
          while not QTitulos.Eof do
          begin
            Dup := TDup.Create;
            Dup.NDup := QTitulosNUM_PARCELA.Value;
            Dup.DVenc := TCteData.Create(QTitulosDT_VENCIMENTO.Value);
            Dup.VDup := TCTeFloat2.Create(QTitulosVAL_ORIGINAL.Value);
            Cobr.Dup.AddItem(Dup);
            QTitulos.Next;
          end;
          if QGeraCteIND_TIPO_CTE.Value = 3 then
          begin
            chave := Bib.LimpaNumero(DMOracle.FastSelect('DESC_CHAVE_ACESSO_CTE','TB_CONHECIMENTO','COD_CONHECIMENTO = '+QGeraCteCOD_CONHECIMENTO_REF.Text));
            if chave <> '' then
            begin
              InfCteSub := TInfCteSub.Create;
              with InfCteSub do
              begin
                ChCte := chave;
                RefCteAnu := Bib.LimpaNumero(DMOracle.FastSelect('DESC_CHAVE_ACESSO_CTE','TB_CONHECIMENTO','COD_CONHECIMENTO = '+QGeraCteCOD_CTE_ANULACAO_REF.Text));
                if QGeraCteIND_TOMA_ICMS.Value = 'S' then
                begin
                  TomaICMS := TTomaICMS.Create;
                  if Copy( QGeraCteDESC_CHAVE_ACESSO_REF.Value, 21,2) = '55' then
                    TomaICMS.RefNFe := QGeraCteDESC_CHAVE_ACESSO_REF.Value;
                  if Copy( QGeraCteDESC_CHAVE_ACESSO_REF.Value, 21,2) = '57' then
                    TomaICMS.RefCte := Bib.LimpaNumero(QGeraCteDESC_CHAVE_ACESSO_REF.Value);
                end
                else if QGeraCteDESC_VERSAO_CTE.Value = '2.00' then
                begin
                  chave := Bib.LimpaNumero(DMOracle.FastSelect('DESC_CHAVE_ACESSO_CTE','TB_CONHECIMENTO','COD_CONHECIMENTO = '+QGeraCteCOD_CTE_ANULACAO_REF.Text));
                  if chave <> '' then
                  begin
                    TomaNaoICMS := TTomaNaoICMS.Create;
                    TomaNaoICMS.RefCteAnu := chave;
                    RefCteAnu := '';
                  end;
                end;
                if DMOracle.FastSelect('COD_CADASTRO_TOMADOR',
                  'TB_CONHECIMENTO','COD_CONHECIMENTO = '+
                  QGeraCteCOD_CONHECIMENTO_REF.Text) <> QGeraCteCOD_CADASTRO_TOMADOR.Text then
                  IndAlteraToma := 1;
              end;
            end;
          end;
          if (QGeraCteIND_GLOBALIZADO.Value = 'SIM') and
             ((QGeraCteDESC_VERSAO_CTE.Value = '3.00') or
              (QGeraCteDESC_VERSAO_CTE.Value = '4.00')) then
          begin
            InfGlobalizado := TInfGlobalizado.Create;
            InfGlobalizado.XObs := 'CT-e Globalizado';
          end;
        end;
      end;
      InfRespTec := TInfRespTec.Create;
      InfRespTec.CNPJ := '81504763000171';
      InfRespTec.XContato := 'Adriel Inácio Dias';
      InfRespTec.Email := 'adriel@cemapa.com';
      InfRespTec.Fone := '4532643773';
      InfRespTec.IdCSRT := TCTeIntegerComZero.Create(DMParamSistema.QParamSistemaDESC_IDENTIFICADOR_CSRT.AsInteger, 3);

      with DMConhecimento do
      begin
        if QGeraCteCOD_CONHECIMENTO_REF.Value <> 0 then
        begin
          QConhecimentoCons.Close;
          QConhecimentoCons.ClearVariables;
          QConhecimentoCons.SetVariable('COD_CONHECIMENTO', QGeraCteCOD_CONHECIMENTO_REF.Value);
          QConhecimentoCons.SetVariable('DT_EMISSAO_INI', '01/01/1900');
          QConhecimentoCons.SetVariable('DT_EMISSAO_FIM', DateToStr(Date));
          QConhecimentoCons.SetVariable('COD_CADASTRO_REMETENTE', Null);
          QConhecimentoCons.SetVariable('COD_CADASTRO_DESTINATARIO', Null);
          QConhecimentoCons.SetVariable('NUM_CONHECIMENTO', NULL);
          QConhecimentoCons.SetVariable('Cod_Nota_Cab', NULL);
          QConhecimentoCons.SetVariable('Cod_Contrato_Vend', NULL);
          QConhecimentoCons.SetVariable('COD_FILIAL', NULL);
          QConhecimentoCons.SetVariable('Desc_Placa', NULL);
          QConhecimentoCons.SetVariable('Situacao',Null);
          QConhecimentoCons.Open;
          if QGeraCteIND_TIPO_CTE.Value = 1 then  // Complemento de CT-e
          begin
            InfCteComp := TInfCteComp.Create;
            if (QGeraCteDESC_VERSAO_CTE.Value = '3.00') or (QGeraCteDESC_VERSAO_CTE.Value = '4.00') then
              InfCteComp.ChCTe := Bib.LimpaNumero(QConhecimentoConsDESC_CHAVE_ACESSO_CTE.Value)
            else
              InfCteComp.Chave := Bib.LimpaNumero(QConhecimentoConsDESC_CHAVE_ACESSO_CTE.Value);
          end;
          if QGeraCteIND_TIPO_CTE.Value = 2 then
          begin
            chave := Bib.LimpaNumero(DMOracle.FastSelect('DESC_CHAVE_ACESSO_CTE','TB_CONHECIMENTO','COD_CONHECIMENTO = '+QGeraCteCOD_CONHECIMENTO_REF.Text));
            if chave <> '' then
            begin
              InfCteAnu := TInfCteAnu.Create;
              InfCteAnu.ChCte := chave;
              if QGeraCteDT_DECLARACAO_NAO_CONTRIB.Text <> '' then
                InfCteAnu.DEmi := TCTeData.Create(QGeraCteDT_DECLARACAO_NAO_CONTRIB.Value).ToString;
            end;
          end;
        end;
      end;
      AutXML := TCTeElementItems.Create;
      QAutXML.Close;
      QAutXML.SetVariable('IND_TIPO_DOCUMENTO',57);
      QAutXML.SetVariable('COD_FILIAL',QGeraCteCOD_FILIAL.Value);
      QAutXML.Open;
      QAutXML.First;
      while not QAutXML.Eof do
      begin
        wAutXML := TAutXML.Create;
        if Length(Bib.LimpaNumero(QAutXMLNUM_CGC_CPF.Value)) = 11 then
          wAutXML.CPF := QAutXMLNUM_CGC_CPF.Value
        else
          wAutXML.CNPJ := QAutXMLNUM_CGC_CPF.Value;
        AutXML.AddItem(wAutXML);
        QAutXML.Next;
      end;
    end;
  end;
end;

class function TCteUtils.GeraXMLCTe(CodCT: Integer): String;
begin
  Result := GeraXMLCTe(GeraCTe(CodCT));
end;

class function TCteUtils.GeraXMLCTe(CTe: TCTe): String;
var
  wXml :String;
begin
  wXml := CTe.GetXML( 'CTe', TCteVersaoFactory.GetCteVersao(CTe.InfCte.Versao));
  Result := wXml;
end;

class function TCteUtils.GeraCTeEvento(wTpEvento: Integer): TEventoCTe;
var
  wInfCorrecao: TInfCorrecao;
begin
  with DMNfe do
  begin
    Result := TEventoCTe.Create(QGeraCteEventoID_EVENTO.Value, TCteVersaoFactory.GetCteVersao(QGeraCteDESC_VERSAO_CTE.Value));

    with Result.InfEvento do
    begin
      COrgao := QGeraCteCOD_UF_IBGE_FILIAL.Value;
      TpAmb := QGeraCteIND_AMBIENTE_CTE.Value;
      CNPJ := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_FILIAL.Value));
      ChCTe := QGeraCteEventoDESC_CHAVE_ACESSO.Value;
      if (QGeraCteDESC_VERSAO_CTE.Value = '3.00') or (QGeraCteDESC_VERSAO_CTE.Value = '4.00') then
        DhEvento := TCTeDataHora.Create( QGeraCteEventoDT_EVENTO.Value).ToString +
          GetFuso(QGeraCteUF_FILIAL.Value)
      else
        DhEvento := TCTeDataHora.Create.ToString;
      TpEvento := wTpEvento;
      NSeqEvento := QGeraCteEventoNSEQ_EVENTO.Value;
      DetEvento := TDetEvento.Create(TCteVersaoFactory.GetCteVersao(QGeraCteDESC_VERSAO_CTE.Value));
      
      with DetEvento do
      begin
        case wTpEvento of
          TP_EVENTO_DFE_CANCELAMENTO:
          begin
            EvCancCTe := TEvCancCTe.Create;
            EvCancCTe.DescEvento := 'Cancelamento';
            EvCancCTe.NProt := QCteDESC_PROT_AUTORIZACAO.Value;
            EvCancCTe.XJust := QGeraCteEventoDESC_JUSTIFICATIVA.Value;
          end;
          TP_EVENTO_DFE_CARTA_CORRECAO:
          begin
            EvCCeCTe := TEvCCeCTe.Create;
            EvCCeCTe.DescEvento := 'Carta de Correção';
            EvCCeCTe.InfCorrecao := TCTeElementItems.Create;
            QCorrecaoCTe.Close;
            QCorrecaoCTe.Open;
            if QCorrecaoCTe.RecordCount > 0 then
            begin
              QCorrecaoCTe.First;
              while not QCorrecaoCTe.Eof do
              begin
                wInfCorrecao := TInfCorrecao.Create;
                wInfCorrecao.GrupoAlterado := QCorrecaoCTeDESC_GRUPO_ALTERADO.Value;
                wInfCorrecao.CampoAlterado := QCorrecaoCTeDESC_CAMPO_ALTERADO.Value;
                wInfCorrecao.ValorAlterado := QCorrecaoCTeDESC_VALOR_ALTERADO.Value;
                if not QCorrecaoCTeNUM_ITEM_ALTERADO.IsNull then
                  wInfCorrecao.NroItemAlterado := TCTeIntegerComZero.Create( QCorrecaoCTeNUM_ITEM_ALTERADO.Value,2);
                EvCCeCTe.InfCorrecao.AddItem(wInfCorrecao);
                QCorrecaoCTe.Next;
              end;
            end;
            EvCCeCTe.XCondUso := 'A Carta de Correção é disciplinada pelo Art. ' +
              '58-B do CONVÊNIO/SINIEF 06/89: Fica ' +
              'permitida a utilização de carta de correção, ' +
              'para regularização de erro ocorrido na ' +
              'emissão de documentos fiscais relativos à ' +
              'prestação de serviço de transporte, desde ' +
              'que o erro não esteja relacionado com: I - as ' +
              'variáveis que determinam o valor do imposto ' +
              'tais como: base de cálculo, alíquota, ' +
              'diferença de preço, quantidade, valor da ' +
              'prestação;II - a correção de dados ' +
              'cadastrais que implique mudança do ' +
              'emitente, tomador, remetente ou do ' +
              'destinatário;III - a data de emissão ou de saída.';
          end;
        end;
      end;
    end;
  end;
end;

class function TCteUtils.GeraXMLCTeEvento(wTpEvento: Integer): String;
begin
  Result := GeraXMLCTeEvento(GeraCTeEvento(wTpEvento));
end;

class function TCteUtils.GeraXMLCTeEvento(
  CTeEvento: TEventoCTe): String;
var
  wXml :String;
begin
  wXml := CTeEvento.GetXML('eventoCTe', TCteVersaoFactory.GetCteVersao(CTeEvento.Versao));
  Result := wXml;
end;

class function TCteUtils.GeraCTeOS(CodCT: Integer): TCTeOS;
var
  wInfPercurso: TInfPercurso;
  wInfDocRef: TInfDocRef;
  wAutXML: TAutXML;
  wComp: TComp;
  wCompComp: TCompComp;
  Icm: TICMSCte;
  Int: Integer;
  wEmiDocAnt: TEmiDocAnt;
  wIdDocAnt: TIdDocAnt;
  wIdDocAntPap: TIdDocAntPap;
  wIdDocAntEle: TIdDocAntEle;
  wSeg: TSeg;

  i: Integer;
  Today: TDateTime;
  chave: String;
begin
  Result := nil;
  with DMNfe do
  begin
    QGeraCte.Close;
    QGeraCte.ClearVariables;
    QGeraCte.SetVariable('COD_CONHECIMENTO', CodCT);
    QGeraCte.Open;

    DMParamSistema.QParamSistema.Close;
    DMParamSistema.QParamSistema.Open;
    QTitulos.Close;
    QTitulos.Open;
    QDocOriginario.Close;
    QDocOriginario.Open;
    QDocAnterior.Close;
    QDocAnterior.Open;
    QVeiculoCTe.Close;
    QVeiculoCTe.Open;
    QMotoristaCTe.Close;
    QMotoristaCTe.Open;
    QUFPercursoCTe.Close;
    QUFPercursoCTe.Open;
    QUFPercursoCTe.Close;
    QUFPercursoCTe.Open;

    //verifica se nf-e nao foi gerada anteriormente
    ValidaCte;

    if (QGeraCte.Eof) then
      Exit;

    Result := TCTeOS.Create('', TCteVersaoFactory.GetCteVersao(QGeraCteDESC_VERSAO_CTE.Value));
    with Result.InfCte do
    begin
      Ide := TIdeOS.Create;
      Id := QGeraCteDESC_CHAVE_ACESSO_CTE.Value; //Atribuindo aqui, para pegar o cDV automaticamente no SetId.
      Ide.CUF := QGeraCteCOD_UF_IBGE_FILIAL.Value;
      Ide.CFOP := QGeraCteNUM_CFOP.AsInteger;
      Ide.NatOp := QGeraCteDESC_OPERACAO.Value;

      Ide.Mod_ := QGeraCteCOD_SERIE_MODELO.AsInteger;
      Ide.Serie := QGeraCteCOD_SERIE.AsInteger;
      Ide.NCT := QGeraCteNUM_CONHECIMENTO.Value;
      Today := Time;
      Ide.DhEmi := TCTeDataHora.Create(QGeraCteDT_EMISSAO.Value+
        DMOracle.HoraServ).ToString + GetFuso(QGeraCteUF_FILIAL.Value);
      if (QGeraCteCOD_PAIS_IBGE_TOM.Value <> 1058) then
        Ide.IndIEToma := 9
      else
      begin
        if QGeraCteIND_FISICA_JURIDICA_TOM.Value = 'F' then
        begin
          Ide.IndIEToma := 9;
          if QGeraCteINSCRICAO_MUN_TOM.Value <> '' then
            Ide.IndIEToma := 1;
        end
        else
        begin
          if (QGeraCteINSCRICAO_TOM.Value = '') or
              ((QGeraCteINSCRICAO_TOM.Value = 'ISENTO') and
               (QGeraCteIND_CONTRIBUINTE_TOM.Value = 'NAO')) then
            Ide.IndIEToma := 9
          else if (QGeraCteINSCRICAO_TOM.Value = 'ISENTO') then
            Ide.IndIEToma := 2
          else
            Ide.IndIEToma := 1;
        end;
      end;
      
      Ide.TpImp := 1; //Tipo de Impressão --  1 - Retrato / 2 - Paisagem
      Ide.TpEmis := QGeraCteIND_CONTINGENCIA_CTE_FILIAL.AsInteger;
      Ide.TpAmb := QGeraCteIND_AMBIENTE_CTE_FILIAL.Value;
      Ide.TpCTe := QGeraCteIND_TIPO_CTE.Value;
      Ide.ProcEmi := 0; // Identificador do Processo de Emissão --
                        // 0 - Aplicativo do Contribuinte / 1 - Avulsa pelo Fisco /
                        // 2 - Avulsa pelo site do Fisco / 3 - Aplicativo Fisco
      Ide.VerProc := '1.3.8';

      Ide.CMunEnv := StrToInt('0' + qgeractecod_uf_IBGE_ORIG.Text + QGeraCteCOD_CIDADE_IBGE_ORIG.Text);
      Ide.XMunEnv := QGeraCteDESC_CIDADE_ORIG.Value;
      Ide.UFEnv := QGeraCteUF_ORIG.Value;
      Ide.Modal := TCTeIntegerComZero.Create(1,2);
      Ide.TpServ := QGeraCteIND_TIPO_SERVICO.Value;
      Ide.CMunIni := StrToInt('0' + qgeractecod_uf_IBGE_ORIG.Text + QGeraCteCOD_CIDADE_IBGE_ORIG.Text);
      Ide.XMunIni:= QGeraCteDESC_CIDADE_ORIG.Value;
      Ide.UFIni := QGeraCteUF_ORIG.Value;
      Ide.CMunFim := StrToInt('0' + QGeraCteCOD_UF_IBGE_DESTINO.Text + QGeraCteCOD_CIDADE_IBGE_DESTINO.Text);
      Ide.XMunFim := QGeraCteDESC_CIDADE_DESTINO.Value;
      Ide.UFFim := QGeraCteUF_DESTINO.Value;
      Ide.InfPercurso := TCTeElementItems.Create;
      if QUFPercursoCTe.RecordCount > 0 then
      begin
        QUFPercursoCTe.First;
        while not QUFPercursoCTe.Eof do
        begin
          wInfPercurso := TInfPercurso.Create;
          wInfPercurso.UFPer := QUFPercursoCTeCOD_ESTADO.Value;
          Ide.InfPercurso.AddItem(wInfPercurso);    
          QUFPercursoCTe.Next;
        end;
      end;
      
      Compl := TCompl.Create;
      with Compl do
      begin
        XCaracAd := QGeraCteDESC_CARAC_ADICIONAL_TRANSP.Value;
        XCaracSer := QGeraCteDESC_CARAC_ADICIONAL_SERV.Value;
        XEmi := QGeraCteDESC_FUNC_EMISSOR_CTE.Value;
        XObs := '';
        if QGeraCteSVAL_TOTAL_TRIBUTOS.Value > 0 then
          XObs := 'Valor Aprox. Total dos Tributos: ' + FormatFloat('#,##0.00', QGeraCteSVAL_TOTAL_TRIBUTOS.Value)+ '\n';
        if trim(QGeraCteDESC_OBS.Value) <> '' then
          XObs := XObs + Trim(QGeraCteDESC_OBS.Value) + ' \n';
        if trim(QGeraCteOBS_TRIBUTACAO.Value) <> '' then
          XObs := XObs + trim(QGeraCteOBS_TRIBUTACAO.Value) + ' \n';

        if QGeraCtePERC_ALIQ_CRED_ICMSSN.Value > 0 then
          XObs := XObs + 'PERMITE O APROVEITAMENTO DO CREDITO DE ICMS NO VALOR DE R$ ' +
                  FormatFloat('#,##0.00', (QGeraCteVAL_TOTAL_CTE.Value * QGeraCtePERC_ALIQ_CRED_ICMSSN.Value) /100) +
                  ' CORRESPONDENTE A ALIQUOTA DE ' + QGeraCtePERC_ALIQ_CRED_ICMSSN.Text +
                  '%, NOS TERMOS DO ARTIGO 23 DA LC 123 \n';

        if (QGeraNfeCOD_MENSAGEM.Value > 0) then
        begin
          QMensagem.Close;
          QMensagem.SetVariable('COD_MENSAGEM', QGeraNfeCOD_MENSAGEM.Value);
          QMensagem.Open;
          if (QMensagemDESC_MENSAGEM.Value <> '') then
            XObs := Trim(XObs + QMensagemDESC_MENSAGEM.Value);
          if (QMensagemDESC_COMPLEMENTO.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO.Value);
          if (QMensagemDESC_COMPLEMENTO1.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO1.Value);
          if (QMensagemDESC_COMPLEMENTO2.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO2.Value);
          if (QMensagemDESC_COMPLEMENTO3.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO3.Value);
          if (QMensagemDESC_COMPLEMENTO4.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO4.Value);
          if (QMensagemDESC_COMPLEMENTO5.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO5.Value);
          if (QMensagemDESC_COMPLEMENTO6.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO6.Value);
          if (QMensagemDESC_COMPLEMENTO7.Value <> '') then
            XObs := Trim(XObs + '\n'+ QMensagemDESC_COMPLEMENTO7.Value);
        end;
      end;
      Emit := TEmit.Create;
      with Emit do
      begin
        Emit.CNPJ := Bib.LimpaNumero(QGeraCteCPF_CNPJ_FILIAL.Value);
        Emit.XNome := Trim(QGeraCteNOME_FILIAL.Value);
        Emit.XFant := Trim(QGeraCteNOME_FILIAL.Value);
        Emit.IE := IfThen(Trim(QGeraCteINSCRICAO_FILIAL.Value) = 'ISENTO', 'ISENTO',
                    Bib.LimpaNumero(QGeraCteINSCRICAO_FILIAL.Value));
        Ender := TEnderecoCTe.Create;
        with Ender do
        begin
          XLgr := Trim(QGeraCteENDERECO_FILIAL.Value);
          Nro := IfThen((QGeraCteNUM_ENDERECO_FILIAL.Text <> ''),QGeraCteNUM_ENDERECO_FILIAL.Text,'SN');
          XCpl := Trim(QGeraCteCOMPLEMENTO_FILIAL.Value);
          XBairro := QGeraCteBAIRRO_FILIAL.Value;
          CMun := StrToInt('0' + QGeraCteCOD_UF_IBGE_FILIAL.Text + QGeraCteCOD_CIDADE_IBGE_FILIAL.Value);
          XMun := Trim(QGeraCteCIDADE_FILIAL.Value);
          CEP := TCteIntegerComZero.Create(StrToInt('0' + Bib.LimpaNumero(QGeraCteCEP_FILIAL.Value)),8);
          UF := QGeraCteUF_FILIAL.Value;
          Fone := Bib.LimpaNumero(QGeraCteTELEFONE_FILIAL.Value);
        end;
        if Result.InfCte.Versao = '4.00' then
          Emit.CRT := QGeraCteIND_REGIME_TRIBUTARIO.Value;
      end;
      if not QGeraCteCOD_CADASTRO_TOMADOR.IsNull then      // Terminar Depois
      begin
        Toma := TToma.Create;
        with Toma do
        begin  
          XNome := Trim(QGeraCteNOME_TOM.Value);
          Fone := Bib.LimpaNumero(QGeraCteTELEFONE_TOM.Value);
          Ender := TEnderecoCTe.Create;
          with Ender do
          begin
            XLgr := Trim(Bib.RemoveNumEndereco(QGeraCteENDERECO_TOM.Value, Nro));
            Nro := Bib.NumEndereco(QGeraCteENDERECO_TOM.Value);
            XCpl := Trim(QGeraCteCOMPLEMENTO_TOM.Value);
            XBairro := Trim(QGeraCteBAIRRO_TOM.Value);
            CMun := StrToInt('0' + QGeraCteCOD_UF_IBGE_TOM.Text + QGeraCteCOD_CIDADE_IBGE_TOM.Value);
            XMun := Trim(QGeraCteCIDADE_TOM.Value);
            CEP := TCteIntegerComZero.Create(StrToInt('0' + Bib.LimpaNumero(QGeraCteCEP_TOM.Value)),8);
            UF := QGeraCteUF_TOM.Value;
            CPais := QGeraCteCOD_PAIS_IBGE_TOM.AsInteger;
            XPais := Trim(QGeraCtePAIS_TOM.Value);
          end;
          if QGeraCteIND_FISICA_JURIDICA_TOM.Value = 'F' then
            CPF := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_TOM.Value))
          else
          begin
            if Ender.CMun = 9999999 then
              CNPJ := '00000000000000'
            else
              CNPJ := Trim(Bib.LimpaNumero(QGeraCteCPF_CNPJ_TOM.Value));
            IE := IfThen((QGeraCteINSCRICAO_TOM.Value = 'ISENTO') and
               (QGeraCteIND_CONTRIBUINTE_TOM.Value = 'NAO'),'',
                IfThen(QGeraCteINSCRICAO_TOM.Value = 'ISENTO','ISENTO',
               Bib.LimpaNumero(QGeraCteINSCRICAO_TOM.Value)));
          end;
          Email := LeftStr(Trim(QGeraCteEMAIL_TOM.Value), 60);
        end;
      end;
      
      VPrest := TVPrest.Create;
      with VPrest do
      begin
        VTPrest := TCTeFloat2.Create(QGeraCteVAL_TOTAL_CTE.Value);
        VRec := TCTeFloat2.Create(QGeraCteVAL_A_RECEBER.Value);

        Comp := TCTeElementItems.Create;
        if QGeraCteVAL_FRETE_PESO.Value > 0 then
        begin
          wComp := TComp.Create;
          wComp.XNome := 'FRETE PESO';
          wComp.VComp := TCTeFloat2.Create(QGeraCteVAL_FRETE_PESO.Value);
          Comp.AddItem(wComp);
        end;
        if QGeraCteVAL_FRETE.Value > 0 then
        begin
          wComp := TComp.Create;
          wComp.XNome := 'FRETE VALOR';
          wComp.VComp := TCTeFloat2.Create(QGeraCteVAL_FRETE.Value);
          Comp.AddItem(wComp);
        end;

        if QGeraCteVAL_DESPACHO.Value > 0 then
        begin
          wComp := TComp.Create;
          wComp.XNome := 'DESPACHO';
          wComp.VComp := TCTeFloat2.Create(QGeraCteVAL_DESPACHO.Value);
          Comp.AddItem(wComp);
        end;

        if QGeraCteVAL_GRIS.Value > 0 then
        begin
          wComp := TComp.Create;
          wComp.XNome := 'GRIS';
          wComp.VComp := TCTeFloat2.Create(QGeraCteVAL_GRIS.Value);
          Comp.AddItem(wComp);
        end;

        if QGeraCteVAL_PEDAGIO.Value > 0 then
        begin
          wComp := TComp.Create;
          wComp.XNome := 'PEDAGIO';
          wComp.VComp := TCTeFloat2.Create(QGeraCteVAL_PEDAGIO.Value);
          Comp.AddItem(wComp);
        end;
        if QGeraCteVAL_FRETE_POR_TON.Value > 0 then
        begin
          wComp := TComp.Create;
          wComp.XNome := 'TARIFA P/ TON';
          wComp.VComp := TCTeFloat2.Create(QGeraCteVAL_FRETE_POR_TON.Value);
          Comp.AddItem(wComp);
        end;
      end;
      Icm := nil;
      Imp := TImpCte.Create;
      Imp.ICMS := TICMSImposto.Create;

      if (QGeraCteIND_REGIME_TRIBUTARIO.Value = 1) then
        Icm := TICMSSN.Create(CST_ICMS_TRIB_OUTROS)
      else
      begin
        if Length(QGeraCteCST.Value) > 2 then
          Int := StrToInt('0' + Copy(QGeraCteCST.Value, 2, 2))
        else
          Int := StrToInt('0' + QGeraCteCST.Value);

        if Int in [40, 41, 51] then
          Icm := TICMS45.Create(Int)
        else
        begin
          case Int of
            0:
            begin
              Icm := TICMS00.Create;
              with Icm as TICMS00 do
              begin
                PICMS := TCTeFloat2.Create(Bib.ift(QGeraCtePERC_TRIBUTADO_NOTA.Value > 0,QGeraCtePERC_TRIBUTADO_NOTA.Value,QGeraCtePERC_ALIQUOTA.Value));
                VBC := TCTeFloat2.Create(QGeraCteVAL_BASE_ICMS.Value);
                VICMS := TCTeFloat2.Create(QGeraCteVAL_ICMS.Value);
              end;
            end;
            20:
            begin
              Icm := TICMS20.Create;
              with Icm as TICMS20 do
              begin
                PRedBC := TCTeFloat2.Create(100 - QGeraCtePERC_TRIBUTADO.Value); //100 - valor da tabela de tributacao
                PICMS := TCTeFloat2.Create(Bib.ift(QGeraCtePERC_TRIBUTADO_NOTA.Value > 0,QGeraCtePERC_TRIBUTADO_NOTA.Value,QGeraCtePERC_ALIQUOTA.Value));
                VBC := TCTeFloat2.Create(QGeraCteVAL_BASE_ICMS.Value);
                VICMS := TCTeFloat2.Create(QGeraCteVAL_ICMS.Value);
              end;
            end;
            60:
            begin
              Icm := TICMS60.Create;
              with Icm as TICMS60 do
              begin
                VBCSTRet := TCTeFloat2.Create(QGeraCteVAL_BASE_ICMS_SUBST.Value);
                VICMSSTRet := TCTeFloat2.Create(QGeraCteVAL_ICMS_SUBST.Value);
                PICMSSTRet := TCTeFloat2.Create(QGeraCtePERC_ALIQUOTA.Value);
              end;
            end;
            90:
            begin
              Icm := TICMS90.Create;
              with Icm as TICMS90 do
              begin
                if QGeraCtePERC_TRIBUTADO.Value <= 100 then
                  PRedBC := TCTeFloat2.Create( 100 - QGeraCtePERC_TRIBUTADO.Value);
                PICMS := TCTeFloat2.Create(Bib.ift(QGeraCtePERC_TRIBUTADO_NOTA.Value > 0,QGeraCtePERC_TRIBUTADO_NOTA.Value,QGeraCtePERC_ALIQUOTA.Value));
                VBC := TCTeFloat2.Create(QGeraCteVAL_BASE_ICMS.Value);
                VICMS := TCTeFloat2.Create(QGeraCteVAL_ICMS.Value);
              end;
            end;
          end;
        end;
      end;
      Imp.ICMS.Icms := Icm;
      Imp.InfTribFed := TInfTribFed.Create;
      with Imp.InfTribFed do
      begin
        VPIS := TCTeFloat2.Create(QGeraCteVAL_PIS.Value);
        VCOFINS := TCTeFloat2.Create(QGeraCteVAL_COFINS.Value);
        VIR := TCTeFloat2.Create(QGeraCteVAL_IR.Value);
        VINSS := TCTeFloat2.Create(QGeraCteVAL_INSS.Value);
        VCSLL := TCTeFloat2.Create(QGeraCteVAL_CSLL.Value);
      end;
      if QGeraCteVAL_CBS_TOTAL.Value >= 0 then
      begin
        Imp.IBSCBS := TIBSCBS.Create;
        with Imp.IBSCBS do
        begin
          CST := '000';
          CClassTrib := '000001';
          GIBSCBS := TGIBSCBS.Create;
          with GIBSCBS do
          begin
            VBC := TCTeFloat2.Create(QGeraCteVAL_BC_IBS_CBS.Value);

            GIBSUF := TGIBSUF.Create;
            GIBSUF.PIBSUF := TCTeFloat4.Create(0.1);
            GIBSUF.VIBSUF := TCTeFloat2.Create(QGeraCteVAL_IBS_EST.Value);

            GIBSMun := TGIBSMun.Create;
            GIBSMun.PIBSMun := TCTeFloat4.Create(0);
            GIBSMun.VIBSMun := TCTeFloat2.Create(QGeraCteVAL_IBS_MUN.Value);

            GCBS := TGCBS.Create;
            GCBS.PCBS := TCTeFloat4.Create(0.9);
            GCBS.VCBS := TCTeFloat2.Create(QGeraCteVAL_CBS_TOTAL.Value);
            VIBS := TCTeFloat2.Create(QGeraCteVAL_IBS_EST.Value + QGeraCteVAL_IBS_MUN.Value);
          end;
        end;
      end;
      Imp.VTotDFe := TCTeFloat2.Create(QGeraCteVAL_TOTAL_CTE.Value); // implementação futura a partir de 2027 => + Imp.IBSCBS.GIBSCBS.VIBS.Valor + QGeraCteVAL_CBS_TOTAL.Value);
      Imp.InfAdFisco := Trim(QGeraCteDESC_INF_ADIC_FISCO.Value);
      if (QGeraCteIND_TIPO_CTE.Value = 0) or (QGeraCteIND_TIPO_CTE.Value = 3) then
      begin
        InfCteNorm := TInfCTeNorm.Create;
        with InfCTeNorm do
        begin
          InfServico := TInfServico.Create;
          with InfServico do
          begin
            XDescServ := QGeraCteDESC_SERVICO.Value;
            InfQ := TInfQ.Create;
            InfQ.QCarga := TCTeFloat4.Create(QGeraCteQT_VOLUMES.Value);
          end;
          InfDocRef := TCTeElementItems.Create;

          while not QDocOriginario.Eof do
          begin
            wInfDocRef := TInfDocRef.Create;
            with wInfDocRef do
            begin
              NDoc := QDocOriginarioNUM_DOCUMENTO.Text;
              Serie := QDocOriginarioCOD_SERIE.Value;
              SubSerie := QDocOriginarioCOD_SUBSERIE.Value;
              DEmi := TCTeData.Create(QDocOriginarioDT_EMISSAO.Value);
              if QDocOriginarioVAL_TOTAL.Value > 0 then
                VDoc := TCTeFloat2.Create(QDocOriginarioVAL_TOTAL.Value);

            end;
            InfDocRef.AddItem(wInfDocRef);
            QDocOriginario.Next;
          end;
          
          Seg := TCTeElementItems.Create;
          wSeg := TSeg.Create;

          with wSeg do
          begin
            RespSeg := QGeraCteIND_RESP_SEGURO.Text;
            XSeg := Trim(QGeraCteDESC_SEGURADORA.Value);
            NApol := Trim(QGeraCteNUM_APOLICE_SEGURO.Value);
            Seg.AddItem(wSeg);
          end;

          InfModal := TInfModal.Create;
          InfModal.VersaoModal := QGeraCteDESC_VERSAO_CTE.Value;;
          InfModal.RodoOS := TRodoOS.Create;
          with InfModal.RodoOS do
          begin
            if QGeraCteUF_ORIG.Value <> QGeraCteUF_DESTINO.Value then
              TAF := TCTeIntegerComZero.Create(StrToInt('0'+QGeraCteDESC_TAF.Value),12)
            else
              NroRegEstadual := TCTeIntegerComZero.Create(StrToInt('0'+QGeraCteDESC_NRO_REG_ESTADUAL.Value),25);
            QVeiculoCTe.First;
            Veic := TVeicOS.Create;
            if not QVeiculoCTe.Eof then
            begin
              with Veic do
              begin
                Placa := StringReplace(QVeiculoCTeDESC_PLACA.Value, ' ', '', [rfReplaceAll]);
                Placa := StringReplace(Placa, '-', '', [rfReplaceAll]);
                if trim(QVeiculoCTeDESC_RENAVAN.Value) <> '' then
                  RENAVAM := IntToStr(StrToInt(Bib.LimpaNumero(QVeiculoCTeDESC_RENAVAN.Value)));

                if (Trim(QVeiculoCTeNUM_CGC_CPF.Value) <> '') and
                   (Bib.LimpaNumero( QVeiculoCTeNUM_CGC_CPF.Value) <> Emit.CNPJ) then
                begin
                  Veic.Prop := TPropOS.Create;
                  with Veic.Prop do
                  begin
                    if Length(Bib.LimpaNumero( QVeiculoCTeNUM_CGC_CPF.Value)) = 11 then
                      CPF := Bib.LimpaNumero( QVeiculoCTeNUM_CGC_CPF.Value)
                    else
                      CNPJ := Bib.LimpaNumero(QVeiculoCTeNUM_CGC_CPF.Value);
                    TAF :=  Bib.LimpaNumero(QVeiculoCTeDESC_TAF.Value);
                    NroRegEstadual := Bib.LimpaNumero(QVeiculoCTeDESC_NRO_REG_ESTADUAL.Value);
                    XNome := Trim(QVeiculoCTeNOME.Value);
                    IE := Bib.LimpaNumero(QVeiculoCTeNUM_INSCRICAO.Value);
                    UF := QVeiculoCTeCOD_ESTADO.Value;
                    TpProp := QVeiculoCTeIND_TIPO_PROPRIETARIO.Value;
                  end;
                end;
                UF := QVeiculoCTeCOD_ESTADO.Value;
              end;
            end;
            InfFretamento := TInfFretamento.Create;
            InfFretamento.TpFretamento := QGeraCteIND_TIPO_FRETAMENTO.Value;
            if (QGeraCteDT_VIAGEM.Text <> '') and (QGeraCteHORA_VIAGEM.Value <> '') then
              InfFretamento.DhViagem := TCTeDataHoraTZD.Create(
                StrToDateTime(FormatDateTime('dd/MM/yyyy', QGeraCteDT_VIAGEM.Value) + ' ' +
                QGeraCteHORA_VIAGEM.Value+':00')).ToString;

          end;

          
          if QGeraCteIND_TIPO_CTE.Value = 3 then
          begin
            chave := Bib.LimpaNumero(DMOracle.FastSelect('DESC_CHAVE_ACESSO_CTE','TB_CONHECIMENTO','COD_CONHECIMENTO = '+QGeraCteCOD_CONHECIMENTO_REF.Text));
            if chave <> '' then
            begin
              InfCteSub := TInfCteSub.Create;
              with InfCteSub do
              begin
                ChCte := chave;
                if QGeraCteIND_TOMA_ICMS.Value = 'S' then
                begin
                  TomaICMS := TTomaICMS.Create;
                  if Copy( QGeraCteDESC_CHAVE_ACESSO_REF.Value, 21,2) = '55' then
                    TomaICMS.RefNFe := QGeraCteDESC_CHAVE_ACESSO_REF.Value;
                  if Copy( QGeraCteDESC_CHAVE_ACESSO_REF.Value, 21,2) = '57' then
                    TomaICMS.RefCte := Bib.LimpaNumero(QGeraCteDESC_CHAVE_ACESSO_REF.Value);
                end
                else
                begin
                  chave := Bib.LimpaNumero(DMOracle.FastSelect('DESC_CHAVE_ACESSO_CTE','TB_CONHECIMENTO','COD_CONHECIMENTO = '+QGeraCteCOD_CTE_ANULACAO_REF.Text));
                  if chave <> '' then
                    RefCteAnu := chave;
                end;
              end;
            end;
          end;
        end;
      end;

      InfRespTec := TInfRespTecOS.Create;
      InfRespTec.CNPJ := '81504763000171';
      InfRespTec.XContato := 'Adriel Inácio Dias';
      InfRespTec.Email := 'adriel@cemapa.com';
      InfRespTec.Fone := '4532643773';
      InfRespTec.IdCSRT := TCTeIntegerComZero.Create(DMParamSistema.QParamSistemaDESC_IDENTIFICADOR_CSRT.AsInteger, 3);

      with DMConhecimento do
      begin
        if QGeraCteCOD_CONHECIMENTO_REF.Value <> 0 then
        begin
          QConhecimentoCons.Close;
          QConhecimentoCons.ClearVariables;
          QConhecimentoCons.SetVariable('COD_CONHECIMENTO', QGeraCteCOD_CONHECIMENTO_REF.Value);
          QConhecimentoCons.SetVariable('DT_EMISSAO_INI', '01/01/1900');
          QConhecimentoCons.SetVariable('DT_EMISSAO_FIM', DateToStr(Date));
          QConhecimentoCons.SetVariable('COD_CADASTRO_REMETENTE', Null);
          QConhecimentoCons.SetVariable('COD_CADASTRO_DESTINATARIO', Null);
          QConhecimentoCons.SetVariable('NUM_CONHECIMENTO', NULL);
          QConhecimentoCons.SetVariable('Cod_Nota_Cab', NULL);
          QConhecimentoCons.SetVariable('Cod_Contrato_Vend', NULL);
          QConhecimentoCons.SetVariable('COD_FILIAL', NULL);
          QConhecimentoCons.SetVariable('Desc_Placa', NULL);
          QConhecimentoCons.SetVariable('Situacao',Null);
          QConhecimentoCons.Open;
          if QGeraCteIND_TIPO_CTE.Value = 1 then  // Complemento de CT-e
          begin
            InfCteComp := TInfCteComp.Create;
            InfCteComp.ChCTe := Bib.LimpaNumero(QConhecimentoConsDESC_CHAVE_ACESSO_CTE.Value);
          end;
          if QGeraCteIND_TIPO_CTE.Value = 2 then
          begin
            chave := Bib.LimpaNumero(DMOracle.FastSelect('DESC_CHAVE_ACESSO_CTE','TB_CONHECIMENTO','COD_CONHECIMENTO = '+QGeraCteCOD_CONHECIMENTO_REF.Text));
            if chave <> '' then
            begin
              InfCteAnu := TInfCteAnu.Create;
              InfCteAnu.ChCte := chave;
              if QGeraCteDT_DECLARACAO_NAO_CONTRIB.Text <> '' then
                InfCteAnu.DEmi := TCTeData.Create(QGeraCteDT_DECLARACAO_NAO_CONTRIB.Value).ToString;
            end;
          end;
        end;
      end;
      AutXML := TCTeElementItems.Create;
      QAutXML.Close;
      QAutXML.SetVariable('IND_TIPO_DOCUMENTO',67);
      QAutXML.SetVariable('COD_FILIAL',QGeraCteCOD_FILIAL.Value);
      QAutXML.Open;
      QAutXML.First;
      while not QAutXML.Eof do
      begin
        wAutXML := TAutXML.Create;
        if Length(Bib.LimpaNumero(QAutXMLNUM_CGC_CPF.Value)) = 11 then
          wAutXML.CPF := QAutXMLNUM_CGC_CPF.Value
        else
          wAutXML.CNPJ := QAutXMLNUM_CGC_CPF.Value;
        AutXML.AddItem(wAutXML);
        QAutXML.Next;
      end;
    end;
  end;
end;

class function TCteUtils.GeraXMLCTeOS(CodCT: Integer): String;
begin
  Result := GeraXMLCTeOS(GeraCTeOS(CodCT));
end;

class function TCteUtils.GeraXMLCTeOS(CTe: TCTeOS): String;
var
  wXml :String;
begin
  wXml := CTe.GetXML( 'CTeOS', TCteVersaoFactory.GetCteVersao(CTe.InfCte.Versao));
  Result := wXml;
end;

end.
