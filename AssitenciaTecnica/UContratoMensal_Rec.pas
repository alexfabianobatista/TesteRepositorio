unit UContratoMensal_Rec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, variants, UFmOperacao, ExtCtrls;

type
  TFContratoMensal_Rec = class(TForm)
    Label89: TLabel;
    MeFilial: TMaskEdit;
    SpeedButton51: TSpeedButton;
    EdFilial: TMaskEdit;
    Label31: TLabel;
    MEContaCorrente: TMaskEdit;
    SpeedButton18: TSpeedButton;
    EdContaCorrente: TMaskEdit;
    Label33: TLabel;
    MEDataRef: TMaskEdit;
    Label1: TLabel;
    MeCadastro: TMaskEdit;
    SpeedButton1: TSpeedButton;
    EdCadastro: TMaskEdit;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    Label64: TLabel;
    MEFinalidade: TMaskEdit;
    SpeedButton39: TSpeedButton;
    EdFinalidade: TMaskEdit;
    RgEmissao: TRadioGroup;
    procedure SpeedButton51Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
    procedure MEContaCorrenteExit(Sender: TObject);
    procedure MeCadastroExit(Sender: TObject);
    procedure MEFinalidadeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoMensal_Rec: TFContratoMensal_Rec;

implementation

uses UFilialCons, UFilial_cl, UOracle_cl, UContasReceber_cl, UnotaImpressao,
  UBancoAgencia_cl, UCadastroCons, UCadastro_cl, UOrdemServico_cl,
  UFinalidade_cl, UFinalidadeCons, UUsuario_cl, UParamSistema_cl,
  UTipoContrato_cl, UContaCorrenteCons, UNotaSaida_cl, UNotaSaida_Confirma,
  USerie_cl;

{$R *.DFM}

procedure TFContratoMensal_Rec.SpeedButton51Click(Sender: TObject);
begin
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      MEFilial.Text:=DMFilial.QFilialConsCod_filial.Text;
      MeFilialExit(Self);
    end;

end;

procedure TFContratoMensal_Rec.SpeedButton18Click(Sender: TObject);
begin
  If FContaCorrenteCons = Nil then
    FContaCorrenteCons:=TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.ShowModal=mrOk then
     MEContaCorrente.Text:=DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Text;

end;

procedure TFContratoMensal_Rec.SpeedButton1Click(Sender: TObject);
begin
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      MECadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
      MeCadastroExit(Self);
    end;

end;

procedure TFContratoMensal_Rec.BtOkClick(Sender: TObject);
Var
  wDia,wMes,wAno, wMesParcela:Word;
  wDiaCorrente, wMesCorrente, wAnoCorrente :Word;
  wValMensalidade :Double;
  wLoteNfe, wFlag, CountRps : Integer;
  wMesExtenso, wContaCorrente : String;
