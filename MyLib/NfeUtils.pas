unit NfeUtils;

interface

uses
  Nfe, Pessoa, CartaCorrecao, Endereco, Ide, NfeConsts, XMLUtils, Dialogs, Classes, SysUtils;
  //Caso não encontre as Units, adicionar no path: "..\MyLib\NfeTypes"

type

  TNfeUtils = class
  private
  protected
    class function RetornaEstadoVeiculo(Placa: String): String;
  public
    class function EnviaLoteNfe(IdLote: Integer): Boolean;
    class function GeraChaveAcesso(CodUF: Integer; DtEmissao: TDateTime;
      CNPJ: string; Modelo, Serie, NumeroNF, FormaEmissao: Integer): string;
    class function GeraNFe(CodNota: Integer): TNfe;
    class function GeraNFCe(CodNota: Integer): TNfe;
    class function GeraXMLNFe(CodNota: Integer): String; overload;
    class function GeraXMLNFe(NFe: TNFe): String; overload;
    class function GeraCCe(CodNota: Integer): TEnvEvento;
    class function GeraXMLCCe(envEvento: TenvEvento): String; overload;
    class function GeraXMLCCe(CodNota: Integer): String; overload;
	  class function GeraNFeCanc(CodNota: Integer): TenvEvento;
    class function GeraXMLNFeCanc(CodNota: Integer): String; overload;
	  class function GeraXMLNFeCanc(envEvento: TenvEvento): String; overload;
    class function GeraMD(): TEnvEvento;
    class function GeraXMLMD(): String; overload;
  end;

implementation

uses UNfe_cl, UBiblioteca, Windows,Math, DB, TypInfo, Item, NfeTypes,
  Imposto, ICMS, IPI, PIS, StrUtils, COFINS, ISSQN, Total, Transp, exporta, IBSCBS, IBSCBSTot,
  Cobranca, InfAdic, NfeVersao, DateUtils, UOracle_cl, UParamSistema_cl,
  UNotaSaida_cl, UNotaEntrada_cl, DI, Adi, NFref, II, UNfeParam, MaskUtils,
  UUsuario_cl;

{ TNfeUtils }

class function TNfeUtils.EnviaLoteNFe(IdLote: Integer): Boolean;
begin
  Result := True;
end;

class function TNfeUtils.GeraChaveAcesso(CodUF: Integer; DtEmissao: TDateTime; CNPJ: string;
  Modelo, Serie, NumeroNF, FormaEmissao: integer): string;
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
    Bib.StrZero2(StrToFloat(Bib.LimpaNumero(CNPJ)),14,0) + Bib.StrZero2(Modelo, 2, 0) + Bib.StrZero2(Serie, 3, 0) +
    Bib.StrZero2(NumeroNF, 9, 0) + IntToStr(FormaEmissao) + Bib.StrZero2(CodigoNumerico, 8, 0);
  Result := chave + Bib.Modulo11(chave);
end;

class function TNfeUtils.GeraNfe(CodNota: Integer): TNfe;
function TemCEST(codigoST: string): Boolean;
var wCst_Csosn: Integer;
begin
  wCst_Csosn := StrToInt('0'+codigoST);
  result := ((wCst_Csosn = 10) or (wCst_Csosn = 30) or (wCst_Csosn = 60)
    or (wCst_Csosn = 61)
    or (wCst_Csosn = 70) or (wCst_Csosn = 90) or (wCst_Csosn = 201)
    or (wCst_Csosn = 202) or (wCst_Csosn = 203) or (wCst_Csosn = 500)
    or (wCst_Csosn = 900));

  // Retirado para CGS a pedido da Katia
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
    result := false;
end;
var
  Prod: TProd;
  Icm: TICMS;
  Ipi: TIPI;
  Pis: TPIS;
  Cofins: TCOFINS;
  Issqn: TISSQN;
  wDet: TDet;
  wMed: TMed;
  wRastro: TRastro;
  wDetExport: TDetExport;
  wAutXML: TAutXML;
  Int: Integer;
  Dup: TDup;
  DI :TDI;
  ADI :TADI;
  wPag: TPag;
  Tribs, ObsTrib, Empresa, MsgNotasReferenciadas: String;
  Retornavel: Boolean;
  ChaveBusca, XmlNfe, NotaProdutor :String;
  Buscador :TBuscador;
  arrAdi : TList;
  Origem: Integer;
  NFRef: TNFref;
  chaveRef :String;
  II: TII;
  TotalTributos: Double;
  MostraMsgReducaoST: Integer;
  TotalCredICMSSN: Double;
  TotalICMSOp: Double;
  TotalICMSDif: Double;
  TotalICMSDevido: Double;
  TotalICMSUFDest: Double;
  TotalICMSUFRemet: Double;
  TotalFCPUFDest: Double;
  TotalFCP: Double;
  TotalFCPST: Double;
  TotalFCPSTRet: Double;
  TotalParcelas: Double;
  wTotalQBCMonoRet: Double;
  wTotalVICMSMonoRet: Double;
  posVirgula: Integer;
  SomaDescontos, wPercICMSInterPart: Real;
  wPesob, wPesol, wQuantidadeItens: Double;
  wListaOS: TStringList;
  wValPisCofins: double;
  wAliqPisCofins: double;
  wPisIsento: boolean;
  wCofinsIsento: boolean;
  wQTRef: Real;
  wTotalIPIDevol: Real;
  wChaveAcessoNatural: string;
  wTotalPisCofins, wBasePis,wBaseCofins : Real;
  wOperacao : integer;
  wIBSCBS: TIBSCBS;
  wRedAliq: real;
begin
  TotalTributos := 0;
  TotalCredICMSSN := 0;
  TotalICMSDif := 0;
  TotalICMSOp := 0;
  TotalICMSDevido := 0;
  TotalICMSUFDest := 0;
  TotalICMSUFRemet := 0;
  TotalFCPUFDest := 0;
  TotalFCP := 0;
  TotalFCPST := 0;
  TotalFCPSTRet := 0;
  wTotalIPIDevol := 0;
  wTotalQBCMonoRet := 0;
  wTotalVICMSMonoRet := 0;
  SomaDescontos := 0;
  wQuantidadeItens := 0;
  Result := nil;
  Retornavel := False;
  NotaProdutor := '';
  chaveRef := '';
  MsgNotasReferenciadas := '';
  wValPisCofins := 0;
  wAliqPisCofins := 0;
  
  with DMNfe do
  begin
    QGeraNfe.Close;
    QGeraNfe.ClearVariables;
    QGeraNfe.SetVariable('COD_NOTA_CAB', CodNota);
    QGeraNfe.Open;

    QSomaNfe.Close;
    QSomaNfe.Open;
    QSomaPagamentos.Close;
    QSomaPagamentos.Open;
    QValeProduto.Close;
    QValeProduto.Open;
    QTitulos.Close;
    QTitulos.Open;
    DMParamSistema.QParamSistema.Close;
    DMParamSistema.QParamSistema.Open;
    QNotaReferenciada.Close;
    QNotaReferenciada.Open;
    QPagamento.Close;
    QPagamento.Open;

    //verifica se nf-e nao foi gerada anteriormente
    ValidaNfe;

    if (QGeraNfe.Eof) then
      Exit;

    Empresa := '';

    Result := TNFe.Create('', TNfeVersaoFactory.
        GetNfeVersao(QGeraNfeDESC_VERSAO_NFE.Value));
    with Result.InfNfe do
    begin
      Emit := TEmit.Create;
      if Length(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value)) = 14 then
        Emit.CNPJ := Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value)
      else
        Emit.CPF := Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value);
      Emit.XNome := Trim(QGeraNfeNOME_FILIAL.Value);
      Emit.XFant := Trim(QGeraNfeNOME_FILIAL.Value);
      Emit.Ender := TEndereco.Create;
      Emit.IE := Bib.LimpaNumero(QGeraNfeINSCRICAO_FILIAL.Value);
      Emit.CRT := QGeraNfeIND_REGIME_TRIBUTARIO.Value;
      with Emit.Ender do
      begin
        CEP := TNFeIntegerComZero.Create(StrToInt('0' + Bib.LimpaNumero(QGeraNfeCEP_FILIAL.Value)),8);
        CMun := StrToInt('0' + QGeraNfeCOD_UF_IBGE_FILIAL.Text + QGeraNfeCOD_CIDADE_IBGE_FILIAL.Value);
        CPais := Trunc(QGeraNfeCOD_PAIS_IBGE_FILIAL.Value);
        Fone := Bib.LimpaNumero(QGeraNfeTELEFONE_FILIAL.Value);
        Nro := IfThen((QGeraNfeNUM_ENDERECO_FILIAL.Text <> ''),QGeraNfeNUM_ENDERECO_FILIAL.Text,'SN');
        UF := QGeraNfeUF_FILIAL.Value;
        XBairro := Trim(QGeraNfeBAIRRO_FILIAL.Value);
        XCpl := Trim(QGeraNfeCOMPLEMENTO_FILIAL.Value);
        XLgr := Trim(QGeraNfeENDERECO_FILIAL.Value);
        XMun := Trim(QGeraNfeCIDADE_FILIAL.Value);
        XPais := Trim(QGeraNfePAIS_FILIAL.Value);
      end;

      Dest := TDest.Create;
      if (QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value <> 1058) then
      begin
        Dest.IndIEDest := 9;
        Dest.IdEstrangeiro := Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value));
      end
      else
      begin
        if QGeraNfeIND_FISICA_JURIDICA.Value = 'F' then
        begin
          Dest.IndIEDest := 9;
          Dest.CPF := Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value));
          if (Bib.LimpaNumero(QGeraNfeINSCRICAO_MUN_CADASTRO.Value) <> '') and
            ((DMParamSistema.CodEmpresa <> 'GRASEL') or
             ((QGeraNfeIND_CONTRIBUINTE.Value = 'SIM') and
              (DMParamSistema.CodEmpresa = 'GRASEL'))) then
          begin
            Dest.IndIEDest := 1;
            Dest.IE := Trim(Bib.LimpaNumero(QGeraNfeINSCRICAO_MUN_CADASTRO.Value));
          end;
        end
        else
        begin
          Dest.CNPJ := Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value));
          if (QGeraNfeINSCRICAO_CADASTRO.Value = '') or
              ((QGeraNfeINSCRICAO_CADASTRO.Value = 'ISENTO') and
               (QGeraNfeIND_CONTRIBUINTE.Value = 'NAO')) then
            Dest.IndIEDest := 9
          else if (QGeraNfeINSCRICAO_CADASTRO.Value = 'ISENTO') then
            Dest.IndIEDest := 2
          else
          begin
            Dest.IndIEDest := 1;
            Dest.IE := Trim(Bib.LimpaNumero(QGeraNfeINSCRICAO_CADASTRO.Value));
          end;
        end;
      end;

      Ide := TIde.Create;
      Id := QGeraNfeDESC_CHAVE_ACESSO.Value; //Atribuindo aqui, para pegar o cDV automaticamente no SetId.
      Ide.CMunFG := StrToInt('0' + QGeraNfeCOD_UF_IBGE_FILIAL.Text + QGeraNfeCOD_CIDADE_IBGE_FILIAL.Value);       Ide.CUf := QGeraNfeCOD_UF_IBGE_FILIAL.Value;
      Ide.FinNFe := QGeraNfeIND_FINALIDADE_NFE.Value;
      if (Result.InfNFe.Versao = '2.00') or (Result.InfNFe.Versao = '1.10') then
      begin
        Ide.DEmi := TNFeData.Create(QGeraNfeDT_EMISSAO.Value);
        Ide.DSaiEnt := TNFeData.Create(QGeraNfeDT_RECEBIMENTO.Value);
        Ide.HSaiEnt := TNFeHora.Create(QGeraNfeDT_RECEBIMENTO.Value);
        if QGeraNfeIND_FINALIDADE_NFE.Value = 4 then
          Ide.FinNFe := 1; //Finalidade NF-e Normal
        Dest.IndIEDest := 0;
      end
      else //if Result.InfNFe.Versao = '3.10' then
      begin
        if ((DMParamSistema.CodEmpresa = 'STEIN') and (QGeraNfeUF_FILIAL.Value = 'MT')) or
           ((DMParamSistema.CodEmpresa = 'DEMAG') and (QGeraNfeUF_FILIAL.Value = 'MS')) then //Stein tem um CADPRO do MT Junior 20/05/2025
        begin
          Ide.DhEmi :=    TNFeDataHora.Create(QGeraNfeDT_EMISSAO.Value + (DMOracle.HoraServ - (1/24))).ToString + GetFuso(Emit.Ender.UF);
          Ide.DhSaiEnt := TNFeDataHora.Create(QGeraNfeDT_RECEBIMENTO.Value + (DMOracle.HoraServ - (1/24))).ToString + GetFuso(Emit.Ender.UF);
        end
        else
        begin
          Ide.DhEmi := TNFeDataHora.Create(QGeraNfeDT_EMISSAO.Value + DMOracle.HoraServ).ToString + GetFuso(Emit.Ender.UF);
          Ide.DhSaiEnt := TNFeDataHora.Create(QGeraNfeDT_RECEBIMENTO.Value + DMOracle.HoraServ).ToString + GetFuso(Emit.Ender.UF);
        end;
        Ide.TpImp := QGeraNfeIND_ORIENTACAO_PAG_DANFE.Value;
        Ide.IndFinal := bib.ift(QGeraNfeIND_CONSUMIDOR_FINAL.Value = 'S','1','0'); //criar parâmetro na filial
        if(Dest.IndIEDest = 9) then
          Ide.IndFinal := '1';

        Emit.IEST := Bib.LimpaNumero(QGeraNfeDESC_INSCRICAO_SUBST.Value);

        if (Copy(QGeraNfeNUM_CFOP.Text,1,1) = '1') or (Copy(QGeraNfeNUM_CFOP.Text,1,1) = '5') then
          Ide.IdDest := 1  //Estadual
        else if (Copy(QGeraNfeNUM_CFOP.Text,1,1) = '2') or (Copy(QGeraNfeNUM_CFOP.Text,1,1) = '6') then
        begin
          Ide.IdDest := 2;  //Interestadual
          if (Dest.IndIEDest = 9) and (Ide.IndFinal = '1') then
            case StrToInt(FormatDateTime('yyyy',QGeraNfeDT_EMISSAO.Value)) of
              2016: wPercICMSInterPart := 40;
              2017: wPercICMSInterPart := 60;
              2018: wPercICMSInterPart := 80;
              else wPercICMSInterPart := 100;
            end;

        end
        else
        begin
          Ide.IdDest := 3;
          Dest.IdEstrangeiro := QGeraNfeCPF_CNPJ_CADASTRO.Value;
        end;
        Ide.IndPres := Bib.ift(QGeraNfeIND_FINALIDADE_NFE.Value = 1,QGeraNfeIND_PRESENCA.Value, 0);
        if (Ide.IndPres <> 0) and (Ide.IndPres <> 5) then
          Ide.IndIntermed := QGeraNfeIND_INTERMEDIADOR.Value;
      end;

      if(DMParamSistema.QParamSistemaIND_COD_CADASTRO_NFE.Value = 'S') then
        if length(IntToStr(QGeraNfeCOD_CADASTRO.Value) + ' - ' + Trim(QGeraNfeNOME_CADASTRO.Value)) > 60 then
          Dest.XNome := Trim(QGeraNfeNOME_CADASTRO.Value)
        else
          Dest.XNome := IntToStr(QGeraNfeCOD_CADASTRO.Value) + ' - ' + Trim(QGeraNfeNOME_CADASTRO.Value)
      else
        Dest.XNome := Trim(QGeraNfeNOME_CADASTRO.Value);
      if QGeraNfeDESC_SUFRAMA.Value <> '' then
        Dest.ISUF := Trim(bib.LimpaNumero(QGeraNfeDESC_SUFRAMA.Value));
      Dest.Email := trim(QGeraNfeEMAIL_CADASTRO.Value);
      Dest.Ender := TEndereco.Create;
      with Dest.Ender do
      begin
        CEP := TNFeIntegerComZero.Create(StrToInt('0' + Bib.LimpaNumero(QGeraNfeCEP_CADASTRO.Value)),8);
        CMun := StrToInt('0' + QGeraNfeCOD_UF_IBGE_NOTA.Text + QGeraNfeCOD_CIDADE_IBGE_CADASTRO.Value);
        CPais := QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value;
        Fone := Bib.LimpaNumero(QGeraNfeTELEFONE_CADASTRO.Value);
        Nro := Bib.NumEndereco(QGeraNfeENDERECO_CADASTRO.Text);
        UF := QGeraNfeUF_CADASTRO.Value;
        XBairro := Trim(QGeraNfeBAIRRO_CADASTRO.Value);
        XCpl := Trim(QGeraNfeCOMPLEMENTO_CADASTRO.Value);
        posVirgula := pos(',',QGeraNfeENDERECO_CADASTRO.Value);
        if Length(QGeraNfeENDERECO_CADASTRO.Value) > 0 then
          XLgr := bib.ift(posVirgula = 0, Trim(QGeraNfeENDERECO_CADASTRO.Value),
          Trim(Copy(QGeraNfeENDERECO_CADASTRO.Value,1,posVirgula-1)));
        XMun := Trim(QGeraNfeCIDADE_CADASTRO.Value);
        XPais := Trim(QGeraNfePAIS_CADASTRO.Value);
        if (UF <> 'EX') and (UF <> '') and (CPais <> 1058) then
          Exception.Create('Modifique o país do destinatário para "Brasil".');
      end;

      if QGeraNfeIND_AMBIENTE_NFE_FILIAL.Value = 2 then
      begin
        Dest.XNome := 'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
        if Dest.Ender.UF = 'EX' then
          Dest.CNPJ := ''
        else
          QGeraNfeCPF_CNPJ_CADASTRO.Value := '99999999000191';
      end;

      if Result.InfNFe.Versao <> '4.00' then
        Ide.IndPag := IntToStr(StrToInt('0'+QGeraNfeIND_CONDICAO_PAGTO.Value) - 1);

      Ide.Mod_ := QGeraNfeDESC_MODELO.Value;
      Ide.NatOp := QGeraNfeDESC_OPERACAO.Text;
      Ide.NNf := QGeraNfeNUM_NOTA.AsInteger;
      Ide.ProcEmi := PROC_EMI_APP_CONTRIBUINTE;
      Ide.Serie := StrToInt('0' + QGeraNfeCOD_SERIE.Value);
      Ide.TpAmb := Bib.ift(QGeraNfeIND_AMBIENTE_NFE.IsNull, QGeraNfeIND_AMBIENTE_NFE_FILIAL.Value,
          QGeraNfeIND_AMBIENTE_NFE.Value);
      Ide.TpEmis := StrToInt('0' + QGeraNfeIND_CONTINGENCIA.Value);

      Ide.TpNf := IfThen(QGeraNfeIND_ENTRADA_SAIDA.Value = 'E', TP_NF_ENTRADA, TP_NF_SAIDA);
      Ide.VerProc := VERSAO_APLICATIVO;

      if not QGeraNfeDT_CONTINGENCIA.IsNull then
        Ide.DhCont := TNFeDataHora.Create(QGeraNfeDT_CONTINGENCIA.Value).ToString + GetFuso(Emit.Ender.UF);
      Ide.XJust := QGeraNfeDESC_JUST_CONTINGENCIA.Value;
      Ide.NFref := TNFeElementItems.Create;
      if QGeraNfeCOD_NOTA_CAB_REF.Value > 0 then
      begin
        chaveRef :=
          DMOracle.FastSelect('DESC_CHAVE_ACESSO','TB_NOTA_CAB','COD_NOTA_CAB = ' +
          QGeraNfeCOD_NOTA_CAB_REF.Text);
        chaveRef := Copy(chaveRef, 4, Length(chaveRef));
        NFRef := TNFref.Create(chaveRef);
        Ide.NFref.AddItem(NFRef);
      end;

      InfAdic := TInfAdic.Create;
      QNotaReferenciada.First;
      case QGeraNfeIND_FINALIDADE_NFE.Value of
        2: MsgNotasReferenciadas := 'NF-e complementar referente à(s) nota(s)';
        3: MsgNotasReferenciadas := 'NF-e de ajuste referente à(s) nota(s)';
        4: MsgNotasReferenciadas := 'NF-e de Devolução referente à(s) nota(s)';
      else
        if not QNotaReferenciada.Eof then
          MsgNotasReferenciadas := 'Documentos referenciados: ';
      end;

