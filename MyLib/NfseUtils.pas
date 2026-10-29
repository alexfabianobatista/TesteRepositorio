unit NfseUtils;

interface
                                   
uses
  NfseConsts, Rps, XMLUtils, Dialogs, Classes, DeclaracaoPrestacaoServico, IBSCBS_NFSE;
  //Caso não encontre as Units, adicionar no path: "..\MyLib\NfseTypes"

type

  TNfseUtils = class
  private
  protected
  public
    class function EnviaLoteRps(IdLote: Integer): Boolean;
    class function GeraChaveAcesso(NumeroNF: Integer; DtEmissao:TDateTime; CodNota: Integer): string;
    class function GeraRps(CodRps: Integer): TRps;
    class function GeraXMLRps(CodRps: Integer): String; overload;
    class function GeraXMLRps(Rps: TRps): String; overload;
    class function GeraDeclaracaoPrestacaoServico(CodRps: Integer): TDeclaracaoPrestacaoServico;
    class function GeraXMLDeclaracaoPrestacaoServico(CodRps: Integer): String; overload;
    class function GeraXMLDeclaracaoPrestacaoServico(DeclaracaoPrestacaoServico: TDeclaracaoPrestacaoServico): String; overload;
  end;

implementation

uses UNfe_cl,UOracle_cl, UBiblioteca, SysUtils, Math, DB, TypInfo, NfseTypes, StrUtils, DateUtils,
     IdentificacaoRps, DadosServico, Prestador, IdentificacaoTomador,EnderecoNfse, Contato,
     Valores, IntermediarioServico, Tomador, ConstrucaoCivil, NfseVersao,
  UParamSistema_cl;

{ TNfeUtils }

class function TNfseUtils.EnviaLoteRps(IdLote: Integer): Boolean;
begin
  Result := True;
end;

class function TNfseUtils.GeraChaveAcesso(NumeroNF: integer; DtEmissao: TDateTime; CodNota: Integer): string;
var
  chave: string;
  ano, mes, dia: word;
begin
  chave := IntToStr(NumeroNF);


  while length(Chave)<= 10 do
            Chave:='0'+Chave;

  chave := IntToStr(CodNota)+ chave;

  while length(Chave)<= 19 do
            Chave:='0'+Chave;
  Result := FormatDateTime('YYYY',DtEmissao)+chave;
end;

