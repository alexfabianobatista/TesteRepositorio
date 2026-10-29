unit UGeraXMLReinf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, OracleData, OraTeste, Variants, DBClient,
  Provider, UBiblioteca, UReinf_cl, xmldom, XMLIntf, msxmldom, XMLDoc, DateUtils,
  UNotaEntrada_cl;



type
  TGeraXMLReinf = class

    published

    public
      function ValidaEventoReinf(codEvento: integer; descEvento: string): boolean;
      function GerarID(codFilial: Integer; isR1000: boolean = false): string;
      procedure GerarR1000(codEvento: Integer; eventoReinf: string; versaoReinf: string);
      procedure GerarR1070(codEvento: Integer; eventoReinf: string; versaoReinf: string);
      procedure GerarR2010(codEvento: Integer; eventoReinf: string; versaoReinf: string);
      procedure GerarR2020(codEvento: Integer; eventoReinf: string; versaoReinf: string);
      procedure GerarR2060(codEvento: Integer; eventoReinf: string; versaoReinf: string);
      procedure GerarR2050(codEvento: Integer; eventoReinf: string; versaoReinf: string);
      procedure GerarR2055(codEvento: Integer; eventoReinf: string; versaoReinf: string);
      procedure GerarR2098(codEvento: Integer; eventoReinf: string; versaoReinf: string);      
      procedure GerarR2099(codEvento: Integer; eventoReinf: string; versaoReinf: string);      
      function GetVersaoFormatada(codVersao: string): string;
      function GetStartOfMonth(Data : TDateTime) : TDate;
      function GetEndOfMonth(Data : TDateTime) : TDate;
      function DateTimeToMilliseconds(aDateTime: TDateTime): Int64;


    private

 end;

