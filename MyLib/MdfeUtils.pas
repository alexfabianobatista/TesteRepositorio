unit MdfeUtils;

interface

uses
  MdfeTypes, Mdfe, IdeMdfe, InfCarga, RodoMdfe, MDFeConsts,
  XMLUtils, Dialogs, EnderecoMdfe, InfDoc, EventoMDFe, UParamSistema_cl;

type
  TMdfeUtils = class
  private
    class function ContemUFPercurso(InfPercurso: TMDFeElementItems; UF: String): Boolean;
  public
    class function GeraChaveAcesso(CodUF: Integer; DtEmissao: TDateTime;
      TpEmis, CNPJ: string; Modelo, Serie, NumeroMT: Integer): string;
    class function GeraMDFe(CodMT: Integer): TMDFe;
    class function GeraXMLMDFe(CodMT: Integer): String; overload;
    class function GeraXMLMDFe(MDFe: TMDFe): String; overload;
    class function GeraMdfeEvento(wTpEvento: Integer): TEventoMDFe;
    class function GeraXMLMDFeEvento(wTpEvento: Integer): String; overload;
    class function GeraXMLMDFeEvento(MDFeEvento: TEventoMDFe): String; overload;
  end;

implementation

uses UNfe_cl, SysUtils, MdfeVersao, DB, DateUtils, UBiblioteca, StrUtils, Variants, Classes,
  UOracle_cl, EnvolvidoMdfe, VarUtils;
{ TMdfeUtils }

class function TMdfeUtils.ContemUFPercurso(InfPercurso: TMDFeElementItems;
  UF: String): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Length(InfPercurso.GetItems) - 1 do
    if UF = TInfPercurso(InfPercurso.GetItems[i]).UFPer then
    begin
      Result := True;
      Exit;
    end;
end;
class function TMdfeUtils.GeraChaveAcesso(CodUF: Integer; DtEmissao: TDateTime; TpEmis, CNPJ: string;
  Modelo, Serie, NumeroMT: integer): string;
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
    Bib.StrZero2(NumeroMT, 9, 0) + TpEmis + Bib.StrZero2(CodigoNumerico, 8, 0);
  Result := chave + Bib.Modulo11(chave);
end;

class function TMdfeUtils.GeraMDFe(CodMT: Integer): TMDFe;
var
  Int: Integer;
  wInfMunCarrega: TInfMunCarrega;
  wInfMunDescarga: TInfMunDescarga;
  wInfPercurso: TInfPercurso;
  wCondutor: TCondutor;
  wVeicReboque: TVeicReboque;
  wInfCIOT: TInfCIOT;
  wSeg: TSeg;
  wDisp: TDisp;
  wInfContratante: TInfContratante;
  wInfCTe: TInfCTe;
  wInfCT: TInfCT;
  wInfNFe: TInfNFe;
  wInfNF: TInfNF;
  wInfUnidTransp: TInfUnidTransp;
  wLacresAux: TStringList;
  wLacres: TLacres;
  i: Integer;
  chave: String;
  wCIOTs, wContratantes: String;
  wInfPag: TInfPag;
  wFuso: String;