begin
   If MeDataRef.Text = '__/__/____' Then
      ShowMessage('Informar Data de Referência');
   If MeFinalidade.Text = '' Then
      ShowMessage('Informar Finalidade');
   If FNotaSaida_Confirma = Nil Then
      FNotaSaida_Confirma := TFNotaSaida_Confirma.Create(Application);
   With DMOrdemServico Do
   Begin
     QContratoMensal_Rec.Close;
     QContratoMensal_Rec.SetVariable('DT_REFERENCIA',StrToDate(MeDataRef.Text));
     if Trim(MeCadastro.Text) = '' Then
        QContratoMensal_Rec.SetVariable('COD_CADASTRO',Null)
     Else
        QContratoMensal_Rec.SetVariable('COD_CADASTRO',MeCadastro.Text);
        
     If (MeFilial.Text) = '' Then
        QContratoMensal_Rec.SetVariable('COD_FILIAL',Null)
     Else
        QContratoMensal_Rec.SetVariable('COD_FILIAL',MeFilial.Text);

     DecodeDate(StrToDate(MeDataRef.Text),wAno,wMes,wDia);
     DecodeDate(DMOracle.DataServ,wAnoCorrente, wMesCorrente, wDiaCorrente);
     Case wMes Of
       1 : wMesExtenso := 'Referente ao mes de Janeiro de '+FloatToStr(wAno);
       2 : wMesExtenso := 'Referente ao mes de Fevereiro de '+FloatToStr(wAno);
       3 : wMesExtenso := 'Referente ao mes de Marco de '+FloatToStr(wAno);
       4 : wMesExtenso := 'Referente ao mes de Abril de '+FloatToStr(wAno);
       5 : wMesExtenso := 'Referente ao mes de Maio de '+FloatToStr(wAno);
       6 : wMesExtenso := 'Referente ao mes de Junho de '+FloatToStr(wAno);
       7 : wMesExtenso := 'Referente ao mes de Julho de '+FloatToStr(wAno);
       8 : wMesExtenso := 'Referente ao mes de Agosto de '+FloatToStr(wAno);
       9 : wMesExtenso := 'Referente ao mes de Setembro de '+FloatToStr(wAno);
       10 : wMesExtenso := 'Referente ao mes de Outubro de '+FloatToStr(wAno);
       11 : wMesExtenso := 'Referente ao mes de Novembro de '+FloatToStr(wAno);
       12 : wMesExtenso := 'Referente ao mes de Dezembro de '+FloatToStr(wAno);
     End;
     QContratoMensal_Rec.Open;
     DMContasReceber.QContasReceber_Cab.Open;
     DMContasReceber.QContasReceber_Mov.Open;
     DMNotaSaida.QNotaSaida.Open;
     DMNotaSaida.QItemNF.Open;
     DMOracle.DBCemapa.StartTransaction;
     CountRps := 0;
     Try
       While Not QContratoMensal_Rec.Eof Do
       Begin
         with DMTipoContrato do
         begin
           QTipoContrato.Close;
           QTipoContrato.SetVariable('PK', QContratoMensal_RecCOD_TIPO_CONTRATO.Value);
           QTipoContrato.Open;
         end;
         //se nao for preenchido valor da mensalidade .. pega valor mensalidade da tb_tipo_contrato
         if QContratoMensal_RecVal_Mensalidade.Text = '' then
            wValMensalidade := DMTipoContrato.QTipoContratoVAL_MENSAL.Value
         else
            wValMensalidade := QContratoMensal_RecVal_Mensalidade.Value;

         if QContratoMensal_RecDESC_FORMA_PAGTO.Value = 'TRIMESTRAL' then
            if NOT(wMes in [03,06,09,12]) then
             Begin
               QContratoMensal_Rec.Next;
               Continue;  // retorna no comando while
             End;
         if QContratoMensal_RecDESC_FORMA_PAGTO.Value = 'SEMESTRAL' then
            if NOT(wMes in [06,12]) then
             Begin
               QContratoMensal_Rec.Next;
               Continue;  // retorna no comando while
             End;
         if QContratoMensal_RecDESC_FORMA_PAGTO.Value = 'ANUAL' then
           if NOT(wMes in [01]) then
             Begin
               QContratoMensal_Rec.Next;
               Continue;  // retorna no comando while
             End;
         // RgEmissao itemindex diferente de 1 significa que esta solicitando para emitir nota fiscal nos parametros
         If (QContratoMensal_RecInd_Emite_Nota.Value = 'SIM') and (RgEmissao.ItemIndex <> 1) Then
          Begin
            With DMNotaSaida do
            Begin
              QNotaSaida.Insert;
              QNotaSaidaCod_Filial.Value := StrToInt(Trim(MeFilial.Text));
              If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR') And
                 (StrToInt(Trim(MeFilial.Text)) = 2) Then
                 QNotaSaidaCod_Serie.Value := '1'
              Else
                 QNotaSaidaCod_Serie.Value := DMParamSistema.QParamSistemaCOD_SERIE_OS_SERVICO.Value;
              QNotaSaidaCod_Serie_Modelo.Value := DMParamSistema.QParamSistemaCOD_SERIE_MODELO_OS_SERVICO.Value;
              QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value, QNotaSaidaCod_Serie.Value, QNotaSaidaCOD_SERIE_MODELO.Value);
              QNotaSaidaCod_Cadastro.Value := QContratoMensal_RecCod_Cadastro.Value;
              QNotaSaidaCod_Operacao.Value := DMParamSistema.QParamSistemaCOD_OPERACAO_OS_SERVICO.Value;
              QNotaSaidaInd_Condicao_Pagto.Value := '3';
              QNotaSaidaDesc_Obs_Corpo_Nota.Value := wMesExtenso;
              QItemNF.Insert;  // já faz o Post do QNotaSaida dentro dos eventos desta Query.
              QItemNFCod_Produto.Value := DMParamSistema.QParamSistemaCod_Produto_Servico.Value;
              QItemNFQt_Quantidade.Value := 1;
              QItemNFVal_Total.Value := wValMensalidade;
              QItemNFVal_Unitario.Value := wValMensalidade;
              QItemNF.Post;
              QNotaSaida.Edit;
              QNotaSaidaInd_Situacao.Value := '2';
              QNotaSaida.Post;
              CountRps := CountRps +1;
