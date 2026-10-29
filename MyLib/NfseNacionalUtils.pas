unit NfseNacionalUtils;

interface

uses
  NfseConsts, XMLUtils, Dialogs, Classes, NfseNacional;

type

  TNfseNacionalUtils = class
  private
  protected
  public
    class function EnviaLoteRps(IdLote: Integer): Boolean;
    class function GeraChaveAcesso(CodMun, TipoPessoa, Serie, NumeroNF, CpfCnpj: string): string;
    class function GeraDPS(CodRps: Integer): TCDPS;
    class function GeraXMLDPS(CodRps: Integer): String; overload;
    class function GeraXMLDPS(DPS: TCDPS): String; overload;
  end;

implementation

uses UNfe_cl,UOracle_cl, UBiblioteca, SysUtils, Math, DB, TypInfo, NfseTypes, StrUtils, DateUtils,
     IdentificacaoRps, DadosServico, Prestador, IdentificacaoTomador,EnderecoNfse, Contato,
     Valores, IntermediarioServico, Tomador, ConstrucaoCivil, NfseVersao,
  UParamSistema_cl;

{ TNfeNacionalUtils }

class function TNfseNacionalUtils.EnviaLoteRps(IdLote: Integer): Boolean;
begin
  Result := True;
end;

class function TNfseNacionalUtils.GeraChaveAcesso(CodMun, TipoPessoa,
  Serie, NumeroNF, CpfCnpj: string): string;
begin
  Result := 'DPS' +
    CodMun + TipoPessoa + Bib.StrZero(CpfCnpj, 5) + Bib.StrZero(Serie, 5) + Bib.StrZero(NumeroNF, 15);
end;

class function TNfseNacionalUtils.GeraDPS(
  CodRps: Integer): TCDPS;
  function VerificaImpostoRetido(valorImposto: Double): Integer;
  begin
    result := 2;
    if (valorImposto > 0) then
      result := 1;
  end;
var
  Valores: TValores;
  wValorIssRetido: Double;
  wItemServico: TItemServico;
  wValorTotalDescontos: Double;
  wContadorServicos: Integer;