//        if QGeraNfeIND_FINALIDADE_NFE.Value = 2 then
//          MsgNotasReferenciadas := 'NF-e complementar referente à(s) nota(s)';
//        if QGeraNfeIND_FINALIDADE_NFE.Value = 3 then
//          MsgNotasReferenciadas := 'NF-e de ajuste referente à(s) nota(s)';
//        if QGeraNfeIND_FINALIDADE_NFE.Value = 4 then
//          MsgNotasReferenciadas := 'NF-e de Devolução referente à(s) nota(s)';


      if (ide.IdDest = 2) and (Dest.IndIEDest = 9) and (Ide.IndFinal = '1')
          and (QNotaReferenciadaDESC_CHAVE_ACESSO.Value <> '') then
        case StrToInt(copy(QNotaReferenciadaDESC_CHAVE_ACESSO.Value,3,2)) of
          16: wPercICMSInterPart := 40;
          17: wPercICMSInterPart := 60;
          18: wPercICMSInterPart := 80;
          else wPercICMSInterPart := 100;
        end;
      while not QNotaReferenciada.Eof do
      begin
        NFRef := TNFref.Create(QNotaReferenciadaDESC_CHAVE_ACESSO.Value);
        if QNotaReferenciadaCOD_SERIE_MODELO.Value = '01' then
        begin
          NFRef.RefNF := TRefNF.Create;
          with NFRef.RefNF do
          begin
            CUF := QNotaReferenciadaCOD_UF_IBGE.Value;
            AAMM := FormatDateTime('YYMM', QNotaReferenciadaDT_EMISSAO.Value);
            CNPJ := Bib.LimpaNumero(QNotaReferenciadaCPF_CNPJ_CADASTRO.Value);
            Mod_ := TNFeIntegerComZero.Create(QNotaReferenciadaCOD_SERIE_MODELO.AsInteger,2);
            Serie := QNotaReferenciadaCOD_SERIE.AsInteger;
            NNF := QNotaReferenciadaNUM_NOTA.AsInteger;
          end;
        end;
        if QNotaReferenciadaCOD_SERIE_MODELO.Value = '04' then
        begin
          NFRef.RefNFP := TRefNFP.Create;
          with NFRef.RefNFP do
          begin
            CUF := QNotaReferenciadaCOD_UF_IBGE.Value;
            AAMM := FormatDateTime('YYMM', QNotaReferenciadaDT_EMISSAO.Value);
            if QNotaReferenciadaIND_FISICA_JURIDICA.Value = 'J' then
            begin
              CNPJ := Bib.LimpaNumero(QNotaReferenciadaCPF_CNPJ_CADASTRO.Value);
              IE := Bib.LimpaNumero(QNotaReferenciadaINSCRICAO_CADASTRO.Value);
            end
            else
            begin
              CPF := Bib.LimpaNumero(QNotaReferenciadaCPF_CNPJ_CADASTRO.Value);
              IE := Bib.LimpaNumero(QNotaReferenciadaDESC_INSCRICAO_MUNICIPAL.Value);
            end;

            Mod_ := TNFeIntegerComZero.Create(QNotaReferenciadaCOD_SERIE_MODELO.AsInteger,2);
            Serie := QNotaReferenciadaCOD_SERIE.AsInteger;
            NNF := QNotaReferenciadaNUM_NOTA.AsInteger;
          end;
        end;
        if (QNotaReferenciadaCOD_SERIE_MODELO.Value = '2B') or
           (QNotaReferenciadaCOD_SERIE_MODELO.Value = '2C') or
           (QNotaReferenciadaCOD_SERIE_MODELO.Value = '2D') then
        begin
          NFRef.RefECF := TRefECF.Create;
          NFRef.RefECF.Mod_ := QNotaReferenciadaCOD_SERIE_MODELO.Value;
          NFRef.RefECF.NECF := 1;
          nfref.RefECF.NCOO := QNotaReferenciadaNUM_COO.Value;
        end;
        Ide.NFref.AddItem(NFRef);
        if trim(QNotaReferenciadaDESC_CHAVE_ACESSO.Value) <> '' then
        MsgNotasReferenciadas := trim(MsgNotasReferenciadas + ' '+
          IntToStr(StrToInt(Copy(QNotaReferenciadaDESC_CHAVE_ACESSO.Value, 26,9))) + ',')
        else
          MsgNotasReferenciadas := MsgNotasReferenciadas + ' ' +
            QNotaReferenciadaNUM_NOTA.Text;
        QNotaReferenciada.Next;
      end;
      MsgNotasReferenciadas := LeftStr(MsgNotasReferenciadas
        ,length(trim(MsgNotasReferenciadas))) + ' ';
      Tribs := ',';
      QGeraNfeItem.First;
      Det := TNFeElementItems.Create;
      wListaOS := TStringList.Create;
      while not QGeraNfeItem.Eof do
      begin

        if QGeraNfeItemCOD_ORDEM_SERVICO_CAB.Value > 0 then
        begin
          if wListaOS.IndexOf(QGeraNfeItemCOD_ORDEM_SERVICO_CAB.Text) < 0 then
            wListaOS.Add(QGeraNfeItemCOD_ORDEM_SERVICO_CAB.Text);
        end;

        wDet := TDet.Create(QGeraNfeItem.RecNo);
        wDet.InfAdProd := '';
        if (DMParamSistema.CodEmpresa = 'RETIFOZ') and
           (Dest.Ender.UF = 'PR') then
        begin
          wChaveAcessoNatural := DMOracle.FastSelect('DESC_CHAVE_ACESSO', 'TB_SUBST_ESPECIAL',
            'DT_LANCAMENTO = (SELECT MAX(DT_LANCAMENTO) FROM TB_SUBST_ESPECIAL WHERE COD_PRODUTO = ' +
            QGeraNfeItemCOD_PRODUTO.Text + ') AND COD_PRODUTO = ' + QGeraNfeItemCOD_PRODUTO.Text);
          if wChaveAcessoNatural <> '' then
          begin
            wDet.InfAdProd := 'CHAVENATURAL=' + wChaveAcessoNatural + ' \n';
            wDet.InfAdProd := wDet.InfAdProd + 'nItem='+ IntToStr(wDet.NItem) + ' \n';
          end;
        end;
        QGeraNfeExport.Close;
        QGeraNfeExport.Open;
        if QGeraNfeItemNUM_GENERO_NCM.Value = '' then
        begin
          MessageDlg('O produto ' + QGeraNfeItemDESC_PRODUTO.Value +
            ' não possui NCM cadastrado', mtError, [mbOk], 0);
          Abort;
        end;

        if QGeraNfeItemDESC_UNIDADE.Value = '' then
        begin
          MessageDlg('O produto ' + QGeraNfeItemDESC_PRODUTO.Value +  ' - '+ QGeraNfeItemCOD_PRODUTO.AsString +
            ' não possui unidade de medida cadastrada', mtError, [mbOk], 0);
          Abort;
        end;

        if QGeraNfeItemNUM_NOTA_PRODUTOR.Value > 0 then
        begin
          if NotaProdutor = '' then
            NotaProdutor := '\nNF Produtor: ' + QGeraNfeItemNUM_NOTA_PRODUTOR.Text
          else
            NotaProdutor := NotaProdutor + ', ' + QGeraNfeItemNUM_NOTA_PRODUTOR.Text;
        end;

        Prod := TProd.Create;

        if DMParamSistema.QParamSistemaIND_COD_PRODUTO_NFE.Value = 'C' then
          Prod.CProd := QGeraNfeItemCOD_PRODUTO.Text
        else
          Prod.CProd := QGeraNfeItemNUM_FABRICANTE.Text;
        if (DMParamSistema.QParamSistemaIND_COD_BARRA_XML.Value = 'S') and
           (length(QGeraNfeItemDESC_COD_BARRA.Value) in [8, 12, 13, 14]) then
        begin
          Prod.CEAN := QGeraNfeItemDESC_COD_BARRA.Value;
          prod.CEANTrib := QGeraNfeItemDESC_COD_BARRA.Value;
        end
        else if Result.InfNFe.Versao = '4.00' then
        begin
          Prod.CEAN := 'SEM GTIN';
          prod.CEANTrib := 'SEM GTIN';
        end;
        if not QGeraNfeItemNUM_PEDIDO.IsNull then
          Prod.XPed := QGeraNfeItemNUM_PEDIDO.AsString;
        if not QGeraNfeItemNUM_PEDIDO_COMPRA.IsNull then
          Prod.XPed := Trim(QGeraNfeItemNUM_PEDIDO_COMPRA.Value);
        if not QGeraNfeItemNUM_PEDIDO_COMPRA_ITEM.IsNull then
          Prod.NItemPed := QGeraNfeItemNUM_PEDIDO_COMPRA_ITEM.Value;
        Prod.XProd := Trim(QGeraNfeItemDESC_PRODUTO.Value);

        Prod.CFOP := IfThen(QGeraNfeItemCOD_CFOP.IsNull, Trunc(QGeraNfeNUM_CFOP.Value),
            QGeraNfeItemCOD_CFOP.Value);
        Prod.UCom := QGeraNfeItemDESC_UNIDADE.Value;
        Prod.QCom := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value);
        wQuantidadeItens := wQuantidadeItens + Prod.QCom.Valor;
        Prod.VUnCom := TNFeFloat8.Create(QGeraNfeItemVAL_UNITARIO.Value);

        if (((Emit.CRT = 1) or (Emit.CRT =2)) and TemCEST(QGeraNfeItemCSOSN.Value)) then
          Prod.CEST := QGeraNfeItemCOD_CEST.Value;

        if ((Emit.CRT = 3) and TemCEST(QGeraNfeItemCST.Value)) then
          Prod.CEST := QGeraNfeItemCOD_CEST.Value;

        Prod.VProd := QGeraNfeItemVAL_TOTAL.Value;
        Prod.UTrib := QGeraNfeItemDESC_UNIDADE.Value;
        Prod.QTrib := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value);
        Prod.VUnTrib := TNFeFloat8.Create(QGeraNfeItemVAL_UNITARIO.Value);
        if (Pos(IntToStr(Prod.CFOP), ',7101,7102,7949,1501,2501,5119,6119,5501,5502,5504,5505,6501,6504,6505,6502') > 0) Or
           ((Pos(IntToStr(Prod.CFOP), ',5102') > 0) And (DMParamSistema.CodEmpresa = 'GRASEL')) then
        begin
          if QGeraNfeItemUNIDADE_NCM.Value <> '' then
            Prod.UTrib := QGeraNfeItemUNIDADE_NCM.Value;
          if (Prod.UCom = 'KG') and ((Prod.UTrib = 'TON') or (Prod.UTrib = 'TN') ) and (QGeraNfeItemQT_QUANTIDADE.Value > 0) then
          begin
            Prod.QTrib := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value / 1000);
            Prod.VUnTrib := TNFeFloat8.Create(QGeraNfeItemVAL_TOTAL.Value / Prod.QTrib.Valor);
          end
          else if (QGeraNfeItemUNIDADE_NCM.Value = 'KG') and
             (QGeraNfeItemDESC_UNIDADE.Value <> 'KG') and
             (QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value > 0)
             and (QGeraNfeItemQT_QUANTIDADE.Value > 0) then
          begin
            Prod.QTrib := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value * QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value);
            Prod.VUnTrib := TNFeFloat8.Create(QGeraNfeItemVAL_TOTAL.Value/(QGeraNfeItemQT_QUANTIDADE.Value *
              QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value));
          end;
        end;

        Prod.VFrete := QGeraNfeItemVAL_FRETE.Value;
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CEREAIS' then
        begin
          if QGeraNfeItemVAL_DESCONTO.Value + QGeraNfeVAL_FUNRURAL.Value + QGeraNfeVAL_SENAR.Value > 0 then
            Prod.VDesc := TNFeFloat2.Create(QGeraNfeVAL_FUNRURAL.Value + QGeraNfeItemVAL_DESCONTO.Value +
              QGeraNfeVAL_SENAR.Value);
        end
        else
        begin
          if QGeraNfeItemVAL_DESCONTO.Value > 0 then
          begin
            if RoundTo(QGeraNfeItemVAL_DESCONTO.Value + SomaDescontos, -2) >=
               RoundTo(QSomaNfeSVAL_DESCONTO.Value, -2) then
            begin
              if RoundTo(SomaDescontos, -2) < RoundTo(QSomaNfeSVAL_DESCONTO.Value, -2) then
                Prod.VDesc := TNFeFloat2.Create(QSomaNfeSVAL_DESCONTO.Value - SomaDescontos);
            end
            else
              Prod.VDesc := TNFeFloat2.Create(QGeraNfeItemVAL_DESCONTO.Value);
            SomaDescontos := SomaDescontos + QGeraNfeItemVAL_DESCONTO.Value;
          end;
          if (QGeraNfeItem.RecNo = QGeraNfeItem.RecordCount) and (QSomaNfeSVAL_DESCONTO.Value > 0) and
                                 (RoundTo(QSomaNfeSVAL_DESCONTO.Value,-2) > RoundTo(SomaDescontos,-2)) then
          begin
            Prod.VDesc := TNFeFloat2.Create(RoundTo(QGeraNfeItemVAL_DESCONTO.Value + QSomaNfeSVAL_DESCONTO.Value - SomaDescontos,-2) );
          end;
        end;
        Prod.IndTot := IND_TOT_COMPOE_TOTAL;
        Prod.VOutro := QGeraNfeItemVAL_DESPESAS.Value;

        if QGeraNfeItemNUM_DI.Value <> '' then
        begin
          DI := TDI.Create;
          DI.NDI := QGeraNfeItemNUM_DI.Value;
          DI.DDI := TNFeData.Create(QGeraNfeItemDT_DI.Value);
          DI.XLocDesemb := QGeraNfeItemDESC_LOCAL_DESEMB_DI.Value;
          DI.UFDesemb := QGeraNfeItemCOD_UF_DESEMB_DI.Value;
          DI.DDesemb := TNFeData.Create(QGeraNfeItemDT_DESEMB_DI.Value);
          DI.CExportador := QGeraNfeItemCOD_EXPORTADOR.Value;
          DI.TpViaTransp := QGeraNfeItemIND_TIPO_VIA_TRANSP_DI.Value;
          if QGeraNfeItemIND_TIPO_VIA_TRANSP_DI.Value = 1 then
            DI.VAFRMM := TNFeFloat2.Create(QGeraNfeItemVAL_AFRMM_DI.Value);
          DI.TpIntermedio := QGeraNfeItemIND_TIPO_INTERMEDIO_DI.Value;
          DI.CNPJ := QGeraNfeItemDESC_CNPJ_ENCOMENDANTE_DI.Value;
          DI.UFTerceiro := QGeraNfeItemDESC_UF_ENCOMENDANTE_DI.Value;
          QGeraNfeItemAdi.Close;
          QGeraNfeItemAdi.SetVariable('COD_NOTA_ITEM', QGeraNfeItemCOD_NOTA_ITEM.Value);
          QGeraNfeItemAdi.Open;

          if QGeraNfeItemAdi.RecordCount > 0 then
          begin
            DI.adi := TNFeElementItems.Create;
            while not QGeraNfeItemAdi.Eof do
            begin
              adi := TADI.Create;
              adi.NAdicao := QGeraNfeItemAdiNUM_ADICAO.Value;
              adi.NSeqAdic := QGeraNfeItemAdiNUM_SEQ_ADIC.Value;
              adi.CFabricante := QGeraNfeItemAdiCOD_FABRICANTE.Value;
              adi.VDescDI := QGeraNfeItemAdiVAL_DESCONTO.Value;
              DI.adi.AddItem(adi);
              QGeraNfeItemAdi.Next;
            end;
          end;
          Prod.DI := DI;
        end
        else
          Prod.DI := Nil;

        if (QGeraNfeNUM_CFOP.Value > 7000) then
        begin
          if QGeraNfeCOD_ESTADO_EMBARQUE.Value = '' then
          begin
            MessageDlg('Informe o estado do embarque.', mtError, [mbOK], 0);//Exception só aparece dem Debug, precisei adicionar o MessageDlg. Junior 26/05/2023
            raise Exception.Create('Informe o estado do embarque.');
          end;

          exporta:= TExporta.Create();
          if (Result.InfNFe.Versao <> '1.10') and (Result.InfNFe.Versao <> '2.00') then
          begin
            Exporta.UFSaidaPais := QGeraNfeCOD_ESTADO_EMBARQUE.Value;
            exporta.XLocExporta := QGeraNfeDESC_LOCAL_EMBARQUE.Value;
            Exporta.XLocDespacho := QGeraNfeDESC_LOCAL_DESPACHO.Value;
          end
          else
          begin
            Exporta.UFEmbarq := QGeraNfeCOD_ESTADO_EMBARQUE.Value;
            exporta.XLocEmbarq := QGeraNfeDESC_LOCAL_EMBARQUE.Value;
          end;
          QGeraNfeExport.First;
          Prod.DetExport := TNFeElementItems.Create;
          while not QGeraNfeExport.Eof do
          begin    
            wDetExport := TDetExport.Create;
            wDetExport.NDraw := QGeraNfeExportDESC_NUM_DRAW.Value;
            if QGeraNfeExportDESC_NUM_RE.Value <> '' then
            begin
              wDetExport.ExportInd := TExportInd.Create;
              wDetExport.ExportInd.NRE := QGeraNfeExportDESC_NUM_RE.Value;
              wDetExport.ExportInd.ChNFe := QGeraNfeExportDESC_CHAVE_ACESSO.Value;
              wDetExport.ExportInd.QExport := TNFeFloat2.Create(QGeraNfeExportQT_QUANTIDADE_EXPORTADA.Value);
            end;
            Prod.DetExport.AddItem(wDetExport);
            QGeraNfeExport.Next;
          end;
        end;
        Prod.VeicProd := nil;
        if((Copy(QGeraNfeItemNUM_GENERO_NCM.Value,1,4) = '3001') Or
           (Copy(QGeraNfeItemNUM_GENERO_NCM.Value,1,4) = '3002') Or
           (Copy(QGeraNfeItemNUM_GENERO_NCM.Value,1,4) = '3003') Or
           (Copy(QGeraNfeItemNUM_GENERO_NCM.Value,1,4) = '3004') Or
           (Copy(QGeraNfeItemNUM_GENERO_NCM.Value,1,4) = '3005') Or
           (Copy(QGeraNfeItemNUM_GENERO_NCM.Value,1,4) = '3006')) then
        begin
          wMed := TMed.Create;
          if(trim(QGeraNfeItemCOD_PRODUTO_ANVISA.Value) = '') then
            wMed.CProdANVISA := 'ISENTO'
          else
            wMed.CProdANVISA := trim(QGeraNfeItemCOD_PRODUTO_ANVISA.Value);

          if(trim(QGeraNfeItemDESC_MOTIVO_ISENCAO_ANVISA.Value) = '') then
            wMed.XMotivoIsencao := 'medicamentoisentoanvisa'
          else
            wMed.XMotivoIsencao := trim(QGeraNfeItemDESC_MOTIVO_ISENCAO_ANVISA.Value);

          if(QGeraNfeItemVAL_PRECO_MAXIMO_CONSUMIDOR.Value = 0) then
            wMed.VPMC := TNFeFloat2.Create(100)
          else
            wMed.VPMC := TNFeFloat2.Create(QGeraNfeItemVAL_PRECO_MAXIMO_CONSUMIDOR.Value);

          Prod.Med := TNFeElementItems.Create;
          Prod.Med.AddItem(wMed);

          wRastro := TRastro.Create;
          wRastro.NLote := Trim(QGeraNfeItemDESC_LOTE.Value);
          wRastro.QLote := TNFeFloat3.Create(QGeraNfeItemQT_LOTE.Value);
          wRastro.DFab := TNFeData.Create(QGeraNfeItemDT_FABRICACAO_LOTE.Value);
          wRastro.DVal := TNFeData.Create(QGeraNfeItemDT_VENCIMENTO_LOTE.Value);

          Prod.Rastro := TNFeElementItems.Create;
          Prod.Rastro.AddItem(wRastro);
        end;
        Prod.Arma := nil;

        Prod.Comb := nil;
        if ((Prod.CFOP > 1649) and (Prod.CFOP < 1665)) or ((Prod.CFOP > 2649) and (Prod.CFOP < 2665)) or
            ((Prod.CFOP > 3649) and (Prod.CFOP < 3654)) or ((Prod.CFOP > 5649) and (Prod.CFOP < 5668)) or
            ((Prod.CFOP > 6649) and (Prod.CFOP < 6668)) or ((Prod.CFOP > 7649) and (Prod.CFOP < 7668)) or
            (QGeraNfeItemCOD_PRODUTO_ANP.Value = 210203001) then
        begin
          Prod.Comb := TComb.Create;
          with Prod.Comb do
          begin
            CProdANP := QGeraNfeItemCOD_PRODUTO_ANP.Value;
            DescANP := Bib.ift(Result.InfNFe.Versao = '4.00', QGeraNfeItemDESC_ANP.Value,'');
            if CProdANP = 210203001 then
            begin
              if Result.InfNFe.Versao = '4.00' then
              begin
                PGLP := TNFeFloat4.Create(QGeraNfeItemPERC_GLP_PETROLEO.Value);
                PGNn := TNFeFloat4.Create(QGeraNfeItemPERC_MIXGN.Value);
                PGNi := TNFeFloat4.Create(QGeraNfeItemPERC_GNI.Value);
                if QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value = 0 then
                  Raise Exception.Create('É preciso informar o peso líquido do produto '+ QGeraNfeItemDESC_PRODUTO.Value);
                VPart := TNFeFloat2.Create(QGeraNfeItemVAL_UNITARIO.Value / QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value);
                Prod.QTrib := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value * QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value);
                Prod.VUnTrib := TNFeFloat8.Create(QGeraNfeItemVAL_TOTAL.Value/(QGeraNfeItemQT_QUANTIDADE.Value *
                  QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value));
                Prod.UTrib := 'KG';
                if Result.InfNFe.Ide.IndFinal = '0' then
                begin
                  Prod.Comb.OrigComb := TOrigComb.Create;
                  with Prod.Comb.OrigComb do
                  begin
                    IndImport := QGeraNfeItemIND_IMPORT_COMB.Text;
                    CUFOrig := StrToInt('0' + QGeraNfeItemUF_ORIGEM_COMB.Value);
                    POrig := TNFeFloat4.Create(QGeraNfeItemPERC_ORIG_UF_COMB.Value);
                  end;
                end;
              end
              else
                PMixGN := TNFeFloat4.Create(QGeraNfeItemPERC_MIXGN.Value);
            end;
            if QGeraNfeItemQT_TEMP.Value > 0 then
              QTemp := TNFeFloat4.Create(QGeraNfeItemQT_TEMP.Value);
            if QGeraNfeItemCOD_UF_CONSUMO.Value = '' then
              UFCons := QGeraNfeUF_CADASTRO.Value
            else
              UFCons := QGeraNfeItemCOD_UF_CONSUMO.Value;
            Cide := nil;
          end;
        end;
        Prod.NRECOPI := QGeraNfeItemDESC_RECOPI.Value;

        Icm := nil;
        Ipi := nil;
        II := Nil;
        Issqn := nil;
        if QGeraNfeItemIND_TIPO_PRODUTO.Value <> 'SERVIÇO' then
        begin
          Prod.NCM := TNCM.Create(Bib.LimpaNumero(
              QGeraNfeItemNUM_GENERO_NCM.Value));
{Adicionado ind_finalidade_nfe para quando for nota de devolução. Alex 14/09/2026}
          if (QGeraNfeIND_FINALIDADE_NFE.Value = 4) or ( (Emit.CRT = 3) and (QGeraNfeItemVAL_CBS.Value >= 0) ) then
          begin
            wIBSCBS := TIBSCBS.Create;
            with wIBSCBS do
            begin
              CST := QGeraNfeItemNUM_CST_IBS_CBS.Value;
              CClassTrib := QGeraNfeItemNUM_CLASS_TRIB_IBS_CBS.Value;
              if CST = '620' then
              begin
                if Today >= StrToDate('04/01/2027') then
                begin
                  GIBSCBSMono := TGIBSCBSMono.Create;
                  with GIBSCBSMono do
                  begin
                    if QGeraNfeItemIND_GRUPO_MONO_RET.Value = '1' then
                    begin
                      GIBSMonoAdRem := TGIBSMonoAdRem.Create;
                      GIBSMonoAdRem.GMonoRet := TGIBSMonoRet.Create;
                      GIBSMonoAdRem.GMonoRet.VIBSMonoRet := TNFeFloat2.Create(0);

                      GCBSMonoAdRem := TGCBSMonoAdRem.Create;
                      GCBSMonoAdRem.GMonoRet := TGCBSMonoRet.Create;
                      GCBSMonoAdRem.GMonoRet.VCBSMonoRet := TNFeFloat2.Create(0);
                    end;
                    VTotIBSMonoItem := TNFeFloat2.Create(0);
                    VTotCBSMonoItem := TNFeFloat2.Create(0);
                  end;
                end;
              end
              else if (CST <> '410') then
              begin
                GIBSCBS := TGIBSCBS.Create;
                with GIBSCBS do
                begin
                  VBC := TNFeFloat2.Create(QGeraNfeItemVAL_BC_IBS_CBS.Value);

                  GIBSUF := TGIBSUF.Create;
                  if QGeraNfeItemIND_GRUPO_TRIB_REGULAR.Value = '1' then
                    GIBSUF.PIBSUF := TNFeFloat4.Create(0)
                  else
                    GIBSUF.PIBSUF := TNFeFloat4.Create(QGeraNfeItemPERC_IBS_UF.Value);
                  GIBSUF.VIBSUF := TNFeFloat2.Create(QGeraNfeItemVAL_IBS_EST.Value);

                  GIBSMun := TGIBSMun.Create;
                  GIBSMun.PIBSMun := TNFeFloat4.Create(QGeraNfeItemPERC_IBS_MUN.Value);
                  GIBSMun.VIBSMun := TNFeFloat2.Create(QGeraNfeItemVAL_IBS_MUN.Value);

                  if QGeraNfeItemPERC_REDUCAO_IBS.Value > 0 then
                  begin
                    GIBSUF.GRed := TGRed.Create;
                    GIBSUF.GRed.PRedAliq := TNFeFloat4.Create(QGeraNfeItemPERC_REDUCAO_IBS.Value);
                    GIBSUF.GRed.PAliqEfet := TNFeFloat4.Create(QGeraNfeItemPERC_IBS_UF.Value - (QGeraNfeItemPERC_IBS_UF.Value * (QGeraNfeItemPERC_REDUCAO_IBS.Value/100)));

                    GIBSMun.GRed := TGRed.Create;
                    GIBSMun.GRed.PRedAliq := TNFeFloat4.Create(QGeraNfeItemPERC_REDUCAO_IBS.Value);
                    GIBSMun.GRed.PAliqEfet := TNFeFloat4.Create(QGeraNfeItemPERC_IBS_MUN.Value - (QGeraNfeItemPERC_IBS_MUN.Value * (QGeraNfeItemPERC_REDUCAO_IBS.Value/100)));
                  end;

                  GCBS := TGCBS.Create;
                  if QGeraNfeItemIND_GRUPO_TRIB_REGULAR.Value = '1' then
                    GCBS.PCBS := TNFeFloat4.Create(0)
                  else
                    GCBS.PCBS := TNFeFloat4.Create(QGeraNfeItemPERC_CBS.Value);
                  GCBS.VCBS := TNFeFloat2.Create(QGeraNfeItemVAL_CBS.Value);
                  VIBS := TNFeFloat2.Create(QGeraNfeItemVAL_IBS_EST.Value + QGeraNfeItemVAL_IBS_MUN.Value);

                  if QGeraNfeItemPERC_REDUCAO_CBS.Value > 0 then
                  begin
                    GCBS.GRed := TGRed.Create;
                    GCBS.GRed.PRedAliq := TNFeFloat4.Create(QGeraNfeItemPERC_REDUCAO_CBS.Value);
                    GCBS.GRed.PAliqEfet := TNFeFloat4.Create(QGeraNfeItemPERC_CBS.Value - (QGeraNfeItemPERC_CBS.Value * (QGeraNfeItemPERC_REDUCAO_CBS.Value/100)));
                  end;
                  if QGeraNfeItemIND_GRUPO_TRIB_REGULAR.Value = '1' then
                  begin
                    GTribRegular := TGTribRegular.Create;
                    with GTribRegular do
                    begin
                      CSTReg := QGeraNfeItemNUM_CST_IBS_CBS_REGULAR.Value;
                      CClassTribReg := QGeraNfeItemNUM_CLASS_TRIB_IBS_CBS_REGULAR.Value;
                      PAliqEfetRegIBSUF := TNFeFloat4.Create(0.1);
                      VTribRegIBSUF := TNFeFloat2.Create(QGeraNfeItemVAL_IBS_EST_REGULAR.Value);
                      PAliqEfetRegIBSMun := TNFeFloat4.Create(0);
                      VTribRegIBSMun := TNFeFloat2.Create(QGeraNfeItemVAL_IBS_MUN_REGULAR.Value);
                      PAliqEfetRegCBS := TNFeFloat4.Create(0.9);
                      VTribRegCBS := TNFeFloat2.Create(QGeraNfeItemVAL_CBS_REGULAR.Value);
                    end;
                  end;
                end;
              end;
            end;
          end;
          if (Emit.CRT = 1) then
          begin
            Int :=  StrToInt('0' + QGeraNfeItemCSOSN.Value);
            Origem := QGeraNfeItemNUM_ORIGEM.Value;
          end
          else
          begin
            if Length(QGeraNfeItemCST.Value) > 2 then
            begin
              Int := StrToInt('0' + Copy(QGeraNfeItemCST.Value, 2, 2));
              Origem := StrToInt('0' + Copy(QGeraNfeItemCST.Value, 1, 1));
            end
            else
            begin
              Int := StrToInt('0' + QGeraNfeItemCST.Value);
              Origem := QGeraNfeItemNUM_ORIGEM.Value;
            end;
          end;

          MostraMsgReducaoST := 0;
          if Int in [40, 41, 50] then
          begin
            Icm := TICMS40.Create(Int);
            if QGeraNfeCOD_BENEF_FISCAL.Value = '' then
            begin
              if Int = 40 then   //ISENÇÃO
                Prod.CBenef := QGeraNfeItemCOD_BENEF_FISCAL_ISENCAO.Value;
              if Int = 41 then   //NÃO TRIBUTADO
                Prod.CBenef := QGeraNfeItemCOD_BENEF_FISCAL_IMUNIDADE.Value;
              if Int = 50 then   //SUSPENSÃO
                Prod.CBenef := QGeraNfeItemCOD_BENEF_FISCAL_SUSPENSAO.Value;
            end
            else
              Prod.CBenef := QGeraNfeCOD_BENEF_FISCAL.value;
            //TICMS40(Icm).MotDesICMS := '9'; //Temporario 03/2011 =D
          end
          else
          begin
            case Int of
              0: //TRIBUTADO INTEGRALMENTE
              begin
                Icm := TICMS00.Create;
                with Icm as TICMS00 do
                begin
                  ModBC := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 2, MOD_BC_VAL_OPERACAO, MOD_BC_VAL_AGREGADO);
                  PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  VBC := QGeraNfeItemVAL_ICM_BASE.Value;
                  VICMS := QGeraNfeItemVAL_ICM.Value;
                  if (Result.InfNFe.Versao = '4.00') and (QGeraNfeItemPERC_FCP.Value > 0) then
                  begin
                    PFCP := TNFeFloat4.Create(QGeraNfeItemPERC_FCP.Value);
                    VFCP := TNFeFloat2.Create(QGeraNfeItemPERC_FCP.Value * QGeraNfeItemVAL_ICM_BASE.Value / 100);
                    TotalFCP := TotalFCP + VFCP.Valor;
                  end;
                end;
              end;
              10: //ST
              begin
                Icm := TICMS10.Create;
                with Icm as TICMS10 do
                begin
                  ModBC := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 2, MOD_BC_VAL_OPERACAO, MOD_BC_VAL_AGREGADO);
                  ModBCST := MOD_BC_ST_MARGEM_VAL_AGREGADO;
                  PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  PICMSST := QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VBC := QGeraNfeItemVAL_ICM_BASE.Value;
                  VBCST  := QGeraNfeItemVAL_BASE_SUBST.Value;
                  PMVAST := TNFeFloat2.Create(Bib.ift(QGeraNfeItemPERC_BASE_SUBST.Value > 100, QGeraNfeItemPERC_BASE_SUBST.Value - 100, QGeraNfeItemPERC_BASE_SUBST.Value));
                  VICMS := QGeraNfeItemVAL_ICM.Value;
                  VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  if QGeraNfeItemPERC_DIFERIMENTO.Value > 0 then
                  begin
                    PICMS := RoundTo(QGeraNfeItemPERC_ALIQUOTA.Value - RoundTo(QGeraNfeItemPERC_ALIQUOTA.Value * QGeraNfeItemPERC_DIFERIMENTO.Value / 100,-2), -2);
                    TotalICMSOp := TotalICMSOp + RoundTo(QGeraNfeItemVAL_ICM_BASE.Value * PICMS / 100, -2);
                    TotalICMSDif := TotalICMSDif + (QGeraNfeItemVAL_ICM_BASE.Value * PICMS / 100) * QGeraNfeItemPERC_DIFERIMENTO.Value / 100;
                    TotalICMSDevido := TotalICMSDevido + VICMS;
                  end;
                  if (Result.InfNFe.Versao = '4.00') and (QGeraNfeItemPERC_FCP.Value > 0) then
                  begin
                    VBCFCP := TNFeFloat2.Create(VBC);
                    PFCP := TNFeFloat4.Create(QGeraNfeItemPERC_FCP.Value);
                    VFCP := TNFeFloat2.Create(QGeraNfeItemPERC_FCP.Value * QGeraNfeItemVAL_ICM_BASE.Value / 100);
                    TotalFCP := TotalFCP + VFCP.Valor;
                  end;
                  if (Result.InfNFe.Versao = '4.00') and (QGeraNfeItemPERC_FCP_UF_DEST.Value > 0) then
                  begin
                    VBCFCPST := TNFeFloat2.Create(VBCST);
                    PFCPST := TNFeFloat4.Create(QGeraNfeItemPERC_FCP_UF_DEST.Value);
                    VFCPST := TNFeFloat2.Create((QGeraNfeItemPERC_FCP_UF_DEST.Value * VBCST / 100) -
                        (QGeraNfeItemPERC_FCP.Value * QGeraNfeItemVAL_ICM_BASE.Value / 100));
                    TotalFCPST := TotalFCPST + VFCPST.Valor;
                  end;
                end;
                if QGeraNfeItemVAL_ICMS_SUBST.Value > 0 then
                    if (QGeraNfeREGIME_TRIBUTARIO_CADASTRO.Value <> 3) and
                   (QGeraNfeItemPERC_REDUCAO_ICMS_SUBST.Value > 0) then
                      MostraMsgReducaoST := MostraMsgReducaoST + 1;
              end;
              20: //REDUÇÃO DA BASE DE CÁLCULO
              begin
                Icm := TICMS20.Create;
                with Icm as TICMS20 do
                begin
                  ModBC := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 2, MOD_BC_VAL_OPERACAO, MOD_BC_VAL_AGREGADO);
                  PRedBC := 100 - QGeraNfeItemPERC_TRIBUTADO.Value; //100 - valor da tabela de tributacao
                  VBC := QGeraNfeItemVAL_ICM_BASE.Value;
                  //PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  VICMS := QGeraNfeItemVAL_ICM.Value;
                  //VICMSDeson := TNFeFloat2.Create(0);
                  if (Result.InfNFe.Versao = '4.00') and (QGeraNfeItemPERC_FCP.Value > 0) then
                  begin
                    VBCFCP := TNFeFloat2.Create(VBC);
                    PFCP := TNFeFloat4.Create(QGeraNfeItemPERC_FCP.Value);
                    VFCP := TNFeFloat2.Create(QGeraNfeItemPERC_FCP.Value * QGeraNfeItemVAL_ICM_BASE.Value / 100);
                    TotalFCP := TotalFCP + VFCP.Valor;
                  end;
                end;
                if QGeraNfeCOD_BENEF_FISCAL.Value = '' then
                  Prod.CBenef := QGeraNfeItemCOD_BENEF_FISCAL_REDUCAO.Value
                else
                  Prod.CBenef := QGeraNfeCOD_BENEF_FISCAL.value;
              end;
              30: //ISENTO OU NÃO TRIBUTADO COM ST
              begin
                Icm := TICMS30.Create;
                with Icm as TICMS30 do
                begin
                  ModBCST := MOD_BC_ST_MARGEM_VAL_AGREGADO;
                  VBCST := QGeraNfeItemVAL_BASE_SUBST.Value;
                  PICMSST := QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  PMVAST := TNFeFloat2.Create(Bib.ift(QGeraNfeItemPERC_BASE_SUBST.Value > 100, QGeraNfeItemPERC_BASE_SUBST.Value - 100, QGeraNfeItemPERC_BASE_SUBST.Value));
                  //VICMSDeson := TNFeFloat2.Create(0);
                  if (Result.InfNFe.Versao = '4.00') and (QGeraNfeItemPERC_FCP_UF_DEST.Value > 0) then
                  begin
                    VBCFCPST := TNFeFloat2.Create(VBCST);
                    PFCPST := TNFeFloat4.Create(QGeraNfeItemPERC_FCP_UF_DEST.Value);
                    VFCPST := TNFeFloat2.Create((QGeraNfeItemPERC_FCP_UF_DEST.Value * VBCST / 100) -
                        (QGeraNfeItemPERC_FCP.Value * QSomaNfeSVAL_TOTAL.Value / 100));
                    TotalFCPST := TotalFCPST + VFCPST.Valor;
                  end;
                end;
                if QGeraNfeCOD_BENEF_FISCAL.Value = '' then
                begin
                  if QGeraNfeItemNUM_CLASSIFICACAO.Value = '6' then //Imunidade ou não incidência
                    Prod.CBenef := QGeraNfeItemCOD_BENEF_FISCAL_IMUNIDADE.Value
                  else                                              //Isenção
                    Prod.CBenef := QGeraNfeItemCOD_BENEF_FISCAL_ISENCAO.Value;
                end
                else
                  Prod.CBenef := QGeraNfeCOD_BENEF_FISCAL.value;

              end;
              51: //DIFERIMENTO
              begin
                Icm := TICMS51.Create;
                with Icm as TICMS51 do
                begin
                  ModBC := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 1, MOD_BC_VAL_OPERACAO, MOD_BC_VAL_AGREGADO);
                  PRedBC := 0;
                  if QGeraNfeItemPERC_TRIBUTADO.Value <= 100 then
                    PRedBC := 100 - QGeraNfeItemPERC_TRIBUTADO.Value; //100 - valor da tabela de tributacao
                  VBC := QGeraNfeItemVAL_ICM_BASE.Value;
                  PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  VICMS := QGeraNfeItemVAL_ICM.Value;
                  //VICMSOp := TNFeFloat2.Create(RoundTo(QGeraNfeItemVAL_ICM_BASE.Value * PICMS / 100,-2)); //Arredondamento na B. Calc. ICMS(Estava gerando valor negativo para icms diferencial). Adriel/Junior 16/04/2024
                  VICMSOp := TNFeFloat2.Create(QGeraNfeItemVAL_ICM_BASE.Value * PICMS / 100); //Tirei RoundTo e utilizar a função MAX. Arredondamento na B. Calc. ICMS(Estava gerando valor negativo para icms diferencial). //Junior 25/02/2025
                  PDif := TNFeFloat4.Create(QGeraNfeItemPERC_DIFERIMENTO.Value);
                 // VICMSDif := TNFeFloat2.Create(VICMSOp.Valor - VICMS);
                  VICMSDif := TNFeFloat2.Create(Bib.ift(VICMSOp.Valor - VICMS < 0, 0, VICMSOp.Valor - VICMS)); //Não permitir ficar valor negativo no ICMS DIF. Erro de -0,01 Junior 25/02/2025
                  TotalICMSOp := TotalICMSOp + VICMSOp.Valor;
                  TotalICMSDif := TotalICMSDif + VICMSDif.Valor;
                  TotalICMSDevido := TotalICMSDevido + VICMS;
                  //if PDif.Valor < 100 then