class function TNfseUtils.GeraDeclaracaoPrestacaoServico(
  CodRps: Integer): TDeclaracaoPrestacaoServico;
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
    Result := TDeclaracaoPrestacaoServico.Create;
    with Result.InfDeclaracaoPrestacaoServico do
    begin
      Rps := TRpsElotech.Create;
      with Rps do
      begin
        with IdentificacaoRps do
        begin
          Numero := QGeraNfeNUM_NOTA.AsInteger;
          Serie := QGeraNfeCOD_SERIE.AsInteger;
          Tipo := TIPO_RPS;
        end;
        DataEmissao := FormatDateTime('YYYY-MM-DD', QGeraNfeDT_EMISSAO.Value);
        Status := STATUS_RPS_NORMAL;
        Competencia := DataEmissao;
      end;

      Valores := TValores.Create;
      Servico := TDadosServico.Create;
      Servico.IssRetido := Bib.ift((QGeraNfeIND_ISS_RETIDO.Value = 1) and (QGeraNfeIND_FISICA_JURIDICA.Value = 'J'),
            ISS_RETIDO_SIM,ISS_RETIDO_NAO);
      with Valores do
      begin
        ValorServicos := TNFSeFloat2.Create(QSomaNfeSVAL_TOTAL_SERVICOS.Value - RoundTo(QSomaNfeSVAL_DESCONTO_SERVICO.Value, -2));
        ValorDeducoes := TNFSeFloat2.Create(RoundTo((Valores.ValorServicos.Valor * QGeraNfePERC_DEDUCAO_NFSE.Value)/100,-2)); //saber o que é isso, coloquei aqui só para poder preencher o campo base de cálculo posteriormente

        wValorIssRetido := Bib.ift(Servico.IssRetido = ISS_RETIDO_SIM,
            QSomaNfeSVAL_ISS.Value,0);
        AliquotaPis := TNFSeFloat2.Create(QSomaNfeSVAL_PIS.Value * 100 / QSomaNfeSVAL_TOTAL_SERVICOS.Value);
        ValorPis := TNFSeFloat2.Create(QSomaNfeSVAL_PIS.Value);
        AliquotaCofins := TNFSeFloat2.Create(QSomaNfeSVAL_COFINS.Value * 100 / QSomaNfeSVAL_TOTAL_SERVICOS.Value);
        ValorCofins := TNFSeFloat2.Create(QSomaNfeSVAL_COFINS.Value);
        AliquotaCsll := TNFSeFloat2.Create(QSomaNfeSVAL_CSLL.Value * 100 / QSomaNfeSVAL_TOTAL_SERVICOS.Value);
        ValorCsll := TNFSeFloat2.Create(QSomaNfeSVAL_CSLL.Value);

        if (QGeraNfeIND_ISS_RETIDO.Value = 1) and
           (QGeraNfeIND_FISICA_JURIDICA.Value = 'J') then
        begin
          IssRetido := ISS_RETIDO_SIM;
          ValorIssRetido := TNFSeFloat2.Create(QSomaNfeSVAL_ISS.Value);
        end
        else
          IssRetido :=ISS_RETIDO_NAO;
        AliquotaInss := TNFSeFloat2.Create(QSomaNfeSVAL_INSS.Value * 100 / QSomaNfeSVAL_TOTAL_SERVICOS.Value);
        ValorInss := TNFSeFloat2.Create(QSomaNfeSVAL_INSS.Value);
        AliquotaIr := TNFSeFloat2.Create(QSomaNfeSVAL_IR.Value * 100 / QSomaNfeSVAL_TOTAL_SERVICOS.Value);
        ValorIr := TNFSeFloat2.Create(QSomaNfeSVAL_IR.Value);

        RetidoPis := 2;
        RetidoCofins := 2;
        RetidoInss := 2;
        RetidoIr := 2;
        RetidoCsll := 2;
        if (QGeraNfeIND_PIS_COFINS_RETIDO.Value = 'SIM') then
        begin
          RetidoPis := VerificaImpostoRetido(QSomaNfeSVAL_PIS.Value);
          RetidoCofins := VerificaImpostoRetido(QSomaNfeSVAL_COFINS.Value);
          RetidoInss := VerificaImpostoRetido(QSomaNfeSVAL_INSS.Value);
          RetidoIr := VerificaImpostoRetido(QSomaNfeSVAL_IR.Value);
          RetidoCsll := VerificaImpostoRetido(QSomaNfeSVAL_CSLL.Value);
        end;

        DescontoCondicionado := TNFSeFloat2.Create(0);
        DescontoIncondicionado := TNFSeFloat2.Create(RoundTo(QSomaNfeSVAL_DESCONTO_SERVICO.Value, -2));

        OutrasRetencoes := TNFSeFloat2.Create(0);
        BaseCalculo := TNFSeFloat2.Create(((Valores.ValorServicos.Valor * QGeraNfePERC_BC_NFSE.Value)/100) - ValorDeducoes.Valor);
        Aliquota := TNFSeFloat4.Create(QGeraNfePERC_ISS.Value);
      end;

      Servico.Valores := Valores;
      with Servico do
      begin
        Discriminacao := '';
        QGeraNfeItem.First;
        ListaItensServico := TListaItensServico.Create;
        ListaItensServico.ItemServico := TNFSeElementItems.Create;
        wValorTotalDescontos := 0;
        wContadorServicos := 0;
        while not QGeraNfeItem.Eof do
        begin
          if QGeraNfeItemIND_TIPO_PRODUTO.Value = 'SERVIÇO' then
          begin
            Inc(wContadorServicos);
            Discriminacao := Discriminacao + QGeraNfeItemDESC_PRODUTO.Value + Bib.ift(QGeraNfeItemDESC_INF_ADICIONAL.Value = '', '',' - '+ QGeraNfeItemDESC_INF_ADICIONAL.Value)+ ' - ' + FormatFloat('#,##0.00', QGeraNfeItemVAL_TOTAL.Value)+ chr(13)+chr(10);
            wItemServico := TItemServico.Create;
            With wItemServico do
            begin
              if QGeraNfeItemCOD_LISTA_SERVICO.Value = 0 then
              begin
                MessageDlg('O produto ' + QGeraNfeItemDESC_PRODUTO.Value +
                  ' precisa estar associado a um item da lista de serviço.', mtError, [mbOk], 0);
                Abort;
              end;

              ItemListaServico := QGeraNfeItemCOD_LISTA_SERVICO.Text;
              CodigoCnae := Bib.ift(QGeraNfeItemCOD_SERVICO_MUNICIPAL.Value = '', QGeraNfeDESC_CNAE.Value, QGeraNfeItemCOD_SERVICO_MUNICIPAL.Value);
              Descricao := QGeraNfeItemDESC_PRODUTO.Value;
              Tributavel := 1;
              Quantidade := TNFSeFloat2.Create(QGeraNfeItemQT_QUANTIDADE.Value);
              ValorUnitario := TNFSeFloat4.Create(QGeraNfeItemVAL_UNITARIO.Value);

              if wContadorServicos < QSomaNfeSQT_TOTAL_SERVICOS.Value then
                ValorDesconto := TNFSeFloat2.Create(RoundTo(QGeraNfeItemVAL_DESCONTO.Value, -2))
              else
                ValorDesconto := TNFSeFloat2.Create(Valores.DescontoIncondicionado.Valor - wValorTotalDescontos);
              wValorTotalDescontos := wValorTotalDescontos + ValorDesconto.Valor;
              ValorLiquido := TNFSeFloat2.Create(QGeraNfeItemVAL_TOTAL.Value - ValorDesconto.Valor);
              if QSomaNfeSVAL_PIS.Value > 0 then
                Valores.CSTPisCofins := QGeraNfeItemCOD_CST_PIS.Value;
            end;
            ListaItensServico.ItemServico.AddItem(wItemServico);
          end;
          QGeraNfeItem.Next;
        end;

        if(QGeraNfeOBS.Value <> '') then
          Discriminacao := Discriminacao + QGeraNfeOBS.Value + chr(13)+chr(10);

        if(QGeraNfeOBS_COMPLEMENTO.Value <> '') then
          Discriminacao := Discriminacao + QGeraNfeOBS_COMPLEMENTO.Value + chr(13)+chr(10);
        if(QGeraNfeDESC_OBS_CORPO_NOTA.Value <> '') then
          Discriminacao := Discriminacao + QGeraNfeDESC_OBS_CORPO_NOTA.Value + chr(13)+chr(10);

        if (QGeraNfeCOD_MENSAGEM.Value > 0) then
        begin
          QMensagem.Close;
          QMensagem.SetVariable('COD_MENSAGEM', QGeraNfeCOD_MENSAGEM.Value);
          QMensagem.Open;
          if (QMensagemDESC_MENSAGEM.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_MENSAGEM.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO1.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO1.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO2.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO2.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO3.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO3.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO4.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO4.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO5.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO5.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO6.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO6.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO7.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO7.Value) + chr(13)+chr(10);
        end;
        Discriminacao := Discriminacao + '*Em atendimento à Lei Federal nº 12.741/2012, '+
                         'o Valor Aproximado dos impostos é de ' +
                         FormatFloat('#,##0.00', (100*QSomaNfeSVAL_TOTAL_TRIB_NFSE.Value)/QSomaNfeSVAL_TOTAL.Value) +
                         '% R$ ' + FormatFloat('#,##0.00',QSomaNfeSVAL_TOTAL_TRIB_NFSE.Value) + chr(13)+chr(10);

        if QGeraNfeIND_CONDICAO_PAGTO.Value = '2' then
        begin
          Discriminacao := Discriminacao +'Pagamento a prazo' + chr(13)+chr(10);
          QTitulos.First;
          while not QTitulos.Eof do
          begin
            Discriminacao := Discriminacao + QTitulosNUM_PARCELA.AsString + 'a Parcela - ' +
                        FormatDateTime('dd/MM/yyyy' ,QTitulosDT_VENCIMENTO.Value) + ' - R$ ' +
                        FormatFloat('#,##0.00',QTitulosVAL_ORIGINAL.Value)  + chr(13)+chr(10);
            QTitulos.Next;
          end;
        end;
        if (QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value <> 1058) then
          Discriminacao := Discriminacao + 'Doc. Estrangeiro: ' + Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value) + chr(13)+chr(10);

        CodigoNbs := QGeraNfeItemCOD_NBS.Text;
        ExigibilidadeISS := QGeraNfeNUM_CFOP.AsInteger;

        if QGeraNfeCOD_CIDADE_PRESTACAO.Value = 0 then
          MunicipioIncidencia := StrToInt('0' + QGeraNfeCOD_UF_IBGE_FILIAL.Text +
            QGeraNfeCOD_CIDADE_IBGE_FILIAL.Value)
        else
          MunicipioIncidencia := StrToInt('0' + QGeraNfeCOD_UF_IBGE_PRESTACAO.Text +
            QGeraNfeCOD_CIDADE_IBGE_PRESTACAO.Value);

        CodigoMunicipio := MunicipioIncidencia;
        //IBSCBS := TIBSCBS.Create;