begin
  Result := nil;
  with DMNfe do
  begin
    QGeraMdfe.Close;
    QGeraMdfe.ClearVariables;
    QGeraMdfe.SetVariable('COD_MANIFESTO', CodMT);
    QGeraMdfe.Open;

    DMParamSistema.QParamSistema.Close;
    DMParamSistema.QParamSistema.Open;
    QCidadeCarrega.Close;
    QCidadeCarrega.Open;
    QCidadeDescarga.Close;
    QCidadeDescarga.Open;
    QInfDoc.Close;
    QInfDoc.Open;
    QVeiculoMDFe.Close;
    QVeiculoMDFe.Open;
    QCondutorMDFe.Close;
    QCondutorMDFe.Open;
    QUFPercurso.Close;
    QUFPercurso.Open;
    QSeguroMDFe.Close;
    QSeguroMDFe.Open;
    QValePedagio.Close;
    QValePedagio.Open;

    //verifica se nf-e nao foi gerada anteriormente
    ValidaMdfe;

    if (QGeraMdfe.Eof) then
      Exit;

    Result := TMDFe.Create('', TMdfeVersaoFactory.GetMdfeVersao(QGeraMdfeDESC_VERSAO_MDFE.Value));
    with Result.InfMDFe do
    begin
      Ide := TIde.Create;
      Id := QGeraMdfeDESC_CHAVE_ACESSO.Value; //Atribuindo aqui, para pegar o cDV automaticamente no SetId.
      Ide.CUF := QGeraMdfeCOD_UF_IBGE_FILIAL.Value;
      Ide.TpAmb := QGeraMdfeIND_AMBIENTE_MDFE_FILIAL.Value;
      Ide.TpEmit := QGeraMdfeIND_TIPO_EMITENTE.Value;
      Ide.Mod_ := QGeraMdfeCOD_SERIE_MODELO.AsInteger;
      Ide.Serie := QGeraMdfeCOD_SERIE.AsInteger;
      Ide.NMDF := QGeraMdfeNUM_MANIFESTO.Value;
      Ide.Modal := QGeraMdfeIND_MODAL.Value;
      wFuso := GetFuso(QGeraMdfeUF_FILIAL.Value);
      if QGeraMdfeDESC_VERSAO_MDFE.Value = '3.00' then
        Ide.DhEmi := TMDFeDataHora.Create(QGeraMdfeDT_EMISSAO.Value+
          DMOracle.HoraServ - Bib.ift(wFuso = '-04:00', 1/24, 0)).ToString + wFuso
      else
        Ide.DhEmi := TMDFeDataHora.Create(QGeraMdfeDT_EMISSAO.Value+DMOracle.HoraServ).ToString;
      Ide.TpEmis := 1; //1-NORMAL  2-CONTINGÊNCIA
      Ide.ProcEmi := 0; // Identificador do Processo de Emissão --
                        // 0 - emissão de MDF-e com aplicativo do contribuinte;
                        //3- emissão MDF-e pelo contribuinte com
                        //aplicativo fornecido pelo Fisco.
      Ide.VerProc := '1.3.8';
      Ide.UFIni := QGeraMdfeCOD_UF_CARREGA.Value;
      Ide.UFFim := QGeraMdfeCOD_UF_DESCARREGA.Value;
      Ide.InfMunCarrega := TMDFeElementItems.Create;
      Ide.InfPercurso := TMDFeElementItems.Create;

      if QCidadeCarrega.RecordCount > 0 then
      begin
        QCidadeCarrega.First;
        while not QCidadeCarrega.Eof do
        begin
          wInfMunCarrega := TInfMunCarrega.Create;
          wInfMunCarrega.CMunCarrega := QCidadeCarregaCOD_IBGE.AsInteger;
          wInfMunCarrega.XMunCarrega := QCidadeCarregaDESC_CIDADE.Value;
          Ide.InfMunCarrega.AddItem(wInfMunCarrega);
          QCidadeCarrega.Next;
        end;
      end;
      if QUFPercurso.RecordCount > 0 then
      begin
        QUFPercurso.First;
        while not QUFPercurso.Eof do
        begin
          if not ContemUFPercurso(Ide.InfPercurso, QUFPercursoCOD_ESTADO.Value) then
          begin
            wInfPercurso := TInfPercurso.Create;
            wInfPercurso.UFPer := QUFPercursoCOD_ESTADO.Value;
            Ide.InfPercurso.AddItem(wInfPercurso); 
          end;
          QUFPercurso.Next;
        end;
      end;

      Emit := TEmit.Create;
      with Emit do
      begin
        CNPJ := Bib.LimpaNumero(QGeraMdfeCPF_CNPJ_FILIAL.Value);
        IE := Bib.LimpaNumero(QGeraMdfeINSCRICAO_FILIAL.Value);
        XNome := Trim(QGeraMdfeNOME_FILIAL.Value);
        XFant := Trim(QGeraMdfeNOME_FILIAL.Value);

        Ender := TEnderecoMDFe.Create;
        with Ender do
        begin
          XLgr := Trim(QGeraMdfeENDERECO_FILIAL.Value);
          Nro := IfThen((QGeraMdfeNUM_ENDERECO_FILIAL.Text <> ''),QGeraMdfeNUM_ENDERECO_FILIAL.Text,'SN');
          XCpl := Trim(QGeraMdfeCOMPLEMENTO_FILIAL.Value);
          XBairro := QGeraMdfeBAIRRO_FILIAL.Value;
          CMun := StrToInt('0' + QGeraMdfeCOD_UF_IBGE_FILIAL.Text + QGeraMdfeCOD_CIDADE_IBGE_FILIAL.Value);
          XMun := Trim(QGeraMdfeCIDADE_FILIAL.Value);
          CEP := TMdfeIntegerComZero.Create(StrToInt('0' + Bib.LimpaNumero(QGeraMdfeCEP_FILIAL.Value)),8);
          UF := QGeraMdfeUF_FILIAL.Value;
          Fone := Bib.LimpaNumero(QGeraMdfeTELEFONE_FILIAL.Value);
          Email := QGeraMdfeEMAIL_FILIAL.Value;
        end;

      end;

      ProdPred := TProdPred.Create;
      with ProdPred do
      begin
        TpCarga := TMDFeIntegerComZero.Create(QGeraMdfeIND_TIPO_CARGA.Value,2);
        XProd := QGeraMdfeDESC_PRODUTO.Value;
        CEAN := Bib.LimpaNumero(QGeraMdfeDESC_COD_BARRA.Value);
        NCM := BIB.LimpaNumero(QGeraMdfeNUM_GENERO_NCM.Value);
        if(QGeraMdfeIND_LOTACAO.Value = 'SIM') then
        begin
          InfLotacao := TInfLotacao.Create;
          with InfLotacao do
          begin
            InfLocalCarrega := TInfLocalCarrega.Create;
            with InfLocalCarrega do
            begin
              //CEP := Bib.LimpaNumero(QGeraMdfeDESC_CEP_CARREGA.Value);
              Latitude := QGeraMdfeDESC_LATITUDE_CARREGA.Value;
              Longitude := QGeraMdfeDESC_LONGITUDE_CARREGA.Value;
            end;
            InfLocalDescarrega := TInfLocalDescarrega.Create;
            with InfLocalDescarrega do
            begin
              //CEP := Bib.LimpaNumero(QGeraMdfeDESC_CEP_DESCARREGA.Value);
              Latitude := QGeraMdfeDESC_LATITUDE_DESCARREGA.Value;
              Longitude := QGeraMdfeDESC_LONGITUDE_DESCARREGA.Value;
            end;
          end;
        end;
      end;

      InfAdic := TInfAdic.Create;
      InfModal := TInfModal.Create;
      InfModal.VersaoModal := Result.InfMDFe.Versao;
      InfModal.Rodo := TRodo.Create;
      with InfModal.Rodo do
      begin
        if(Result.InfMDFe.Versao = '1.00') then
        begin
          RNTRC := Trim(QGeraMdfeDESC_RNTRC.Value);
          //CIOT := Trim(QGeraMdfeDESC_CIOT.Value);
        end
        else
        begin
          InfANTT := TInfANTT.Create;
          with InfANTT do
          begin
            RNTRC := Trim(QGeraMdfeDESC_RNTRC.Value);
            QInfDoc.First;
            InfContratante := TMDFeElementItems.Create;
            InfCIOT := TMDFeElementItems.Create;
            wCIOTs := ',';
            wContratantes := ',';
            while not QInfDoc.Eof do
            begin
              if QInfDocCPF_CNPJ_TOMADOR.Value <> '' then
              begin
                if (Bib.LimpaNumero(QInfDocDESC_CIOT.Value) <> '') and
                   (pos(','+Bib.LimpaNumero(QInfDocDESC_CIOT.Value)+',', wCIOTs) = 0)  then
                begin
                  wCIOTs := wCIOTs + Bib.LimpaNumero(QInfDocDESC_CIOT.Value) +',';
                  wInfCIOT := TInfCIOT.Create;
                  wInfCIOT.CIOT := Bib.LimpaNumero(QInfDocDESC_CIOT.Value);
                  if QInfDocIND_FISICA_JURIDICA.Value = 'F' then
                    wInfCIOT.CPF := Bib.LimpaNumero(QInfDocCPF_CNPJ_TOMADOR.Value)
                  else
                    wInfCIOT.CNPJ := Bib.LimpaNumero(QInfDocCPF_CNPJ_TOMADOR.Value);
                  InfCIOT.AddItem(wInfCIOT);
                end;

                if pos(','+Bib.LimpaNumero(QInfDocCPF_CNPJ_TOMADOR.Value)+',', wContratantes) = 0 then
                begin
                  wContratantes := wContratantes + Bib.LimpaNumero(QInfDocCPF_CNPJ_TOMADOR.Value) + ',';
                  wInfContratante := TInfContratante.Create;
                  if QInfDocIND_FISICA_JURIDICA.Value = 'F' then
                    wInfContratante.CPF := Bib.LimpaNumero(QInfDocCPF_CNPJ_TOMADOR.Value)
                  else
                    wInfContratante.CNPJ := Bib.LimpaNumero(QInfDocCPF_CNPJ_TOMADOR.Value);
                  InfContratante.AddItem(wInfContratante);
                end;

                InfPag := TMDFeElementItems.Create;
                wInfPag := TInfPag.Create;
                with wInfPag do
                begin
                  XNome := QInfDocNOME.Value;
                  if QInfDocIND_FISICA_JURIDICA.Value = 'F' then
                    wInfPag.CPF := Bib.LimpaNumero(QInfDocCPF_CNPJ_TOMADOR.Value)
                  else
                    wInfPag.CNPJ := Bib.LimpaNumero(QInfDocCPF_CNPJ_TOMADOR.Value);

                  Comp := TComp.Create;
                  Comp.TpComp := TMDFeIntegerComZero.Create(4,2);
                  Comp.VComp := TMDFeFloat2.Create(QInfDocVAL_TOTAL_CTE.Value);

                  VContrato := TMDFeFloat2.Create(QInfDocVAL_TOTAL_CTE.Value);
                  IndPag := Bib.ift(QInfDocIND_FORMA_PGTO.Value = 1, 1, 0);
                  if indPag = 1 then
                  begin
                    InfPrazo := TInfPrazo.Create;
                    with InfPrazo do
                    begin
                      NParcela := '001';
                      DVenc := TMDFeData.Create(QInfDocDT_VENCIMENTO.Value);
                      VParcela := TMDFeFloat2.Create(QInfDocVAL_TOTAL_CTE.Value);
                    end;
                    TpAntecip := 1;
                  end;
                  InfBanc := TInfBanc.Create;
                  InfBanc.CodBanco := QInfDocCOD_BANCO.Text;
                  InfBanc.CodAgencia := QInfDocCOD_AGENCIA.Text;
                  InfPag.AddItem(wInfPag);
                end;
              end;
              QInfDoc.Next;
            end;
          end;
        end;
        QVeiculoMDFe.First;
        VeicReboque := TMDFeElementItems.Create;
        while not QVeiculoMDFe.Eof do
        begin
          if QVeiculoMDFeIND_TIPO_VEICULO.Value = 0 then
          begin
            VeicTracao := TVeicTracao.Create;
            with VeicTracao do
            begin
              //CInt :=
              Placa := StringReplace(QVeiculoMDFeDESC_PLACA.Value, ' ', '', [rfReplaceAll]);
              Placa := StringReplace(Placa, '-', '', [rfReplaceAll]);
              Tara := QVeiculoMDFeNUM_TARA.Value;
              CapKG := QVeiculoMDFeVAL_MAX_CARGA.Value;
              CapM3 := QVeiculoMDFeVAL_VOLUME.AsInteger;
              if ((Emit.CNPJ <> Bib.LimpaNumero(Trim(QVeiculoMDFeNUM_CGC_CPF.Value))) or
                   (trim(QVeiculoMDFeDESC_RNTRC.Value) <> ''))
                and (QVeiculoMDFeNUM_CGC_CPF.Value <> '') then
              begin
                Prop := TProp.Create;
                with Prop do
                begin
                  if QVeiculoMDFeIND_FISICA_JURIDICA.Value = 'F' then
                    CPF := Bib.LimpaNumero(Trim(QVeiculoMDFeNUM_CGC_CPF.Value))
                  else
                    CNPJ := Bib.LimpaNumero(Trim(QVeiculoMDFeNUM_CGC_CPF.Value));
                  RNTRC := QVeiculoMDFeDESC_RNTRC.Value;
                  XNome := QVeiculoMDFeNOME.Value;
                  IE := Bib.LimpaNumero( QVeiculoMDFeNUM_INSCRICAO.Value);
                  UF := QVeiculoMDFeESTADO_PROPRIETARIO.Value;
                  TpProp := QVeiculoMDFeIND_TIPO_PROPRIETARIO.AsInteger;
                  if (QGeraMdfeDESC_VERSAO_MDFE.Value = '3.00') and
                     (Emit.CNPJ <> Bib.LimpaNumero(Trim(QVeiculoMDFeNUM_CGC_CPF.Value))) and
                     (QVeiculoMDFeIND_FISICA_JURIDICA.Value = 'J') and
                     (Ide.TpEmit = 2)then
                    Ide.TpTransp := 2;
                end;
              end;
              QCondutorMDFe.first;
              Condutor := TMDFeElementItems.Create;
              while not QCondutorMDFe.Eof do
              begin
                wCondutor := TCondutor.Create;
                wCondutor.XNome := Trim(QCondutorMDFeNOME.Value);
                wCondutor.CPF := Bib.LimpaNumero(QCondutorMDFeNUM_CGC_CPF.Value);
                Condutor.AddItem(wCondutor);
                QCondutorMDFe.Next;
              end;
              TpRod := TMDFeIntegerComZero.Create(QVeiculoMDFeIND_TIPO_RODADO.AsInteger,2);
              TpCar := TMDFeIntegerComZero.Create(QVeiculoMDFeIND_TIPO_CARROCERIA.AsInteger,2);
              UF := QVeiculoMDFeCOD_ESTADO.Value;
            end;
          end
          else
          begin
            wVeicReboque := TVeicReboque.Create;
            with wVeicReboque do
            begin
              //CInt :=
              Placa := StringReplace(QVeiculoMDFeDESC_PLACA.Value, ' ', '', [rfReplaceAll]);
              Placa := StringReplace(Placa, '-', '', [rfReplaceAll]);
              Tara := QVeiculoMDFeNUM_TARA.Value;
              CapKG := QVeiculoMDFeVAL_MAX_CARGA.Value;
              CapM3 := QVeiculoMDFeVAL_VOLUME.AsInteger;
              if ((Emit.CNPJ <> Bib.LimpaNumero(Trim(QVeiculoMDFeNUM_CGC_CPF.Value))) or
                   (trim(QVeiculoMDFeDESC_RNTRC.Value) <> ''))
                and (QVeiculoMDFeNUM_CGC_CPF.Value <> '') then
              begin
                Prop := TProp.Create;
                with Prop do
                begin
                  if QVeiculoMDFeIND_FISICA_JURIDICA.Value = 'F' then
                    CPF := Bib.LimpaNumero(QVeiculoMDFeNUM_CGC_CPF.Value)
                  else
                    CNPJ := Bib.LimpaNumero(QVeiculoMDFeNUM_CGC_CPF.Value);
                  RNTRC := QVeiculoMDFeDESC_RNTRC.Value;
                  XNome := QVeiculoMDFeNOME.Value;
                  IE := Bib.LimpaNumero(QVeiculoMDFeNUM_INSCRICAO.Value);
                  UF := QVeiculoMDFeESTADO_PROPRIETARIO.Value;
                  TpProp := QVeiculoMDFeIND_TIPO_PROPRIETARIO.AsInteger;
                end;
              end;
              TpCar := TMDFeIntegerComZero.Create(QVeiculoMDFeIND_TIPO_CARROCERIA.AsInteger,2);
              UF := QVeiculoMDFeCOD_ESTADO.Value;
            end;
            VeicReboque.AddItem(wVeicReboque);
          end;
          QVeiculoMDFe.Next;
        end;
        if QValePedagio.RecordCount > 0 then
        begin
          QValePedagio.First;
          InfANTT.ValePed := TValePed.Create;
          InfANTT.ValePed.Disp := TMDFeElementItems.Create;
          InfANTT.ValePed.CategCombVeic := QValePedagioIND_COMBINACAO_VEICULAR.Value;
          while not QValePedagio.Eof do
          begin
            wDisp := TDisp.Create;
            wDisp.CNPJForn := Bib.LimpaNumero(QValePedagioNUM_CNPJ_FORNECEDOR.Value);
            if Length(Bib.LimpaNumero(QValePedagioNUM_CPF_CNPJ_TOMADOR.Value)) = 14 then
              wDisp.CNPJPg := Bib.LimpaNumero(QValePedagioNUM_CPF_CNPJ_TOMADOR.Value)
            else if Length(Bib.LimpaNumero(QValePedagioNUM_CPF_CNPJ_TOMADOR.Value)) = 11 then
              wDisp.CPFPg := Bib.LimpaNumero(QValePedagioNUM_CPF_CNPJ_TOMADOR.Value);
            wDisp.NCompra := Bib.LimpaNumero(QValePedagioNUM_COMPRA.Value);
            wDisp.VValePed := TMDFeFloat2.Create(QValePedagioVAL_VALE_PEDAGIO.Value);
            wDisp.TpValePed := QValePedagioIND_TIPO_VALE_PEDAGIO.Value;
            InfANTT.ValePed.Disp.AddItem(wDisp);
            QValePedagio.Next;
          end;
        end;
      end;
      InfDoc := TInfDoc.Create;
      InfDoc.InfMunDescarga := TMDFeElementItems.Create;
      QCidadeDescarga.First;
      while not QCidadeDescarga.Eof do
      begin
        wInfMunDescarga := TInfMunDescarga.Create;
        wInfMunDescarga.CMunDescarga := QCidadeDescargaCOD_IBGE.AsInteger;
        wInfMunDescarga.XMunDescarga := QCidadeDescargaDESC_CIDADE.Value;
        wInfMunDescarga.InfCTe := TMDFeElementItems.Create;
        wInfMunDescarga.InfCT := TMDFeElementItems.Create;
        wInfMunDescarga.InfNFe := TMDFeElementItems.Create;
        wInfMunDescarga.InfNF := TMDFeElementItems.Create;
        QInfDoc.Close;
        QInfDoc.Open;
        QInfDoc.First;
        while not QInfDoc.Eof do
        begin
          if QInfDocIND_TIPO_DOC.Value = '57' then
          begin
            wInfCTe := TInfCTe.Create;
            wInfCTe.ChCTe := QInfDocDESC_CHAVE_ACESSO.Value;
            wInfMunDescarga.InfCTe.AddItem(wInfCTe);
            InfAdic.InfCpl := InfAdic.InfCpl + 'CT-e: ' +QInfDocDESC_CHAVE_ACESSO.Value +' \n';
          end;
          if QInfDocIND_TIPO_DOC.Value = '08' then
          begin
            wInfCT := TInfCT.Create;
            wInfCT.NCT := QInfDocNUM_DOC.Value;
            wInfCT.Serie := QInfDocDESC_SERIE.AsInteger;
            wInfCT.Subser := QInfDocDESC_SUBSERIE.AsInteger;
            wInfCT.DEmi := TMDFeData.Create(QInfDocDT_EMISSAO.Value);
            wInfCT.VCarga := TMDFeFloat2.Create(QInfDocVAL_CARGA.Value);
            wInfMunDescarga.InfCT.AddItem(wInfCT);
          end;
          if QInfDocIND_TIPO_DOC.Value = '55' then
          begin
            wInfNFe := TInfNFe.Create;
            wInfNFe.ChNFe := QInfDocDESC_CHAVE_ACESSO.Value;
            wInfMunDescarga.InfNFe.AddItem(wInfNFe);
            InfAdic.InfCpl := InfAdic.InfCpl + 'NF-e: ' +QInfDocDESC_CHAVE_ACESSO.Value +' \n';
          end;
          if QInfDocIND_TIPO_DOC.Value = '01' then
          begin
            wInfNF := TInfNF.Create;
            wInfNF.CNPJ := TMDFeIntegerComZero.Create(StrToInt(Bib.LimpaNumero(QInfDocDESC_CNPJ_EMIT.Value)),14);
            wInfNF.UF := QInfDocCOD_UF_DEST.Value;
            wInfNF.NNF := QInfDocNUM_DOC.Value;
            wInfNF.Serie := QInfDocDESC_SERIE.Value;
            wInfNF.DEmi := TMDFeData.Create(QInfDocDT_EMISSAO.Value);
            wInfNF.VNF := TMDFeFloat2.Create(QInfDocVAL_NF.Value);
            wInfNF.PIN := QInfDocDESC_PIN_SUFRAMA.Value;
            wInfMunDescarga.InfNF.AddItem(wInfNF);
          end;
          QInfDoc.Next;
        end;

        InfDoc.InfMunDescarga.AddItem(wInfMunDescarga);
        QCidadeDescarga.Next;
      end;

      Seg := TMDFeElementItems.Create;
      QSeguroMDFe.First;
      if QSeguroMDFe.RecordCount > 0 then
        InfAdic.InfCpl := InfAdic.InfCpl + 'Informações relacionadas ao seguro da carga: \n';
      while not QSeguroMDFe.Eof do
      begin
        wSeg := TSeg.Create;
        with wSeg do
        begin
          InfResp := TInfResp.Create;
          InfResp.RespSeg := QSeguroMDFeIND_RESP_SEGURO.Value;
          if QSeguroMDFeIND_RESP_SEGURO.Value = 1 then
            InfResp.CNPJ := Bib.LimpaNumero(QGeraMdfeCPF_CNPJ_FILIAL.Value);
          if Trim(QSeguroMDFeDESC_CPF_CNPJ_RESP_SEGURO.Value) <> '' then
          begin
            if Length(Trim(QSeguroMDFeDESC_CPF_CNPJ_RESP_SEGURO.Value)) = 11 then
              InfResp.CPF := Bib.LimpaNumero(QSeguroMDFeDESC_CPF_CNPJ_RESP_SEGURO.Value)
            else
              InfResp.CNPJ := Bib.LimpaNumero(QSeguroMDFeDESC_CPF_CNPJ_RESP_SEGURO.Value);
          end;
          if Trim(QSeguroMDFeDESC_SEGURADORA.Value) <> '' then
          begin
            InfSeg := TInfSeg.Create;
            InfSeg.XSeg := Trim(LeftStr(QSeguroMDFeDESC_SEGURADORA.Value,30));
            InfSeg.CNPJ := Bib.LimpaNumero(QSeguroMDFeCNPJ_Seguradora.Value);
          end;
          if Trim(QSeguroMDFeNUM_APOLICE_SEGURO.Value) <> '' then
            NApol := QSeguroMDFeNUM_APOLICE_SEGURO.Value;
          if Trim(QSeguroMDFeNUM_AVERBACAO_SEGURO.Value) <> '' then
            NAver := QSeguroMDFeNUM_AVERBACAO_SEGURO.Value;
        end;
        Seg.AddItem(wSeg);
        InfAdic.InfCpl := InfAdic.InfCpl +
          'Responsável: ' +
          Bib.ift(wSeg.InfResp.RespSeg = 1, 'Emitente',
            IfThen(wSeg.InfResp.CNPJ = '',wSeg.InfResp.CPF, wSeg.InfResp.CNPJ))+
          ' - Apólice: '+wSeg.NApol + ' - Averbação: ' +wSeg.NAver + ' \n';

        QSeguroMDFe.Next;
      end;
      InfRespTec := TInfRespTec.Create;
      InfRespTec.CNPJ := '81504763000171';
      InfRespTec.XContato := 'Adriel Inácio Dias';
      InfRespTec.Email := 'adriel@cemapa.com';
      InfRespTec.Fone := '4532643773';
      InfRespTec.IdCSRT := TMDFeIntegerComZero.Create(DMParamSistema.QParamSistemaDESC_IDENTIFICADOR_CSRT.AsInteger, 3);

      Tot := TTot.Create;
      Tot.QCTe := 0;
      Tot.QCT := 0;
      Tot.QNFe := 0;
      Tot.QNF := 0;
      for i := 0 to Length(InfDoc.InfMunDescarga.GetItems) -1 do
      begin
        Tot.QCTe := tot.QCTe + Length(TInfMunDescarga(InfDoc.InfMunDescarga.GetItems[i]).InfCTe.GetItems);
        Tot.QCT := tot.QCT + Length(TInfMunDescarga(InfDoc.InfMunDescarga.GetItems[i]).InfCT.GetItems);
        Tot.QNFe := tot.QNFe + Length(TInfMunDescarga(InfDoc.InfMunDescarga.GetItems[i]).InfNFe.GetItems);
        Tot.QNF := tot.QNF + Length(TInfMunDescarga(InfDoc.InfMunDescarga.GetItems[i]).InfNF.GetItems);
      end;
      Tot.VCarga := TMDFeFloat2.Create(QGeraMdfeVAL_CARGA.Value);
      Tot.CUnid := TMDFeIntegerComZero.Create(1,2); //01 = KG   02 = TON
      Tot.QCarga := TMDFeFloat4.Create(QGeraMdfeNUM_PESO.Value);
      wLacresAux := TStringList.Create;
      wLacresAux.Delimiter := ',';
      wLacresAux.DelimitedText := Trim(QGeraCteDESC_LACRES.Value);
      Lacres := TMDFeElementItems.Create;
      for i := 0 to wLacresAux.Count - 1 do
      begin
        wLacres := TLacres.Create;
        wLacres.NLacre := wLacresAux[i];
        Lacres.AddItem(wLacres);
      end;
      InfAdic.InfCpl :=  LeftStr(InfAdic.InfCpl + QGeraMdfeDESC_OBS.Value, 5000);
      //if Ide.TpEmis = 1 then