//                    wDet.InfAdProd :=  wDet.InfAdProd +'ICMS com Diferimento parcial de ' +
//                                        StringReplace(FormatFloat('#,##0.00', PDif.Valor),'.',',',[rfReplaceAll])+'% (R$ '+
//                                        StringReplace(FormatFloat('#,##0.00',VICMSDif.Valor),'.',',',[rfReplaceAll])+')\n'
//                  else
//                    wDet.InfAdProd :=  wDet.InfAdProd +'Diferimento total de ICMS no valor de R$ '+
//                                        StringReplace(FormatFloat('#,##0.00',VICMSDif.Valor),'.',',',[rfReplaceAll])+'\n';

                  if (Result.InfNFe.Versao = '4.00') and (QGeraNfeItemPERC_FCP.Value > 0) then
                  begin
                    VBCFCP := TNFeFloat2.Create(VBC);
                    PFCP := TNFeFloat4.Create(QGeraNfeItemPERC_FCP.Value);
                    VFCP := TNFeFloat2.Create(QGeraNfeItemPERC_FCP.Value * QGeraNfeItemVAL_ICM_BASE.Value / 100);
                    TotalFCP := TotalFCP + VFCP.Valor;
                  end;
                end;
                if QGeraNfeCOD_BENEF_FISCAL.Value = '' then
                begin
                  Prod.CBenef := QGeraNfeItemCOD_BENEF_FISCAL_DIFERIMENTO.Value;
                  if (QGeraNfeItemCOD_BENEF_FISCAL_DIFERIMENTO.Value = 'PR830078') and
                     (QGeraNfeItemCOD_CFOP.Value = 5502) then
                    Prod.CBenef := 'PR830079';
                end
                else
                  Prod.CBenef := QGeraNfeCOD_BENEF_FISCAL.value;

              end;
              60: //COBRADO ANTERIORMENTE POR ST
              begin
                if (Result.InfNFe.Versao = '4.00') and
                   (pos(QGeraNfeItemCOD_PRODUTO_ANP.Text, ',210203001,320101001,320101002,320102002,320102001'+
                  ',320102003,320102005,320201001,320103001,220102001,320301001,320103002,820101032,820101026'+
                  ',820101027,820101004,820101005,820101022,820101031,820101030,820101014,820101006,820101016'+
                  ',820101015,820101025,820101017,820101018,820101019,820101020,820101021,420105001,420101005'+
                  ',420101004,420102005,420102004,420104001,820101033,820101034,420106001,820101011,820101003'+
                  ',820101013,820101012,420106002,830101001,420301004,420202001,420301001,420301002,410103001'+
                  ',410101001,410102001,430101004,510101001,510101002,510102001,510102002,510201001,510201003'+
                  ',510301003,510103001,510301001') > 0) then
                begin
                  Icm := TICMSST.Create(60);
                  with Icm as TICMSST do
                  begin
                    VBCSTRet := QGeraNfeItemVAL_BASE_SUBST.Value;
                    VICMSSTRet := QGeraNfeItemVAL_ICMS_SUBST.Value;

                    VBCSTDest := 0;
                    VICMSSTDest := 0;
                  end;
                end
                else
                begin
                  Icm := TICMS60.Create;
                  with Icm as TICMS60 do
                  begin
                    VBCSTRet := QGeraNfeItemVAL_BASE_ST_ANTERIOR_RETIDO.Value;
                    VICMSSTRet := QGeraNfeItemVAL_ST_ANTERIOR_RETIDO.Value;
                    if (Result.InfNFe.Versao = '4.00') then
                    begin
                      PST := TNFeFloat2.Create(QGeraNfeItemPERC_ST_ANTERIOR_RETIDO.Value);
                      if (QGeraNfeItemPERC_FCP_UF_DEST.Value > 0) then
                      begin
                        VBCFCPSTRet := TNFeFloat2.Create(VBCSTRet);
                        PFCPSTRet := TNFeFloat4.Create(QGeraNfeItemPERC_FCP_UF_DEST.Value);
                        VFCPSTRet := TNFeFloat2.Create((QGeraNfeItemPERC_FCP_UF_DEST.Value * VBCSTRet / 100) -
                            (QGeraNfeItemPERC_FCP.Value * QSomaNfeSVAL_TOTAL.Value / 100));
                        TotalFCPSTRet := TotalFCPSTRet + VFCPSTRet.Valor;
                      end;
                      if(Result.InfNFe.Ide.IndFinal = '1') then
                      begin
                        PRedBCEfet := TNFeFloat4.Create(0);
                        VBCEfet := TNFeFloat2.Create(QGeraNfeItemVAL_TOTAL.Value * (1 - PRedBCEfet.Valor));
                        PICMSEfet := TNFeFloat4.Create(0);
                        VICMSEfet := TNFeFloat2.Create(VBCEfet.Valor * PICMSEfet.Valor / 100);
                      end;
                    end;
                  end;
                end;
              end;
              61: //COBRADO ANTERIORMENTE POR ST
              begin
                Icm := TICMS61.Create;
                with Icm as TICMS61 do
                begin
                  QBCMonoRet := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value * QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value);
                  AdRemICMSRet := TNFeFloat4.Create(QGeraNfeItemPERC_AD_REM_ICMS.Value);
                  VICMSMonoRet := TNFeFloat2.Create(RoundTo(QBCMonoRet.Valor * AdRemICMSRet.Valor, -2));
                  wTotalQBCMonoRet := wTotalQBCMonoRet + QBCMonoRet.Valor;
                  wTotalVICMSMonoRet := wTotalVICMSMonoRet + VICMSMonoRet.Valor;
                end;
              end;
              70: //REDUÇÃO DA BASE DE CÁLCULO COM ST
              begin
                //ICMS 70 não tem nos clientes da Cemapa.
                Icm := TICMS70.Create;
                with Icm as TICMS70 do
                begin
                  ModBC := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 2, MOD_BC_VAL_OPERACAO, MOD_BC_VAL_AGREGADO);
                  if QGeraNfeItemPERC_TRIBUTADO.Value <= 100 then
                    PRedBC := 100 - QGeraNfeItemPERC_TRIBUTADO.Value; //100 - valor da tabela de tributacao
                  VBC := QGeraNfeItemVAL_ICM_BASE.Value;
                  PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  VICMS := QGeraNfeItemVAL_ICM.Value;
                  ModBCST := MOD_BC_ST_MARGEM_VAL_AGREGADO;
                  //PRedBCST := 100 - QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VBCST := QGeraNfeItemVAL_BASE_SUBST.Value;
                  PICMSST := QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  PMVAST := TNFeFloat2.Create(Bib.ift(QGeraNfeItemPERC_BASE_SUBST.Value > 100, QGeraNfeItemPERC_BASE_SUBST.Value - 100, QGeraNfeItemPERC_BASE_SUBST.Value));
                  //VICMSDeson := TNFeFloat2.Create(0);
                  if (Result.InfNFe.Versao = '4.00') and (QGeraNfeItemPERC_FCP.Value > 0) then
                  begin
                    VBCFCP := TNFeFloat2.Create(VBC);
                    PFCP := TNFeFloat4.Create(QGeraNfeItemPERC_FCP.Value);
                    VFCP := TNFeFloat2.Create(QGeraNfeItemPERC_FCP.Value * QGeraNfeItemVAL_ICM_BASE.Value / 100);
                    TotalFCP := TotalFCP + VFCP.Valor;
                  end;
                  if (Result.InfNFe.Versao = '4.00') and (QGeraNfeItemPERC_FCP_UF_DEST.Value > 0) then
                  begin
                    VBCFCPST := TNFeFloat2.Create(VBCST);
                    PFCPST := TNFeFloat4.Create(QGeraNfeItemPERC_FCP_UF_DEST.Value);
                    VFCPST := TNFeFloat2.Create((QGeraNfeItemPERC_FCP_UF_DEST.Value * VBCST / 100) -
                        (QGeraNfeItemPERC_FCP.Value * QGeraNfeItemVAL_ICM_BASE.Value / 100));
                    TotalFCPST := TotalFCPST + VFCPST.Valor;
                  end;
                end;
                if QGeraNfeCOD_BENEF_FISCAL.Value = '' then
                  Prod.CBenef := QGeraNfeItemCOD_BENEF_FISCAL_REDUCAO.Value
                else
                  Prod.CBenef := QGeraNfeCOD_BENEF_FISCAL.value;
              end;
              90: //OUTRAS
              begin
                Icm := TICMS90.Create;
                with Icm as TICMS90 do
                begin
                  ModBC := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 2, MOD_BC_VAL_OPERACAO, MOD_BC_VAL_AGREGADO);
                  VBC := QGeraNfeItemVAL_ICM_BASE.Value;
                  if QGeraNfeItemPERC_TRIBUTADO.Value <= 100 then
                    PRedBC := 100 - QGeraNfeItemPERC_TRIBUTADO.Value;
                  PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  VICMS := QGeraNfeItemVAL_ICM.Value;
                  //ModBCST := MOD_BC_ST_MARGEM_VAL_AGREGADO; //Erro. Informada modalidade de determinação da BC da ST como Mva. Deixei igual o código do Simples Nacional. 28/11/2014. Junior.
                  ModBCST := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 2, 0, MOD_BC_ST_MARGEM_VAL_AGREGADO);
                  VBCST := QGeraNfeItemVAL_BASE_SUBST.Value;
                  PICMSST := QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  if (QGeraNfeItemPERC_BASE_SUBST.Value > 0) or (ModBC = MOD_BC_VAL_AGREGADO) then
                    PMVAST := TNFeFloat2.Create(Bib.ift(QGeraNfeItemPERC_BASE_SUBST.Value > 100, QGeraNfeItemPERC_BASE_SUBST.Value - 100, QGeraNfeItemPERC_BASE_SUBST.Value));
                  //VICMSDeson := TNFeFloat2.Create(0);
                  if (Result.InfNFe.Versao = '4.00') and (QGeraNfeItemPERC_FCP.Value > 0) then
                  begin
                    VBCFCP := TNFeFloat2.Create(VBC);
                    PFCP := TNFeFloat4.Create(QGeraNfeItemPERC_FCP.Value);
                    VFCP := TNFeFloat2.Create(QGeraNfeItemPERC_FCP.Value * QGeraNfeItemVAL_ICM_BASE.Value / 100);
                    TotalFCP := TotalFCP + VFCP.Valor;
                  end;
                  if (Result.InfNFe.Versao = '4.00') and (QGeraNfeItemPERC_FCP_UF_DEST.Value > 0) then
                  begin
                    VBCFCPST := TNFeFloat2.Create(VBCST);
                    PFCPST := TNFeFloat4.Create(QGeraNfeItemPERC_FCP_UF_DEST.Value);
                    VFCPST := TNFeFloat2.Create((QGeraNfeItemPERC_FCP_UF_DEST.Value * VBCST / 100) -
                        (QGeraNfeItemPERC_FCP.Value * QGeraNfeItemVAL_ICM_BASE.Value / 100));
                    TotalFCPST := TotalFCPST + VFCPST.Valor;
                  end;

                  if QGeraNfeItemVAL_ICMS_SUBST.Value > 0 then
                    if (QGeraNfeREGIME_TRIBUTARIO_CADASTRO.Value <> 3) and
                   (QGeraNfeItemPERC_REDUCAO_ICMS_SUBST.Value > 0) then
                      MostraMsgReducaoST := MostraMsgReducaoST + 1;
                  if QGeraNfeItemPERC_DIFERIMENTO.Value > 0 then
                  begin
                    TotalICMSOp := TotalICMSOp + RoundTo(QGeraNfeItemVAL_ICM_BASE.Value * PICMS / 100,-2);
                    TotalICMSDif := TotalICMSDif + (QGeraNfeItemVAL_ICM_BASE.Value * PICMS / 100) * QGeraNfeItemPERC_DIFERIMENTO.Value / 100;
                    TotalICMSDevido := TotalICMSDevido + VICMS;
                    //if QGeraNfeItemPERC_DIFERIMENTO.Value < 100 then