//        with IBSCBS do
//        begin
//
//        end;
      end;

      if QGeraNfeDESC_VERSAO_NFSE.Value = 'ELOTECH 2.03' then
      begin
        Prestador := TIdentificacaoTomador.Create;
        with Prestador do
        begin
          Prestador.CpfCnpj := TCpfCnpj.Create;
          Prestador.CpfCnpj.Cnpj := Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value));
          Prestador.InscricaoMunicipal := Bib.LimpaNumero(QGeraNfeINSCRICAO_MUN_FILIAL.Value);
          if Prestador.InscricaoMunicipal = '' then
          begin
            MessageDlg('Preencha a Inscrição Municipal da Filial.', mtError, [mbOk], 0);
              Abort;
          end;
        end;
      end
      else
      begin
        DadosPrestador := TDadosPrestador.Create;
        with DadosPrestador do
        begin
          IdentificacaoPrestador := TIdentificacaoTomador.Create;
          IdentificacaoPrestador.CpfCnpj := TCpfCnpj.Create;
          IdentificacaoPrestador.CpfCnpj.Cnpj := Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value));
          IdentificacaoPrestador.InscricaoMunicipal := Bib.LimpaNumero(QGeraNfeINSCRICAO_MUN_FILIAL.Value);
          if IdentificacaoPrestador.InscricaoMunicipal = '' then
          begin
            MessageDlg('Preencha a Inscrição Municipal da Filial.', mtError, [mbOk], 0);
              Abort;
          end;
          RazaoSocial := LimpaStrXML(Trim(QGeraNfeNOME_FILIAL.Value));
          Endereco := TEndereco.Create;
          with Endereco do
          begin
            Numero := Bib.NumEndereco(QGeraNfeENDERECO_FILIAL.Text);
            Endereco := LimpaStrXML(Trim(Bib.RemoveNumEndereco(QGeraNfeENDERECO_FILIAL.Value, Numero)));
            if Trim(QGeraNfeCOMPLEMENTO_CADASTRO.Value) <> '' then
              Complemento := LimpaStrXML(Trim(QGeraNfeCOMPLEMENTO_FILIAL.Value));
            Bairro := Trim(QGeraNfeBAIRRO_FILIAL.Value);
            CodigoMunicipio := QGeraNfeCOD_CIDADE_IBGE_FILIAL.Value;
            CidadeNome := Trim(QGeraNfeCIDADE_FILIAL.Value);
            CodigoMunicipio := QGeraNfeCOD_UF_IBGE_FILIAL.Text + CodigoMunicipio;

            Uf := QGeraNfeUF_FILIAL.Value;
            Cep := Bib.LimpaNumero(QGeraNfeCEP_FILIAL.Value);
          end;
        end;
      end;
      Tomador := TTomador.Create;
      with Tomador do
      begin
        IdentificacaoTomador := TIdentificacaoTomador.Create;
        IdentificacaoTomador.CpfCnpj := TCpfCnpj.Create;
        if (QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value = 1058) then
        begin
          if QGeraNfeIND_FISICA_JURIDICA.Value = 'F' then
            IdentificacaoTomador.CpfCnpj.Cpf := Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value))
          else
          begin
            IdentificacaoTomador.CpfCnpj.Cnpj := Trim( Bib.ift(QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value = 1058,
              Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value),
              QGeraNfeCPF_CNPJ_CADASTRO.Value));
            IdentificacaoTomador.InscricaoMunicipal := Trim(Bib.LimpaNumero(QGeraNfeINSCRICAO_MUN_CADASTRO.Value));
          end;
        end
        else
        begin
          NifTomador := Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value));
        end;

        RazaoSocial := LimpaStrXML(Trim(QGeraNfeNOME_CADASTRO.Value));
        Endereco := TEndereco.Create;
        with Endereco do
        begin
          Numero := Bib.NumEndereco(QGeraNfeENDERECO_CADASTRO.Text);
          Endereco := LimpaStrXML(Trim(Bib.RemoveNumEndereco(QGeraNfeENDERECO_CADASTRO.Value, Numero)));
          if Trim(QGeraNfeCOMPLEMENTO_CADASTRO.Value) <> '' then
            Complemento := LimpaStrXML(Trim(QGeraNfeCOMPLEMENTO_CADASTRO.Value));
          CodigoMunicipio := QGeraNfeCOD_CIDADE_IBGE_CADASTRO.Value;
          if (QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value = 1058) then
            CodigoMunicipio := QGeraNfeCOD_UF_IBGE_CADASTRO.Text + CodigoMunicipio;
          CidadeNome := QGeraNfeCIDADE_CADASTRO.Value;
          Uf := QGeraNfeCOD_ESTADO_CADASTRO.Value;
          Cep := Bib.LimpaNumero(QGeraNfeCEP_CADASTRO.Value);
          Bairro := QGeraNfeBAIRRO_CADASTRO.Value;

        end;
        Contato := TContato.Create;
        Contato.Telefone := Bib.LimpaNumero(QGeraNfeTELEFONE_CADASTRO.Value);
        //if pos(';',trim(QGeraNfeEMAIL_CADASTRO.Value)) > 0 then