begin
  Result := nil;

  with DMNfe do
  begin
    QGeraNfe.Close;
    QGeraNfe.ClearVariables;
    QGeraNfe.SetVariable('COD_NOTA_CAB', CodRps);
    QGeraNfe.Open;

    QGeraNfeItem.Close;
    QGeraNfeItem.Open;
    QSomaNfe.Close;
    QSomaNfe.Open;
    QTitulos.Close;
    QTitulos.Open;


    //verifica se nfs-e nao foi gerada anteriormente
    ValidaNfse;

    if (QGeraNfe.Eof) then
      Exit;
    Result := TCDPS.Create;

    with Result.infDPS do
    begin
      Id := GeraChaveAcesso(QGeraNfeCOD_UF_IBGE_FILIAL.Text + QGeraNfeCOD_CIDADE_IBGE_FILIAL.Value,
        '2', QGeraNfeCOD_SERIE.Value, QGeraNfeNUM_NOTA.Text, Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value));
      tpAmb := Bib.ift(QGeraNfeIND_AMBIENTE_NFSE_FILIAL.Value = 1, '2', '1');
      dhEmi := TNFSeDataHoraTimeZone.Create(QGeraNfeDT_EMISSAO.Value + (DMOracle.HoraServ - (1/24))).ToString + GetFuso(QGeraNfeUF_FILIAL.Value);
      verAplic := '2.03';
      serie := QGeraNfeCOD_SERIE.Value;
      nDPS := QGeraNfeNUM_NOTA.Text;
      dCompet := FormatDateTime('YYYY-MM-DD', QGeraNfeDT_EMISSAO.Value);
      tpEmit := '1'; // 1-prestador 2-tomador 3-intermediário
      cLocEmi := QGeraNfeCOD_UF_IBGE_FILIAL.Text + QGeraNfeCOD_CIDADE_IBGE_FILIAL.Value;
      prest := TCInfoPrestador.Create;
      with prest do
      begin
        End_ := TCEndereco.Create;
        with End_ do
        begin
          if QGeraNfeCOD_PAIS_IBGE_FILIAL.Value <> 1058 then
          begin
            if Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value)) <> '' then
              NIF := Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value))
            else
              cNaoNIF := '0'; //0 - Não informado na nota de origem;
                              //1 - Dispensado do NIF;
                              //2 - Não exigência do NIF;
            endExt := TCEnderExt.Create;
            with endExt do
            begin
              cPais := QGeraNfeCOD_PAIS_IBGE_FILIAL.Text;
              cEndPost := Bib.LimpaNumero(QGeraNfeCEP_FILIAL.Value);
              xCidade := QGeraNfeCIDADE_FILIAL.Value;
              xEstProvReg := QGeraNfeUF_FILIAL.Value;
            end;
          end
          else
          begin
            CNPJ := Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value);
            IM := Bib.LimpaNumero(QGeraNfeINSCRICAO_MUN_FILIAL.Value);
            endNac := TCEnderNac.Create;
            with endNac do
            begin
              cMun := QGeraNfeCOD_UF_IBGE_FILIAL.Text + QGeraNfeCOD_CIDADE_IBGE_FILIAL.Value;
              CEP := Bib.LimpaNumero(QGeraNfeCEP_FILIAL.Value);
            end;
          end;
          xLgr := QGeraNfeENDERECO_FILIAL.Value;
          nro := QGeraNfeNUM_ENDERECO_FILIAL.Text;
          xCpl := Trim(QGeraNfeCOMPLEMENTO_FILIAL.Value);
          xBairro := QGeraNfeBAIRRO_FILIAL.Value;
        end;
        fone := Bib.LimpaNumero(QGeraNfeTELEFONE_FILIAL.Value);
        email := QGeraNfeEMAIL_FILIAL.Value;

        regTrib := TCRegTrib.Create;
        with regTrib do
        begin
          opSimpNac := Bib.ift(QGeraNfeIND_REGIME_TRIBUTARIO.Value = 1, '3', '1');
          if QGeraNfeIND_REGIME_TRIBUTARIO.Value = 1 then
            regApTribSN := '1';
          regEspTrib := '0';
        end;
        toma := TCInfoPessoa.Create;
        with toma do
        begin
          xNome := QGeraNfeNOME_CADASTRO.Value;
          End_ := TCEndereco.Create;
          with End_ do
          begin
            if QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value <> 1058 then
            begin
              if Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value)) <> '' then
                NIF := Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value))
              else
                cNaoNIF := '0'; //0 - Não informado na nota de origem;
                                //1 - Dispensado do NIF;
                                //2 - Não exigência do NIF;
              endExt := TCEnderExt.Create;
              with endExt do
              begin
                cPais := QGeraNfeCOD_PAIS_IBGE_CADASTRO.Text;
                cEndPost := Bib.LimpaNumero(QGeraNfeCEP_CADASTRO.Value);
                xCidade := QGeraNfeCIDADE_CADASTRO.Value;
                xEstProvReg := QGeraNfeUF_CADASTRO.Value;
              end;
            end
            else
            begin
              if QGeraNfeIND_FISICA_JURIDICA.Value = 'F' then
                CPF := Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value)
              else
                CNPJ := Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value);
              endNac := TCEnderNac.Create;
              with endNac do
              begin
                cMun := QGeraNfeCOD_UF_IBGE_CADASTRO.Text + QGeraNfeCOD_CIDADE_IBGE_CADASTRO.Value;
                CEP := Bib.LimpaNumero(QGeraNfeCEP_CADASTRO.Value);
              end;
            end;
            xLgr := QGeraNfeENDERECO_CADASTRO.Value;
            nro := Bib.NumEndereco(QGeraNfeENDERECO_CADASTRO.Value);
            xCpl := Trim(QGeraNfeCOMPLEMENTO_CADASTRO.Value);
            xBairro := QGeraNfeBAIRRO_CADASTRO.Value;
          end;
          fone := Bib.LimpaNumero(QGeraNfeTELEFONE_CADASTRO.Value);
          email := QGeraNfeEMAIL_CADASTRO.Value;
        end;
      end;
      serv := TCServ.Create;

      with serv do
      begin
        locPrest := TCLocPrest.Create;
        locPrest.cLocPrestacao := QGeraNfeCOD_UF_IBGE_PRESTACAO.Text + QGeraNfeCOD_CIDADE_IBGE_PRESTACAO.Value;
        if QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value <> 1058 then
          locPrest.cPaisPrestacao := QGeraNfeCOD_PAIS_IBGE_CADASTRO.Text;
        cServ := TCCServ.Create;
        with cServ do
        begin
          cTribNac := QGeraNfeItemCOD_SERVICO_MUNICIPAL.Value;
          //cTribMun := QGeraNfeItemCOD_SERVICO_MUNICIPAL.Value;
          xDescServ := QGeraNfeItemDESC_PRODUTO.Value;
          cNBS := QGeraNfeItemCOD_NBS.Text;
          //cIntContrib
        end;
        if (Bib.LimpaNumero(QGeraNfeNUM_DCO.Value) <> '') or
           (Bib.LimpaNumero(QGeraNfeNUM_ART.Value) <> '') then
        begin
          obra := TCInfoObra.Create;
          with obra do
          begin
            inscImobFisc := Bib.LimpaNumero(QGeraNfeNUM_ART.Value);
            cObra := Bib.LimpaNumero(QGeraNfeNUM_DCO.Value);
          end;
        end;
        valores := TCInfoValores.Create;
        with valores do
        begin
          vServPrest := TCVServPrest.Create;
          vServPrest.vServ := QSomaNfeSQT_TOTAL_SERVICOS.Text;
          if QSomaNfeSVAL_DESCONTO_SERVICO.Value > 0 then
          begin
            vDescCondIncond := TCVDescCondIncond.Create;
            vDescCondIncond.vDescIncond := QSomaNfeSVAL_DESCONTO_SERVICO.text;
          end;
          trib := TCInfoTributacao.Create;
          with trib do
          begin
            tribMun := TCTribMunicipal.Create;
            with tribMun do
            begin
              tribISSQN := QGeraNfeItemCOD_CFOP.Text;
              if QGeraNfeItemCOD_CFOP.Value = 2 then
                tpImunidade := '0'; //implementar outros tipos no futuro
              //exigSusp := TCExigSuspensa.Create; implementar no futuro
              //BM := TCBeneficioMunicipal.Create; implementar no futuro
              tpRetISSQN := Bib.ift((QGeraNfeIND_ISS_RETIDO.Value = 1)
                and (QGeraNfeIND_FISICA_JURIDICA.Value = 'J'), 2, 1); // implementar 3-retido pelo intermediário
              pAliq := QGeraNfePERC_ISS.Text;
            end;
            if (QSomaNfeSVAL_PIS.Value > 0) or
               (QSomaNfeSVAL_COFINS.Value > 0) or
               (QSomaNfeSVAL_IR.Value > 0) or
               (QSomaNfeSVAL_CSLL.Value > 0) or
               (QSomaNfeSVAL_INSS.Value > 0) then
            begin
              tribFed := TCTribFederal.Create;
              with tribFed do
              begin
                piscofins := TCTribOutrosPisCofins.Create;
                with piscofins do
                begin
                  CST := QGeraNfeItemCOD_CST_PIS.Text;
                  vBCPisCofins := QSomaNfeSVAL_TOTAL_SERVICOS.Text;
                  pAliqPis := FloatToStr(QSomaNfeSVAL_PIS.Value * 100 / QSomaNfeSVAL_TOTAL_SERVICOS.Value);
                  pAliqCofins := FloatToStr(QSomaNfeSVAL_COFINS.Value * 100 / QSomaNfeSVAL_TOTAL_SERVICOS.Value);
                  vPis := QSomaNfeSVAL_PIS.Text;
                  vCofins := QSomaNfeSVAL_COFINS.Text;
                  tpRetPisCofins := Bib.ift(QGeraNfeIND_PIS_COFINS_RETIDO.Value = 'SIM', 1, 2); // implementar outros tipos de retenção de pis e cofins
                end;
                vRetCP := QSomaNfeSVAL_INSS.Text;
                vRetIRRF := QSomaNfeSVAL_IR.Text;
                vRetCSLL := QSomaNfeSVAL_CSLL.Text;
              end;
            end;
            totTrib := TCTribTotal.Create;
            with totTrib do
            begin
              //vTotTrib := TCTribTotalMonet.Create;  //implementar no futuro