//                    wDet.InfAdProd :=  wDet.InfAdProd +'ICMS com Diferimento parcial de ' +
//                                        StringReplace(FormatFloat('#,##0.00', QGeraNfeItemPERC_DIFERIMENTO.Value),'.',',',[rfReplaceAll])+'% (R$ '+
//                                        StringReplace(FormatFloat('#,##0.00',(QGeraNfeItemVAL_ICM_BASE.Value * PICMS / 100) * QGeraNfeItemPERC_DIFERIMENTO.Value / 100),'.',',',[rfReplaceAll])+')\n'
//                    else
//                      wDet.InfAdProd :=  wDet.InfAdProd +'Diferimento total de ICMS no valor de R$ '+
//                                        StringReplace(FormatFloat('#,##0.00',(QGeraNfeItemVAL_ICM_BASE.Value * PICMS / 100) * QGeraNfeItemPERC_DIFERIMENTO.Value / 100),'.',',',[rfReplaceAll])+'\n';
                  end;
                end;
              end;
              101:
              begin
                Icm := TICMSSN101.Create;
                with Icm as TICMSSN101 do
                begin
                  PCredSN := TNFeFloat2.Create( QGeraNfePERC_ALIQ_CRED_ICMSSN.Value);
                  VCredICMSSN := TNFeFloat2.Create((QGeraNfeItemVAL_TOTAL.Value-QGeraNfeItemVAL_DESCONTO.Value) * QGeraNfePERC_ALIQ_CRED_ICMSSN.Value / 100);
                  TotalCredICMSSN := TotalCredICMSSN + VCredICMSSN.Valor;
                end;
              end;
              102..103:
              begin
                Icm := TICMSSN102.Create(Int);
              end;
              300..400:
              begin
                Icm := TICMSSN102.Create(Int);
              end;
              201:
              begin
                Icm := TICMSSN201.Create;
                with Icm as TICMSSN201 do
                begin
                  ModBCST := MOD_BC_ST_MARGEM_VAL_AGREGADO;
                  PRedBCST := 0;
                  PICMSST := QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VBCST  := QGeraNfeItemVAL_BASE_SUBST.Value;
                  VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  PCredSN := TNFeFloat2.Create( QGeraNfePERC_ALIQ_CRED_ICMSSN.Value);
                  VCredICMSSN := TNFeFloat2.Create((QGeraNfeItemVAL_TOTAL.Value-QGeraNfeItemVAL_DESCONTO.Value) * QGeraNfePERC_ALIQ_CRED_ICMSSN.Value / 100);
                  TotalCredICMSSN := TotalCredICMSSN + VCredICMSSN.Valor;
                  PMVAST := TNFeFloat2.Create(Bib.ift(QGeraNfeItemPERC_BASE_SUBST.Value > 100, QGeraNfeItemPERC_BASE_SUBST.Value - 100, QGeraNfeItemPERC_BASE_SUBST.Value));
                  if (Result.InfNFe.Versao = '4.00') and (QGeraNfeItemPERC_FCP_UF_DEST.Value > 0) then
                  begin
                    VBCFCPST := TNFeFloat2.Create(VBCST);
                    PFCPST := TNFeFloat4.Create(QGeraNfeItemPERC_FCP_UF_DEST.Value);
                    VFCPST := TNFeFloat2.Create((QGeraNfeItemPERC_FCP_UF_DEST.Value * VBCST / 100) -
                        (QGeraNfeItemPERC_FCP_UF_DEST.Value * QGeraNfeItemVAL_ICM_BASE.Value / 100));
                    TotalFCPST := TotalFCPST + VFCPST.Valor;
                  end;
                end;
                if QGeraNfeItemVAL_ICMS_SUBST.Value > 0 then
                  if (QGeraNfeREGIME_TRIBUTARIO_CADASTRO.Value <> 3) and
                 (QGeraNfeItemPERC_REDUCAO_ICMS_SUBST.Value > 0) then
                    MostraMsgReducaoST := MostraMsgReducaoST + 1;
              end;
              202..203:
              begin
                Icm := TICMSSN202.Create(Int);
                with Icm as TICMSSN202 do
                begin 
                  ModBCST := MOD_BC_ST_MARGEM_VAL_AGREGADO;
                  PRedBCST := 0;
                  PICMSST := QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VBCST  := QGeraNfeItemVAL_BASE_SUBST.Value;
                  VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  PMVAST := TNFeFloat2.Create(Bib.ift(QGeraNfeItemPERC_BASE_SUBST.Value > 100, QGeraNfeItemPERC_BASE_SUBST.Value - 100, QGeraNfeItemPERC_BASE_SUBST.Value));
                  if (Result.InfNFe.Versao = '4.00') and (QGeraNfeItemPERC_FCP_UF_DEST.Value > 0) then
                  begin
                    VBCFCPST := TNFeFloat2.Create(VBCST);
                    PFCPST := TNFeFloat4.Create(QGeraNfeItemPERC_FCP_UF_DEST.Value);
                    VFCPST := TNFeFloat2.Create((QGeraNfeItemPERC_FCP_UF_DEST.Value * VBCST / 100) -
                        (QGeraNfeItemPERC_FCP_UF_DEST.Value * QGeraNfeItemVAL_ICM_BASE.Value / 100));
                    TotalFCPST := TotalFCPST + VFCPST.Valor;
                  end;
                end;
                if QGeraNfeItemVAL_ICMS_SUBST.Value > 0 then
                  if (QGeraNfeREGIME_TRIBUTARIO_CADASTRO.Value <> 3) and
                 (QGeraNfeItemPERC_REDUCAO_ICMS_SUBST.Value > 0) then
                    MostraMsgReducaoST := MostraMsgReducaoST + 1;
              end;
              500:
              begin
                Icm := TICMSSN500.Create;
                with Icm as TICMSSN500 do
                begin
                  VBCSTRet := QGeraNfeItemVAL_BASE_SUBST.Value;
                  VICMSSTRet := QGeraNfeItemVAL_ICMS_SUBST.Value;

                  if (Result.InfNFe.Versao = '4.00') then
                  begin
                    if QGeraNfeItemVAL_BASE_SUBST.Value = 0 then
                      PST := TNFeFloat4.Create(0)
                    else
                      PST := TNFeFloat4.Create(QGeraNfeItemVAL_ICMS_SUBST.Value * 100 /
                        QGeraNfeItemVAL_BASE_SUBST.Value);
                    if (QGeraNfeItemPERC_FCP_UF_DEST.Value > 0) then
                    begin
                      VBCFCPSTRet := TNFeFloat2.Create(VBCSTRet);
                      PFCPSTRet := TNFeFloat4.Create(QGeraNfeItemPERC_FCP_UF_DEST.Value);
                      VFCPSTRet := TNFeFloat2.Create((QGeraNfeItemPERC_FCP_UF_DEST.Value * VBCSTRet / 100) -
                          (QGeraNfeItemPERC_FCP.Value * QSomaNfeSVAL_TOTAL.Value / 100));
                      TotalFCPSTRet := TotalFCPSTRet + VFCPSTRet.Valor;
                    end;
                    if(Result.InfNFe.Ide.IndFinal = '1') then
                    begin
                      PRedBCEfet := TNFeFloat4.Create(0);
                      VBCEfet := TNFeFloat2.Create(QGeraNfeItemVAL_TOTAL.Value * (1 - PRedBCEfet.Valor));
                      PICMSEfet := TNFeFloat4.Create(0);
                      VICMSEfet := TNFeFloat2.Create(VBCEfet.Valor * PICMSEfet.Valor / 100);
                    end;
                  end;
                end;
              end;
              900:
              begin
                Icm := TICMSSN900.Create;
                with Icm as TICMSSN900 do
                begin
                  ModBC := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 2, MOD_BC_VAL_OPERACAO, MOD_BC_VAL_AGREGADO);
                  VBC := QGeraNfeItemVAL_ICM_BASE.Value;
                  PRedBC := 100 - QGeraNfeItemPERC_ALIQUOTA.Value;
                  PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  VICMS := QGeraNfeItemVAL_ICM.Value;
                  PRedBCST := 100 - QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  ModBCST := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 2, 0, MOD_BC_ST_MARGEM_VAL_AGREGADO);
                  VBCST  := QGeraNfeItemVAL_BASE_SUBST.Value;
                  PICMSST := QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  if (QGeraNfeItemPERC_BASE_SUBST.Value > 0) or (ModBC = MOD_BC_VAL_AGREGADO) then
                    PMVAST := TNFeFloat2.Create(Bib.ift(QGeraNfeItemPERC_BASE_SUBST.Value > 100, QGeraNfeItemPERC_BASE_SUBST.Value - 100, QGeraNfeItemPERC_BASE_SUBST.Value));
                  PCredSN := TNFeFloat2.Create( QGeraNfePERC_ALIQ_CRED_ICMSSN.Value);
                  VCredICMSSN := TNFeFloat2.Create((QGeraNfeItemVAL_TOTAL.Value-QGeraNfeItemVAL_DESCONTO.Value) * QGeraNfePERC_ALIQ_CRED_ICMSSN.Value / 100);
                  TotalCredICMSSN := TotalCredICMSSN + VCredICMSSN.Valor;
                  if (Result.InfNFe.Versao = '4.00') and (QGeraNfeItemPERC_FCP_UF_DEST.Value > 0) then
                  begin
                    VBCFCPST := TNFeFloat2.Create(VBCST);
                    PFCPST := TNFeFloat4.Create(QGeraNfeItemPERC_FCP_UF_DEST.Value);
                    VFCPST := TNFeFloat2.Create((QGeraNfeItemPERC_FCP_UF_DEST.Value * VBCST / 100) -
                        (QGeraNfeItemPERC_FCP_UF_DEST.Value * QGeraNfeItemVAL_ICM_BASE.Value / 100));
                    TotalFCPST := TotalFCPST + VFCPST.Valor;
                  end;
                end;
                if QGeraNfeItemVAL_ICMS_SUBST.Value > 0 then
                  if (QGeraNfeREGIME_TRIBUTARIO_CADASTRO.Value <> 3) and
                 (QGeraNfeItemPERC_REDUCAO_ICMS_SUBST.Value > 0) then
                    MostraMsgReducaoST := MostraMsgReducaoST + 1;
              end;
            end;
          end;

          if (QGeraNfeItemCOD_CST_IPI.Value <> '') then
          begin
            Ipi := TIPI.Create;
            if QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value <> 1058 then
              Ipi.CNPJProd := Bib.LimpaNumero(QGeraNfeItemNUM_CGC_CPF_FAB.Value);
            if pos(QGeraNfeItemCOD_CST_IPI.Value,'02,52') > 0 then  //Regras de Enq. IPI. Junior 10/12/2024
              Ipi.CEnq := QGeraNfeItemCOD_CST_IPI_ENQU_ISENCAO.Value //'399'
            else
              if pos(QGeraNfeItemCOD_CST_IPI.Value,'04,54') > 0 then
                Ipi.CEnq := QGeraNfeItemCOD_CST_IPI_ENQU_IMUNE.Value //'099'
              else
                if pos(QGeraNfeItemCOD_CST_IPI.Value,'05,55') > 0 then
                  Ipi.CEnq := QGeraNfeItemCOD_CST_IPI_ENQU_SUSPENSAO.Value //'199'
                else
                  Ipi.CEnq := '999';
            if pos(QGeraNfeItemCOD_CST_IPI.Value,'00,49,50,99') > 0 then
            begin
              Ipi.IPITrib := TIPITrib.Create(QGeraNfeItemCOD_CST_IPI.Value);
              if (QGeraNfeIND_FINALIDADE_NFE.Value = 2) then
              Begin
                if QGeraNfeItemPERC_IPI.Value = 0 then
                  showmessage('Com essa CST de IPI o percentual de IPI tem que ser diferente de 0');
                Ipi.IPITrib.VBC := QGeraNfeItemVAL_IPI.Value * 100 / QGeraNfeItemPERC_IPI.Value;
              end
              else
                Ipi.IPITrib.VBC := QGeraNfeItemVAL_TOTAL.Value; //Levando base de calculo do IPI sendo de 100%
              Ipi.IPITrib.PIPI := QGeraNfeItemPERC_IPI.Value;
              Ipi.IPITrib.VIPI := QGeraNfeItemVAL_IPI.Value;
            end
            else
              Ipi.IPINT := TIPINT.Create(QGeraNfeItemCOD_CST_IPI.Value);
          end
          else
          begin
            if (QGeraNfeNUM_CFOP.Value >= 3000) and
              (QGeraNfeNUM_CFOP.Value <= 4000) then
            begin
              Ipi := TIPI.Create;
              Ipi.CEnq := '999';
              Ipi.IPITrib := TIPITrib.Create('49');
              Ipi.IPITrib.VBC := 0.00;
              Ipi.IPITrib.PIPI := 0.00;
              Ipi.IPITrib.VIPI := 0.00;
            end;
          end;
          if (QGeraNfeItemCOD_CST_IPI.Value = '') and
            (Ide.FinNFe = 4) and (QGeraNfeItemVAL_IPI.Value > 0) then
          begin
            wQTRef := StrToFloat(DMOracle.BuscaNome('select nvl(sum(ni.qt_quantidade),0) sqt_quantidade from tb_nota_item ni',
              'ni.cod_nota_cab in (select cod_nota_cab_ref from tb_nota_referenciada where cod_nota_cab = '+
              QGeraNfeCOD_NOTA_CAB.Text +') and ni.cod_produto = '+ QGeraNfeItemCOD_PRODUTO.Text)); //Busca a nota de entrada para saber o % dev. do IPI
            wDet.ImpostoDevol := TImpostoDevol.Create;
            if wQTRef > 0 then
              wDet.ImpostoDevol.PDevol := TNFeFloat2.Create(QGeraNfeItemQT_QUANTIDADE.Value * 100 / wQTRef)
            else
              wDet.ImpostoDevol.PDevol := TNFeFloat2.Create(QGeraNfeItemPERC_IPI.Value); //Precisa devolver o IPI mas não tem compras para buscar o %IPI e gerava erro Division By zero então busca o %ipi que informar na nota. Junior 25/02/2025
            if wDet.ImpostoDevol.PDevol.Valor > 100 then
              wDet.ImpostoDevol.PDevol := TNFeFloat2.Create(100);
            wDet.ImpostoDevol.IPI := TIPIDevol.Create;
            wDet.ImpostoDevol.IPI.VIPIDevol := TNFeFloat2.Create(QGeraNfeItemVAL_IPI.Value);
            wTotalIPIDevol := wTotalIPIDevol + QGeraNfeItemVAL_IPI.Value;
          end;
            // Informações de II

          if (QGeraNfeNUM_CFOP.Value >= 3000) and
              (QGeraNfeNUM_CFOP.Value <= 4000) then
          begin
            II := TII.Create;
            if QGeraNfeItemVAL_II.Value > 0 then
            begin
              II.vBC := QGeraNfeItemVAL_BC_II.Value;
              II.vDespAdu := QGeraNfeItemVAL_DESPADU_II.Value;
              II.vII := QGeraNfeItemVAL_II.Value;
              II.vIOF := QGeraNfeItemVAL_IOF_II.Value;
            end
            else  //se não for informado dados de II vai com valores zerados
            begin
              II.vBC := 0.00;
              II.vDespAdu := 0.00;
              II.vII := 0.00;
              II.vIOF := 0.00;
            end;
          end;

        end
        else
        begin
          Prod.NCM := TNCM .Create('0');
          Prod.EXTIPI := QGeraNfeItemCOD_EX_TIPI.Value;
          // por enquanto nao vai
          Issqn := TISSQN.Create;

          Issqn.VBC := QGeraNfeItemVAL_TOTAL.Value * QGeraNfePERC_BC_NFSE.Value/100;
          Issqn.VAliq := QGeraNfePERC_ISS.Value;
          Issqn.VISSQN := QGeraNfeItemVAL_ISS.Value;
          Issqn.CMunFG := StrToInt(QGeraNfeCOD_UF_IBGE_FILIAL.Text + QGeraNfeCOD_CIDADE_IBGE_FILIAL.Text);
          Issqn.CListServ := Bib.StrZero(Copy(QGeraNfeItemCOD_LISTA_SERVICO.Text,1,
                                length(QGeraNfeItemCOD_LISTA_SERVICO.Text)-2) + '.' +
                                Copy(QGeraNfeItemCOD_LISTA_SERVICO.Text,
                                length(QGeraNfeItemCOD_LISTA_SERVICO.Text)-1,2),5);
          if QGeraNfeItemVAL_DESCONTO.Value > 0 then
            Issqn.VDescIncond := TNFeFloat2.Create(QGeraNfeItemVAL_DESCONTO.Value);
          if QGeraNfeItemVAL_DESPESAS.Value > 0 then
            Issqn.VOutro := TNFeFloat2.Create(QGeraNfeItemVAL_DESPESAS.Value);
          Issqn.IndISS := 1;
          Issqn.IndIncentivo := 2;

          Dest.IM := Bib.LimpaNumero(QGeraNfeINSCRICAO_MUN_CADASTRO.Value);
          Emit.IM := Bib.LimpaNumero(QGeraNfeINSCRICAO_MUN_FILIAL.Value);
          Emit.CNAE := Bib.LimpaNumero(QGeraNfeDESC_CNAE.Value);
        end;

        wPisIsento := (QGeraNfeItemCOD_CST_PIS.Value = '') or
                      (StrToInt(QGeraNfeItemCOD_CST_PIS.Value) in [4,6,7,8,9,49]);
        wCofinsIsento := (QGeraNfeItemCOD_CST_COFINS.Value = '') or
                         (StrToInt(QGeraNfeItemCOD_CST_COFINS.Value) in [4,6,7,8,9,49]);

        QNotaImpostoServico.Close;
        QNotaImpostoServico.SetVariable('COD_NOTA', QGeraNfeCOD_NOTA_CAB.Value);
        QNotaImpostoServico.SetVariable('DESC_IMPOSTO', 'PIS');
        QNotaImpostoServico.Open;

        if QNotaImpostoServico.RecordCount > 0 then
        begin
          wValPisCofins := QGeraNfeItemVAL_TOTAL.Value * QNotaImpostoServicoPERC_ALIQUOTA.Value / 100;
          wAliqPisCofins := QNotaImpostoServicoPERC_ALIQUOTA.Value;
        end
        else
        begin
          wValPisCofins := QGeraNfeItemVAL_PIS.Value;
          wAliqPisCofins := QGeraNfeItemPERC_PIS.Value;
        end;

        if wPisIsento then
        begin
          wValPisCofins := 0;
          wAliqPisCofins := 0;
        end;

        Pis := TPIS.Create;
        case QGeraNfeItemCOD_CST_PIS.AsInteger of
          1,2:
          begin
            wOperacao := StrToInt('0'+DMOracle.BuscaNome('SELECT COD_OPERACAO FROM TB_NOTA_CAB','COD_NOTA_CAB ='+QGeraNfeCOD_NOTA_CAB.text)); //adciona o 0+ pois estava buscando numero invalido e estava dando erro. - vitor e jr
            wBasePis := StrToFloat('0'+DMOracle.BuscaNome('SELECT PERC_BASE_PIS FROM TB_OPERACAO ','COD_OPERACAO='+ IntToStr(wOperacao)));
            wBaseCofins := StrToFloat('0'+DMOracle.BuscaNome('SELECT PERC_BASE_COFINS FROM TB_OPERACAO ','COD_OPERACAO='+ IntToStr(wOperacao)));
            wTotalPisCofins := (((QGeraNfeItemVAL_ICM.Value)) +
                               (((QGeraNfeItemVAL_TOTAL.Value - QGeraNfeItemVAL_ICM.Value - QGeraNfeItemVAL_DESCONTO.Value) *
                               QGeraNfeItemPERC_PIS.Value * (wBasePis / 100)) / 100)+
                               (((QGeraNfeItemVAL_TOTAL.Value - QGeraNfeItemVAL_ICM.Value - QGeraNfeItemVAL_DESCONTO.Value) *
                               QGeraNfeItemPerc_cofins.Value * (wBaseCofins / 100)) / 100));

            Pis.PIS := TPISAliq.Create(QGeraNfeItemCOD_CST_PIS.AsInteger);
            with Pis.PIS as TPISAliq do
            begin
              // Por problemas na geração do XML, onde a base de calculo está permanecendo com o valor cheio
              if QGeraNfeCOD_INC_TRIB.Value = 2 then
              begin{
Foi comentado este bloco por solicitação da Veridiana. Pelo que a contabilidade dela repassou, o valor do frete não deve ser separado na geração do Pis e Cofins.
CodSuporte: 11021. Alex 22/04/2025.
                if (DMParamSistema.CodEmpresa = 'DEBONA') then
                  VBC := RoundTo((QGeraNfeItemVAL_TOTAL.Value + QGeraNfeItemVAL_FRETE.Value - (QGeraNfeItemVAL_ICM.Value -
                          - QGeraNfeItemVAL_IPI.Value - QGeraNfeItemVAL_ICMS_SUBST.Value)),-2)
                else  }
                  VBC := RoundTo((QGeraNfeItemVAL_TOTAL.Value - Bib.ift((DMParamSistema.CodEmpresa = 'CGS') and (QGeraNfeItemVAL_TOTAL.Value >= wTotalPisCofins),wTotalPisCofins, QGeraNfeItemVAL_ICM.Value) -
                          - QGeraNfeItemVAL_IPI.Value - QGeraNfeItemVAL_ICMS_SUBST.Value),-2);
              end
              else
                VBC := RoundTo((QGeraNfeItemVAL_TOTAL.Value -
                        Bib.ift((DMParamSistema.CodEmpresa = 'CGS') and (QGeraNfeItemVAL_TOTAL.Value >= wTotalPisCofins),wTotalPisCofins, QGeraNfeItemVAL_ICM.Value) -
                        - QGeraNfeItemVAL_DESCONTO.Value),-2);
              PPIS := wAliqPisCofins;
              VPIS := wValPisCofins;

            end;
          end;
          3:
          begin
            Pis.PIS := TPISQtde.Create(QGeraNfeItemCOD_CST_PIS.AsInteger);
            with Pis.PIS as TPISQtde do
            begin
              QBCProd := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value);
              VAliqProd := TNFeFloat4.Create(wValPisCofins / QGeraNfeItemQT_QUANTIDADE.Value);
              VPIS := TNFeFloat2.Create(wValPisCofins);
            end;
          end;
          4,6,7,8,9:  Pis.PIS := TPISNT.Create(QGeraNfeItemCOD_CST_PIS.AsInteger);
          else
          begin
            Pis.PIS := TPISOutr.Create(QGeraNfeItemCOD_CST_PIS.AsInteger);
            with Pis.PIS as TPISOutr do
            begin
              if QGeraNfeCOD_INC_TRIB.Value = 2 then
              begin{
Foi comentado este bloco por solicitação da Veridiana. Pelo que a contabilidade dela repassou, o valor do frete não deve ser separado na geração do Pis e Cofins.
CodSuporte: 11021. Alex 22/04/2025.
                if (DMParamSistema.CodEmpresa = 'DEBONA') then
                  VBC := RoundTo((QGeraNfeItemVAL_TOTAL.Value + QGeraNfeItemVAL_FRETE.Value - (QGeraNfeItemVAL_ICM.Value -
                          - QGeraNfeItemVAL_IPI.Value - QGeraNfeItemVAL_ICMS_SUBST.Value)),-2)
                else                             }
                  VBC := RoundTo((QGeraNfeItemVAL_TOTAL.Value -
                        Bib.ift((DMParamSistema.CodEmpresa = 'CGS') and (QGeraNfeItemVAL_TOTAL.Value >= wTotalPisCofins),wTotalPisCofins, QGeraNfeItemVAL_ICM.Value) -
                        - QGeraNfeItemVAL_IPI.Value - QGeraNfeItemVAL_ICMS_SUBST.Value),-2);
              end
              else
                VBC := RoundTo((QGeraNfeItemVAL_TOTAL.Value -
                        Bib.ift((DMParamSistema.CodEmpresa = 'CGS') and (QGeraNfeItemVAL_TOTAL.Value >= wTotalPisCofins),wTotalPisCofins, QGeraNfeItemVAL_ICM.Value) -
                        - QGeraNfeItemVAL_DESCONTO.Value),-2);
              PPIS := wAliqPisCofins;
              VPIS := wValPisCofins;
            end;
          end;
        end;


        QNotaImpostoServico.Close;
        QNotaImpostoServico.SetVariable('COD_NOTA', QGeraNfeCOD_NOTA_CAB.Value);
        QNotaImpostoServico.SetVariable('DESC_IMPOSTO', 'COFINS');
        QNotaImpostoServico.Open;
        if QNotaImpostoServico.RecordCount > 0 then
        begin
          wValPisCofins := QGeraNfeItemVAL_TOTAL.Value * QNotaImpostoServicoPERC_ALIQUOTA.Value / 100;
          wAliqPisCofins := QNotaImpostoServicoPERC_ALIQUOTA.Value;
        end
        else
        begin
          wValPisCofins := QGeraNfeItemVAL_COFINS.Value;
          wAliqPisCofins := QGeraNfeItemPERC_COFINS.Value;
        end;

        if wCofinsIsento then
        begin
          wValPisCofins := 0;
          wAliqPisCofins := 0;
        end;

        Cofins := TCOFINS.Create;
        case QGeraNfeItemCOD_CST_COFINS.AsInteger of
          1,2:
          begin
            COFINS.COFINS := TCOFINSAliq.Create(QGeraNfeItemCOD_CST_COFINS.AsInteger);
            with COFINS.COFINS as TCOFINSAliq do
            begin
              if QGeraNfeCOD_INC_TRIB.Value = 2 then
              begin{
Foi comentado este bloco por solicitação da Veridiana. Pelo que a contabilidade dela repassou, o valor do frete não deve ser separado na geração do Pis e Cofins.
CodSuporte: 11021. Alex 22/04/2025.
                if (DMParamSistema.CodEmpresa = 'DEBONA') then
                  VBC := RoundTo((QGeraNfeItemVAL_TOTAL.Value + QGeraNfeItemVAL_FRETE.Value - (QGeraNfeItemVAL_ICM.Value -
                          - QGeraNfeItemVAL_IPI.Value - QGeraNfeItemVAL_ICMS_SUBST.Value)),-2)
                else}
                  VBC := RoundTo((QGeraNfeItemVAL_TOTAL.Value -
                        Bib.ift((DMParamSistema.CodEmpresa = 'CGS') and (QGeraNfeItemVAL_TOTAL.Value >= wTotalPisCofins),wTotalPisCofins, QGeraNfeItemVAL_ICM.Value) -
                        - QGeraNfeItemVAL_IPI.Value - QGeraNfeItemVAL_ICMS_SUBST.Value),-2)
              end
              else
                VBC := RoundTo((QGeraNfeItemVAL_TOTAL.Value -
                        Bib.ift((DMParamSistema.CodEmpresa = 'CGS') and (QGeraNfeItemVAL_TOTAL.Value >= wTotalPisCofins),wTotalPisCofins, QGeraNfeItemVAL_ICM.Value) -
                        - QGeraNfeItemVAL_DESCONTO.Value),-2);
              PCOFINS := wAliqPisCofins;
              VCOFINS := wValPisCofins;
            end;
          end;
          3:
          begin
            COFINS.COFINS := TCOFINSQtde.Create( QGeraNfeItemCOD_CST_COFINS.AsInteger);
            with COFINS.COFINS as TCOFINSQtde do
            begin
              QBCProd := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value);
              VAliqProd := TNFeFloat4.Create(wValPisCofins / QGeraNfeItemQT_QUANTIDADE.Value);
              VCOFINS := TNFeFloat2.Create(wValPisCofins);
            end;
          end;
          4,6,7,8,9:  COFINS.COFINS := TCOFINSNT.Create(QGeraNfeItemCOD_CST_COFINS.AsInteger);
          else
          begin
            COFINS.COFINS := TCOFINSOutr.Create(QGeraNfeItemCOD_CST_COFINS.AsInteger);
            with COFINS.COFINS as TCOFINSOutr do
            begin
              if QGeraNfeCOD_INC_TRIB.Value = 2 then
              begin{
Foi comentado este bloco por solicitação da Veridiana. Pelo que a contabilidade dela repassou, o valor do frete não deve ser separado na geração do Pis e Cofins.
CodSuporte: 11021. Alex 22/04/2025.              
                if (DMParamSistema.CodEmpresa = 'DEBONA') then
                  VBC := RoundTo((QGeraNfeItemVAL_TOTAL.Value + QGeraNfeItemVAL_FRETE.Value - (QGeraNfeItemVAL_ICM.Value -
                          - QGeraNfeItemVAL_IPI.Value - QGeraNfeItemVAL_ICMS_SUBST.Value)),-2)
                else       }
                  VBC := RoundTo((QGeraNfeItemVAL_TOTAL.Value -
                        Bib.ift((DMParamSistema.CodEmpresa = 'CGS') and (QGeraNfeItemVAL_TOTAL.Value >= wTotalPisCofins),wTotalPisCofins, QGeraNfeItemVAL_ICM.Value) -
                        - QGeraNfeItemVAL_IPI.Value - QGeraNfeItemVAL_ICMS_SUBST.Value),-2)
              end
              else
                VBC := RoundTo((QGeraNfeItemVAL_TOTAL.Value -
                        Bib.ift((DMParamSistema.CodEmpresa = 'CGS') and (QGeraNfeItemVAL_TOTAL.Value >= wTotalPisCofins),wTotalPisCofins, QGeraNfeItemVAL_ICM.Value) -
                        - QGeraNfeItemVAL_DESCONTO.Value),-2);
              PCOFINS := wAliqPisCofins;
              VCOFINS := wValPisCofins;
            end;
          end;
        end;

        if Icm <> nil then
          Icm.Orig := Origem;


        wDet.Prod := Prod;
        wDet.Imposto := TImposto.Create;
        if (Ide.IndFinal = '1') and (Ide.IdDest = 2) and
           (Dest.IndIEDest = 9) and (Issqn = nil) and
           (Ide.TpNF = 1) and ((prod.Comb = nil) or
           (pos(IntToStr(prod.Comb.CProdANP),',820101001,820101010,810102001,810102004,'+
                '810102002,810102003,810101002,810101001,810101003,'+
                '220101003,220101004,220101002,220101001,220101005,220101006,84369100') > 0))  then
        begin
          wDet.Imposto.ICMSUFDest := TICMSUFDest.Create;
          wDet.Imposto.ICMSUFDest.VBCUFDest := TNFeFloat2.Create(QGeraNfeItemVAL_ICM_BASE.Value);
          if Result.InfNFe.Versao = '4.00' then
          begin
            if QGeraNfeItemPERC_FCP_UF_DEST.Value > 0 then
            begin
              wDet.Imposto.ICMSUFDest.VBCFCPUFDest := TNFeFloat2.Create(QGeraNfeItemVAL_ICM_BASE.Value);
              wDet.Imposto.ICMSUFDest.PFCPUFDest := TNFeFloat2.Create(QGeraNfeItemPERC_FCP_UF_DEST.Value);
              wDet.Imposto.ICMSUFDest.VFCPUFDest := TNFeFloat2.Create(QGeraNfeItemVAL_ICM_BASE.Value *
                QGeraNfeItemPERC_FCP_UF_DEST.Value / 100);
              TotalFCPUFDest := TotalFCPUFDest + RoundTo(wDet.Imposto.ICMSUFDest.VFCPUFDest.Valor,-2);
            end;
          end
          else
          begin
            wDet.Imposto.ICMSUFDest.PFCPUFDest := TNFeFloat2.Create(QGeraNfeItemPERC_FCP_UF_DEST.Value);
            wDet.Imposto.ICMSUFDest.VFCPUFDest := TNFeFloat2.Create(QGeraNfeItemVAL_ICM_BASE.Value *
              QGeraNfeItemPERC_FCP_UF_DEST.Value / 100);
            TotalFCPUFDest := TotalFCPUFDest + RoundTo(wDet.Imposto.ICMSUFDest.VFCPUFDest.Valor,-2);
          end;
          
          wDet.Imposto.ICMSUFDest.PICMSUFDest := TNFeFloat2.Create(QGeraNfePERC_ICMS_UF_DEST.Value);
          wDet.Imposto.ICMSUFDest.PICMSInter := TNFeFloat2.Create(QGeraNfeItemPERC_ALIQUOTA.Value);
          if QGeraNfeItemPERC_ALIQUOTA.Value = 0 then
          begin
            if (pos(QGeraNfeUF_NOTA.Value,',AC,AL,AM,AP,BA,CE,DF,ES,GO,MA,MT,MS,'+
                'PA,PB,PE,PI,RN,RO,RR,SE,TO,') > 0) and
               (pos(QGeraNfeUF_FILIAL.Value,',MG,PR,RS,RJ,SC,SP,') > 0) then
              wDet.Imposto.ICMSUFDest.PICMSInter := TNFeFloat2.Create(7)
            else
              wDet.Imposto.ICMSUFDest.PICMSInter := TNFeFloat2.Create(12);
          end;
          wDet.Imposto.ICMSUFDest.PICMSInterPart := TNFeFloat2.Create(wPercICMSInterPart);


          wDet.Imposto.ICMSUFDest.VICMSUFDest :=
              TNFeFloat2.Create(QGeraNfeItemVAL_ICMS_DIFERENCIAL.Value *
              wPercICMSInterPart / 100);
          wDet.Imposto.ICMSUFDest.VICMSUFRemet :=
              TNFeFloat2.Create(QGeraNfeItemVAL_ICMS_DIFERENCIAL.Value -
              wDet.Imposto.ICMSUFDest.VICMSUFDest.Valor);

          TotalICMSUFDest := TotalICMSUFDest + RoundTo(wDet.Imposto.ICMSUFDest.VICMSUFDest.Valor,-2);
          TotalICMSUFRemet := TotalICMSUFRemet + RoundTo(wDet.Imposto.ICMSUFDest.VICMSUFRemet.Valor, -2);
        end;
        wdet.VItem := TNFeFloat2.Create(QGeraNfeItemSVAL_TOTAL_ITEM.Value);
        
        if QNotaReferenciadaDESC_CHAVE_ACESSO.Value <> '' then
        begin
          wDet.DFeReferenciado := TDFeReferenciado.Create;
          wDet.DFeReferenciado.ChaveAcesso := QNotaReferenciadaDESC_CHAVE_ACESSO.Value;
        end;
        if Icm <> Nil then
        begin
          wDet.Imposto.Icms := TICMSImposto.Create;
          wDet.Imposto.Icms.Icms := Icm;
        end;
        if wIBSCBS <> nil then
        begin
          wDet.Imposto.IBSCBS := wIBSCBS;
        end;
        wDet.Imposto.Cofins := Cofins;
        if Ipi <> nil then
          wDet.Imposto.IPI := Ipi;
        wDet.Imposto.PIS := Pis;
        if Issqn <> Nil then
          wDet.Imposto.ISSQN := Issqn;
        if II <> Nil then
          wDet.Imposto.II := II;
        wDet.Imposto.VTotTrib := TNFeFloat2.Create(RoundTo(QGeraNfeItemVAL_TOTAL_TRIB.Value,-2));

        TotalTributos := TotalTributos + RoundTo(wDet.Imposto.VTotTrib.Valor,-2);
        if (DMParamSistema.CodEmpresa = 'INSIDE') and (Trim(QGeraNfeItemNUM_FABRICANTE.Value) <> '') then
            wDet.InfAdProd := wDet.InfAdProd + 'Nro Fabricante: ' + QGeraNfeItemNUM_FABRICANTE.Value + '\n';
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CITY' then
          if QGeraNfeVAL_FUNRURAL.Value > 0 then
            wDet.InfAdProd := wDet.InfAdProd + 'Funrural: R$ ' + FormatFloat('#,##0.00',QGeraNfeVAL_FUNRURAL.Value)+'\n';
        wDet.InfAdProd := wDet.InfAdProd  + Trim(QGeraNfeItemDESC_INF_ADICIONAL.Value);

        Det.AddItem(wDet);

        if (QGeraNfeItemCOD_TRIBUTACAO.Value > 0) and (PosEx(',' +
            QGeraNfeItemCOD_TRIBUTACAO.Text + ',', Tribs) = 0) then
        begin
          ObsTrib := Trim(ObsTrib + ' ' + QGeraNfeItemDESC_OBSERVACAO_TR.Value);
          Tribs := Tribs + QGeraNfeItemCOD_TRIBUTACAO.Text + ',';
        end;
        Retornavel := (Retornavel) or (QGeraNfeItemIND_RETORNAVEL.Value = 'SIM'); //Se houver ao menos 1 produto retornavel, já vai adicionar informações de devolução de embalagens vazias.
        QGeraNfeItem.Next;
      end;

      Total := TTotal.Create;
      with Total do
      begin
        if (QGeraNfeIND_FINALIDADE_NFE.Value) <> 2 then
        begin
          TNFeFloat2.Create(QSomaNfeval_total.Value);
        end;
        ICMSTot := TICMSTot.Create;
        ICMSTot.VBC := QSomaNfeSVAL_ICM_BASE.Value;
        ICMSTot.VICMS := QSomaNfeSVAL_ICM.Value;
        if (Result.InfNFe.Versao <> '1.10') and (Result.InfNFe.Versao <> '2.00') then
          ICMSTot.VICMSDeson := TNFeFloat2.Create(0);
        ICMSTot.VBCST := QSomaNfeSVAL_BASE_SUBST.Value;
        ICMSTot.VST := QSomaNfeSVAL_ICMS_SUBST.Value;
        ICMSTot.VProd := QSomaNfeSVAL_TOTAL.Value - QSomaNfeSVAL_TOTAL_SERVICOS.Value;
        ICMSTot.VTotTrib := TNFeFloat2.Create(TotalTributos);
        ICMSTot.VFrete := QSomaNfeSVAL_FRETE.Value;
        ICMSTot.VFCPUFDest := TNFeFloat2.Create(TotalFCPUFDest);
        ICMSTot.VICMSUFDest := TNFeFloat2.Create(TotalICMSUFDest);
        ICMSTot.VICMSUFRemet := TNFeFloat2.Create(TotalICMSUFRemet);
        if Result.InfNFe.Versao = '4.00' then
        begin
          ICMSTot.VFCP := TNFeFloat2.Create(TotalFCP);
          ICMSTot.VFCPST := TNFeFloat2.Create(TotalFCPST);
          ICMSTot.VFCPSTRet := TNFeFloat2.Create(TotalFCPSTRet);
          ICMSTot.VIPIDevol := TNFeFloat2.Create(wTotalIPIDevol);
          ICMSTot.QBCMonoRet := TNFeFloat2.Create(wTotalQBCMonoRet);
          ICMSTot.VICMSMonoRet := TNFeFloat2.Create(wTotalVICMSMonoRet);
        end;

        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CEREAIS' then
        begin
          ICMSTot.VDesc := QSomaNfeSVAL_DESCONTO.Value
            + QGeraNfeVAL_FUNRURAL.Value
            + QGeraNfeVAL_SENAR.Value;
          ICMSTot.VNF := RoundTo(QSomaNfeval_total.Value - QGeraNfeVAL_FUNRURAL.Value
            - QGeraNfeVAL_SENAR.Value, -2);
        end
        else
        begin
          ICMSTot.VDesc := QSomaNfeSVAL_DESCONTO.Value;
          ICMSTot.VNF := QSomaNfeval_total.Value;
        end;
        ICMSTot.VIPI :=  RoundTo(QSomaNfeSVAL_IPI.Value, -2) - ICMSTot.VIPIDevol.Valor;

        QNotaImpostoServico.Close;
        QNotaImpostoServico.SetVariable('COD_NOTA', QGeraNfeCOD_NOTA_CAB.Value);
        QNotaImpostoServico.SetVariable('DESC_IMPOSTO', 'PIS');
        QNotaImpostoServico.Open;
        if QNotaImpostoServico.RecordCount > 0 then
        begin
          wValPisCofins := QNotaImpostoServicoVAL_IMPOSTO.Value;
        end
        else
        begin
          wValPisCofins := QSomaNfeSVAL_PIS.Value;
        end;
        ICMSTot.VPIS := wValPisCofins;

        QNotaImpostoServico.Close;
        QNotaImpostoServico.SetVariable('COD_NOTA', QGeraNfeCOD_NOTA_CAB.Value);
        QNotaImpostoServico.SetVariable('DESC_IMPOSTO', 'COFINS');
        QNotaImpostoServico.Open;
        if QNotaImpostoServico.RecordCount > 0 then
        begin
          wValPisCofins := QNotaImpostoServicoVAL_IMPOSTO.Value;
        end
        else
        begin
          wValPisCofins := QSomaNfeSVAL_COFINS.Value;
        end;
        ICMSTot.VCOFINS := wValPisCofins;

        ICMSTot.VII := QSomaNfeSVAL_II.Value;
        ICMSTot.VOutro := QSomaNfeSVAL_DESPESAS.Value;

        if QSomaNfeSVAL_TOTAL_SERVICOS.Value > 0 then
        begin
          ISSQNtot := TISSQNtot.Create;
          ISSQNtot.VServ := QSomaNfeSVAL_TOTAL_SERVICOS.Value;
          ISSQNtot.VBC := QSomaNfeSVAL_TOTAL_SERVICOS.Value - QSomaNfeSVAL_DESCONTO_SERVICO.Value
                            +QSomaNfeSVAL_DESPESAS_SERVICO.Value;
          ISSQNtot.VISS := QSomaNfeSVAL_ISS.Value;
          if QSomaNfeSVAL_DESCONTO_SERVICO.Value > 0 then
            ISSQNtot.VDescIncond := TNFeFloat2.Create(QSomaNfeSVAL_DESCONTO_SERVICO.Value);
          if QSomaNfeSVAL_DESPESAS_SERVICO.Value > 0 then
            ISSQNtot.VOutro := TNFeFloat2.Create(QSomaNfeSVAL_DESPESAS_SERVICO.Value);
          ISSQNtot.DCompet := TNFeData.Create(QGeraNfeDT_EMISSAO.Value);
        end;
{Adicionado ind_finalidade_nfe para quando for nota de devolução. Alex 14/09/2026}
        if (QGeraNfeIND_FINALIDADE_NFE.Value = 4) or ( (Emit.CRT = 3) and (QSomaNfeSVAL_IBS_EST.Value >= 0) )then
        begin
          IBSCBSTot := TIBSCBSTot.Create;
          with IBSCBSTot do
          begin
            VBCIBSCBS := TNFeFloat2.Create(QSomaNfeSVAL_BC_IBS_CBS.Value);