//              FNotaSaida_Confirma.SetaConfirma;  // confirmação da nota fiscal
              If wFlag = 0 Then  // somente vai entrar uma unica vez neste If - para obter o numero do lote
               Begin
                 FNotaImpressao.EmiteNF(QNotaSaidaCod_Nota_Cab.Value);
                 wLoteNfe := StrToInt(DMOracle.BuscaNome('SELECT ID_LOTE FROM TB_NF_ELETRONICA','COD_NOTA_CAB = '+QNotaSaidaCod_Nota_Cab.Text));
                 wFlag := 1;
               End
              Else
                 FNotaImpressao.EmiteNF(QNotaSaidaCod_Nota_Cab.Value,'',wLoteNfe);
            End;
          End;
          If QContratoMensal_RecInd_Envia_Banco.Value = 'SIM' Then
             wContaCorrente := MeContaCorrente.Text
          Else
             wContaCorrente := '0';
          If QContratoMensal_RecDESC_FORMA_PAGTO.Value = 'ANUAL' then  // Cesar 27/12/2017
             wMesParcela := QContratoMensal_RecMes_Ultimo_Reajuste.Value  // para contratos anual este campo contem mes vencimento parcela anual
          Else
             wMesParcela := wMes;
          if RgEmissao.ItemIndex <> 0 Then
             DMContasReceber.IncluiCR(QContratoMensal_RecCod_Contrato_Mensal.Value, wAno,
                                      wMes,StrToInt(MEFinalidade.Text), 1,
                                      StrToInt(wContaCorrente),
                                      QContratoMensal_RecCod_Cadastro.Value,
                                      QContratoMensal_RecCod_Filial.Value,wValMensalidade,QContratoMensal_RecDesc_Tipo_Documento.Value,
                                      StrToDate(FormatFloat('00',QContratoMensal_RecNum_Dia_Vencto.Value)+'/' +FormatFloat('00',wMesParcela)+'/' +FormatFloat('0000',wAno)),
                                      Date );
         QContratoMensal_Rec.Next;
         if CountRps = 25 then
         begin
           If wFlag = 1 Then
              FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value,'',wLoteNfe, True);
           wFlag := 0;
           CountRps := 0;
         end;
       End;
       If wFlag = 1 Then
          FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value,'',wLoteNfe, True);
     Except
       DMOracle.DBCemapa.RollBack;
       Raise;
     End;
     DMOracle.DBCemapa.Commit;
     ShowMessage('Atualização de Contas Receber do Mês Gerados com Sucesso!');
   End;
end;

procedure TFContratoMensal_Rec.SpeedButton39Click(Sender: TObject);
begin
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal=mrOk then
    With DMFinalidade do
        MEFinalidade.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value);

end;

procedure TFContratoMensal_Rec.MeFilialExit(Sender: TObject);
begin
  if Trim(MEFilial.Text)<>'' then
      EdFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MEFilial.Text)
  else
    Begin
      MEFilial.Clear;
      EdFilial.Text := 'Todas';
    End;

end;

procedure TFContratoMensal_Rec.MEContaCorrenteExit(Sender: TObject);
begin
  if Trim(MEContaCorrente.Text)<>'' then
    EdContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+MEContaCorrente.Text)
  else
    EdContaCorrente.Clear;

end;

procedure TFContratoMensal_Rec.MeCadastroExit(Sender: TObject);
begin
  if Trim(MECadastro.Text)<>'' then
      EdCadastro.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECadastro.Text)
  else
    Begin
      MECadastro.Clear;
      EdCadastro.Text := 'Todos';
    End;

end;

procedure TFContratoMensal_Rec.MEFinalidadeExit(Sender: TObject);
begin
  if Trim(MEFinalidade.Text)<>'' then
    EdFinalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MeFinalidade.Text)
  else
    MEFinalidade.Clear;

end;

end.