const
  LineBreak = AnsiString(#13#10);

var
 GeraXML: TGeraXMLReinf;
 dia, mes, ano: word;
 wXMLReinf: String;

implementation

uses
  UOracle_cl, UUsuario_cl, UFilial_cl, UNotaSaida_cl, UProduto_cl,
  UObra_cl, Math, USequencia_cl, UCadastro_cl,
  UCidade_cl, MaskUtils, StrUtils;


function TGeraXMLReinf.DateTimeToMilliseconds(aDateTime: TDateTime): Int64;
var
  TimeStamp: TTimeStamp;
begin
  { Call DateTimeToTimeStamp to convert DateTime to TimeStamp: }
  TimeStamp := DateTimeToTimeStamp(aDateTime);
  { Multiply and add to complete the conversion: }
  Result := Int64(TimeStamp.Date) * MSecsPerDay + TimeStamp.Time;
end;

function TGeraXMLReinf.GerarID(codFilial: Integer; isR1000: boolean = false): string;
var
  Id, sequencia, cnpj: string;
begin
  decodeDate(Today, ano, mes, dia);

  with DMOracle, DMFilial, DMReinf do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK', codFilial);
    QFilial.Open;

    if isR1000 then
      cnpj := DMOracle.BuscaNome('select limpa_cnpj(num_cgc) from tb_filial', 'limpa_cnpj(num_cgc) like ' + quotedstr('%') + ' || ' + copy(Bib.LimpaNumero(QFilialNUM_CGC.Text), 1, 8) + ' || ' + quotedstr('0001%'))
    else
      cnpj := bib.LimpaNumero(QFilialNUM_CGC.Text);

    cnpj := copy(cnpj, 1, 8) + '000000';

    Id := 'ID1' + cnpj  + IntToStr(ano) + Format('%.2d', [mes]) + Format('%.2d', [dia])
      + FormatDateTime('hhMMss',Now) + RightStr(IntToStr(DateTimeToMilliseconds(Now)),5);

    result := Id;
  end;
end;

function TGeraXMLReinf.ValidaEventoReinf(codEvento: integer; descEvento: string): boolean;
begin
  with DMReinf do
  begin
    QValidaSituacaoEnvio.Close;
    QValidaSituacaoEnvio.SetVariable('COD_EVENTO', codEvento);
    QValidaSituacaoEnvio.SetVariable('DESC_EVENTO', descEvento);
    QValidaSituacaoEnvio.Open;

    if (QValidaSituacaoEnvio.RecordCount = 0) then
    begin
      result := true;
    end
    else
    begin
      if (not QValidaSituacaoEnvioDESC_XML_RETORNO.IsNull) and (QValidaSituacaoEnvioIND_SITUACAO.Value = 'ENVIADO') then
      begin
        ShowMessage('Não é possível alterar eventos enviados. Realize a retificação, caso não seja possível, exclua o evento.');
        result := false;
      end
      else
      begin
        ShowMessage('Já existe evento gerado para envio. Exclua os eventos não enviados para poder alterá-los.');
        result := false;
      end;
    end;
  end;
end;

procedure TGeraXMLReinf.GerarR1000(codEvento: Integer; eventoReinf: string; versaoReinf: string);
var
  idEventoGerado: string;
begin
  wXMLReinf := '';

  with DMReinf, DMFilial, DMCadastro do
  begin
    try

        // abre o evento relacionado
        QReinfR1000.Close;
        QReinfR1000.SetVariable('PK', codEvento);
        QReinfR1000.Open;

        // abre a filial do evento
        QFilial.Close;
        QFilial.SetVariable('PK', QReinfR1000COD_FILIAL.Value);
        QFilial.Open;

        idEventoGerado := GerarID(QReinfR1000COD_FILIAL.Value, true);

        //abre o cadastro do evento
        QCadastro.Close;
        QCadastro.SetVariable('PK', QReinfR1000COD_CADASTRO.Value);
        QCadastro.Open;

        wXMLReinf := wXMLReinf + '<?xml version="1.0" encoding="UTF-8"?>' + LineBreak;
        wXMLReinf := wXMLReinf + '<Reinf xmlns="http://www.reinf.esocial.gov.br/schemas/evtInfoContribuinte/v' + GetVersaoFormatada(versaoReinf) +'">' + LineBreak;

        // #9 são tabulações e #10 são saltos de linha
        wXMLReinf := wXMLReinf + #9 + '<evtInfoContri id="' + idEventoGerado + '">' + LineBreak;
        // info do evento
        wXMLReinf := wXMLReinf + #9#9 + '<ideEvento>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<tpAmb>' + QReinfR1000IND_PRODUCAO_HOMOLOGACAO.Text + '</tpAmb>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<procEmi>' + QReinfR1000IND_TIPO_APLICATIVO.Text + '</procEmi>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<verProc>' + '1.0.0' + '</verProc>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9 + '</ideEvento>' + LineBreak;
        // identificação do contribuinte
        wXMLReinf := wXMLReinf + #9#9 + '<ideContri>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<tpInsc>1</tpInsc>'+ LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<nrInsc>' + copy(Bib.LimpaNumero(QFilialNUM_CGC.Text), 1, 8) + '</nrInsc>' + LineBreak; //apenas raiz
        wXMLReinf := wXMLReinf + #9#9 + '</ideContri>' + LineBreak;

        // info do contribuinte
        wXMLReinf := wXMLReinf + #9#9 + '<infoContri>' + LineBreak;

        if QReinfR1000IND_INC_ALT_EXC.Value <> 2 then
        begin


          // dados que se repetem de informação do evento - inclusao - alteracao - exclusão
          // os iguais vem primeiro
          if QReinfR1000IND_INC_ALT_EXC.Value = 0 then
            wXMLReinf := wXMLReinf + #9#9#9 + '<inclusao>' + LineBreak;
          if QReinfR1000IND_INC_ALT_EXC.Value = 1 then
            wXMLReinf := wXMLReinf + #9#9#9 + '<alteracao>' + LineBreak;



          // periodo do evento
          wXMLReinf := wXMLReinf + #9#9#9#9 + '<idePeriodo>' + LineBreak;

          DecodeDate(QReinfR1000DT_INI_VALIDADE.Value, ano, mes, dia);
          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<iniValid>' + FormatFloat('0000',ano)+ '-' + FormatFloat('00',mes) + '</iniValid>' + LineBreak;
          if (QReinfR1000DT_FIM_VALIDADE.Value <> null) and (QReinfR1000DT_FIM_VALIDADE.Value <> 0) then
          begin
            DecodeDate(QReinfR1000DT_FIM_VALIDADE.Value, ano, mes, dia);
            wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<fimValid>' + FormatFloat('0000',ano)+ '-' + FormatFloat('00',mes) + '</fimValid>' + LineBreak;
          end;

          wXMLReinf := wXMLReinf + #9#9#9#9 + '</idePeriodo>' + LineBreak;

          // informações do cadastro contribuinte
          wXMLReinf := wXMLReinf + #9#9#9#9 + '<infoCadastro>' + LineBreak;

          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<classTrib>' + QFilialCOD_CLASSIFICACAO_TRIBUTARIA.Text + '</classTrib>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<indEscrituracao>' + QReinfR1000IND_ECD.Text + '</indEscrituracao>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<indDesoneracao>' + QReinfR1000IND_ECD.Text + '</indDesoneracao>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<indAcordoIsenMulta>' + QReinfR1000IND_ACORDO_MULTA.Text + '</indAcordoIsenMulta>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<indSitPJ>' + QFilialIND_SITUACAO_REINF.Text + '</indSitPJ>' + LineBreak;

          // informações de contato
          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<contato>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<nmCtt>' + Bib.LimpaCaracteresReinf(QCadastroNOME.Text) + '</nmCtt>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<cpfCtt>' + Bib.LimpaNumero(QCadastroNUM_CGC_CPF.Text) + '</cpfCtt>' + LineBreak;
          if Trim(QCadastroDESC_TELEFONE.Text) <> '' then
            wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<foneFixo>' + Bib.LimpaNumero(QCadastroDESC_TELEFONE.Text) + '</foneFixo>' + LineBreak;
          if Trim(QCadastroDESC_CELULAR.Text) <> '' then
            wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<foneCel>' + Bib.LimpaNumero(QCadastroDESC_CELULAR.Text) + '</foneCel>' + LineBreak;
          if Trim(QCadastroDESC_E_MAIL.Text) <> '' then
            wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<email>' + QCadastroDESC_E_MAIL.Text + '</email>' + LineBreak;

          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '</contato>' + LineBreak;

          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<softHouse>' + LineBreak;

          // CNPJ AQUI
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<cnpjSoftHouse>81504763000171</cnpjSoftHouse>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<nmRazao>CEMAPA SOLUCOES EM INFORMATICA LTDA</nmRazao>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<nmCont>Marcos Basi</nmCont>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<telefone>4532643773</telefone>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<email>suporte@cemapa.com</email>' + LineBreak;

          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '</softHouse>' + LineBreak;

          wXMLReinf := wXMLReinf + #9#9#9#9 + '</infoCadastro>' + LineBreak;

          if (QReinfR1000IND_INC_ALT_EXC.Value = 1) and (QReinfR1000DT_INI_VALIDADE.Value <> null ) then
          begin
            wXMLReinf := wXMLReinf + #9#9#9#9 + '<novaValidade>' + LineBreak;

            DecodeDate(QReinfR1000DT_INI_VALIDADE.Value, ano, mes, dia);
            wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<iniValid>' + FormatFloat('0000',ano)+ '-' + FormatFloat('00',mes) + '</iniValid>' + LineBreak;
            if (QReinfR1000DT_FIM_VALIDADE.Value <> null) and (QReinfR1000DT_FIM_VALIDADE.Value <> 0) then
            begin
              DecodeDate(QReinfR1000DT_FIM_VALIDADE.Value, ano, mes, dia);
              wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<fimValid>' + FormatFloat('0000',ano)+ '-' + FormatFloat('00',mes) + '</fimValid>' + LineBreak;
            end;

            wXMLReinf := wXMLReinf + #9#9#9#9 + '<novaValidade>';

          end;

          if QReinfR1000IND_INC_ALT_EXC.Value = 0 then
            wXMLReinf := wXMLReinf + #9#9#9 + '</inclusao>' + LineBreak;
          if QReinfR1000IND_INC_ALT_EXC.Value = 1 then
            wXMLReinf := wXMLReinf + #9#9#9 + '</alteracao>' + LineBreak;

        end
        else
        begin
          wXMLReinf := wXMLReinf + #9#9#9 + '<exclusao>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9 + '<idePeriodo>' + LineBreak;

          DecodeDate(QReinfR1000DT_INI_VALIDADE.Value, ano, mes, dia);
          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<iniValid>' + FormatFloat('0000',ano)+ '-' + FormatFloat('00',mes) + '</iniValid>' + LineBreak;
          if (QReinfR1000DT_FIM_VALIDADE.Value <> null) and (QReinfR1000DT_FIM_VALIDADE.Value <> 0) then
          begin
            DecodeDate(QReinfR1000DT_FIM_VALIDADE.Value, ano, mes, dia);
            wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<fimValid>' + FormatFloat('0000',ano)+ '-' + FormatFloat('00',mes) + '</fimValid>' + LineBreak;
          end;

          wXMLReinf := wXMLReinf + #9#9#9#9 + '</idePeriodo>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9 + '</exclusao>' + LineBreak;
        end;

        wXMLReinf := wXMLReinf + #9#9 + '</infoContri>' + LineBreak;

        wXMLReinf := wXMLReinf + #9 + '</evtInfoContri>' + LineBreak;

        wXMLReinf := wXMLReinf + '</Reinf>';


        if not (QRegistrosReinf.State in [dsEdit, dsInsert]) then
        begin
          if not (QRegistrosReinf.State in[dsBrowse]) then
            QRegistrosReinf.Open;

          QRegistrosReinf.Insert;

          QRegistrosReinfDESC_EVENTO_REINF.Value := eventoReinf;
          QRegistrosReinfCOD_FILIAL.Value := QReinfR1000COD_FILIAL.Value;
          QRegistrosReinfDT_INI_EVENTO.Value := QReinfR1000DT_INI_VALIDADE.Value;
          QRegistrosReinfDT_FIM_EVENTO.Value := QReinfR1000DT_FIM_VALIDADE.Value;
          QRegistrosReinfDESC_XML_EVENTO.Value := wXMLReinf;
          QRegistrosReinfCOD_EVENTO_REINF.Value := QReinfR1000COD_REINF_R1000.Value;
          QRegistrosReinfDT_GERACAO_REINF.Value := Today;
          QRegistrosReinfCOD_USUARIO.Value := QReinfR1000COD_USUARIO.Value;
          QRegistrosReinfCOD_EVENTO_REINF.Value := QReinfR1000COD_REINF_R1000.Value;
          QRegistrosReinfDESC_XML_ID.Value := idEventoGerado; //gerado com base no código da filial e na hora conforme GerarID(codFilial);
          QRegistrosReinfIND_SITUACAO.Value := 'GERADO';

          QRegistrosReinf.Post;

        end;

    finally
      QReinfR1000.Close;
      QReinfR1000.SetVariable('PK', codEvento);
      QReinfR1000.Open;
    end;
  end;

end;

procedure TGeraXMLReinf.GerarR1070(codEvento: Integer; eventoReinf,
  versaoReinf: string);
var
  idEventoGerado: string;
begin
  wXMLReinf := '';

  with DMReinf, DMFilial, DMCadastro, DMCidade do
  begin
    try
        // abre o Filial do evento
        QFilial.Close;
        QFilial.SetVariable('PK', QReinfR2010COD_FILIAL.Value);
        QFilial.Open;

        idEventoGerado := GerarID(QReinfR2010COD_FILIAL.Value);

        // abre o Cadastro do evento
        QCadastro.Close;
        QCadastro.SetVariable('PK', QReinfR1070COD_CADASTRO.Value);
        QCadastro.Open;

        // abre a Cidade do evento
        QCidade.Close;
        QCadastro.SetVariable('PK', QReinfR1070COD_CIDADE.Value);
        QCadastro.Open;


        wXMLReinf := wXMLReinf + '<?xml version="1.0" encoding="UTF-8"?>' + LineBreak;
        wXMLReinf := wXMLReinf + '<Reinf xmlns="http://www.reinf.esocial.gov.br/schemas/evtTabProcesso/v'+ GetVersaoFormatada(versaoReinf) +'">' + LineBreak;

        wXMLReinf := wXMLReinf + #9 + '<evtTabProcesso id="'+ idEventoGerado + '">' + LineBreak;
        // info do evento
        wXMLReinf := wXMLReinf + #9#9 + '<ideEvento>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<tpAmb>' + QReinfR1070IND_PRODUCAO_HOMOLOGACAO.Text + '</tpAmb>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<procEmi>' + QReinfR1070IND_TIPO_APLICATIVO.Text + '</procEmi>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<verProc>' + '1.0.0' + '</verProc>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9 + '</ideEvento>' + LineBreak;
        // identificação do contribuinte
        wXMLReinf := wXMLReinf + #9#9 + '<ideContri>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<tpInsc>1</tpInsc>'+ LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<nrInsc>' + copy(Bib.LimpaNumero(QFilialNUM_CGC.Text), 1, 8) + '</nrInsc>' + LineBreak; //apenas raiz
        wXMLReinf := wXMLReinf + #9#9 + '</ideContri>' + LineBreak;

        // info do contribuinte
        wXMLReinf := wXMLReinf + #9#9 + '<infoProcesso>' + LineBreak;

        if QReinfR1070IND_INC_ALT_EXC.Value <> 2 then
        begin


          // dados que se repetem de informação do evento - inclusao - alteracao - exclusão
          // os iguais vem primeiro
          if QReinfR1070IND_INC_ALT_EXC.Value = 0 then
            wXMLReinf := wXMLReinf + #9#9#9 + '<inclusao>' + LineBreak;
          if QReinfR1070IND_INC_ALT_EXC.Value = 1 then
            wXMLReinf := wXMLReinf + #9#9#9 + '<alteracao>' + LineBreak;

          // periodo do evento
          wXMLReinf := wXMLReinf + #9#9#9#9 + '<ideProcesso>' + LineBreak;

          wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '<tpProc>' + QReinfR1070IND_TIPO_PROCESSO.Text + '</tpProc>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '<nrProc>' + QReinfR1070NUM_PROCESSO.Text + '</nrProc>' + LineBreak;


          DecodeDate(QReinfR1070DT_INI_VALIDADE.Value, ano, mes, dia);
          wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '<iniValid>' + FormatFloat('0000',ano)+ '-' + FormatFloat('00',mes) + '</iniValid>' + LineBreak;
          if QReinfR1070DT_FIM_VALIDADE.Value <> null then
          begin
            DecodeDate(QReinfR1070DT_FIM_VALIDADE.Value, ano, mes, dia);
            wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '<fimValid>' + FormatFloat('0000',ano)+ '-' + FormatFloat('00',mes) + '</fimValid>' + LineBreak;
          end;

          if (Bib.FormataCNPJ(QFilialNUM_CGC.Value) = Bib.FormataCNPJ(QCadastroNUM_CGC_CPF.Value)) then
            wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '<indAutoria>1</indAutoria>' + LineBreak
          else
            wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '<indAutoria>2</indAutoria>' + LineBreak;

          QReinfSuspProcR1070Cons.Close;
          QReinfSuspProcR1070Cons.SetVariable('COD_REINF_R1070', QReinfR1070COD_REINF_R1070.Value);
          QReinfSuspProcR1070Cons.Open;

          // resguardado no momento de inserir que não ultrapasse 50 suspensões.
          while not QReinfSuspProcR1070Cons.Eof do
          begin
            wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '<infoSusp>' + LineBreak;
            wXMLReinf := wXMLReinf + #9#9#9#9#9#9 +  '<codSusp>' + QReinfSuspProcR1070ConsCOD_IND_SUSPENSAO.Text + '</codSusp>' + LineBreak;
            wXMLReinf := wXMLReinf + #9#9#9#9#9#9 +  '<indSusp>' + QReinfSuspProcR1070ConsIND_SUSPENSAO.Text + '</indSusp>' + LineBreak;
            DecodeDate(QReinfSuspProcR1070ConsDT_DECISAO.Value, ano, mes, dia);
            wXMLReinf := wXMLReinf + #9#9#9#9#9#9 +  '<dtDecisao>' + FormatFloat('0000', ano) + '-' + FormatFloat('00', mes) + '-' + FormatFloat('00', dia) + '</dtDecisao>' + LineBreak;
            wXMLReinf := wXMLReinf + #9#9#9#9#9#9 +  '<indDeposito>' + QReinfSuspProcR1070ConsIND_DEPOSITO.Text + '</indDeposito>' + LineBreak;
            wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '</infoSusp>' + LineBreak;
            QReinfSuspProcR1070Cons.Next;
          end;

          wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '<dadosProcJud>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 +  '<ufVara>' + QCidadeCOD_ESTADO.Text + '</ufVara>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 +  '<codMunic>' + QCidadeCOD_CIDADE_IBGE.Text + '</ufVara>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 +  '<idVara>' + QReinfR1070NUM_VARA.Text + '</idVara>' + LineBreak;

          wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '</dadosProcJud>' + LineBreak;

          wXMLReinf := wXMLReinf + #9#9#9#9 + '</ideProcesso>' + LineBreak;

          if QReinfR1070IND_INC_ALT_EXC.Value = 1 then
          begin
            DecodeDate(QReinfR1070DT_INI_VALIDADE.Value, ano, mes, dia);
            wXMLReinf := wXMLReinf + #9#9#9#9 +  '<novaValidade>' + LineBreak;
            wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '<iniValid>' + FormatFloat('0000', ano) + '-' + FormatFloat('00', mes) + '</iniValid>' + LineBreak;
            DecodeDate(QReinfR1070DT_FIM_VALIDADE.Value, ano, mes, dia);
            wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '<fimValid>' + FormatFloat('0000', ano) + '-' + FormatFloat('00', mes) + '</fimValid>' + LineBreak;
            wXMLReinf := wXMLReinf + #9#9#9#9 +  '</novaValidade>' + LineBreak;
          end;

        end
        else
        begin
          wXMLReinf := wXMLReinf + #9#9#9 + '<exclusao>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9 + '<ideProcesso>' + LineBreak;

          wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '<tpProc>' + QReinfR1070IND_TIPO_PROCESSO.Text + '</tpProc>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '<nrProc>' + QReinfR1070NUM_PROCESSO.Text + '</nrProc>' + LineBreak;


          DecodeDate(QReinfR1070DT_INI_VALIDADE.Value, ano, mes, dia);
          wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '<iniValid>' + FormatFloat('0000',ano)+ '-' + FormatFloat('00',mes) + '</iniValid>' + LineBreak;
          if QReinfR1070DT_FIM_VALIDADE.Value <> null then
          begin
            DecodeDate(QReinfR1070DT_FIM_VALIDADE.Value, ano, mes, dia);
            wXMLReinf := wXMLReinf + #9#9#9#9#9 +  '<fimValid>' + FormatFloat('0000',ano)+ '-' + FormatFloat('00',mes) + '</fimValid>' + LineBreak;
          end;

          wXMLReinf := wXMLReinf + #9#9#9#9 + '</ideProcesso>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9 + '</exclusao>' + LineBreak;
        end;

        wXMLReinf := wXMLReinf + #9#9 + '</infoProcesso>' + LineBreak;

        wXMLReinf := wXMLReinf + #9 + '</evtTabProcesso>' + LineBreak;

        if not (QRegistrosReinf.State in [dsEdit, dsInsert]) then
        begin
          if not (QRegistrosReinf.State in[dsBrowse]) then
            QRegistrosReinf.Open;

          QRegistrosReinf.Insert;

          QRegistrosReinfDESC_EVENTO_REINF.Value := eventoReinf;
          QRegistrosReinfCOD_FILIAL.Value := QReinfR1070COD_FILIAL.Value;
          QRegistrosReinfDT_INI_EVENTO.Value := QReinfR1070DT_INI_VALIDADE.Value;
          QRegistrosReinfDT_FIM_EVENTO.Value := QReinfR1070DT_FIM_VALIDADE.Value;
          QRegistrosReinfDESC_XML_EVENTO.Value := wXMLReinf;
          QRegistrosReinfCOD_EVENTO_REINF.Value := QReinfR1070COD_REINF_R1070.Value;
          QRegistrosReinfDT_GERACAO_REINF.Value := Today;
          QRegistrosReinfCOD_USUARIO.Value := QReinfR1070COD_USUARIO.Value;
          QRegistrosReinfCOD_EVENTO_REINF.Value := QReinfR1070COD_REINF_R1070.Value;
          QRegistrosReinfDESC_XML_ID.Value := GerarID(QReinfR1070COD_FILIAL.Value);
          QRegistrosReinfIND_SITUACAO.Value := 'GERADO';

          QRegistrosReinf.Post;

        end;

    finally
      QReinfR1070.Close;
      QReinfR1070.SetVariable('PK', codEvento);
      QReinfR1070.Open;

      QFilial.Close;
      QCadastro.Close;
      QCidade.Close;
    end;
  end;

end;

procedure TGeraXMLReinf.GerarR2010(codEvento: Integer; eventoReinf,
  versaoReinf: string);
var
  idEventoGerado: string;
  PerApuracaoData: TDate;
  DataInicioEvento: TDate;
begin
  wXMLReinf := '';

  with DMReinf, DMFilial, DMCadastro, DMCidade do
  begin
    try

        // abre o evento relacionado
        QReinfR2010.Close;
        QReinfR2010.SetVariable('PK', codEvento);
        QReinfR2010.Open;

        // abre o Filial do evento
        QFilial.Close;
        QFilial.SetVariable('PK', QReinfR2055COD_FILIAL.Value);
        QFilial.Open;

        idEventoGerado := GerarID(QReinfR2055COD_FILIAL.Value);

        // abre o Cadastro do evento

        wXMLReinf := wXMLReinf + '<?xml version="1.0" encoding="UTF-8"?>' + LineBreak;
        wXMLReinf := wXMLReinf + '<Reinf xmlns="http://www.reinf.esocial.gov.br/schemas/evt2010TomadorServicos/v'+ GetVersaoFormatada(versaoReinf) +'">' + LineBreak;

        wXMLReinf := wXMLReinf + #9 + '<evtServTom id="'+ idEventoGerado + '">' + LineBreak;
        // info do evento
        wXMLReinf := wXMLReinf + #9#9 + '<ideEvento>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<indRetif>' + QReinfR2010IND_RETIFCACAO.Text + '</indRetif>' + LineBreak;
        if QReinfR2010IND_RETIFCACAO.Value = 2 then
          wXMLReinf := wXMLReinf + #9#9#9 + '<nrRecibo>' + QReinfR2010DESC_NUM_RECIBO.Text + '</nrRecibo>' + LineBreak;


        wXMLReinf := wXMLReinf + #9#9#9 + '<tpAmb>' + QReinfR2055IND_PRODUCAO_HOMOLOGACAO.Text + '</tpAmb>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<procEmi>' + QReinfR2055IND_TIPO_APLICATIVO.Text + '</procEmi>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<verProc>' + '1.0.0' + '</verProc>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9 + '</ideEvento>' + LineBreak;
        // identificação do contribuinte
        wXMLReinf := wXMLReinf + #9#9 + '<ideContri>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<tpInsc>1</tpInsc>'+ LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<nrInsc>' + Bib.LimpaNumero(QFilialNUM_CGC.Text) + '</nrInsc>' + LineBreak; 
        wXMLReinf := wXMLReinf + #9#9 + '</ideContri>' + LineBreak;

        // info aquisição produção agrícola
        wXMLReinf := wXMLReinf + #9#9 + '<infoServTom>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9 + '<ideEstabObra>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9 + '<tpInscEstab>1</tpInscEstab>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9 + '<nrInscEstab>' + Bib.LimpaNumero(QFilialNUM_CGC.Value) + '</nrInscEstab>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9 + '<indObra>' + QReinfR2010IND_OBRA.Text + '</indObra>' + LineBreak;

        //dados do prestador serviço
        wXMLReinf := wXMLReinf + #9#9#9#9 + '<idePrestServ>' + LineBreak;

        QCadastro.Close;
        QCadastro.SetVariable('PK', QReinfR2010COD_CADASTRO_PRESTADOR.Value);  // cadastro do prestador salvo
        QCadastro.Open;

        wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<tpInscProd>'+ '2' + '</tpInscProd>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<nrInscProd>' + Bib.LimpaNumero(QCadastroNUM_CGC_CPF.Text) + '</nrInscProd>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<vlrTotalBruto>' + QReinfR2010VAL_TOTAL_BRUTO.Text + '</vlrTotalBruto>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<vlrTotalBaseRet>' + QReinfR2010VAL_TOTAL_BASE_RETENCAO.Text + '</vlrTotalBaseRet>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<vlrTotalRetPrinc>' + QReinfR2010VAL_TOTAL_RETIDO_PRINCIPAL.Text + '</vlrTotalRetPrinc>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<vlrTotalRetAdic>' + QReinfR2010VAL_TOTAL_RETIDO_ADICIONAL.Text + '</vlrTotalRetAdic>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<vlrTotalNRetPrinc>' + QReinfR2010VAL_TOT_NAO_RET_PRINCIPAL.Text + '</vlrTotalNRetPrinc>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<vlrTotalNRetAdic>' + QReinfR2010VAL_TOT_NAO_RET_ADICIONAL.Text + '</vlrTotalNRetAdic>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<indCPRB>' + QReinfR2010IND_CPRB.Text + '</indCPRB>' + LineBreak;

        QNotaReinfR2010Geracao.Close;
        QNotaReinfR2010Geracao.SetVariable('COD_REGISTRO_REINF', QReinfR2010COD_REINF_R2010.Value);
        QNotaReinfR2010Geracao.Open;

        if QNotaReinfR2010Geracao.RecordCount = 0 then
          Raise Exception.Create('Não existem notas para o evento. Cancelada a geração.');

        QNotaReinfR2010Geracao.First;
        while not QNotaReinfR2010Geracao.Eof do
        begin

          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<nfs>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<serie>' + QNotaReinfR2010GeracaoCOD_SERIE.Text +  '</serie>' +  LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<numDocto>' + QNotaReinfR2010GeracaoNUM_NOTA.Text +  '</numDocto>' +  LineBreak;
          DecodeDate(QNotaReinfR2010GeracaoDT_EMISSAO.Value, dia, mes, ano);
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<dtEmissaoNF>' + IntToStr(ano) + '-' + IntToStr(mes) + '-' + IntToStr(dia) + '</dtEmissaoNF>' +  LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<vlrBruto>' + QNotaReinfR2010GeracaoVAL_BRUTO.Text +  '</vlrBruto>' +  LineBreak;

          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<infoTpServ>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9#9 + '<tpServico>' + QNotaReinfR2010GeracaoVAL_BRUTO.Text +  '</tpServico>' +  LineBreak;

          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '</infoTpServ>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '</nfs>' + LineBreak;
// TODO - nECESSÁRIO CRIAR TABELA PARA ARMAZENAR OS DADOS POR TIPO DE SERVIÇO PRESTADO. INFORMAÇÕES DE TIPOS DE
// RETENÇÃO POR SEGURADO ESPECIAL TAMBÉM
          QNotaReinfR2010Geracao.Next;
        end;

        if QReinfR2055IND_OPCAO_CP.Value = 'S' then
          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<indOpcCP>' + trim(QReinfR2055IND_OPCAO_CP.Text) + '</indOpcCP>' + LineBreak;

        //Detalhamento da aquisição
        QAquisicaoR2055.Close;
        QAquisicaoR2055.SetVariable('cod_registro_reinf', QReinfR2055COD_REINF_R2055.Value);
        QAquisicaoR2055.Open;
        QAquisicaoR2055.First;
        while not QAquisicaoR2055.Eof do
        begin
          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<detAquis>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<indAquis>' + QAquisicaoR2055IND_AQUISICAO.Text + '</indAquis>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<vlrBruto>' +  FormatFloat('####0.00', QAquisicaoR2055VAL_BRUTO.Value) + '</vlrBruto>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<vlrCPDescPR>' + FormatFloat('####0.00', QAquisicaoR2055VAL_CP_DESC_PR.Value) + '</vlrCPDescPR>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<vlrRatDescPR>' + FormatFloat('####0.00', QAquisicaoR2055VAL_RAT_DESC_PR.Value) + '</vlrRatDescPR>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<vlrSenarDesc>' + FormatFloat('####0.00', QAquisicaoR2055VAL_SENAR_DESC.Value) + '</vlrSenarDesc>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '</detAquis>' + LineBreak;
          QAquisicaoR2055.Next;
        end;
        QAquisicaoR2055.Close;

        wXMLReinf := wXMLReinf + #9#9#9#9 + '</idePrestServ>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9 + '</ideEstabObra>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9 + '</infoServTom>' + LineBreak;

        wXMLReinf := wXMLReinf + #9 + '</evtServTom>' + LineBreak;

        wXMLReinf := wXMLReinf + '</Reinf>' + LineBreak;


        if not (QRegistrosReinf.State in [dsEdit, dsInsert]) then
        begin
          if not (QRegistrosReinf.State in[dsBrowse]) then
            QRegistrosReinf.Open;

          QRegistrosReinf.Insert;

          QRegistrosReinfDESC_EVENTO_REINF.Value := eventoReinf;
          QRegistrosReinfCOD_FILIAL.Value := QReinfR2055COD_FILIAL.Value;
          QRegistrosReinfDT_INI_EVENTO.Value := GetStartOfMonth(QReinfR2055DT_PERIODO_APURACAO.Value);
          QRegistrosReinfDT_FIM_EVENTO.Value := GetEndOfMonth(QReinfR2055DT_PERIODO_APURACAO.Value);
          QRegistrosReinfDESC_XML_EVENTO.Value := wXMLReinf;
          QRegistrosReinfCOD_EVENTO_REINF.Value := QReinfR2055COD_REINF_R2055.Value;
          QRegistrosReinfDT_GERACAO_REINF.Value := Today;
          QRegistrosReinfCOD_USUARIO.Value := QReinfR2055COD_USUARIO.Value;
          QRegistrosReinfCOD_EVENTO_REINF.Value := QReinfR2055COD_REINF_R2055.Value;
          QRegistrosReinfDESC_XML_ID.Value := GerarID(QReinfR2055COD_FILIAL.Value);
          QRegistrosReinfIND_SITUACAO.Value := 'GERADO';

          QRegistrosReinf.Post;

        end;

    finally
      QReinfR2055.Close;
      QReinfR2055.SetVariable('PK', codEvento);
      QReinfR2055.Open;

      QFilial.Close;
    end;
  end;

end;

procedure TGeraXMLReinf.GerarR2020(codEvento: Integer; eventoReinf,
  versaoReinf: string);
begin
  //não montado
end;

procedure TGeraXMLReinf.GerarR2050(codEvento: Integer; eventoReinf,
  versaoReinf: string);
begin
  //não montado
end;

procedure TGeraXMLReinf.GerarR2055(codEvento: Integer; eventoReinf,
  versaoReinf: string);
var
  idEventoGerado: string;
  PerApuracaoData: TDate;
  DataInicioEvento: TDate;
begin
  wXMLReinf := '';

  with DMReinf, DMFilial, DMCadastro, DMCidade do
  begin
    try

        // abre o evento relacionado
        QReinfR2055.Close;
        QReinfR2055.SetVariable('PK', codEvento);
        QReinfR2055.Open;

        // abre o Filial do evento
        QFilial.Close;
        QFilial.SetVariable('PK', QReinfR2055COD_FILIAL.Value);
        QFilial.Open;

        idEventoGerado := GerarID(QReinfR2055COD_FILIAL.Value);

        // abre o Cadastro do evento

        wXMLReinf := wXMLReinf + '<?xml version="1.0" encoding="UTF-8"?>' + LineBreak;
        wXMLReinf := wXMLReinf + '<Reinf xmlns="http://www.reinf.esocial.gov.br/schemas/evt2055AquisicaoProdRural/v'+ GetVersaoFormatada(versaoReinf) +'">' + LineBreak;

        wXMLReinf := wXMLReinf + #9 + '<evtAqProd id="'+ idEventoGerado + '">' + LineBreak;
        // info do evento
        wXMLReinf := wXMLReinf + #9#9 + '<ideEvento>' + LineBreak;
        if (QReinfR2055REF_F1250_E_SOCIAL.Text = 'S') then
          wXMLReinf := wXMLReinf + #9#9#9 + '<indRetif>' + IntToStr(1) + '</indRetif>' + LineBreak
        else
          wXMLReinf := wXMLReinf + #9#9#9 + '<indRetif>' + QReinfR2055IND_RETIFCACAO.Text + '</indRetif>' + LineBreak;

        //período de apuração
        DecodeDate(QReinfR2055DT_PERIODO_APURACAO.Value, ano, mes, dia);
        wXMLReinf := wXMLReinf + #9#9#9 + '<perApur>' + FormatFloat('0000',ano)+ '-' + FormatFloat('00',mes) + '</perApur>' + LineBreak;

        DataInicioEvento := StrToDate('21/07/2021');
        if (QReinfR2055IND_RETIFCACAO.Text = '2') and (QReinfR2055REF_F1250_E_SOCIAL.Text = 'S') and (QReinfR2055DT_PERIODO_APURACAO.Value < DataInicioEvento) then
        begin
          wXMLReinf := wXMLReinf + #9#9#9 + '<retifS1250>' + QReinfR2055REF_F1250_E_SOCIAL.Text + '</retifS1250>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9 + '<nrRecibo>' + QReinfR2055DESC_NUM_RECIBO.Text + '</nrRecibo>' + LineBreak;
        end
        else if (QReinfR2055IND_RETIFCACAO.Text = '2') then
          wXMLReinf := wXMLReinf + #9#9#9 + '<nrRecibo>' + QReinfR2055DESC_NUM_RECIBO.Text + '</nrRecibo>' + LineBreak;


        wXMLReinf := wXMLReinf + #9#9#9 + '<tpAmb>' + QReinfR2055IND_PRODUCAO_HOMOLOGACAO.Text + '</tpAmb>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<procEmi>' + QReinfR2055IND_TIPO_APLICATIVO.Text + '</procEmi>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<verProc>' + '1.0.0' + '</verProc>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9 + '</ideEvento>' + LineBreak;
        // identificação do contribuinte
        wXMLReinf := wXMLReinf + #9#9 + '<ideContri>' + LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<tpInsc>1</tpInsc>'+ LineBreak;
        wXMLReinf := wXMLReinf + #9#9#9 + '<nrInsc>' + copy(Bib.LimpaNumero(QFilialNUM_CGC.Text), 1, 8) + '</nrInsc>' + LineBreak; //apenas raiz
        wXMLReinf := wXMLReinf + #9#9 + '</ideContri>' + LineBreak;

        // info aquisição produção agrícola
        wXMLReinf := wXMLReinf + #9#9 + '<infoAquisProd>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9 + '<ideEstabAdquir>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9 + '<tpInscAdq>' + '1' + '</tpInscAdq>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9 + '<nrInscAdq>' + Bib.LimpaNumero(QFilialNUM_CGC.Value) + '</nrInscAdq>' + LineBreak;


        //dados do produtor
        wXMLReinf := wXMLReinf + #9#9#9#9 + '<ideProdutor>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<tpInscProd>'+ '2' + '</tpInscProd>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<nrInscProd>' + Bib.LimpaNumero(QReinfR2055NUM_CGC_CPF.Value) + '</nrInscProd>' + LineBreak;

        if QReinfR2055IND_OPCAO_CP.Value = 'S' then
          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<indOpcCP>' + trim(QReinfR2055IND_OPCAO_CP.Text) + '</indOpcCP>' + LineBreak;

        //Detalhamento da aquisição
        QAquisicaoR2055.Close;
        QAquisicaoR2055.SetVariable('cod_registro_reinf', QReinfR2055COD_REINF_R2055.Value);
        QAquisicaoR2055.Open;
        QAquisicaoR2055.First;
        while not QAquisicaoR2055.Eof do
        begin
          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '<detAquis>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<indAquis>' + QAquisicaoR2055IND_AQUISICAO.Text + '</indAquis>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<vlrBruto>' +  FormatFloat('####0.00', QAquisicaoR2055VAL_BRUTO.Value) + '</vlrBruto>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<vlrCPDescPR>' + FormatFloat('####0.00', QAquisicaoR2055VAL_CP_DESC_PR.Value) + '</vlrCPDescPR>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<vlrRatDescPR>' + FormatFloat('####0.00', QAquisicaoR2055VAL_RAT_DESC_PR.Value) + '</vlrRatDescPR>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9#9 + '<vlrSenarDesc>' + FormatFloat('####0.00', QAquisicaoR2055VAL_SENAR_DESC.Value) + '</vlrSenarDesc>' + LineBreak;
          wXMLReinf := wXMLReinf + #9#9#9#9#9 + '</detAquis>' + LineBreak;
          QAquisicaoR2055.Next;
        end;
        QAquisicaoR2055.Close;

        wXMLReinf := wXMLReinf + #9#9#9#9 + '</ideProdutor>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9#9 + '</ideEstabAdquir>' + LineBreak;

        wXMLReinf := wXMLReinf + #9#9 + '</infoAquisProd>' + LineBreak;

        wXMLReinf := wXMLReinf + #9 + '</evtAqProd>' + LineBreak;

        wXMLReinf := wXMLReinf + '</Reinf>' + LineBreak;


        if not (QRegistrosReinf.State in [dsEdit, dsInsert]) then
        begin
          if not (QRegistrosReinf.State in[dsBrowse]) then
            QRegistrosReinf.Open;

          QRegistrosReinf.Insert;

          QRegistrosReinfDESC_EVENTO_REINF.Value := eventoReinf;
          QRegistrosReinfCOD_FILIAL.Value := QReinfR2055COD_FILIAL.Value;
          QRegistrosReinfDT_INI_EVENTO.Value := GetStartOfMonth(QReinfR2055DT_PERIODO_APURACAO.Value);
          QRegistrosReinfDT_FIM_EVENTO.Value := GetEndOfMonth(QReinfR2055DT_PERIODO_APURACAO.Value);
          QRegistrosReinfDESC_XML_EVENTO.Value := wXMLReinf;
          QRegistrosReinfCOD_EVENTO_REINF.Value := QReinfR2055COD_REINF_R2055.Value;
          QRegistrosReinfDT_GERACAO_REINF.Value := Today;
          QRegistrosReinfCOD_USUARIO.Value := QReinfR2055COD_USUARIO.Value;
          QRegistrosReinfCOD_EVENTO_REINF.Value := QReinfR2055COD_REINF_R2055.Value;
          QRegistrosReinfDESC_XML_ID.Value := GerarID(QReinfR2055COD_FILIAL.Value);
          QRegistrosReinfIND_SITUACAO.Value := 'GERADO';

          QRegistrosReinf.Post;

        end;

    finally
      QReinfR2055.Close;
      QReinfR2055.SetVariable('PK', codEvento);
      QReinfR2055.Open;

      QFilial.Close;
    end;
  end;

end;

procedure TGeraXMLReinf.GerarR2060(codEvento: Integer; eventoReinf,
  versaoReinf: string);
begin
  //todo
end;

function TGeraXMLReinf.GetVersaoFormatada(codVersao: string): string;
begin
  result := StringReplace(codVersao, '.', '_', [rfReplaceAll]);
end;

function TGeraXMLReinf.GetStartOfMonth(Data : TDateTime) : TDate;
var
  wDia, wMes, wAno: Word;
begin
  DecodeDate(Data, wAno, wMes, wDia);
  result := StartOfaMonth(wAno, wMes);
end;

function TGeraXMLReinf.GetEndOfMonth(Data : TDateTime) : TDate;
var
  wDia, wMes, wAno: Word;
begin
  DecodeDate(Data, wAno, wMes, wDia);
  result := EndOFaMonth(wAno, wMes);
end;

procedure TGeraXMLReinf.GerarR2099(codEvento: Integer; eventoReinf,
  versaoReinf: string);
var
  idEventoGerado: string;
  PerApuracaoData: TDate;
  DataInicioEvento: TDate;
begin
 //Montando
  wXMLReinf := '';

  with DMReinf, DMFilial, DMCadastro, DMCidade do
  begin

    try

      // abre o evento relacionado
      QReinfR2099.Close;
      QReinfR2099.SetVariable('PK', codEvento);
      QReinfR2099.Open;

      // abre o Filial do evento
      QFilial.Close;
      QFilial.SetVariable('PK', QReinfR2099COD_FILIAL.Value);
      QFilial.Open;

      idEventoGerado := GerarID(QReinfR2099COD_FILIAL.Value);

      // abre o Cadastro do evento
      QCadastro.Close;
      QCadastro.SetVariable('PK', QReinfR2099COD_CADASTRO.Value);
      QCadastro.Open;

      wXMLReinf := wXMLReinf + '<?xml version="1.0" encoding="UTF-8"?>' + LineBreak;
      wXMLReinf := wXMLReinf + '<Reinf xmlns="http://www.reinf.esocial.gov.br/schemas/evtFechamento/v'+ GetVersaoFormatada(versaoReinf) +'">' + LineBreak;

      wXMLReinf := wXMLReinf + #9 + '<evtFechaEvPer id="'+ idEventoGerado + '">' + LineBreak;
      // info do evento
      wXMLReinf := wXMLReinf + #9#9 + '<ideEvento>' + LineBreak;

      //período de apuração
      DecodeDate(QReinfR2099DT_PERIODO_APURACAO.Value, ano, mes, dia);
      wXMLReinf := wXMLReinf + #9#9#9 + '<perApur>' + FormatFloat('0000',ano)+ '-' + FormatFloat('00',mes) + '</perApur>' + LineBreak;

      wXMLReinf := wXMLReinf + #9#9#9 + '<tpAmb>' + QReinfR2099IND_PRODUCAO_HOMOLOGACAO.Text + '</tpAmb>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<procEmi>' + QReinfR2099IND_TIPO_APLICATIVO.Text + '</procEmi>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<verProc>' + '1.0.0' + '</verProc>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9 + '</ideEvento>' + LineBreak;
      // identificação do contribuinte
      wXMLReinf := wXMLReinf + #9#9 + '<ideContri>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<tpInsc>1</tpInsc>'+ LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<nrInsc>' + copy(Bib.LimpaNumero(QFilialNUM_CGC.Text), 1, 8) + '</nrInsc>' + LineBreak; //apenas raiz
      wXMLReinf := wXMLReinf + #9#9 + '</ideContri>' + LineBreak;

      // informações de responsavel
      wXMLReinf := wXMLReinf + #9#9 + '<ideRespInf>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<nmResp>' + Bib.LimpaCaracteresReinf(QCadastroNOME.Text) + '</nmResp>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<cpfResp>' + Bib.LimpaNumero(QCadastroNUM_CGC_CPF.Text) + '</cpfResp>' + LineBreak;
      if Trim(QCadastroDESC_TELEFONE.Text) <> '' then
        wXMLReinf := wXMLReinf + #9#9#9 + '<telefone>' + Bib.LimpaNumero(QCadastroDESC_TELEFONE.Text) + '</telefone>' + LineBreak;
      if Trim(QCadastroDESC_E_MAIL.Text) <> '' then
        wXMLReinf := wXMLReinf + #9#9#9 + '<email>' + QCadastroDESC_E_MAIL.Text + '</email>' + LineBreak;

      wXMLReinf := wXMLReinf + #9#9 + '</ideRespInf>' + LineBreak;

      // informações de dos eventos gerados para envio
      wXMLReinf := wXMLReinf + #9#9 + '<infoFech>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<evtServTm>' + Bib.LimpaCaracteresReinf(QReinfR2099IND_EVT_R2010.Text) + '</evtServTm>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<evtServPr>' + Bib.LimpaCaracteresReinf(QReinfR2099IND_EVT_R2020.Text) + '</evtServPr>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<evtAssDespRec>' + Bib.LimpaCaracteresReinf(QReinfR2099IND_EVT_R2030.Text) + '</evtAssDespRec>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<evtAssDespRep>' + Bib.LimpaCaracteresReinf(QReinfR2099IND_EVT_R2040.Text) + '</evtAssDespRep>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<evtComProd>' + Bib.LimpaCaracteresReinf(QReinfR2099IND_EVT_R2050.Text) + '</evtComProd>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<evtCPRB>' + Bib.LimpaCaracteresReinf(QReinfR2099IND_EVT_R2060.Text) + '</evtCPRB>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<evtAquis>' + Bib.LimpaCaracteresReinf(QReinfR2099IND_EVT_R2055.Text) + '</evtAquis>' + LineBreak;

      //se houver períodos sem aquisição de produção anteriores 2018, deve criar a tag aqui e incluir no XML

      wXMLReinf := wXMLReinf + #9#9 + '</infoFech>' + LineBreak;




      wXMLReinf := wXMLReinf + #9 + '</evtFechaEvPer>' + LineBreak;

      wXMLReinf := wXMLReinf + '</Reinf>' + LineBreak;

       if not (QRegistrosReinf.State in [dsEdit, dsInsert]) then
        begin
          if not (QRegistrosReinf.State in[dsBrowse]) then
            QRegistrosReinf.Open;

          QRegistrosReinf.Insert;

          QRegistrosReinfDESC_EVENTO_REINF.Value := eventoReinf;
          QRegistrosReinfCOD_FILIAL.Value := QReinfR2099COD_FILIAL.Value;
          QRegistrosReinfDT_INI_EVENTO.Value := GetStartOfMonth(QReinfR2099DT_PERIODO_APURACAO.Value);
          QRegistrosReinfDT_FIM_EVENTO.Value := GetEndOfMonth(QReinfR2099DT_PERIODO_APURACAO.Value);
          QRegistrosReinfDESC_XML_EVENTO.Value := wXMLReinf;
          QRegistrosReinfCOD_EVENTO_REINF.Value := QReinfR2099COD_REINF_R2099.Value;
          QRegistrosReinfDT_GERACAO_REINF.Value := Today;
          QRegistrosReinfCOD_USUARIO.Value := QReinfR2099COD_USUARIO.Value;
          QRegistrosReinfCOD_EVENTO_REINF.Value := QReinfR2099COD_REINF_R2099.Value;
          QRegistrosReinfDESC_XML_ID.Value := GerarID(QReinfR2099COD_FILIAL.Value);
          QRegistrosReinfIND_SITUACAO.Value := 'GERADO';

          QRegistrosReinf.Post;

        end;

    finally
      QReinfR2099.Close;
      QReinfR2099.SetVariable('PK', codEvento);
      QReinfR2099.Open;

      QFilial.Close;
      QCadastro.Close;
    end;
  end;

end;

procedure TGeraXMLReinf.GerarR2098(codEvento: Integer; eventoReinf,
  versaoReinf: string);
var
  idEventoGerado: string;
  PerApuracaoData: TDate;
  DataInicioEvento: TDate;
begin
 //Montando
  wXMLReinf := '';

  with DMReinf, DMFilial, DMCadastro, DMCidade do
  begin

    try

      // abre o evento relacionado
      QReinfR2098.Close;
      QReinfR2098.SetVariable('PK', codEvento);
      QReinfR2098.Open;

      // abre o Filial do evento
      QFilial.Close;
      QFilial.SetVariable('PK', QReinfR2098COD_FILIAL.Value);
      QFilial.Open;

      idEventoGerado := GerarID(QReinfR2098COD_FILIAL.Value);


      wXMLReinf := wXMLReinf + '<?xml version="1.0" encoding="UTF-8"?>' + LineBreak;
      wXMLReinf := wXMLReinf + '<Reinf xmlns="http://www.reinf.esocial.gov.br/schemas/evtReabreEvPer/v'+ GetVersaoFormatada(versaoReinf) +'">' + LineBreak;

      wXMLReinf := wXMLReinf + #9 + '<evtReabreEvPer id="'+ idEventoGerado + '">' + LineBreak;
      // info do evento
      wXMLReinf := wXMLReinf + #9#9 + '<ideEvento>' + LineBreak;

      //período de apuração
      DecodeDate(QReinfR2098DT_PERIODO_APURACAO.Value, ano, mes, dia);
      wXMLReinf := wXMLReinf + #9#9#9 + '<perApur>' + FormatFloat('0000',ano)+ '-' + FormatFloat('00',mes) + '</perApur>' + LineBreak;

      wXMLReinf := wXMLReinf + #9#9#9 + '<tpAmb>' + QReinfR2098IND_PRODUCAO_HOMOLOGACAO.Text + '</tpAmb>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<procEmi>' + QReinfR2098IND_TIPO_APLICATIVO.Text + '</procEmi>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<verProc>' + '1.0.0' + '</verProc>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9 + '</ideEvento>' + LineBreak;
      // identificação do contribuinte
      wXMLReinf := wXMLReinf + #9#9 + '<ideContri>' + LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<tpInsc>1</tpInsc>'+ LineBreak;
      wXMLReinf := wXMLReinf + #9#9#9 + '<nrInsc>' + copy(Bib.LimpaNumero(QFilialNUM_CGC.Text), 1, 8) + '</nrInsc>' + LineBreak; //apenas raiz
      wXMLReinf := wXMLReinf + #9#9 + '</ideContri>' + LineBreak;


      wXMLReinf := wXMLReinf + #9 + '</evtReabreEvPer>' + LineBreak;

      wXMLReinf := wXMLReinf + '</Reinf>' + LineBreak;

       if not (QRegistrosReinf.State in [dsEdit, dsInsert]) then
        begin
          if not (QRegistrosReinf.State in[dsBrowse]) then
            QRegistrosReinf.Open;

          QRegistrosReinf.Insert;

          QRegistrosReinfDESC_EVENTO_REINF.Value := eventoReinf;
          QRegistrosReinfCOD_FILIAL.Value := QReinfR2098COD_FILIAL.Value;
          QRegistrosReinfDT_INI_EVENTO.Value := GetStartOfMonth(QReinfR2098DT_PERIODO_APURACAO.Value);
          QRegistrosReinfDT_FIM_EVENTO.Value := GetEndOfMonth(QReinfR2098DT_PERIODO_APURACAO.Value);
          QRegistrosReinfDESC_XML_EVENTO.Value := wXMLReinf;
          QRegistrosReinfCOD_EVENTO_REINF.Value := QReinfR2098COD_REINF_R2098.Value;
          QRegistrosReinfDT_GERACAO_REINF.Value := Today;
          QRegistrosReinfCOD_USUARIO.Value := QReinfR2098COD_USUARIO.Value;
          QRegistrosReinfCOD_EVENTO_REINF.Value := QReinfR2098COD_REINF_R2098.Value;
          QRegistrosReinfDESC_XML_ID.Value := GerarID(QReinfR2098COD_FILIAL.Value);
          QRegistrosReinfIND_SITUACAO.Value := 'GERADO';

          QRegistrosReinf.Post;

        end;

    finally
      QReinfR2098.Close;
      QReinfR2098.SetVariable('PK', codEvento);
      QReinfR2098.Open;

      QFilial.Close;
    end;
  end;
end;

end.