//            VNFTot := TNFeFloat2.Create(QSomaNfeSVAL_TOTAL.Value - QSomaNfeSVAL_DESCONTO.Value); //Junior 24/07/2026

            GIBS := TGIBS.Create;
            with GIBS do
            begin
              GIBSUF := TGIBSUFTot.Create;
              with GIBSUF do
              begin
                VDif := TNFeFloat2.Create(0);
                VDevTrib := TNFeFloat2.Create(0);
                VIBSUF := TNFeFloat2.Create(QSomaNfeSVAL_IBS_EST.Value);
              end;
              GIBSMun := TGIBSMunTot.Create;
              with GIBSMun do
              begin
                VDif := TNFeFloat2.Create(0);
                VDevTrib := TNFeFloat2.Create(0);
                VIBSMun := TNFeFloat2.Create(QSomaNfeSVAL_IBS_MUN.Value);
              end;
              VIBS := TNFeFloat2.Create(QSomaNfeSVAL_IBS_EST.Value + QSomaNfeSVAL_IBS_MUN.Value);
              VCredPres := TNFeFloat2.Create(0);
              VCredPresCondSus := TNFeFloat2.Create(0);

              GCBS := TGCBSTot.Create;
              with GCBS do
              begin
                VCredPres := TNFeFloat2.Create(0);
                VCredPresCondSus := TNFeFloat2.Create(0);
                VDif := TNFeFloat2.Create(0);
                VDevTrib := TNFeFloat2.Create(0);
                VCBS := TNFeFloat2.Create(QSomaNfeSVAL_CBS.Value);
              end;
            end;
          end;  
        end;
      end;

      Transp := TTransp.Create;
      if QGeraNfeIND_TIPO_FRETE.Value = 'CIF' then
        Transp.ModFrete := MOD_FRETE_EMITENTE
      else if QGeraNfeIND_TIPO_FRETE.Value = 'FOB' then
        Transp.ModFrete := MOD_FRETE_DESTINATARIO
      else if QGeraNfeIND_TIPO_FRETE.Value = 'TER' then
        Transp.ModFrete := MOD_FRETE_TERCEIRO
      else if QGeraNfeIND_TIPO_FRETE.Value = 'REM' then
        Transp.ModFrete := MOD_FRETE_PROPRIO_REMETENTE
      else if QGeraNfeIND_TIPO_FRETE.Value = 'DES' then
        Transp.ModFrete := MOD_FRETE_PROPRIO_DESTINATARIO
      else
        Transp.ModFrete := MOD_FRETE_SEM_FRETE;

      with Transp do
      begin
        if (not QGeraNfeDESC_TRANSPORTADORA.IsNull) then
        begin
          Transporta := TTransporta.Create;

          if not QGeraNfeNUM_CGC_CPF_TRANSP.IsNull then
          begin
            if QGeraNfeIND_FISICA_JURIDICA_TRANSP.Value = 'J' then
              Transporta.CNPJ := Bib.LimpaNumero(QGeraNfeNUM_CGC_CPF_TRANSP.Value)
            else
              Transporta.CPF := Bib.LimpaNumero(QGeraNfeNUM_CGC_CPF_TRANSP.Value);
          end;
          Transporta.XNome := Trim(QGeraNfeDESC_TRANSPORTADORA.Value);
          if QGeraNfeIND_FISICA_JURIDICA_TRANSP.Value = 'J' then
            if UpperCase(Trim(QGeraNfeINSCRICAO_TRANSP.Value)) = 'ISENTO' then
              Transporta.IE := QGeraNfeINSCRICAO_TRANSP.Value
            else
              Transporta.IE := Bib.LimpaNumero(QGeraNfeINSCRICAO_TRANSP.Value);
          Transporta.XEnder := QGeraNfeDESC_ENDERECO_TRANSP.Value;
          Transporta.xMun := QGeraNfeDESC_CIDADE_TRANSP.Value;
          if not QGeraNfeUF_TRANSP.IsNull then
            Transporta.UF := QGeraNfeUF_TRANSP.Value
          else
            Transporta.UF := QGeraNfeUF_FILIAL.Value;
        end;

        if (trim(QGeraNfeDESC_PLACA.Value) <> '') then
          if (Ide.IdDest <> 2) or (Result.InfNFe.Versao = '3.10') then
          begin
            VeicTransp := TVeicTransp.Create;
            VeicTransp.Placa := Bib.SubstituiStr(UpperCase(QGeraNfeDESC_PLACA.Value), '-', '');
            if QGeraNfeCOD_UF_VEICULO.Text <> '' then
              VeicTransp.UF := QGeraNfeCOD_UF_VEICULO.Text
            else
              VeicTransp.UF := RetornaEstadoVeiculo(VeicTransp.Placa);
          end;

         //A tag QVol deve existir e ser > 0
        wPesob := bib.ift(not QGeraNfeNUM_PESO_BRUTO.IsNull,
          QGeraNfeNUM_PESO_BRUTO.Value, DMNfe.PesoBruto);
        wPesol := bib.ift(not QGeraNfeNUM_PESO_LIQUIDO.IsNull,
          QGeraNfeNUM_PESO_LIQUIDO.Value, DMNfe.Peso);

        if (DMNfe.Volumes > 0) or (wPesob > 0) or (QGeraNfeDESC_ESPECIE.Value <> '') or
           (QGeraNfeDESC_MARCA.Value <> '') then
        begin
          Vol := TVol.Create;
          Vol.QVol := Trunc(Bib.ift(DMNfe.Volumes > 0, DMNfe.Volumes, wQuantidadeItens));
          Vol.Esp := QGeraNfeDESC_ESPECIE.Value;
          Vol.Marca := QGeraNfeDESC_MARCA.Value;
          Vol.NVol := '';

          Vol.PesoL := TNFeFloat3.Create(wPesol);
          Vol.PesoB := TNFeFloat3.Create(wPesob);
          if QGeraNfeNUM_PESO_LIQUIDO.IsNull and (DMNfe.Peso > 0) then
            DMOracle.ExecutaSql(MontaUpdate('NUM_PESO_LIQUIDO', StringReplace(FloatToStr(wPesol),',','.',[rfReplaceAll]),
                     'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + QGeraNfeCOD_NOTA_CAB.Text), True);
          if QGeraNfeNUM_PESO_LIQUIDO.IsNull and (DMNfe.Peso > 0) then
            DMOracle.ExecutaSql(MontaUpdate('NUM_PESO_BRUTO', StringReplace(FloatToStr(wPesob),',','.',[rfReplaceAll]),
                     'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + QGeraNfeCOD_NOTA_CAB.Text), True);
        end;
      end;   
      QTitulos.First;
      TotalParcelas := 0;

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
      begin
        DMNotaSaida.QContaReceber.Close;
        DMNotaSaida.QContaReceber.SetVariable('COD_NOTA_CAB', QGeraNfeCOD_NOTA_CAB.Value);
        DMNotaSaida.QContaReceber.Open;
        if not DMNotaSaida.QContaReceber.Eof then
        begin
          Cobr := TCobr.Create;
          Cobr.Fat := TFat.Create;
          Cobr.Fat.NFat := QGeraNfeNUM_NOTA.AsInteger;
          Cobr.Dup := TNFeElementItems.Create;
          while not DMNotaSaida.QContaReceber.Eof do
          begin
            If (((DMNotaSaida.QNFE_EMITEDESC_SERIE.Value = 'B') and //MARCOS - colocado p/ nao imprimir a parte B
             ( DMNotaSaida.QNFE_EMITENUM_NOTA.Value = DMNotaSaida.QContaReceberNum_Titulo.Value))  or
             ( DMNotaSaida.QNFE_EMITEDESC_SERIE.Value <> 'B')) then
            begin
              Dup := TDup.Create;
              Dup.NDup :=  TNFeIntegerComZero.Create(DMNotaSaida.QContaReceberNUM_PARCELA.Value,3);
              Dup.DVenc := TNFeData.Create(DMNotaSaida.QContaReceberDT_VENCIMENTO.Value);
              Dup.VDup := DMNotaSaida.QContaReceberVAL_ORIGINAL.Value;
              Cobr.Dup.AddItem(Dup);
              TotalParcelas := TotalParcelas + Dup.VDup;
            end;
            DMNotaSaida.QContaReceber.Next;
          end;
          Cobr.Fat.VOrig := TotalParcelas;
          Cobr.Fat.VDesc := TNFeFloat2.Create(0);
          Cobr.Fat.VLiq := TotalParcelas;
        end;
      end
      else
      begin
        if not QTitulos.Eof then
        begin
          Cobr := TCobr.Create;
          Cobr.Fat := TFat.Create;
          Cobr.Fat.NFat := QGeraNfeNUM_NOTA.AsInteger;
          Cobr.Dup := TNFeElementItems.Create;
          while not QTitulos.Eof do
          begin
            Dup := TDup.Create;
            Dup.NDup := TNFeIntegerComZero.Create(QTitulosNUM_PARCELA.Value,3);
            Dup.DVenc := TNFeData.Create(QTitulosDT_VENCIMENTO.Value);
            Dup.VDup := QTitulosVAL_ORIGINAL.Value;
            Cobr.Dup.AddItem(Dup);
            TotalParcelas := TotalParcelas + Dup.VDup;
            QTitulos.Next;
          end;
          Cobr.Fat.VOrig := TotalParcelas;
          Cobr.Fat.VDesc := TNFeFloat2.Create(0);
          Cobr.Fat.VLiq := TotalParcelas;
        end;
      end;

      if Result.InfNFe.Versao = '4.00' then
      begin
        Pag4 := TPag4.Create;
        Pag4.DetPag := TNFeElementItems.Create;
     //   if (RoundTo(QSomaPagamentosVAL_PAGO.Value,-2) >
//           RoundTo(QSomaNfeval_total.Value,-2)) and
//           (Result.InfNFe.Ide.FinNFe < 3) then
//          Pag4.VTroco := TNFeFloat2.Create(QSomaPagamentosVAL_PAGO.Value - QSomaNfeval_total.Value);
        QPagamento.First;
        while not QPagamento.Eof do
        begin
          wPag := TPag.Create;
          //if StrToInt(QGeraNfeIND_CONDICAO_PAGTO.Value) < 3 then
          //  wPag.IndPag := TNFeIntegerComZero.Create(StrToInt(QGeraNfeIND_CONDICAO_PAGTO.Value) - 1,1);
          wPag.TPag := TNFeIntegerComZero.Create(Integer(pFormaPagNFCe.getValue(QPagamentoDESC_PAGAMENTO.Value)),2);
          wPag.VPag := TNFeFloat2.Create(Bib.ift(QPagamentoDESC_PAGAMENTO.Value = 'Sem pagamento', 0, QPagamentoVAL_PAGAMENTO.Value));
          wPag.XPag := Bib.ift(QPagamentoDESC_PAGAMENTO.Value = 'Outros', 'Outros','');
          if (pos('Cartão',QPagamentoDESC_PAGAMENTO.Value) > 0) or (pos('PIX',QPagamentoDESC_PAGAMENTO.Value) > 0) then
          begin
            wPag.Card := TCard.Create;
            wPag.Card.TpIntegra := 2;
            if QPagamentoNSU.Value <> '' then
            begin
              wPag.Card.TpIntegra := 1;
              wPag.Card.CNPJ := pRedesAutorizadoras.getValue(QPagamentoDESC_REDE_AUTORIZADORA.Value);
              wPag.Card.TBand := TNFeIntegerComZero.Create(
                Bib.ift(Pos(','+QPagamentoDESC_BANDEIRA_CARTAO.Value+',',
                  ',00001,00002,00003,00004,00012,00013,00015,') > 0,
                  pBandeirasCartoes.getValue(QPagamentoDESC_BANDEIRA_CARTAO.Value),99),2);
              wPag.Card.CAut := QPagamentoNSU.Value;
            end;
          end;
          QPagamento.Next;
          Pag4.DetPag.AddItem(wPag)
        end;
      end;

      with InfAdic do
      begin
        if (Total.ICMSTot.VTotTrib.Valor > 0) and ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'TEMPERFOZ') or
          (QGeraNfeNUM_CFOP.Value < 3000) and (QGeraNfeNUM_CFOP.Value > 4000)) and
          (Pos(FloatToStr(QGeraNfeNUM_CFOP.Value), ',5924,5925,5923,6923,6924,6925,1924,1925,1924,1925,') = 0) then
          InfCpl := InfCpl + 'Valor Aprox. Total de Tributos: ' + FormatFloat('#,##0.00',Total.ICMSTot.VTotTrib.Valor)
            + ' (' + FormatFloat('#,##0.00',(100*Total.ICMSTot.VTotTrib.Valor)/total.ICMSTot.VProd)
            + '%). (Fonte: IBPT)\n';

// Empresas utilizam essa mensagem no cadastro da tributação
// Com essa programação as mensagens saem duplicadas nas notas

//        if TotalICMSDif > 0 then
//        begin
//          if TotalICMSDevido > 0 then
//            InfCpl := InfCpl + 'Operação com diferimento parcial do imposto no valor de R$ ' +
//                      FormatFloat('#,##0.00',TotalICMSDif) +
//                      ' nos termos do inciso I do art.96 do Decreto n° 1.980/07 (RICMS/PR).\n'
//          else
//            InfCpl := InfCpl + 'Diferimento Conforme  Capítulo XI do Artigo 107 Item 71,' +
//                      ' do Decreto 1980/2007 (RICMS/PR).\n';
//        end;

        if (Transp.VeicTransp = nil) and (trim(QGeraNfeDESC_PLACA.Value) <> '') then
          InfCpl := InfCpl + 'Placa do veículo: ' + Bib.SubstituiStr(UpperCase(QGeraNfeDESC_PLACA.Value), '-', '') +'\n';

        if (TotalCredICMSSN > 0) and
           (Pos(FloatToStr(QGeraNfeNUM_CFOP.Value), ',5924,5925,6924,6925,1924,1925,1924,1925,') = 0) then
          InfCpl := InfCpl + 'PERMITE O APROVEITAMENTO DO CRÉDITO DE ICMS NO VALOR DE R$ '+
                     FormatFloat( '#,##0.00', TotalCredICMSSN) +
                     '; CORRESPONDENTE À ALÍQUOTA DE '+
                     FormatFloat('#,##0.00', QGeraNfePERC_ALIQ_CRED_ICMSSN.Value) +
                     '%, NOS TERMOS DO ART. 23 DA LEI COMPLEMENTAR Nº 123, DE 2006\n';
        if MostraMsgReducaoST > 0 then
          InfCpl := InfCpl + 'Operação destinada a contribuinte enquadrado no Simples Nacional - MVA reduzida - art. 12-D do Anexo X do RICMS. \n';
        if QSomaNfeSVAL_ICMS_SUBST_ANT.Value > 0 then
          InfCpl := InfCpl + 'Valor do ICMS ST: ' + FormatFloat('#,##0.00', QSomaNfeSVAL_ICMS_SUBST_ANT.Value) + '\n';
        if (QGeraNfeVAL_FUNRURAL.Value > 0) then
          InfCpl := InfCpl + 'Funrural: R$ ' + FormatFloat('#,##0.00', QGeraNfeVAL_FUNRURAL.Value) + '\n';
        if QGeraNfeDESC_MD5_CUPOM_FISCAL.Value <> '' then
          InfCpl := InfCpl + 'Md5:'+QGeraNfeDESC_MD5_CUPOM_FISCAL.Value+' \n';

//        Notas de produtor são referenciadas na nf-e, portando estão saindo na MsgNotasReferenciadas.
//        if NotaProdutor <> '' then
//          InfCpl := InfCpl + trim(NotaProdutor) + '\n';

        if (MsgNotasReferenciadas <> '') then
          InfCpl := InfCpl + trim(MsgNotasReferenciadas) + '\n';
        if (QGeraNfeOBS.Value <> '') and
           (pos('DEV. REF. NF. NR.',QGeraNfeOBS.Value) = 0) then
          InfCpl := InfCpl + Trim(QGeraNfeOBS.Value) + '\n';
        if (QGeraNfeOBS_COMPLEMENTO.Value <> '') then
          if(pos('Nf. a Fixar Nr.',QGeraNfeOBS_COMPLEMENTO.Value) = 0) then
            InfCpl := InfCpl + Trim(QGeraNfeOBS_COMPLEMENTO.Text) + '\n';
        if (QGeraNfeDESC_OBS_CORPO_NOTA.Value <> '') then
          InfCpl := InfCpl + Trim(QGeraNfeDESC_OBS_CORPO_NOTA.Value) + '\n';
        if (QGeraNfeNUM_PEDIDO.Value > 0) and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARICOTA') then
          InfCpl := InfCpl + trim(QGeraNfeNUM_PEDIDO.Text) + '\n';
        if (QGeraNfeCOD_VENDEDOR.Value > 0) then
        begin
          if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'DEBONA') then
            InfCpl := InfCpl + 'Vendedor: ' + trim(QGeraNfeNOME_VENDEDOR.Text) + '\n';
        end;
        if QValeProduto.RecordCount > 0 then
          while not QValeProduto.Eof do
          begin
            if QValeProdutoDESC_TIPO_VALE.Value = 'VALE-PRESENTE' then
              InfCpl := InfCpl + 'Vale-presente nro '+ QValeProdutoCOD_VALE_PRODUTO.Text +'. \n'
            else
              if QValeProdutoCOD_NOTA_CAB.Value > 0 then
                InfCpl := InfCpl + 'Vale-compras nro '+ QValeProdutoCOD_VALE_PRODUTO.Text +' referente à nota fiscal nro ' +
                  DMOracle.FastSelect('NUM_NOTA','TB_NOTA_CAB','COD_NOTA_CAB = '+ QValeProdutoCOD_NOTA_CAB.Text)+'. \n';
            QValeProduto.Next;
          end;
        if (QGeraNfeNUM_NOTA_DEV_FIXAR.Value > 0) then //ALTERADO A MSG /MARCOS 01/02/2013
          InfCpl := InfCpl + 'Referente a nota fiscal de Devolucao: ' + QGeraNfeNUM_NOTA_DEV_FIXAR.Text + '\n';
        if (QGeraNfeVAL_SENAR.Value > 0) then
          InfCpl := InfCpl + 'Senar: ' + FormatFloat('0.00', QGeraNfeVAL_SENAR.Value) + '\n';
        if (ObsTrib <> '') then
          InfCpl := InfCpl + 'Obs. das tributacoes: ' + ObsTrib + '\n';

        if (Empresa = 'MOINHO') and (QGeraNfeFANTASIA_CADASTRO.Value <> '') then
          InfCpl := InfCpl + 'Fantasia: ' + Trim(QGeraNfeFANTASIA_CADASTRO.Text) + '\n';
        if QGeraNfeItemVAL_DPI_TRANSGENICOS.Value > 0 then
          InfCpl := InfCpl + 'Desconto DPI: ' + Trim(QGeraNfeItemVAL_DPI_TRANSGENICOS.Text) + '\n';
        if Dest.IdEstrangeiro <> '' then
          InfCpl := InfCpl + 'Doc. Estrangeiro: ' + Dest.IdEstrangeiro + '\n';
        if (QGeraNfeCOD_MENSAGEM.Value > 0) then
        begin
          QMensagem.Close;
          QMensagem.SetVariable('COD_MENSAGEM', QGeraNfeCOD_MENSAGEM.Value);
          QMensagem.Open;
          if (QMensagemDESC_MENSAGEM.Value <> '') then
            InfCpl := Trim(InfCpl + QMensagemDESC_MENSAGEM.Value);
          if (QMensagemDESC_COMPLEMENTO.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO.Value);
          if (QMensagemDESC_COMPLEMENTO1.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO1.Value);
          if (QMensagemDESC_COMPLEMENTO2.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO2.Value);
          if (QMensagemDESC_COMPLEMENTO3.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO3.Value);
          if (QMensagemDESC_COMPLEMENTO4.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO4.Value);
          if (QMensagemDESC_COMPLEMENTO5.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO5.Value);
          if (QMensagemDESC_COMPLEMENTO6.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO6.Value);
          if (QMensagemDESC_COMPLEMENTO7.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO7.Value);
          {Alterado para todos os clientes. Alex 30/03/2026
          if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') or  // Adicionado por Djeison A.Selzlein - 08/08/2012
            (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DALLMOVEIS')) then
          begin
            InfCpl := Trim(InfCpl + '\nEndereço de Entrega: '+ QGeraNfeENDERECO_ENTREGA_CADASTRO.Value);
            InfCpl := Trim(InfCpl + ', '+ QGeraNfeBAIRRO_ENTREGA_CADASTRO.Value);
            InfCpl := Trim(InfCpl + ', '+ QGeraNfeCIDADE_ENTREGA_CADASTRO.Value);
          end; }
        end;
{Alterado para todos os clientes. Alex 30/03/2026}        
        if (QGeraNfeENDERECO_ENTREGA_CADASTRO.Value <> '') then
        begin
          InfCpl := Trim(InfCpl + '\nEndereço de Entrega: '+ QGeraNfeENDERECO_ENTREGA_CADASTRO.Value);
          InfCpl := Trim(InfCpl + ', '+ QGeraNfeBAIRRO_ENTREGA_CADASTRO.Value);
          InfCpl := Trim(InfCpl + ', '+ QGeraNfeCIDADE_ENTREGA_CADASTRO.Value);
        end;

        if (QGeraNfeVAL_AVISTA.Value > 0) and (Ide.IndPag <> IND_PAG_VISTA) then
          InfCpl := InfCpl + ' VALOR DE ENTRADA: ' + FormatFloat('#0.00', QGeraNfeVAL_AVISTA.Value);
        if Retornavel then //Informacoes de devolucao de embalagens
        begin
          InfCpl := InfCpl + '\nE obrigatorio a devolucao das embalagens de agrotoxico triplice lavada. Se lavavel.';
          InfCpl := InfCpl + '\nNo prazo de um ano a partir da aquisicao.';
          InfCpl := InfCpl + '\nLocal para devolucao: Estrada para escola Agricola meu cantinho. linha tres fazendas - Santa Terezinha de Itaipu - PR';
          InfCpl := InfCpl +' ou local e calendario que sera previamente divulgado.';
        end;
        if QGeraNfeDESC_SUFRAMA.Value <> '' then
          InfCpl := InfCpl + '\nInscrição SUFRAMA: ' + Trim(bIb.LimpaNumero(QGeraNfeDESC_SUFRAMA.Value));
          {'\nEndereco para entrega de embalagens vazias triplice lavadas:' +
            '\nEstrada para escola agricola Meu Cantinho - Linha Tres Fazendas - Santa Terezinha de Itaipu - PR' +
            '\nE Obrigatorio a apresentacao desta NF ou copia no momento da entrega das embalagens vazias, acompanhada da NF de produtor';}

        if QSomaNfeVAL_MONOFASICO.Value > 0 then
          InfCpl := InfCpl + '\nTotal de produtos monofásicos: R$ ' + QSomaNfeVAL_MONOFASICO.Text + #13#10;

        //if QSomaNfeSVAL_ICMS_DIFERENCIAL.Value > 0 then
//          InfCpl := InfCpl + '\nDiferencial de alíquotas de ICMS: R$'
//            + formatFloat('#0.00', QSomaNfeSVAL_ICMS_DIFERENCIAL.Value)
//            + ' conforme Emenda Constitucional nº 87 de 16/04/2015.';
        if (QGeraNfeIND_NOME_FANTASIA_DANFE.Value = 'S') and
           (trim(QGeraNfeNOME_FANTASIA_CADASTRO.Value) <> '') then
          InfCpl := InfCpl + '\nNome Fantasia: ' + Trim(QGeraNfeNOME_FANTASIA_CADASTRO.Value);
        if wListaOS.Count > 0 then
        begin
          InfCpl := InfCpl + '\nNF referente a O.S. ';
          InfCpl := InfCpl + wListaOS.CommaText;
        end;
        if (TotalICMSUFDest > 0) and (DMParamSistema.CodEmpresa = 'RETIFOZ') then
          InfCpl := InfCpl + '\nTOTAL ICMS INTERESTADUAL UF REMET.: ' +
            FormatFloat('#0.00', TotalICMSUFRemet) + ' TOTAL ICMS INTERESTADUAL UF DEST.: ' +
            FormatFloat('#0.00', TotalICMSUFDest);
      end;
      AutXML := TNFeElementItems.Create;
      QAutXML.Close;
      QAutXML.SetVariable('IND_TIPO_DOCUMENTO',55);
      QAutXML.SetVariable('COD_FILIAL',QGeraNfeCOD_FILIAL.Value);
      QAutXML.Open;
      QAutXML.First;
      while not QAutXML.Eof do
      begin
        wAutXML := TAutXML.Create;
        if Length(Bib.LimpaNumero(QAutXMLNUM_CGC_CPF.Value)) = 11 then
          wAutXML.CPF := Bib.LimpaNumero(QAutXMLNUM_CGC_CPF.Value)
        else
          wAutXML.CNPJ := Bib.LimpaNumero(QAutXMLNUM_CGC_CPF.Value);
        AutXML.AddItem(wAutXML);
        QAutXML.Next;
      end;
      InfRespTec := TInfRespTec.Create;
      InfRespTec.CNPJ := '81504763000171';
      InfRespTec.XContato := 'Adriel Inácio Dias';
      InfRespTec.Email := 'adriel@cemapa.com';
      InfRespTec.Fone := '4532643773';
      InfRespTec.IdCSRT := TNFeIntegerComZero.Create(DMParamSistema.QParamSistemaDESC_IDENTIFICADOR_CSRT.AsInteger, 2);
    end;
  end;

end;

class function TNfeUtils.GeraNfCe(CodNota: Integer): TNfe;

function TemCEST(codigoST: string): Boolean;
begin
  result := ((codigoST = '10') or (codigoST = '30') or (codigoST = '60')
    or (codigoST = '61')
    or (codigoST = '70') or (codigoST = '90') or (codigoST = '201')
    or (codigoST = '202') or (codigoST = '203') or (codigoST = '500')
    or (codigoST = '900'));
end;

var
  Prod: TProd;
  Icm: TICMS;
  wDet: TDet;
  wAutXML: TAutXML;
  Int: Integer;
  Dup: TDup;
  wPag: TPag;
  Tribs, ObsTrib, Empresa: String;
  ChaveBusca, XmlNfe:String;
  Buscador :TBuscador;
  Origem: Integer;
  TotalTributos: Double;
  wTotalQBCMonoRet: Double;
  wTotalVICMSMonoRet: Double;
  SomaDescontos: Real;
  MostraMsgReducaoST: Integer;
begin
  TotalTributos := 0;
  wTotalQBCMonoRet := 0;
  wTotalVICMSMonoRet := 0;
  SomaDescontos := 0;
  Result := nil;
  with DMNfe do
  begin
    QGeraNfe.Close;
    QGeraNfe.ClearVariables;
    QGeraNfe.SetVariable('COD_NOTA_CAB', CodNota);
    QGeraNfe.Open;

    QGeraNfeItem.Close;
    QGeraNfeItem.Open;
    QSomaNfe.Close;
    QSomaNfe.Open;
    QSomaPagamentos.Close;
    QSomaPagamentos.Open;
    QValeProduto.Close;
    QValeProduto.Open;
    QTitulos.Close;
    QTitulos.Open;
    DMParamSistema.QParamSistema.Close;
    DMParamSistema.QParamSistema.Open;
    QPagamento.Close;
    QPagamento.Open;

    //verifica se nf-e nao foi gerada anteriormente
    ValidaNfe;

    if (QGeraNfe.Eof) then
      Exit;

    Empresa := '';

    Result := TNFe.Create('', TNfeVersaoFactory.
        GetNfeVersao(QGeraNfeDESC_VERSAO_NFCE.Value));
    with Result.InfNfe do
    begin
      Emit := TEmit.Create;
      Emit.CNPJ := Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value);
      Emit.XNome := Trim(QGeraNfeNOME_FILIAL.Value);
      Emit.XFant := Trim(QGeraNfeNOME_FILIAL.Value);
      Emit.Ender := TEndereco.Create;
      Emit.IE := Bib.LimpaNumero(QGeraNfeINSCRICAO_FILIAL.Value);
      Emit.CRT := QGeraNfeIND_REGIME_TRIBUTARIO.Value;
      with Emit.Ender do
      begin
        CEP := TNFeIntegerComZero.Create(StrToInt('0' + Bib.LimpaNumero(QGeraNfeCEP_FILIAL.Value)),8);
        CMun := StrToInt('0' + QGeraNfeCOD_UF_IBGE_FILIAL.Text + QGeraNfeCOD_CIDADE_IBGE_FILIAL.Value);
        CPais := Trunc(QGeraNfeCOD_PAIS_IBGE_FILIAL.Value);
        Fone := Bib.LimpaNumero(QGeraNfeTELEFONE_FILIAL.Value);
        Nro := IfThen((QGeraNfeNUM_ENDERECO_FILIAL.Text <> ''),QGeraNfeNUM_ENDERECO_FILIAL.Text,'SN');
        UF := QGeraNfeUF_FILIAL.Value;
        XBairro := Trim(QGeraNfeBAIRRO_FILIAL.Value);
        XCpl := Trim(QGeraNfeCOMPLEMENTO_FILIAL.Value);
        XLgr := Trim(QGeraNfeENDERECO_FILIAL.Value);
        XMun := QGeraNfeCIDADE_FILIAL.Value;
        XPais := QGeraNfePAIS_FILIAL.Value;
      end;

      if (QGeraNfeCOD_CADASTRO.Value <> DMUsuario.CodClientePadrao) and
         (QGeraNfeCPF_CNPJ_CADASTRO.Value <> '') then
      begin
        Dest := TDest.Create;
        if QGeraNfeIND_AMBIENTE_NFCE_FILIAL.Value = 2 then
        begin
          Dest.CNPJ := '99999999000191';
          Dest.XNome := 'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
        end
        else
        begin
          if QGeraNfeIND_FISICA_JURIDICA.Value = 'F' then
            Dest.CPF := Bib.LimpaNumero(trim(QGeraNfeCPF_CNPJ_CADASTRO.Value))
          else
            Dest.CNPJ := Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value);

          if(DMParamSistema.QParamSistemaIND_COD_CADASTRO_NFE.Value = 'S') then
            if length(IntToStr(QGeraNfeCOD_CADASTRO.Value) + ' - ' + Trim(QGeraNfeNOME_CADASTRO.Value)) > 60 then
              Dest.XNome := Trim(QGeraNfeNOME_CADASTRO.Value)
            else
              Dest.XNome := IntToStr(QGeraNfeCOD_CADASTRO.Value) + ' - ' + Trim(QGeraNfeNOME_CADASTRO.Value)
          else
            Dest.XNome := Trim(QGeraNfeNOME_CADASTRO.Value);
        end;

        Dest.IndIEDest := 9; //Não Contribuinte

        Dest.Email := trim(QGeraNfeEMAIL_CADASTRO.Value);
        if trim(QGeraNfeENDERECO_CADASTRO.Value) <> '' then
        begin
          Dest.Ender := TEndereco.Create;
          with Dest.Ender do
          begin

            CEP := TNFeIntegerComZero.Create(StrToInt('0' + Bib.LimpaNumero(QGeraNfeCEP_CADASTRO.Value)),8);
            CMun := StrToInt('0' + QGeraNfeCOD_UF_IBGE_NOTA.Text + QGeraNfeCOD_CIDADE_IBGE_CADASTRO.Value);
            CPais := QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value;
            Fone := Bib.LimpaNumero(QGeraNfeTELEFONE_CADASTRO.Value);
            Nro := Bib.NumEndereco(QGeraNfeENDERECO_CADASTRO.Text);
            UF := QGeraNfeUF_CADASTRO.Value;
            XBairro := Trim(QGeraNfeBAIRRO_CADASTRO.Value);
            XCpl := Trim(QGeraNfeCOMPLEMENTO_CADASTRO.Value);
            XLgr := Trim(Bib.RemoveNumEndereco(QGeraNfeENDERECO_CADASTRO.Value, Nro));
            XMun := Trim(QGeraNfeCIDADE_CADASTRO.Value);
            XPais := QGeraNfePAIS_CADASTRO.Value;
            if (UF <> 'EX') and (UF <> '') and (CPais <> 1058) then
              Exception.Create('Modifique o país do destinatário para "Brasil".');
          end;
        end;
      end
      else
      begin
        if QGeraNfeCPF_CNPJ_INFORMADO.Value <> '' then
        begin
          Dest := TDest.Create;
          if Length(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_INFORMADO.Value)) = 11 then //CPF
            Dest.CPF := Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_INFORMADO.Value))
          else
            Dest.CNPJ := Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_INFORMADO.Value));
          if QGeraNfeIND_AMBIENTE_NFE.Value = 2 then
            Dest.XNome := 'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL'
          else
            Dest.XNome := Trim(QGeraNfeNOME_INFORMADO.Value);
          Dest.IndIEDest := 9;
        end;
      end;

      Ide := TIde.Create;
      Id := QGeraNfeDESC_CHAVE_ACESSO.Value; //Atribuindo aqui, para pegar o cDV automaticamente no SetId.
      Ide.CMunFG := StrToInt('0' + QGeraNfeCOD_UF_IBGE_FILIAL.Text + QGeraNfeCOD_CIDADE_IBGE_FILIAL.Value);
      Ide.CUf := QGeraNfeCOD_UF_IBGE_FILIAL.Value;
      Ide.FinNFe := 1; //Normal;
      Ide.DhEmi := TNFeDataHora.Create(QGeraNfeDT_EMISSAO.Value + DMOracle.HoraServ).ToString + GetFuso(Emit.Ender.UF);
      Ide.TpImp := 4;
      Ide.IndFinal := '1'; //Consumidor Final
      Ide.IdDest := 1;  //Estadual
      Ide.IndPres := Bib.ift(QGeraNfeIND_FINALIDADE_NFE.Value = 1,QGeraNfeIND_PRESENCA.Value, 0);
                                                   
      if Result.InfNFe.Versao <> '4.00' then
        Ide.IndPag := IntToStr(StrToInt('0'+QGeraNfeIND_CONDICAO_PAGTO.Value) - 1);
      Ide.Mod_ := QGeraNfeDESC_MODELO.Value;
      Ide.NatOp := QGeraNfeDESC_OPERACAO.Text;
      Ide.NNf := QGeraNfeNUM_NOTA.AsInteger;
      Ide.ProcEmi := PROC_EMI_APP_CONTRIBUINTE;
      Ide.Serie := StrToInt('0' + QGeraNfeCOD_SERIE.Value);
      Ide.TpAmb := Bib.ift(QGeraNfeIND_AMBIENTE_NFE.IsNull, QGeraNfeIND_AMBIENTE_NFCE_FILIAL.Value,
          QGeraNfeIND_AMBIENTE_NFE.Value);
      Ide.TpEmis := StrToInt('0' + QGeraNfeIND_CONTINGENCIA_NFCE.Value);

      Ide.TpNf := IfThen(QGeraNfeIND_ENTRADA_SAIDA.Value = 'E', TP_NF_ENTRADA, TP_NF_SAIDA);
      Ide.VerProc := VERSAO_APLICATIVO;

      if QGeraNfeIND_CONTINGENCIA_NFCE.Value = '9' then
      begin
        Ide.DhCont := TNFeDataHora.Create(QGeraNfeDT_CONTINGENCIA_NFCE.Value).ToString +
          GetFuso(Emit.Ender.UF);
        Ide.XJust := QGeraNfeDESC_JUST_CONTINGENCIA_NFCE.Value;
      end;

      Tribs := ',';
      QGeraNfeItem.First;
      Det := TNFeElementItems.Create;
      while not QGeraNfeItem.Eof do
      begin
        wDet := TDet.Create(QGeraNfeItem.RecNo);
        wDet.InfAdProd := '';
        if QGeraNfeItemNUM_GENERO_NCM.Value = '' then
        begin
          MessageDlg('O produto ' + QGeraNfeItemDESC_PRODUTO.Value +
            ' não possui NCM cadastrado', mtError, [mbOk], 0);
          Abort;
        end;

        if QGeraNfeItemDESC_UNIDADE.Value = '' then
        begin
          MessageDlg('O produto ' + QGeraNfeItemDESC_PRODUTO.Value +  ' - '+ QGeraNfeItemCOD_PRODUTO.AsString +
            ' não possui unidade de medida cadastrada', mtError, [mbOk], 0);
          Abort;
        end;

        Prod := TProd.Create;

        if DMParamSistema.QParamSistemaIND_COD_PRODUTO_NFE.Value = 'C' then
          Prod.CProd := QGeraNfeItemCOD_PRODUTO.Text
        else
          Prod.CProd := QGeraNfeItemNUM_FABRICANTE.Text;
        if (DMParamSistema.QParamSistemaIND_COD_BARRA_XML.Value = 'S') and
           (length(QGeraNfeItemDESC_COD_BARRA.Value) in [8, 12, 13, 14]) then
        begin
          Prod.CEAN := QGeraNfeItemDESC_COD_BARRA.Value;
          prod.CEANTrib := QGeraNfeItemDESC_COD_BARRA.Value;
        end
        else if Result.InfNFe.Versao = '4.00' then
        begin
          Prod.CEAN := 'SEM GTIN';
          prod.CEANTrib := 'SEM GTIN';
        end;

        if not(QGeraNfeItemNUM_PEDIDO.IsNull) then
          Prod.XPed := QGeraNfeItemNUM_PEDIDO.AsString;
        Prod.XProd := Trim(QGeraNfeItemDESC_PRODUTO.Value);
        if QGeraNfeItem.RecNo = 1 then
          if QGeraNfeIND_AMBIENTE_NFCE_FILIAL.Value = 2 then
            Prod.XProd := 'NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL';
        Prod.CFOP := IfThen(QGeraNfeItemCOD_CFOP.IsNull, Trunc(QGeraNfeNUM_CFOP.Value),
            QGeraNfeItemCOD_CFOP.Value);
        Prod.UCom := QGeraNfeItemDESC_UNIDADE.Value;
        Prod.QCom := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value);
        Prod.VUnCom := TNFeFloat8.Create(QGeraNfeItemVAL_UNITARIO.Value);
        Prod.VProd := QGeraNfeItemVAL_TOTAL.Value;
        Prod.UTrib := QGeraNfeItemDESC_UNIDADE.Value;
        Prod.QTrib := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value);
        Prod.VUnTrib := TNFeFloat8.Create(QGeraNfeItemVAL_UNITARIO.Value);
        if (Pos(IntToStr(Prod.CFOP), ',7101,7102,7949,1501,2501,5119,6119,5501,5502,5504,5505,6501,6504,6505,6502') > 0) Or
           ((Pos(IntToStr(Prod.CFOP), ',5102') > 0) And (DMParamSistema.CodEmpresa = 'GRASEL')) then
        begin
          if QGeraNfeItemUNIDADE_NCM.Value <> '' then
            Prod.UTrib := QGeraNfeItemUNIDADE_NCM.Value;
          if (Prod.UCom = 'KG') and ((Prod.UTrib = 'TON') or (Prod.UTrib = 'TN')) then
          begin
            Prod.QTrib := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value / 1000);
            Prod.VUnTrib := TNFeFloat8.Create(QGeraNfeItemVAL_TOTAL.Value / Prod.QTrib.Valor);
          end
          else if (QGeraNfeItemUNIDADE_NCM.Value = 'KG') and
             (QGeraNfeItemDESC_UNIDADE.Value <> 'KG') and
             (QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value > 0) then
          begin
            Prod.QTrib := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value * QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value);
            Prod.VUnTrib := TNFeFloat8.Create(QGeraNfeItemVAL_TOTAL.Value/(QGeraNfeItemQT_QUANTIDADE.Value *
              QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value));
          end;
        end;
        Prod.VFrete := QGeraNfeItemVAL_FRETE.Value;
        if QGeraNfeItemVAL_DESCONTO.Value > 0 then
        begin
          if RoundTo(QGeraNfeItemVAL_DESCONTO.Value + SomaDescontos, -2) >=
             RoundTo(QSomaNfeSVAL_DESCONTO.Value, -2) then
          begin
            if RoundTo(SomaDescontos, -2) < RoundTo(QSomaNfeSVAL_DESCONTO.Value, -2) then
              Prod.VDesc := TNFeFloat2.Create(QSomaNfeSVAL_DESCONTO.Value - SomaDescontos);
          end
          else
            Prod.VDesc := TNFeFloat2.Create(QGeraNfeItemVAL_DESCONTO.Value);
          SomaDescontos := SomaDescontos + QGeraNfeItemVAL_DESCONTO.Value;
        end;
        if (QGeraNfeItem.RecNo = QGeraNfeItem.RecordCount) and (QSomaNfeSVAL_DESCONTO.Value > 0) and
                                 (RoundTo(QSomaNfeSVAL_DESCONTO.Value,-2) > RoundTo(SomaDescontos,-2)) then
        begin
          Prod.VDesc := TNFeFloat2.Create(RoundTo(QGeraNfeItemVAL_DESCONTO.Value + QSomaNfeSVAL_DESCONTO.Value - SomaDescontos,-2) );
        end;
        if (((Emit.CRT = 1) or (Emit.CRT =2)) and TemCEST(QGeraNfeItemCSOSN.Value)) then
          Prod.CEST := QGeraNfeItemCOD_CEST.Value;

        if ((Emit.CRT = 3) and TemCEST(QGeraNfeItemCST.Value)) then
          Prod.CEST := QGeraNfeItemCOD_CEST.Value;

        Prod.Comb := nil;
        if ((Prod.CFOP > 1649) and (Prod.CFOP < 1665)) or ((Prod.CFOP > 2649) and (Prod.CFOP < 2665)) or
            ((Prod.CFOP > 3649) and (Prod.CFOP < 3654)) or ((Prod.CFOP > 5649) and (Prod.CFOP < 5668)) or
            ((Prod.CFOP > 6649) and (Prod.CFOP < 6668)) or ((Prod.CFOP > 7649) and (Prod.CFOP < 7668)) or
            (QGeraNfeItemCOD_PRODUTO_ANP.Value = 210203001) then
        begin
          Prod.Comb := TComb.Create;
          with Prod.Comb do
          begin
            CProdANP := QGeraNfeItemCOD_PRODUTO_ANP.Value;
            DescANP := Bib.ift(Result.InfNFe.Versao = '4.00', QGeraNfeItemDESC_ANP.Value,'');
            if CProdANP = 210203001 then
            begin
              if Result.InfNFe.Versao = '4.00' then
              begin
                PGLP := TNFeFloat4.Create(QGeraNfeItemPERC_GLP_PETROLEO.Value);
                PGNn := TNFeFloat4.Create(QGeraNfeItemPERC_MIXGN.Value);
                PGNi := TNFeFloat4.Create(QGeraNfeItemPERC_GNI.Value);
                if QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value = 0 then
                  Raise Exception.Create('É preciso informar o peso líquido do produto '+ QGeraNfeItemDESC_PRODUTO.Value);
                VPart := TNFeFloat2.Create(QGeraNfeItemVAL_UNITARIO.Value / QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value);
                Prod.QTrib := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value * QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value);
                Prod.VUnTrib := TNFeFloat8.Create(QGeraNfeItemVAL_TOTAL.Value/(QGeraNfeItemQT_QUANTIDADE.Value *
                  QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value));
                Prod.UTrib := 'KG';
                if Result.InfNFe.Ide.IndFinal = '0' then
                begin
                  Prod.Comb.OrigComb := TOrigComb.Create;
                  with Prod.Comb.OrigComb do
                  begin
                    IndImport := QGeraNfeItemIND_IMPORT_COMB.Text;
                    CUFOrig := StrToInt('0' + QGeraNfeItemUF_ORIGEM_COMB.Value);
                    POrig := TNFeFloat4.Create(QGeraNfeItemPERC_ORIG_UF_COMB.Value);
                  end;
                end;
              end
              else
                PMixGN := TNFeFloat4.Create(QGeraNfeItemPERC_MIXGN.Value);
            end;
            if QGeraNfeItemQT_TEMP.Value > 0 then
              QTemp := TNFeFloat4.Create(QGeraNfeItemQT_TEMP.Value);
            if QGeraNfeItemCOD_UF_CONSUMO.Value = '' then
              UFCons := QGeraNfeUF_CADASTRO.Value
            else
              UFCons := QGeraNfeItemCOD_UF_CONSUMO.Value;
            Cide := nil;
          end;
        end;
        if ((Prod.CFOP > 1649) and (Prod.CFOP < 1665)) or ((Prod.CFOP > 2649) and (Prod.CFOP < 2665)) or
            ((Prod.CFOP > 3649) and (Prod.CFOP < 3654)) or ((Prod.CFOP > 5649) and (Prod.CFOP < 5668)) or
            ((Prod.CFOP > 6649) and (Prod.CFOP < 6668)) or ((Prod.CFOP > 7649) and (Prod.CFOP < 7668)) then
        begin
          Prod.Comb := TComb.Create;
          with Prod.Comb do
          begin
            CProdANP := QGeraNfeItemCOD_PRODUTO_ANP.Value;
            DescANP := Bib.ift(Result.InfNFe.Versao = '4.00', QGeraNfeItemDESC_ANP.Value,'');
            if CProdANP = 210203001 then
            begin
              if Result.InfNFe.Versao = '4.00' then
              begin
                PGLP := TNFeFloat4.Create(QGeraNfeItemPERC_GLP_PETROLEO.Value);
                PGNn := TNFeFloat4.Create(QGeraNfeItemPERC_MIXGN.Value);
                PGNi := TNFeFloat4.Create(QGeraNfeItemPERC_GNI.Value);
                if QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value = 0 then
                  Raise Exception.Create('É preciso informar o peso líquido do produto '+ QGeraNfeItemDESC_PRODUTO.Value);
                VPart := TNFeFloat2.Create(QGeraNfeItemVAL_UNITARIO.Value / QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value);
                Prod.QTrib := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value * QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value);
                Prod.VUnTrib := TNFeFloat8.Create(QGeraNfeItemVAL_TOTAL.Value/(QGeraNfeItemQT_QUANTIDADE.Value *
                  QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value));
                Prod.UTrib := 'KG';
              end
              else
                PMixGN := TNFeFloat4.Create(QGeraNfeItemPERC_MIXGN.Value);
            end;
            if QGeraNfeItemQT_TEMP.Value > 0 then
              QTemp := TNFeFloat4.Create(QGeraNfeItemQT_TEMP.Value);
            if QGeraNfeItemCOD_UF_CONSUMO.Value = '' then
              UFCons := QGeraNfeUF_CADASTRO.Value
            else
              UFCons := QGeraNfeItemCOD_UF_CONSUMO.Value;
            Cide := nil;
          end;
        end;

        Prod.IndTot := IND_TOT_COMPOE_TOTAL;
        Prod.VOutro := QGeraNfeItemVAL_DESPESAS.Value;

        if QGeraNfeItemIND_TIPO_PRODUTO.Value <> 'SERVIÇO' then
        begin
          Prod.NCM := TNCM.Create(Bib.LimpaNumero(
              QGeraNfeItemNUM_GENERO_NCM.Value));

          if (Emit.CRT = 1) then //PARA NFCE do Regime 2 - puxava cst 000. Deixei igual a geração da NFE. Junior 28/02/2022
          begin
            Int :=  StrToInt('0' + QGeraNfeItemCSOSN.Value);
            Origem := QGeraNfeItemNUM_ORIGEM.Value;
          end
          else
          begin
            if Length(QGeraNfeItemCST.Value) > 2 then
            begin
              Int := StrToInt('0' + Copy(QGeraNfeItemCST.Value, 2, 2));
              Origem := StrToInt('0' + Copy(QGeraNfeItemCST.Value, 1, 1));
            end
            else
            begin
              Int := StrToInt('0' + QGeraNfeItemCST.Value);
              Origem := QGeraNfeItemNUM_ORIGEM.Value;
            end;
          end;
          {if (Emit.CRT = 1) or (Emit.CRT =2) then     //PARA NFCE do regime da empresa 2 - puxava cst 000. comentei e deixei o código acima (igual nfe). Junior 28/02/2022
          begin
            Int :=  StrToInt('0' + QGeraNfeItemCSOSN.Value);
            Origem := QGeraNfeItemNUM_ORIGEM.Value;
          end
          else
          begin
            if Length(QGeraNfeItemCST.Value) > 2 then
            begin
              Int := StrToInt('0' + Copy(QGeraNfeItemCST.Value, 2, 2));
              Origem := StrToInt('0' + Copy(QGeraNfeItemCST.Value, 1, 1));
            end
            else
            begin
              Int := StrToInt('0' + QGeraNfeItemCST.Value);
              Origem := QGeraNfeItemNUM_ORIGEM.Value;
            end;
          end;}

          MostraMsgReducaoST := 0;
          if Int in [40, 41] then
          begin
            Icm := TICMS40.Create(Int);
            if Int = 40 then   //ISENÇÃO
              Prod.CBenef := QGeraNfeItemCOD_BENEF_FISCAL_ISENCAO.Value;
            if Int = 41 then   //NÃO TRIBUTADO
              Prod.CBenef := QGeraNfeItemCOD_BENEF_FISCAL_IMUNIDADE.Value;
            //TICMS40(Icm).MotDesICMS := '9'; //Temporario 03/2011 =D
          end
          else
          begin
            case Int of
              0: //TRIBUTADO INTEGRALMENTE
              begin
                Icm := TICMS00.Create;
                with Icm as TICMS00 do
                begin
                  ModBC := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 2, MOD_BC_VAL_OPERACAO, MOD_BC_VAL_AGREGADO);
                  PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  VBC := QGeraNfeItemVAL_ICM_BASE.Value;
                  VICMS := QGeraNfeItemVAL_ICM.Value;
                end;
              end;
              10: //ST
              begin
                Icm := TICMS10.Create;
                with Icm as TICMS10 do
                begin
                  ModBC := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 2, MOD_BC_VAL_OPERACAO, MOD_BC_VAL_AGREGADO);
                  ModBCST := MOD_BC_ST_MARGEM_VAL_AGREGADO;
                  PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  PICMSST := QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VBC := QGeraNfeItemVAL_ICM_BASE.Value;
                  VBCST  := QGeraNfeItemVAL_BASE_SUBST.Value;
                  VICMS := QGeraNfeItemVAL_ICM.Value;
                  VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  PMVAST := TNFeFloat2.Create(Bib.ift(QGeraNfeItemPERC_BASE_SUBST.Value > 100, QGeraNfeItemPERC_BASE_SUBST.Value - 100, QGeraNfeItemPERC_BASE_SUBST.Value));
                end;
                if QGeraNfeItemVAL_ICMS_SUBST.Value > 0 then
                    if (QGeraNfeREGIME_TRIBUTARIO_CADASTRO.Value <> 3) and
                   (QGeraNfeItemPERC_REDUCAO_ICMS_SUBST.Value > 0) then
                      MostraMsgReducaoST := MostraMsgReducaoST + 1;
              end;
              20: //REDUÇÃO DA BASE DE CÁLCULO
              begin
                Icm := TICMS20.Create;
                with Icm as TICMS20 do
                begin
                  ModBC := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 2, MOD_BC_VAL_OPERACAO, MOD_BC_VAL_AGREGADO);
                  PRedBC := 100 - QGeraNfeItemPERC_TRIBUTADO.Value; //100 - valor da tabela de tributacao
                  VBC := QGeraNfeItemVAL_ICM_BASE.Value;
                  //PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  VICMS := QGeraNfeItemVAL_ICM.Value;
                  //VICMSDeson := TNFeFloat2.Create(0);
                  //MotDesICMS := 9;
                end;
                Prod.CBenef := QGeraNfeItemCOD_BENEF_FISCAL_REDUCAO.Value;
              end;
              30: //ISENTO OU NÃO TRIBUTADO COM ST
              begin
                Icm := TICMS30.Create;
                with Icm as TICMS30 do
                begin
                  ModBCST := MOD_BC_ST_MARGEM_VAL_AGREGADO;
                  VBCST := QGeraNfeItemVAL_BASE_SUBST.Value;
                  PICMSST := QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  PMVAST := TNFeFloat2.Create(Bib.ift(QGeraNfeItemPERC_BASE_SUBST.Value > 100, QGeraNfeItemPERC_BASE_SUBST.Value - 100, QGeraNfeItemPERC_BASE_SUBST.Value));
                  //VICMSDeson := TNFeFloat2.Create(0);
                end;
                if QGeraNfeItemNUM_CLASSIFICACAO.Value = '6' then //Imunidade ou não incidência
                  Prod.CBenef := QGeraNfeItemCOD_BENEF_FISCAL_IMUNIDADE.Value
                else                                              //Isenção
                  Prod.CBenef := QGeraNfeItemCOD_BENEF_FISCAL_ISENCAO.Value;
              end;
              60: //COBRADO ANTERIORMENTE POR ST
              begin
                Icm := TICMS60.Create;
                with Icm as TICMS60 do
                begin
                  //VBCST := QGeraNfeItemVAL_BASE_SUBST.Value;
                  //VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  VBCSTRet := QGeraNfeItemVAL_BASE_SUBST.Value;
                  VICMSSTRet := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  if (Result.InfNFe.Versao = '4.00') then
                  begin
                    if QGeraNfeItemVAL_BASE_SUBST.Value = 0 then
                      PST := TNFeFloat2.Create(0)
                    else
                      PST := TNFeFloat2.Create(QGeraNfeItemVAL_ICMS_SUBST.Value * 100 /
                        QGeraNfeItemVAL_BASE_SUBST.Value);
                    if(Result.InfNFe.Ide.IndFinal = '1') then
                    begin
                      PRedBCEfet := TNFeFloat4.Create(0);
                      VBCEfet := TNFeFloat2.Create(QGeraNfeItemVAL_TOTAL.Value * (1 - PRedBCEfet.Valor));
                      PICMSEfet := TNFeFloat4.Create(0);
                      VICMSEfet := TNFeFloat2.Create(VBCEfet.Valor * PICMSEfet.Valor / 100);
                    end;
                  end;
                end;
              end;
              61: //COBRADO ANTERIORMENTE POR ST
              begin
                Icm := TICMS61.Create;
                with Icm as TICMS61 do
                begin
                  QBCMonoRet := TNFeFloat4.Create(QGeraNfeItemQT_QUANTIDADE.Value * QGeraNfeItemPESO_LIQUIDO_PRODUTO.Value);
                  AdRemICMSRet := TNFeFloat4.Create(QGeraNfeItemPERC_AD_REM_ICMS.Value);
                  VICMSMonoRet := TNFeFloat2.Create(RoundTo(QBCMonoRet.Valor * AdRemICMSRet.Valor, -2));
                  wTotalQBCMonoRet := wTotalQBCMonoRet + QBCMonoRet.Valor;
                  wTotalVICMSMonoRet := wTotalVICMSMonoRet + VICMSMonoRet.Valor;
                end;
              end;
              70: //REDUÇÃO DA BASE DE CÁLCULO COM ST
              begin
                //ICMS 70 não tem nos clientes da Cemapa.
                Icm := TICMS70.Create;
                with Icm as TICMS70 do
                begin
                  ModBC := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 2, MOD_BC_VAL_OPERACAO, MOD_BC_VAL_AGREGADO);
                  if QGeraNfeItemPERC_TRIBUTADO.Value <= 100 then
                    PRedBC := 100 - QGeraNfeItemPERC_TRIBUTADO.Value; //100 - valor da tabela de tributacao
                  VBC := QGeraNfeItemVAL_ICM_BASE.Value;
                  PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  VICMS := QGeraNfeItemVAL_ICM.Value;
                  ModBCST := MOD_BC_ST_MARGEM_VAL_AGREGADO;
                  //PRedBCST := 100 - QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VBCST := QGeraNfeItemVAL_BASE_SUBST.Value;
                  PICMSST := QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  PMVAST := TNFeFloat2.Create(Bib.ift(QGeraNfeItemPERC_BASE_SUBST.Value > 100, QGeraNfeItemPERC_BASE_SUBST.Value - 100, QGeraNfeItemPERC_BASE_SUBST.Value));
                  //VICMSDeson := TNFeFloat2.Create(0);
                end;
                Prod.CBenef := QGeraNfeItemCOD_BENEF_FISCAL_REDUCAO.Value;
              end;
              90: //OUTRAS
              begin
                Icm := TICMS90.Create;
                with Icm as TICMS90 do
                begin
                  ModBC := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 2, MOD_BC_VAL_OPERACAO, MOD_BC_VAL_AGREGADO);
                  VBC := QGeraNfeItemVAL_ICM_BASE.Value;
                  if QGeraNfeItemPERC_TRIBUTADO.Value <= 100 then
                    PRedBC := 100 - QGeraNfeItemPERC_TRIBUTADO.Value;
                  PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  VICMS := QGeraNfeItemVAL_ICM.Value;
                  ModBCST := MOD_BC_ST_MARGEM_VAL_AGREGADO;
                  VBCST := QGeraNfeItemVAL_BASE_SUBST.Value;
                  PICMSST := QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  if (QGeraNfeItemPERC_BASE_SUBST.Value > 0) or (ModBC = MOD_BC_VAL_AGREGADO) then
                    PMVAST := TNFeFloat2.Create(Bib.ift(QGeraNfeItemPERC_BASE_SUBST.Value > 100, QGeraNfeItemPERC_BASE_SUBST.Value - 100, QGeraNfeItemPERC_BASE_SUBST.Value));
                  //VICMSDeson := TNFeFloat2.Create(0);

                  if QGeraNfeItemVAL_ICMS_SUBST.Value > 0 then
                    if (QGeraNfeREGIME_TRIBUTARIO_CADASTRO.Value <> 3) and
                   (QGeraNfeItemPERC_REDUCAO_ICMS_SUBST.Value > 0) then
                      MostraMsgReducaoST := MostraMsgReducaoST + 1;
                end;
              end;
              101:
              begin
                Icm := TICMSSN101.Create;
                with Icm as TICMSSN101 do
                begin
                  PCredSN := TNFeFloat2.Create(0);
                  VCredICMSSN := TNFeFloat2.Create(0);
                end;
              end;
              102..103:
              begin
                Icm := TICMSSN102.Create(Int);
              end;
              300..400:
              begin
                Icm := TICMSSN102.Create(Int);
              end;
              201:
              begin
                Icm := TICMSSN201.Create;
                with Icm as TICMSSN201 do
                begin
                  ModBCST := MOD_BC_ST_MARGEM_VAL_AGREGADO;
                  PRedBCST := 0;
                  PICMSST := QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VBCST  := QGeraNfeItemVAL_BASE_SUBST.Value;
                  VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  PCredSN := TNFeFloat2.Create(0);
                  VCredICMSSN := TNFeFloat2.Create(0);
                  PMVAST := TNFeFloat2.Create(Bib.ift(QGeraNfeItemPERC_BASE_SUBST.Value > 100, QGeraNfeItemPERC_BASE_SUBST.Value - 100, QGeraNfeItemPERC_BASE_SUBST.Value));
                end;
                if QGeraNfeItemVAL_ICMS_SUBST.Value > 0 then
                  if (QGeraNfeREGIME_TRIBUTARIO_CADASTRO.Value <> 3) and
                 (QGeraNfeItemPERC_REDUCAO_ICMS_SUBST.Value > 0) then
                    MostraMsgReducaoST := MostraMsgReducaoST + 1;
              end;
              202..203:
              begin
                Icm := TICMSSN202.Create(Int);
                with Icm as TICMSSN202 do
                begin
                  ModBCST := MOD_BC_ST_MARGEM_VAL_AGREGADO;
                  PRedBCST := 0;
                  PICMSST := QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VBCST  := QGeraNfeItemVAL_BASE_SUBST.Value;
                  VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  PMVAST := TNFeFloat2.Create(Bib.ift(QGeraNfeItemPERC_BASE_SUBST.Value > 100, QGeraNfeItemPERC_BASE_SUBST.Value - 100, QGeraNfeItemPERC_BASE_SUBST.Value));
                end;
                if QGeraNfeItemVAL_ICMS_SUBST.Value > 0 then
                  if (QGeraNfeREGIME_TRIBUTARIO_CADASTRO.Value <> 3) and
                 (QGeraNfeItemPERC_REDUCAO_ICMS_SUBST.Value > 0) then
                    MostraMsgReducaoST := MostraMsgReducaoST + 1;
              end;
              500:
              begin
                Icm := TICMSSN500.Create;
                with Icm as TICMSSN500 do
                begin
                  VBCSTRet := QGeraNfeItemVAL_BASE_SUBST.Value;
                  VICMSSTRet := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  if (Result.InfNFe.Versao = '4.00') then
                  begin
                    if QGeraNfeItemVAL_BASE_SUBST.Value = 0 then
                      PST := TNFeFloat4.Create(0)
                    else
                      PST := TNFeFloat4.Create(QGeraNfeItemVAL_ICMS_SUBST.Value * 100 /
                        QGeraNfeItemVAL_BASE_SUBST.Value);
                    if(Result.InfNFe.Ide.IndFinal = '1') then
                    begin
                      PRedBCEfet := TNFeFloat4.Create(0);
                      VBCEfet := TNFeFloat2.Create(QGeraNfeItemVAL_TOTAL.Value * (1 - PRedBCEfet.Valor));
                      PICMSEfet := TNFeFloat4.Create(0);
                      VICMSEfet := TNFeFloat2.Create(VBCEfet.Valor * PICMSEfet.Valor / 100);
                    end;
                  end;
                end;
              end;
              900:
              begin
                Icm := TICMSSN900.Create;
                with Icm as TICMSSN900 do
                begin
                  ModBC := IfThen(QGeraNfeIND_FINALIDADE_NFE.Value = 2, MOD_BC_VAL_OPERACAO, MOD_BC_VAL_AGREGADO);
                  VBC := QGeraNfeItemVAL_ICM_BASE.Value;
                  PRedBC := 100 - QGeraNfeItemPERC_ALIQUOTA.Value;
                  PICMS := QGeraNfeItemPERC_ALIQUOTA.Value;
                  VICMS := QGeraNfeItemVAL_ICM.Value;
                  PRedBCST := 100 - QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  ModBCST := MOD_BC_ST_MARGEM_VAL_AGREGADO;
                  VBCST  := QGeraNfeItemVAL_BASE_SUBST.Value;
                  PICMSST := QGeraNfeItemPERC_ALIQ_SUBST.Value;
                  VICMSST := QGeraNfeItemVAL_ICMS_SUBST.Value;
                  PCredSN := TNFeFloat2.Create(0);
                  VCredICMSSN := TNFeFloat2.Create(0);
                  if QGeraNfeItemPERC_BASE_SUBST.Value > 0 then
                    PMVAST := TNFeFloat2.Create(Bib.ift(QGeraNfeItemPERC_BASE_SUBST.Value > 100, QGeraNfeItemPERC_BASE_SUBST.Value - 100, QGeraNfeItemPERC_BASE_SUBST.Value));
                end;
                if QGeraNfeItemVAL_ICMS_SUBST.Value > 0 then
                  if (QGeraNfeREGIME_TRIBUTARIO_CADASTRO.Value <> 3) and
                 (QGeraNfeItemPERC_REDUCAO_ICMS_SUBST.Value > 0) then
                    MostraMsgReducaoST := MostraMsgReducaoST + 1;
              end;
            end;
          end;
        end;
        if Icm <> nil then
          Icm.Orig := Origem;


        wDet.Prod := Prod;
        wDet.Imposto := TImposto.Create;
        if Icm <> Nil then
        begin
          wDet.Imposto.Icms := TICMSImposto.Create;
          wDet.Imposto.Icms.Icms := Icm;
        end;

        wDet.Imposto.VTotTrib := TNFeFloat2.Create(RoundTo(QGeraNfeItemVAL_TOTAL_TRIB.Value,-2));

        TotalTributos := TotalTributos + RoundTo(wDet.Imposto.VTotTrib.Valor,-2);

        if DMParamSistema.CodEmpresa = 'DINGLIS' then
          wDet.InfAdProd := wDet.InfAdProd  + Trim(QGeraNfeItemDESC_LOTE.Value)
        else
          wDet.InfAdProd := wDet.InfAdProd  + Trim(QGeraNfeItemDESC_INF_ADICIONAL.Value);

        Det.AddItem(wDet);

        if (QGeraNfeItemCOD_TRIBUTACAO.Value > 0) and (PosEx(',' +
            QGeraNfeItemCOD_TRIBUTACAO.Text + ',', Tribs) = 0) then
        begin
          ObsTrib := Trim(ObsTrib + ' ' + QGeraNfeItemDESC_OBSERVACAO_TR.Value);
          Tribs := Tribs + QGeraNfeItemCOD_TRIBUTACAO.Text + ',';
        end; 
        QGeraNfeItem.Next;
      end;

      Total := TTotal.Create;
      with Total do
      begin
        ICMSTot := TICMSTot.Create;
        ICMSTot.VBC := QSomaNfeSVAL_ICM_BASE.Value;
        ICMSTot.VICMS := QSomaNfeSVAL_ICM.Value;
        if (Result.InfNFe.Versao <> '1.10') and (Result.InfNFe.Versao <> '2.00') then
          ICMSTot.VICMSDeson := TNFeFloat2.Create(0);
        ICMSTot.VBCST := QSomaNfeSVAL_BASE_SUBST.Value;
        ICMSTot.VST := QSomaNfeSVAL_ICMS_SUBST.Value;
        ICMSTot.VProd := QSomaNfeSVAL_TOTAL.Value - QSomaNfeSVAL_TOTAL_SERVICOS.Value;
        ICMSTot.VTotTrib := TNFeFloat2.Create(TotalTributos);
        ICMSTot.VFrete := QSomaNfeSVAL_FRETE.Value;
        if Result.InfNFe.Versao = '4.00' then
        begin
          ICMSTot.VFCP := TNFeFloat2.Create(0);
          ICMSTot.VFCPST := TNFeFloat2.Create(0);
          ICMSTot.VFCPSTRet := TNFeFloat2.Create(0);
          ICMSTot.VIPIDevol := TNFeFloat2.Create(0);
          ICMSTot.QBCMonoRet := TNFeFloat2.Create(wTotalQBCMonoRet);
          ICMSTot.VICMSMonoRet := TNFeFloat2.Create(wTotalVICMSMonoRet);
        end;
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CEREAIS' then
        begin
          if QGeraNfeVAL_FUNRURAL.Value > 0 then
            ICMSTot.VDesc := QGeraNfeVAL_FUNRURAL.Value + QSomaNfeSVAL_DESCONTO.Value
          else
            ICMSTot.VDesc := QSomaNfeSVAL_DESCONTO.Value;
          ICMSTot.VNF := QSomaNfeval_total.Value - QGeraNfeVAL_FUNRURAL.Value;
        end
        else
        begin
          ICMSTot.VDesc := QSomaNfeSVAL_DESCONTO.Value;
          ICMSTot.VNF := QSomaNfeval_total.Value;
        end;
        ICMSTot.VOutro := QSomaNfeSVAL_DESPESAS.Value;
      end;
      Transp := TTransp.Create;
      if Ide.IndPres = 4 then
      begin
        with Transp do
        begin
          if QGeraNfeIND_TIPO_FRETE.Value = 'CIF' then
            ModFrete := MOD_FRETE_EMITENTE
          else if QGeraNfeIND_TIPO_FRETE.Value = 'FOB' then
            ModFrete := MOD_FRETE_DESTINATARIO
          else if QGeraNfeIND_TIPO_FRETE.Value = 'TER' then
            ModFrete := MOD_FRETE_TERCEIRO
          else if QGeraNfeIND_TIPO_FRETE.Value = 'REM' then
            ModFrete := MOD_FRETE_PROPRIO_REMETENTE
          else if QGeraNfeIND_TIPO_FRETE.Value = 'DES' then
            ModFrete := MOD_FRETE_PROPRIO_DESTINATARIO
          else
            ModFrete := MOD_FRETE_SEM_FRETE;
          if (not QGeraNfeCOD_CADASTRO_TRANSP.IsNull) then
          begin
            Transporta := TTransporta.Create;

            if not QGeraNfeNUM_CGC_CPF_TRANSP.IsNull then
            begin
              if QGeraNfeIND_FISICA_JURIDICA_TRANSP.Value = 'J' then
                Transporta.CNPJ := Bib.LimpaNumero(QGeraNfeNUM_CGC_CPF_TRANSP.Value)
              else
                Transporta.CPF := Bib.LimpaNumero(QGeraNfeNUM_CGC_CPF_TRANSP.Value);
            end;
            Transporta.XNome := Trim(QGeraNfeNOME_TRANSP.Value);
            if QGeraNfeIND_FISICA_JURIDICA_TRANSP.Value = 'J' then
              if UpperCase(Trim(QGeraNfeINSCRICAO_TRANSP.Value)) = 'ISENTO' then
                Transporta.IE := QGeraNfeINSCRICAO_TRANSP.Value
              else
                Transporta.IE := Bib.LimpaNumero(QGeraNfeINSCRICAO_TRANSP.Value);
            Transporta.XEnder := QGeraNfeDESC_ENDERECO_TRANSP.Value;
            Transporta.xMun := QGeraNfeDESC_CIDADE_TRANSP.Value;
            if not QGeraNfeUF_TRANSP.IsNull then
              Transporta.UF := QGeraNfeUF_TRANSP.Value
            else
              Transporta.UF := QGeraNfeUF_FILIAL.Value;
          end;
        
          if (DMNfe.Volumes > 0) then //A tag QVol deve existir e ser > 0
          begin
            Vol := TVol.Create;
            Vol.QVol := Trunc(DMNfe.Volumes);
            Vol.Esp := QGeraNfeDESC_ESPECIE.Value;
            Vol.Marca := QGeraNfeDESC_MARCA.Value;
            Vol.NVol := '';
          
            Vol.PesoL := TNFeFloat3.Create(bib.ift(not QGeraNfeNUM_PESO_LIQUIDO.IsNull,
              QGeraNfeNUM_PESO_LIQUIDO.Value, DMNfe.Peso));
            Vol.PesoB := TNFeFloat3.Create(bib.ift(not QGeraNfeNUM_PESO_BRUTO.IsNull,
              QGeraNfeNUM_PESO_BRUTO.Value, DMNfe.PesoBruto));
          end;
        end;
      end
      else
        Transp.ModFrete := MOD_FRETE_SEM_FRETE; //Sem frete;

      if Result.InfNFe.Versao = '4.00' then
      begin
        Pag4 := TPag4.Create;
        Pag4.DetPag := TNFeElementItems.Create;
        if RoundTo(QSomaPagamentosVAL_PAGO.Value,-2) >
           RoundTo(QSomaNfeval_total.Value,-2) then
          Pag4.VTroco := TNFeFloat2.Create(QSomaPagamentosVAL_PAGO.Value - QSomaNfeval_total.Value);
      end
      else
        Pag := TNFeElementItems.Create;

      QPagamento.First;
      while not QPagamento.Eof do
      begin
        wPag := TPag.Create;
        wPag.TPag := TNFeIntegerComZero.Create(Integer(pFormaPagNFCe.getValue(QPagamentoDESC_PAGAMENTO.Value)),2);
        wPag.VPag := TNFeFloat2.Create(QPagamentoVAL_PAGAMENTO.Value);
        wPag.XPag := Bib.ift(QPagamentoDESC_PAGAMENTO.Value = 'Outros', 'Outros','');
        if (pos('Cartão',QPagamentoDESC_PAGAMENTO.Value) > 0) or (pos('PIX',QPagamentoDESC_PAGAMENTO.Value) > 0)then
        begin
          wPag.Card := TCard.Create;
          wPag.Card.TpIntegra := 2;
          if QPagamentoNSU.Value <> '' then
          begin
            if Result.InfNFe.Versao <> '4.00' then
              Ide.IndPag := IND_PAG_OUTROS; //recebe condição de pagamento outros quando é cartão
            wPag.Card.TpIntegra := 1;
            wPag.Card.CNPJ := pRedesAutorizadoras.getValue(QPagamentoDESC_REDE_AUTORIZADORA.Value);
            wPag.Card.TBand := TNFeIntegerComZero.Create(
                Bib.ift(Pos(','+QPagamentoDESC_BANDEIRA_CARTAO.Value+',',
                  ',00001,00002,00003,00004,00012,00013,00015,') > 0,
                  pBandeirasCartoes.getValue(QPagamentoDESC_BANDEIRA_CARTAO.Value),99),2);
            wPag.Card.CAut := QPagamentoNSU.Value;
          end;
        end;
        QPagamento.Next;
        if Result.InfNFe.Versao = '4.00' then
          Pag4.DetPag.AddItem(wPag)
        else
          Pag.AddItem(wPag);
      end;

      InfAdic := TInfAdic.Create;
      with InfAdic do
      begin
        QTitulos.First;
        while not QTitulos.Eof do
        begin
          InfCpl := InfCpl + QTitulosNUM_PARCELA.AsString + 'a Parcela - ' +
                        FormatDateTime('dd/MM/yyyy' ,QTitulosDT_VENCIMENTO.Value) + ' - R$ ' +
                        FormatFloat('#,##0.00',QTitulosVAL_ORIGINAL.Value)+ ' \n';
          QTitulos.Next;
        end;      
        if (QGeraNfeOBS.Value <> '') then
          InfCpl := InfCpl + Trim(QGeraNfeOBS.Value) + '\n';
        if (QGeraNfeOBS_COMPLEMENTO.Value <> '') then
          InfCpl := InfCpl + Trim(QGeraNfeOBS_COMPLEMENTO.Text) + '\n';
        if (QGeraNfeDESC_OBS_CORPO_NOTA.Value <> '') then
          InfCpl := InfCpl + Trim(QGeraNfeDESC_OBS_CORPO_NOTA.Value) + '\n';
        if (QGeraNfeCOD_VENDEDOR.Value > 0) then
          if (DMParamSistema.CodEmpresa = 'ARISTIDES') or
             (DMParamSistema.CodEmpresa = 'DINGLIS') or
             (DMParamSistema.CodEmpresa = 'OSARE') or
             (DMParamSistema.CodEmpresa = 'FERRAGMED') or
             (DMParamSistema.CodEmpresa = 'DONABENTA')or    
             (DMParamSistema.CodEmpresa = 'PIXIXE') then //Osare Clothes
            InfCpl := InfCpl + 'Vendedor: ' + QGeraNfeNOME_VENDEDOR.Text + '\n';
        if QValeProduto.RecordCount > 0 then
          while not QValeProduto.Eof do
          begin
            if QValeProdutoDESC_TIPO_VALE.Value = 'VALE-PRESENTE' then
              InfCpl := InfCpl + 'Vale-presente nro '+ QValeProdutoCOD_VALE_PRODUTO.Text +'. \n'
            else
              if QValeProdutoCOD_NOTA_CAB.Value > 0 then
                InfCpl := InfCpl + 'Vale-compras nro '+ QValeProdutoCOD_VALE_PRODUTO.Text +' referente à nota fiscal nro ' +
                  DMOracle.FastSelect('NUM_NOTA','TB_NOTA_CAB','COD_NOTA_CAB = '+ QValeProdutoCOD_NOTA_CAB.Text)+'. \n';
            QValeProduto.Next;
          end;
        if (QGeraNfeCOD_MENSAGEM.Value > 0) and
           ((DMParamSistema.CodEmpresa = 'DINGLIS') or
           (DMParamSistema.CodEmpresa = 'NFCE-DOCES')) then
        begin
          QMensagem.Close;
          QMensagem.SetVariable('COD_MENSAGEM', QGeraNfeCOD_MENSAGEM.Value);
          QMensagem.Open;
          if (QMensagemDESC_MENSAGEM.Value <> '') then
            InfCpl := Trim(InfCpl + QMensagemDESC_MENSAGEM.Value);
          if (QMensagemDESC_COMPLEMENTO.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO.Value);
          if (QMensagemDESC_COMPLEMENTO1.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO1.Value);
          if (QMensagemDESC_COMPLEMENTO2.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO2.Value);
          if (QMensagemDESC_COMPLEMENTO3.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO3.Value);
          if (QMensagemDESC_COMPLEMENTO4.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO4.Value);
          if (QMensagemDESC_COMPLEMENTO5.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO5.Value);
          if (QMensagemDESC_COMPLEMENTO6.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO6.Value);
          if (QMensagemDESC_COMPLEMENTO7.Value <> '') then
            InfCpl := Trim(InfCpl + '\n'+ QMensagemDESC_COMPLEMENTO7.Value);
        end;
      end;
      AutXML := TNFeElementItems.Create;
      QAutXML.Close;
      QAutXML.SetVariable('IND_TIPO_DOCUMENTO',65);
      QAutXML.SetVariable('COD_FILIAL',QGeraNfeCOD_FILIAL.Value);
      QAutXML.Open;
      QAutXML.First;
      while not QAutXML.Eof do
      begin
        wAutXML := TAutXML.Create;
        if Length(Bib.LimpaNumero(QAutXMLNUM_CGC_CPF.Value)) = 11 then
          wAutXML.CPF := Bib.LimpaNumero(QAutXMLNUM_CGC_CPF.Value)
        else
          wAutXML.CNPJ := Bib.LimpaNumero(QAutXMLNUM_CGC_CPF.Value);
        AutXML.AddItem(wAutXML);
        QAutXML.Next;
      end;
      InfRespTec := TInfRespTec.Create;
      InfRespTec.CNPJ := '81504763000171';
      InfRespTec.XContato := 'Adriel Inácio Dias';
      InfRespTec.Email := 'adriel@cemapa.com';
      InfRespTec.Fone := '4532643773';        
      InfRespTec.IdCSRT := TNFeIntegerComZero.Create(DMParamSistema.QParamSistemaDESC_IDENTIFICADOR_CSRT.AsInteger, 2);
    end;
  end;     