//          Contato.Email := Copy(trim(QGeraNfeEMAIL_CADASTRO.Value),0,pos(';',trim(QGeraNfeEMAIL_CADASTRO.Value)))
//        else
//          Contato.Email := trim(QGeraNfeEMAIL_CADASTRO.Value);
        InscricaoEstadual := Bib.LimpaNumero(QGeraNfeINSCRICAO_CADASTRO.Value);
      end;
      IncentivoFiscal := 2;
      if QGeraNfeDESC_VERSAO_NFSE.Value = 'ELOTECH' then
      begin
          OptanteSimplesNacional := Bib.ift(QGeraNfeIND_REGIME_TRIBUTARIO.Value = 1, 1,2);
          RegimeEspecialTributacao := 100;
      end;
      //RegimeEspecialTributacao := 1;
      {ntermediarioServico := TIntermediarioServico.Create;
      IntermediarioServico.RazaoSocial :=
      IntermediarioServico.CpfCnpj:=
      IntermediarioServico.InscricaoMunicipal;}
      ConstrucaoCivil := TConstrucaoCivil.Create;
      ConstrucaoCivil.CodigoObra := Bib.LimpaNumero(QGeraNfeNUM_DCO.Value);
      ConstrucaoCivil.Art := Bib.LimpaNumero(QGeraNfeNUM_ART.Value);
    end;
  end;