//      begin
//        Result.InfMDFeSupl := TInfMDFeSupl.Create;
//        Result.InfMDFeSupl.QrCodMDFe := 'https://dfe-portal.svrs.rs.gov.br/mdfe/QRCode?chMDFe=' +
//          QGeraMdfeDESC_CHAVE_ACESSO.Value + '&tpAmb=' + IntToStr(Ide.TpAmb);
//      end;

    end;
  end;
end;

class function TMdfeUtils.GeraXMLMDFe(CodMT: Integer): String;
begin
  Result := GeraXMLMDFe(GeraMDFe(CodMT));
end;

class function TMdfeUtils.GeraXMLMDFe(MDFe: TMDFe): String;
var
  wXml :String;
begin
  wXml := MDFe.GetXML( 'MDFe', TMdfeVersaoFactory.GetMdfeVersao(MDFe.InfMDFe.Versao));
  Result := wXml;
end;

class function TMdfeUtils.GeraMdfeEvento(wTpEvento: Integer): TEventoMDFe;
var
  wFuso: String;
begin
  with DMNfe do
  begin
    Result := TEventoMDFe.Create(QGeraMdfeEventoID_EVENTO.Value,TMdfeVersaoFactory.GetMdfeVersao(QGeraMdfeDESC_VERSAO_MDFE.Value));

    with Result.InfEvento do
    begin
      COrgao := QGeraMdfeCOD_UF_IBGE_FILIAL.Value;
      TpAmb := QGeraMdfeIND_AMBIENTE_MDFE_FILIAL.Value;
      CNPJ := Trim(Bib.LimpaNumero(QGeraMdfeCPF_CNPJ_FILIAL.Value));
      ChMDFe := QGeraMdfeEventoDESC_CHAVE_ACESSO.Value;
      wFuso := GetFuso(QGeraMdfeUF_FILIAL.Value);
      if QGeraMdfeDESC_VERSAO_MDFE.Value = '3.00' then
        DhEvento := TMdfeDataHora.Create( QGeraMdfeEventoDT_EVENTO.Value
        - Bib.ift(wFuso = '-04:00', 1/24, 0)).ToString + wFuso
      else
        DhEvento := TMdfeDataHora.Create.ToString;

      //DhEvento := FormatDateTime('yyyy-MM-dd', QGeraMdfeEventoDT_EVENTO.Value) + 'T' +FormatDateTime('hh:mm:ss',QGeraMdfeEventoDT_EVENTO.Value);
      TpEvento := wTpEvento;
      NSeqEvento := QGeraMdfeEventoNSEQ_EVENTO.Value;
      DetEvento := TDetEvento.Create(TMdfeVersaoFactory.GetMdfeVersao(QGeraMdfeDESC_VERSAO_MDFE.Value));
      with DetEvento do
      begin
        case wTpEvento of
          TP_EVENTO_DFE_CANCELAMENTO:
          begin
            EvCancMDFe := TEvCancMDFe.Create;
            EvCancMDFe.DescEvento := 'Cancelamento';
            EvCancMDFe.NProt := QMdfeDESC_PROT_AUTORIZACAO.Value;
            EvCancMDFe.XJust := QGeraMdfeEventoDESC_JUSTIFICATIVA.Value;
          end;
          TP_EVENTO_DFE_ENCERRAMENTO:
          begin
            EvEncMDFe := TEvEncMDFe.Create;
            EvEncMDFe.DescEvento := 'Encerramento';
            EvEncMDFe.NProt := QMdfeDESC_PROT_AUTORIZACAO.Value;
            EvEncMDFe.DtEnc := TMDFeData.Create(QGeraMdfeEventoDT_ENCERRAMENTO.Value);
            EvEncMDFe.CUF := StrToInt(DMOracle.FastSelect('COD_UF_IBGE', 'TB_ESTADO', 'COD_ESTADO = ' +
                              QuotedStr(trim(QGeraMdfeEventoCOD_ESTADO_ENC.Value))));
            EvEncMDFe.CMun := StrToInt(IntToStr(EvEncMDFe.CUF) +
                              DMOracle.FastSelect('COD_CIDADE_IBGE', 'TB_CIDADE',
                              'COD_CIDADE = ' + QGeraMdfeEventoCOD_CIDADE_ENC.AsString));
          end;
          TP_EVENTO_DFE_INC_CONDUTOR:
          begin
            EvIncCondutorMDFe := TEvIncCondutorMDFe.Create;
            EvIncCondutorMDFe.DescEvento := 'Inclusao Condutor';
            EvIncCondutorMDFe.Condutor := TCondutor.Create;
            EvIncCondutorMDFe.Condutor.XNome := DMOracle.FastSelect('NOME', 'TB_CADASTRO',
                                    'COD_CADASTRO = '+ QGeraMdfeEventoCOD_CADASTRO_CONDUTOR.AsString);
            EvIncCondutorMDFe.Condutor.CPF := Trim(Bib.LimpaNumero(DMOracle.FastSelect('NUM_CGC_CPF', 'TB_CADASTRO','COD_CADASTRO = '+ QGeraMdfeEventoCOD_CADASTRO_CONDUTOR.AsString)));
          end;
        end;
      end;
    end;
  end;
end;

class function TMdfeUtils.GeraXMLMDFeEvento(wTpEvento: Integer): String;
begin
  Result := GeraXMLMDFeEvento(GeraMDFeEvento(wTpEvento));
end;

class function TMdfeUtils.GeraXMLMDFeEvento(
  MDFeEvento: TEventoMDFe): String;
var
  wXml :String;
begin
  wXml := MDFeEvento.GetXML('eventoMDFe', TMdfeVersaoFactory.GetMdfeVersao(MDFeEvento.Versao));
  Result := wXml;
end;

end.