end;

class function TNfeUtils.GeraCCe(CodNota: Integer): TEnvEvento;
var
  ev: TEvento;
begin
  with DMNfe do
  begin
    QGeraNfe.Close;
    QGeraNfe.ClearVariables;
    QGeraNfe.SetVariable('COD_NOTA_CAB', CodNota);
    QGeraNfe.Open;

    QGeraCce.Close;
    QGeraCce.Open;

    QGeraCceItem.Close;
    QGeraCceItem.Open;

    Result := TEnvEvento.Create;
    Result.IdLote :=  trunc(QGeraCceID_LOTE.Value);

    QGeraCceItem.last;

    with Result do
    begin
      Evento := TNFeElementItems.Create;
      begin
        ev := TEvento.Create(QGeraCceItemID_EVENTO.Value);
        with ev.InfEvento do
        begin
          COrgao := QGeraNfeCOD_UF_IBGE_FILIAL.Value;
          TpAmb := QGeraNfeIND_AMBIENTE_NFE.Value; 
          if Length(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value)) = 14 then
            CNPJ := Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value)
          else
            CPF := Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value);
          ChNFe := QGeraCceDESC_CHAVE_ACESSO.Value;
          DhEvento := TNFeDataHora.Create(DMNfe.QGeraCceItemDT_EVENTO.Value).ToString +
            GetFuso(QGeraNfeUF_FILIAL.Value);
          TpEvento := 110110;
          NSeqEvento := QGeraCceItemNSEQ_EVENTO.Value;
          VerEvento := '1.00';
          DetEvento := TDetEvento.Create;
          with DetEvento do
          begin
            DescEvento := 'Carta de Correção';
            XCorrecao := LimpaStrXML( Trim(QGeraCceItemDESC_CORRECAO.Value));
            XCondUso := 'A Carta de Correção é disciplinada pelo § 1º-A do art. 7º do Convênio S/N, de 15 de dezembro de 1970 ';
            XCondUso := XCondUso + 'e pode ser utilizada para regularização de erro ocorrido na emissão de documento fiscal, desde que o erro não esteja relacionado com: ';
            XCondUso := XCondUso + 'I - as variáveis que determinam o valor do imposto tais como: base de cálculo, alíquota, diferença de preço, ';
            XCondUso := XCondUso + 'quantidade, valor da operação ou da prestação; II - a correção de dados cadastrais que implique mudança do remetente ou do destinatário; ';
            XCondUso := XCondUso + 'III - a data de emissão ou de saída.';
          end;
        end;
      end;
      Evento.AddItem(ev);
    end;
  end;