//              with vTotTrib do
//              begin
//                vTotTribFed :=
//                vTotTribEst :=
//                vTotTribMun :=
//              end;
//              pTotTrib := TCTribTotalPercent.Create;
//              with pTotTrib do
//              begin
//                pTotTribFed :=
//                pTotTribEst :=
//                pTotTribMun :=
//              end;
              indTotTrib := '0';
            end;
            IBSCBS := TCRTCInfoIBSCBS.Create;
            with IBSCBS do
            begin
              finNFSe := '0';
              indFinal := '0';
              cIndOp := '100501';
              tpOper := '1';
              //0-Interna; 1-Interestadual; 2-Exterior -->
              if QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value <> 1058 then
                indDest := '2'
              else if QGeraNfeCOD_UF_IBGE_FILIAL.Value = QGeraNfeCOD_UF_IBGE_PRESTACAO.Value then
                indDest := '0'
              else
                indDest := '1';
              valores := TCRTCInfoValoresIBSCBS.Create;
              with valores do
              begin
                trib := TCRTCInfoTributosIBSCBS.Create;
                with trib do
                begin
                  gIBSCBS := TCRTCInfoTributosSitClas.Create;
                  with gIBSCBS do
                  begin
                    CST := '000';
                    cClassTrib := '000001';
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

class function TNfseNacionalUtils.GeraXMLDPS(CodRps: Integer): String;
begin
  Result := GeraXMLDPS(GeraDPS(CodRps));
end;
class function TNfseNacionalUtils.GeraXMLDPS(DPS: TCDPS): String;
begin
  Result := DPS.GetXML('DPS');
end;

end.