end;

class function TNfseUtils.GeraRps(CodRps: Integer): TRps;
var
  Valores: TValores;
  Item: String;
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
    Result := TRps.Create('rps:'+QGeraNfeNUM_NOTA.AsString+QGeraNfeCOD_SERIE.Value,
      TNfseVersaoFactory.GetNfseVersao(QGeraNfeDESC_VERSAO_NFSE.Value));
    with Result.InfRps do
    begin
      IdentificacaoRps := TIdentificacaoRps.Create;
      with IdentificacaoRps do
      begin
        IdentificacaoRps.Numero := QGeraNfeNUM_NOTA.AsInteger;
        IdentificacaoRps.Serie := QGeraNfeCOD_SERIE.AsInteger;
        IdentificacaoRps.Tipo := TIPO_RPS;
      end;
      DataEmissao := FormatDateTime('YYYY-MM-DD', QGeraNfeDT_EMISSAO.Value);
      DataEmissao := DataEmissao+'T' + FormatDateTime('HH:nn:ss',QGeraNfeDT_EMISSAO.Value);
      NaturezaOperacao := QGeraNfeNUM_CFOP.AsInteger;
      //RegimeEspecialTributacao :=
      OptanteSimplesNacional := IfThen(QGeraNfeIND_REGIME_TRIBUTARIO.Value =1,OPTANTE_SIMPLES_NACIONAL_SIM,OPTANTE_SIMPLES_NACIONAL_NAO);
      IncentivadorCultural := INCENTIVADOR_CULTURAL_SIM;
      Status := STATUS_RPS_NORMAL;
      //RpsSubstituido :=

      Valores := TValores.Create;
      with Valores do
      begin
        ValorServicos := TNFSeFloat2.Create(QSomaNfeSVAL_TOTAL_SERVICOS.Value);
        ValorDeducoes := TNFSeFloat2.Create(RoundTo((ValorServicos.Valor *
          QGeraNfePERC_DEDUCAO_NFSE.Value)/100,-2)); //saber o que é isso, coloquei aqui só para poder preencher o campo base de cálculo posteriormente

        if (QGeraNfeIND_REGIME_TRIBUTARIO.Value = 3) and
          (QGeraNfeIND_PIS_COFINS_RETIDO.Value = 'SIM') then
        begin
          ValorPis := TNFSeFloat2.Create(QSomaNfeSVAL_PIS.Value);
          ValorCofins := TNFSeFloat2.Create(QSomaNfeSVAL_COFINS.Value);
        end
        else
        begin
          ValorPis := TNFSeFloat2.Create(0);
          ValorCofins := TNFSeFloat2.Create(0);
        end;
        ValorCsll := TNFSeFloat2.Create(QSomaNfeSVAL_CSLL.Value);
        ValorInss := TNFSeFloat2.Create(QSomaNfeSVAL_INSS.Value);
        ValorIr := TNFSeFloat2.Create(QSomaNfeSVAL_IR.Value);

        if ((QGeraNfeIND_ISS_RETIDO.Value = 1) or
           (NaturezaOperacao = 2)) and
           (QGeraNfeIND_FISICA_JURIDICA.Value = 'J') then
        begin
          IssRetido := ISS_RETIDO_SIM;
          ValorIssRetido := TNFSeFloat2.Create(QSomaNfeSVAL_ISS.Value);
          ValorIss := TNFSeFloat2.Create(0);
        end
        else
        begin
          IssRetido :=ISS_RETIDO_NAO;
          ValorIss := TNFSeFloat2.Create(QSomaNfeSVAL_ISS.Value);
        end;
        //DescontoCondicionado := TNFSeFloat2.Create(0);
        if QSomaNfeSVAL_DESCONTO_SERVICO.Value > 0 then
          DescontoIncondicionado :=
            TNFSeFloat2.Create(QSomaNfeSVAL_DESCONTO_SERVICO.Value);

        OutrasRetencoes := TNFSeFloat2.Create(0);
        BaseCalculo := TNFSeFloat2.Create((((ValorServicos.Valor -
          QSomaNfeSVAL_DESCONTO_SERVICO.Value) * QGeraNfePERC_BC_NFSE.Value)/100) -
            ValorDeducoes.Valor);
        Aliquota := TNFSeFloat4.Create(QGeraNfePERC_ISS.Value/100);

        //DescontoCondicionado := TNFSeFloat2.Create(0);
        ValorLiquidoNfse := TNFSeFloat2.Create(ValorServicos.Valor - ValorInss.Valor -
          ValorIr.Valor - ValorCsll.Valor - ValorPis.Valor - ValorCofins.Valor - ValorIr.Valor -
          Bib.ift(QGeraNfeIND_ISS_RETIDO.Value = 1, QSomaNfeSVAL_ISS.Value, 0) -
          QSomaNfeSVAL_DESCONTO_SERVICO.Value); //- Valores.DescontoIncondicionado.Valor);// - Valores.OutrasRetencoes.Valor  -
                                               //Valores.DescontoIncondicionado.Valor
      end;
      Servico := TDadosServico.Create;
      Servico.Valores:= Valores;
      with Servico do
      begin
        if QGeraNfeItemCOD_LISTA_SERVICO.Value = 0 then
        begin
          MessageDlg('O produto ' + QGeraNfeItemDESC_PRODUTO.Value +
            ' precisa estar associado a um item da lista de serviço.', mtError, [mbOk], 0);
          Abort;
        end;
        Item := IntToStr(QGeraNfeItemCOD_LISTA_SERVICO.Value);//QGeraNfeItemCOD_PRODUTO.AsString;     //corrigir depois
        ItemListaServico := Bib.StrZero(Copy(Item,1,length(Item)-2) + '.' + Copy(Item,length(Item)-1,2),5);

        if QGeraNfeItemCOD_SERVICO_MUNICIPAL.Value = '' then
        begin
          MessageDlg('O produto ' + QGeraNfeItemDESC_PRODUTO.Value +
            ' precisa ter um código de serviço municipal.', mtError, [mbOk], 0);
          Abort;
        end;

        CodigoTributacaoMunicipio := QGeraNfeItemCOD_SERVICO_MUNICIPAL.Value;
        Discriminacao := '';
        QGeraNfeItem.First;
        while not QGeraNfeItem.Eof do
        begin
          if QGeraNfeItemIND_TIPO_PRODUTO.Value = 'SERVIÇO' then
          begin
            if DMParamSistema.CodEmpresa = 'SERVITEC' then
              Discriminacao := Discriminacao + QGeraNfeItemQT_QUANTIDADE.Text + ' ' +
                QGeraNfeItemDESC_UNIDADE.Value + ' ' +
                QGeraNfeItemDESC_PRODUTO.Value +
                Bib.ift(QGeraNfeItemDESC_INF_ADICIONAL.Value = '', '',' - '+
                QGeraNfeItemDESC_INF_ADICIONAL.Value) + ' - ' +
                'Vlr Un.: R$' + FormatFloat('#,##0.00', QGeraNfeItemVAL_UNITARIO.Value) + ' - ' +
                'Total: R$ ' + FormatFloat('#,##0.00', QGeraNfeItemVAL_TOTAL.Value)+ chr(13)+chr(10)
            else
              Discriminacao := Discriminacao + QGeraNfeItemDESC_PRODUTO.Value +
                Bib.ift(QGeraNfeItemDESC_INF_ADICIONAL.Value = '', '',' - '+
                QGeraNfeItemDESC_INF_ADICIONAL.Value)+ ' - R$ ' +
                FormatFloat('#,##0.00', QGeraNfeItemVAL_TOTAL.Value)+ chr(13)+chr(10);
          end;
          QGeraNfeItem.Next;
        end;

        if (Valores.BaseCalculo.Valor < (Valores.ValorServicos.Valor * QGeraNfePERC_BC_NFSE.Value/100)) and
           (DMParamSistema.CodEmpresa <> 'SERVITEC') then
        begin
          Discriminacao := Discriminacao + 'Valor do Material: R$ '+ FormatFloat('#,##0.00', Valores.ValorDeducoes.Valor)+ chr(13)+chr(10);
          Discriminacao := Discriminacao + 'Valor do Serviço: R$ '+ FormatFloat('#,##0.00', Valores.BaseCalculo.Valor)+ chr(13)+chr(10);
        end;

        if(QGeraNfeOBS.Value <> '') then
          Discriminacao := Discriminacao + QGeraNfeOBS.Value + chr(13)+chr(10);

        if(QGeraNfeOBS_COMPLEMENTO.Value <> '') then
          Discriminacao := Discriminacao + QGeraNfeOBS_COMPLEMENTO.Value + chr(13)+chr(10);
        if(QGeraNfeDESC_OBS_CORPO_NOTA.Value <> '') then
          Discriminacao := Discriminacao + QGeraNfeDESC_OBS_CORPO_NOTA.Value + chr(13)+chr(10);

        if (QGeraNfeCOD_MENSAGEM.Value > 0) then
        begin
          QMensagem.Close;
          QMensagem.SetVariable('COD_MENSAGEM', QGeraNfeCOD_MENSAGEM.Value);
          QMensagem.Open;
          if (QMensagemDESC_MENSAGEM.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_MENSAGEM.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO1.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO1.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO2.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO2.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO3.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO3.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO4.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO4.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO5.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO5.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO6.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO6.Value) + chr(13)+chr(10);
          if (QMensagemDESC_COMPLEMENTO7.Value <> '') then
            Discriminacao := Trim(Discriminacao + QMensagemDESC_COMPLEMENTO7.Value) + chr(13)+chr(10);
        end;
        //Discriminacao := Discriminacao + '*Em atendimento à Lei Federal nº 12.741/2012, '+
        //                 'o Valor Aproximado dos impostos é de ' +
        //                 FormatFloat('#,##0.00', (100*QSomaNfeSVAL_TOTAL_TRIB_NFSE.Value)/QSomaNfeSVAL_TOTAL.Value) +
        //                 '% R$ ' + FormatFloat('#,##0.00',QSomaNfeSVAL_TOTAL_TRIB_NFSE.Value) + chr(13)+chr(10);

        if QGeraNfeIND_CONDICAO_PAGTO.Value = '2' then
        begin
          Discriminacao := Discriminacao +'Pagamento a prazo' + chr(13)+chr(10);
          QTitulos.First;
          while not QTitulos.Eof do
          begin
            Discriminacao := Discriminacao + QTitulosNUM_PARCELA.AsString + 'a Parcela - ' +
                        FormatDateTime('dd/MM/yyyy' ,QTitulosDT_VENCIMENTO.Value) + ' - R$ ' +
                        FormatFloat('#,##0.00',QTitulosVAL_ORIGINAL.Value)  + chr(13)+chr(10);
            QTitulos.Next;
          end;
        end;
        if (QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value <> 1058) then
          Discriminacao := Discriminacao + 'Doc. Estrangeiro: ' + Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value) + chr(13)+chr(10);

        if QSomaNfeSVAL_INSS.Value > 0 then
          Discriminacao := Discriminacao + 'Retenção Previdência Social: R$' + FormatFloat('#,##0.00', QSomaNfeSVAL_INSS.Value) + chr(13)+chr(10);

        if QGeraNfeCOD_CIDADE_PRESTACAO.Value = 0 then
          CodigoMunicipio := StrToInt('0' + QGeraNfeCOD_UF_IBGE_FILIAL.Text +
            QGeraNfeCOD_CIDADE_IBGE_FILIAL.Value)
        else
          CodigoMunicipio := StrToInt('0' + QGeraNfeCOD_UF_IBGE_PRESTACAO.Text +
            QGeraNfeCOD_CIDADE_IBGE_PRESTACAO.Value);
      end;
      Prestador := TPrestador.Create;
      Prestador.Cnpj := Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_FILIAL.Value));
      Prestador.InscricaoMunicipal := Bib.LimpaNumero(QGeraNfeINSCRICAO_MUN_FILIAL.Value);
      if Prestador.InscricaoMunicipal = '' then
      begin
        MessageDlg('Preencha a Inscrição Municipal da Filial.', mtError, [mbOk], 0);
          Abort;
      end;
      Tomador := TTomador.Create;
      with Tomador do
      begin
        IdentificacaoTomador := TIdentificacaoTomador.Create;
        IdentificacaoTomador.CpfCnpj := TCpfCnpj.Create;
        //if (QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value = 1058) then
        //begin
          if QGeraNfeIND_FISICA_JURIDICA.Value = 'F' then
            IdentificacaoTomador.CpfCnpj.Cpf := Trim(Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value))
          else
          begin
            IdentificacaoTomador.CpfCnpj.Cnpj := Trim( Bib.ift(QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value = 1058,
              Bib.LimpaNumero(QGeraNfeCPF_CNPJ_CADASTRO.Value),
              QGeraNfeCPF_CNPJ_CADASTRO.Value));
            IdentificacaoTomador.InscricaoMunicipal := Trim(Bib.LimpaNumero(QGeraNfeINSCRICAO_MUN_CADASTRO.Value));
          end;
        //end
        //else
        //  IdentificacaoTomador.CpfCnpj.Cnpj := 'EST000000';

        RazaoSocial := LimpaStrXML(Trim(QGeraNfeNOME_CADASTRO.Value));
        Endereco := TEndereco.Create;
        with Endereco do
        begin
          Numero := Bib.NumEndereco(QGeraNfeENDERECO_CADASTRO.Text);
          Endereco := LimpaStrXML(Trim(Bib.RemoveNumEndereco(QGeraNfeENDERECO_CADASTRO.Value, Numero)));
          if Trim(QGeraNfeCOMPLEMENTO_CADASTRO.Value) <> '' then
            Complemento := LimpaStrXML(Trim(QGeraNfeCOMPLEMENTO_CADASTRO.Value));
          CodigoMunicipio := QGeraNfeCOD_CIDADE_IBGE_CADASTRO.Value;
          if (QGeraNfeCOD_PAIS_IBGE_CADASTRO.Value = 1058) then
            CodigoMunicipio := QGeraNfeCOD_UF_IBGE_CADASTRO.Text + CodigoMunicipio;

          Uf := QGeraNfeCOD_ESTADO_CADASTRO.Value;
          Cep := Bib.LimpaNumero(QGeraNfeCEP_CADASTRO.Value);
          Bairro := QGeraNfeBAIRRO_CADASTRO.Value;
        end;
        Contato := TContato.Create;
        Contato.Telefone := Bib.LimpaNumero(QGeraNfeTELEFONE_CADASTRO.Value);
        if pos(';',trim(QGeraNfeEMAIL_CADASTRO.Value)) > 0 then
          Contato.Email := Copy(trim(QGeraNfeEMAIL_CADASTRO.Value),0,pos(';',trim(QGeraNfeEMAIL_CADASTRO.Value)))
        else
          Contato.Email := trim(QGeraNfeEMAIL_CADASTRO.Value);
      end;
      {ntermediarioServico := TIntermediarioServico.Create;
      IntermediarioServico.RazaoSocial :=
      IntermediarioServico.CpfCnpj:=
      IntermediarioServico.InscricaoMunicipal;
      ConstrucaoCivil := TConstrucaoCivil.Create;
      ConstrucaoCivil.CodigoObra :=
      ConstrucaoCivil.Art :=}
    end;
  end;
end;

class function TNfseUtils.GeraXMLRps(Rps: TRps): String;
var
  wXml :String;
begin
  wXml := Rps.GetXML('Rps');
  Result := wXml;
end;

class function TNfseUtils.GeraXMLRps(CodRps: Integer): String;
begin
  Result := GeraXMLRps(GeraRps(CodRps));
end;
class function TNfseUtils.GeraXMLDeclaracaoPrestacaoServico(DeclaracaoPrestacaoServico: TDeclaracaoPrestacaoServico): String;
var
  wXml :String;
begin
  if DMNfe.QGeraNfeDESC_VERSAO_NFSE.Value = 'ELOTECH 2.03' then
    wXml := DeclaracaoPrestacaoServico.GetXML('Rps')
  else
    wXml := DeclaracaoPrestacaoServico.GetXML('DeclaracaoPrestacaoServico');
  Result := wXml;
end;

class function TNfseUtils.GeraXMLDeclaracaoPrestacaoServico(CodRps: Integer): String;
begin
  Result := GeraXMLDeclaracaoPrestacaoServico(GeraDeclaracaoPrestacaoServico(CodRps));
end;
end.