end;
class function TNfeUtils.GeraXMLCCe(envEvento: TenvEvento): String;
var
  wXml: String;
begin
  wXml := envEvento.GetXML('envEvento',TCceVersaoFactory.GetCceVersao(envEvento.Versao));
  Result := wXml;
end;

class function TNfeUtils.GeraXMLCCe(CodNota: Integer): String;
begin
  Result := GeraXMLCCe(GeraCCe(CodNota));
end;

class function TNfeUtils.GeraXMLNFe(NFe: TNFe): String;
var
  wXml :String;
begin
  wXml := NFe.GetXML( 'NFe', TNfeVersaoFactory.GetNfeVersao(Nfe.InfNFe.Versao));
  Result := wXml;
end;

class function TNfeUtils.GeraXMLNFe(CodNota: Integer): String;
begin
  Result := GeraXMLNfe(GeraNfe(CodNota));
end;

class function TNfeUtils.GeraMD(): TEnvEvento;
var
  ev: TEvento;
  wCNPJ: string;
begin
  with DMNfe, DMNotaEntrada  do
  begin
    Result := TEnvEvento.Create;
    Result.IdLote :=  trunc(QManifestDestID_LOTE.Value);

    with Result do
    begin
      Evento := TNFeElementItems.Create;
      begin
        ev := TEvento.Create(QManifestDestID_EVENTO.Value);
        with ev.InfEvento do
        begin
          COrgao := 91;//QNotaEntradacod_uf_ibge_filial.Value;
          TpAmb := QNotaEntradaIND_AMBIENTE_NFE.Value;
          wCNPJ := Trim(Bib.LimpaNumero(DMOracle.FastSelect('NUM_CGC','TB_FILIAL','COD_FILIAL = '+QNotaEntradaCOD_FILIAL.Text)));
          if Length(wCNPJ) = 14 then
            CNPJ := wCNPJ
          else
            CPF := wCNPJ;
          ChNFe := QManifestDestDESC_CHAVE_ACESSO.Value;
          DhEvento := TNFeDataHora.Create(QManifestDestDT_EVENTO.Value).ToString +
            GetFuso(DMOracle.BuscaNome('select cod_estado from tb_filial','cod_filial = '+ QNotaEntradaCOD_FILIAL.Text));
          TpEvento := QManifestDestTP_EVENTO.AsInteger;
          NSeqEvento := QManifestDestNSEQ_EVENTO.Value;
          VerEvento := '1.00';
          DetEvento := TDetEvento.Create;
          with DetEvento do
          begin
            DescEvento := QManifestDestDESC_EVENTO.Value;
            XJust := QManifestDestDESC_JUSTIFICATIVA.Value;
          end;
        end;
      end;
      Evento.AddItem(ev);
    end;
  end;
end;
class function TNfeUtils.GeraNFeCanc(CodNota: Integer): TenvEvento;
  var
    ev: TEvento;
begin
  with DMNfe do
  begin
    Result := TEnvEvento.Create;
    Result.IdLote :=  trunc(QGeraNfeCancID_LOTE.Value);

    with Result do
    begin
      Evento := TNFeElementItems.Create;
      ev := TEvento.Create(QGeraNfeCancID_EVENTO.Value);
      with ev.InfEvento do
      begin
        COrgao := QGeraNfeCOD_UF_IBGE_FILIAL.Value;
        TpAmb := QGeraNfeIND_AMBIENTE_NFE.Value;

        if Length(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value)) = 14 then
          CNPJ := Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value)
        else
          CPF := Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value);
        ChNFe := QGeraNfeCancDESC_CHAVE_ACESSO.Value;
        if ((DMParamSistema.CodEmpresa = 'STEIN') and (QGeraNfeUF_FILIAL.Value = 'MT')) or
           ((DMParamSistema.CodEmpresa = 'DEMAG') and (QGeraNfeUF_FILIAL.Value = 'MS')) then //Stein tem um CADPRO do MT Junior 20/05/2025
          DhEvento := TNFeDataHora.Create(IncHour(QGeraNfeCancDT_EVENTO.Value, -1)).ToString +
            GetFuso(QGeraNfeUF_FILIAL.Value)
        else
          DhEvento := TNFeDataHora.Create(QGeraNfeCancDT_EVENTO.Value).ToString +
            GetFuso(QGeraNfeUF_FILIAL.Value);
        TpEvento := 110111;
        NSeqEvento := QGeraNfeCancNSEQ_EVENTO.Value;
        VerEvento := '1.00';
        DetEvento := TDetEvento.Create;
        with DetEvento do
        begin
          DescEvento := 'Cancelamento';
          NProt := QNfeDESC_PROT_AUTORIZACAO.Value;
          XJust := QGeraNfeCancDESC_JUSTIFICATIVA.Value;
        end;
      end;
      Evento.AddItem(ev);
    end;
  end;
end;

class function TNfeUtils.GeraXMLNFeCanc(CodNota: Integer): String;
begin
  Result := GeraXMLNFeCanc(GeraNFeCanc(CodNota));
end;

class function TNfeUtils.GeraXMLNFeCanc(envEvento: TenvEvento): String;
var
  wXml: String;
begin
  wXml := envEvento.GetXML('envEvento',TCceVersaoFactory.GetCceVersao(envEvento.Versao));
  Result := wXml;
end;

class function TNfeUtils.GeraXMLMD(): String;
begin
  Result := GeraXMLCCe(GeraMD);
end;

class function TNfeUtils.RetornaEstadoVeiculo(Placa: String): String;
var
  letrasPlaca: String;
begin
  letrasPlaca := LeftStr(Placa,3);
  result := 'PR';
  if (letrasPlaca >= 'AAA') and (letrasPlaca <= 'BEZ') then
    Result := 'PR';
  if (letrasPlaca >= 'BFA') and (letrasPlaca <= 'GKI') then
    Result := 'SP';
  if (letrasPlaca >= 'GKJ') and (letrasPlaca <= 'HOK') then
    Result := 'MG';
  if (letrasPlaca >= 'HOL') and (letrasPlaca <= 'HQE') then
    Result := 'MA';
  if (letrasPlaca >= 'HQF') and (letrasPlaca <= 'HTW') then
    Result := 'MS';
  if (letrasPlaca >= 'HTX') and (letrasPlaca <= 'HZA') then
    Result := 'CE';
  if (letrasPlaca >= 'HZB') and (letrasPlaca <= 'IAP') then
    Result := 'SE';
  if (letrasPlaca >= 'IAQ') and (letrasPlaca <= 'JDO') then
    Result := 'RS';
  if (letrasPlaca >= 'JDP') and (letrasPlaca <= 'JKR') then
    Result := 'DF';
  if (letrasPlaca >= 'JKS') and (letrasPlaca <= 'JSZ') then
    Result := 'BA';
  if (letrasPlaca >= 'JTA') and (letrasPlaca <= 'JWE') then
    Result := 'PA';
  if (letrasPlaca >= 'JWF') and (letrasPlaca <= 'JXY') then
    Result := 'AM';
  if (letrasPlaca >= 'JXZ') and (letrasPlaca <= 'KAU') then
    Result := 'MT';
  if (letrasPlaca >= 'KAV') and (letrasPlaca <= 'KFC') then
    Result := 'GO';
  if (letrasPlaca >= 'KFD') and (letrasPlaca <= 'KME') then
    Result := 'PE';
  if (letrasPlaca >= 'KMF') and (letrasPlaca <= 'LVE') then
    Result := 'RJ';
  if (letrasPlaca >= 'LVF') and (letrasPlaca <= 'LWQ') then
    Result := 'PI';
  if (letrasPlaca >= 'LWR') and (letrasPlaca <= 'MMM') then
    Result := 'SC';
  if (letrasPlaca >= 'MMN') and (letrasPlaca <= 'MOW') then
    Result := 'PB';
  if (letrasPlaca >= 'MOX') and (letrasPlaca <= 'MTZ') then
    Result := 'ES';
  if (letrasPlaca >= 'MUA') and (letrasPlaca <= 'MVK') then
    Result := 'AL';
  if (letrasPlaca >= 'MVL') and (letrasPlaca <= 'MXG') then
    Result := 'TO';
  if (letrasPlaca >= 'MXH') and (letrasPlaca <= 'MZM') then
    Result := 'RN';
  if (letrasPlaca >= 'MZN') and (letrasPlaca <= 'NAG') then
    Result := 'AC';
  if (letrasPlaca >= 'NAH') and (letrasPlaca <= 'NBA') then
    Result := 'RR';
  if (letrasPlaca >= 'NBB') and (letrasPlaca <= 'NEH') then
    Result := 'RO';
  if (letrasPlaca >= 'NEI') and (letrasPlaca <= 'NFB') then
    Result := 'AP';
end;

end.

