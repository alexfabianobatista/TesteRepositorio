unit URelEspelhoNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFRelEspelhoNota = class(TFTRelSimples)
    QRLogo: TQRImage;
    QRLLogo: TQRLabel;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRBand4: TQRBand;
    QRLabel18: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRBand5: TQRBand;
    QRShape1: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel38: TQRLabel;
    QRHRule1: TQRHRule;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QMemoParcelas: TQRMemo;
    QRGroup1: TQRGroup;
    QRPDFShape1: TQRPDFShape;
    QRDBText25: TQRDBText;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText26: TQRDBText;
    QMemoObs: TQRMemo;
    QRDBText11: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRLabel47: TQRLabel;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRLabel50: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText38: TQRDBText;
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelEspelhoNota: TFRelEspelhoNota;

implementation
uses URelatorioVenda_cl, UNotaImpressao, UParamSistema_cl;

{$R *.dfm}

procedure TFRelEspelhoNota.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wTotalProd, wTotalServ, wTotalGeral, wDescProd, wDescServ, wDescGeral, wTotalAcrescimo : real;
  wTotalFrete, wTotalST: Real;
begin
  inherited;
  wTotalProd :=0;
  wTotalServ :=0;
  wTotalGeral:= 0;
  wDescProd  :=0;
  wDescServ  :=0;
  wDescGeral :=0;
  wTotalAcrescimo := 0;
  DMRelatorio_Venda.QRelEspelhoNota.First;
  while not DMRelatorio_Venda.QRelEspelhoNota.Eof do
  Begin
    if DMRelatorio_Venda.QRelEspelhoNotaIND_TIPO_PRODUTO.Text = 'SERVIÇO' then
    Begin
      wTotalServ :=  wTotalServ + (DMRelatorio_Venda.QRelEspelhoNotaVAL_UNITARIO.Value *
                      DMRelatorio_Venda.QRelEspelhoNotaQT_QUANTIDADE.Value);
      //wDescServ := wDescServ + (DMRelatorio_Venda.QRelEspelhoNotaQT_QUANTIDADE.Value*
      //                         DMRelatorio_Venda.QRelEspelhoNotaVAL_DESCONTO.Value);
      wDescServ := wDescServ + DMRelatorio_Venda.QRelEspelhoNotaVAL_DESCONTO.Value;
      wTotalFrete := wTotalFrete + DMRelatorio_Venda.QRelEspelhoNotaSVAL_FRETE.Value;
      wTotalST := wTotalST + DMRelatorio_Venda.QRelEspelhoNotaSVAL_ICMS_SUBST.Value;
      wTotalAcrescimo := wTotalAcrescimo + DMRelatorio_Venda.QRelEspelhoNotaSVAL_DESPESAS.Value;
    end
    else
    Begin
      wTotalProd :=  wTotalProd + (DMRelatorio_Venda.QRelEspelhoNotaVAL_UNITARIO.Value *
                      DMRelatorio_Venda.QRelEspelhoNotaQT_QUANTIDADE.Value);
      //wDescProd := wDescProd + (DMRelatorio_Venda.QRelEspelhoNotaQT_QUANTIDADE.Value*
      //                         DMRelatorio_Venda.QRelEspelhoNotaVAL_DESCONTO.Value);
      wDescProd := wDescProd + DMRelatorio_Venda.QRelEspelhoNotaVAL_DESCONTO.Value;
      wTotalFrete := wTotalFrete + DMRelatorio_Venda.QRelEspelhoNotaSVAL_FRETE.Value;
      wTotalST := wTotalST + DMRelatorio_Venda.QRelEspelhoNotaSVAL_ICMS_SUBST.Value;
      wTotalAcrescimo := wTotalAcrescimo + DMRelatorio_Venda.QRelEspelhoNotaSVAL_DESPESAS.Value;
    end;
   // wTotalAcrescimo := wTotalAcrescimo + DMRelatorio_Venda.QRelEspelhoNotaVAL_ACRESCIMO.Value;
    DMRelatorio_Venda.QRelEspelhoNota.Next;
  end;
//Solicitado por e-mail enviado pela Cris da Pateli. Alex - 15/07/2022
  if (DMParamSistema.CodEmpresa = 'PATELI') then
  begin
// Cris da Pateli solicitou que aparecesse o prazo das parcelas no relatório. 10/08/2022, solicitação enviada no whats do suporte.
    QRBand5.Height := 90;
    QRLabel28.Top := 5;
    QRLabel38.Top := 5;
    QRHRule1.Top := 45;
    QRHRule1.Left := 424;
    QRDBText23.Top := 55;
    QRDBText23.Left := 488;

    QRLabel23.Enabled := False;
    QRLabel24.Enabled := False;
    QRLabel36.Enabled := False;
    QRShape1.Enabled := False;
    QRLabel19.Enabled := False;
    QRLabel21.Enabled := False;
    QRLabel22.Enabled := False;
    QRLabel25.Enabled := False;
    QRLabel26.Enabled := False;
    QRLabel27.Enabled := False;
    QRLabel29.Enabled := False;
    QRLabel40.Enabled := False;
    QRLabel41.Enabled := False;
    QRLabel43.Enabled := False;
    QRLabel42.Enabled := False;
    QRLabel37.Enabled := False;
    QRLabel35.Enabled := False;
    QRLabel34.Enabled := False;
    QRLabel33.Enabled := False;
    QRLabel32.Enabled := False;
    QRLabel31.Enabled := False;
    QRLabel30.Enabled := False;
    QRLabel20.Enabled := False;
  end;
  wTotalGeral := wTotalProd + wTotalServ;
  wDescGeral := WdescProd + wdescServ;
  QRLabel20.Caption := Formatfloat('#,##0.00',wTotalProd);
  QRLabel31.Caption := Formatfloat('#,##0.00',wTotalProd-wDescProd);
  QRLabel30.Caption := Formatfloat('#,##0.00',wDescProd);
  QRLabel32.Caption := Formatfloat('#,##0.00',wTotalServ);
  QRLabel34.Caption := Formatfloat('#,##0.00',wTotalServ-wDescServ);
  QRLabel33.Caption := Formatfloat('#,##0.00',wDescServ);
  QRLabel35.Caption := Formatfloat('#,##0.00',wTotalGeral);
  QRLabel38.Caption := Formatfloat('#,##0.00',wTotalGeral + wTotalAcrescimo + wTotalST + wTotalFrete - wDescGeral);
  QRLabel37.Caption := FormatFloat('#,##0.00',wTotalFrete);
  QRLabel36.Caption := Formatfloat('#,##0.00',wDescGeral);
  QRLabel42.Caption := Formatfloat('#,##0.00',wTotalST);
  QRLabel43.Caption := Formatfloat('#,##0.00',wTotalAcrescimo);

  with DMRelatorio_Venda do
  begin
    QRParcelasEspelhoNota.Close;
    QRParcelasEspelhoNota.SetVariable('COD_NOTA_CAB', QRelEspelhoNotaCOD_NOTA_CAB.Value);
    QRParcelasEspelhoNota.Open;

    QMemoParcelas.Lines.Add('Forma de Pagamento:');
    QMemoParcelas.Lines.Add(QRelEspelhoNotaIND_PAGAMENTO.Text + '              ' + QRLabel38.Caption);
    if (QRelEspelhoNotaVAL_AVISTA.Value > 0) then
      QMemoParcelas.Lines.Add('Valor Entrada: ' + QRelEspelhoNotaVAL_AVISTA.Text);

    if QRParcelasEspelhoNota.RecordCount > 0 then
      QMemoParcelas.Lines.Add('Parcelado:');


    while not QRParcelasEspelhoNota.Eof do
    begin
      QMemoParcelas.Lines.Add(QRParcelasEspelhoNotaDT_VENCIMENTO.Text + '           ' + Formatfloat('#,##0.00',QRParcelasEspelhoNotaVAL_TITULO.Value));
      QRParcelasEspelhoNota.Next;
    end;
    QRParcelasEspelhoNota.Close;
    if (DMParamSistema.CodEmpresa = 'RRPECAS') then
      QMemoParcelas.Lines.Add('Mensagem: ' + QRelEspelhoNotaDESC_MENSAGEM.Text);
  end;
end;

procedure TFRelEspelhoNota.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var
  wComplemento, wObsParteInicial, wObsParteMeio, wObsParteFinal: string;
  wObsNotaPedido: Pchar;
begin
  inherited;
  if FileExists(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg') then
  begin // A Ultramaq utiliza logo diferentes para cada filial. Configurado para que o sistema busque a logo de acordo a filial. Alex - 17/09/2021
   if (DMParamSistema.CodEmpresa = 'ULTRAMAQ') and (DMRelatorio_Venda.QRelespelhonotaCOD_FILIAL.Text = '1') then
     begin
      QRLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
      QRLLogo.Enabled := False;
     end;
     if (dmparamsistema.codempresa = 'ULTRAMAQ') and (DMRelatorio_Venda.QRelespelhonotaCOD_FILIAL.Text = '2') then
     begin
      QRLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo1.jpg');
      QRLLogo.Enabled := False;
     end
   else
   begin
    QRLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
    QRLLogo.Enabled := False;
   end
  end
  else
  begin
    QRLogo.Picture := Nil;
    QRLLogo.Enabled := True;
  end;

  if (DMParamSistema.CodEmpresa = 'RRPECAS') or (DMParamSistema.CodEmpresa = 'RSMECANICA') or (DMParamSistema.CodEmpresa = 'RENATOAUTO')  then
  begin
    QRLabel50.Enabled := True;
    QRDBText34.Enabled := True;
  end;

  if (DMRelatorio_Venda.QRelEspelhoNotaCod_serie.value = 'PE') and (DMParamSistema.CodEmpresa <> 'NFCE-TMT') then
  begin
    QRLabel39.Caption := 'PEDIDO: ';
    QRLabel27.Caption := 'Subtotal do Pedido: ';
  end
  else if (DMParamSistema.CodEmpresa <> 'NFCE-TMT') then
  begin
    QRLabel39.Caption := 'NF: ';
    QRLabel27.Caption := 'Subtotal da NF: ';
  end;

  if (DMRelatorio_Venda.QRelEspelhoNotaCOD_SERIE_MODELO.Value <> '55') and (DMRelatorio_Venda.QRelEspelhoNotaCOD_SERIE_MODELO.Value <> '65')
  and ( (DMParamSistema.CodEmpresa = 'KREUZ') or (DMParamSistema.CodEmpresa = 'SCALA') ) then //BLOCO ADICIONADO PARA MUDAR O LABEL DE NF P/ ORÇAMENTO PARA KREUZ
  begin{Adicionado Scala. Alex 20/04/2026}
    QRLabel39.Caption := 'ORÇAMENTO: ';
    QRLabel39.Left := 585;
    QRDBText24.Left := 680;
  end;

//Comentado pois estava fazendo a quebra de pagina cortando algumas palavras. Alex 10/08/2022
//    wObsParteInicial := copy(DMRelatorio_Venda.QRelEspelhoNotaDESC_OBS_CORPO_NOTA.Text), 0, 660);
//    wObsParteMeio := copy(DMRelatorio_Venda.QRelEspelhoNotaDESC_OBS_CORPO_NOTA.Text, 81, 160);
//    wObsParteFinal := copy(DMRelatorio_Venda.QRelEspelhoNotaDESC_OBS_CORPO_NOTA.Text, 161, DMRelatorio_Venda.QRelEspelhoNotaDESC_OBS_CORPO_NOTA.Size);
    wObsParteInicial := DMRelatorio_Venda.QRelEspelhoNotaDESC_OBS_CORPO_NOTA.Text;
    wObsNotaPedido := PChar(wObsParteInicial);// + #13 + wObsParteMeio + #13 +wObsParteFinal);
    QMemoObs.Lines.Add(wObsNotaPedido);

end;

procedure TFRelEspelhoNota.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  QMemoObs.Lines.Clear;
  QMemoParcelas.Lines.Clear;
end;

procedure TFRelEspelhoNota.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
    if (DMParamSistema.CodEmpresa = 'CONSTRUIR')  then
      QRDBText11.Enabled := False;

    if ((DMParamSistema.CodEmpresa = 'ULTRAMAQ') or (DMParamSistema.CodEmpresa = 'PATELI')    or (DMParamSistema.CodEmpresa = 'RRPECAS')    or
        (DMParamSistema.CodEmpresa = 'NFCE-IVO') or (DMParamSistema.CodEmpresa = 'RSMECANICA') or (DMParamSistema.CodEmpresa = 'RENATOAUTO') ) and    //Adicionado Ivo suporte 10782. Andre 13/03/25
       (DMRelatorio_Venda.QRelEspelhoNotaDESC_INF_ADICIONAL.Text <> '') then
      QRBand4.Height := 37
    else
      QRBand4.Height := 19;
end;

procedure TFRelEspelhoNota.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'PATELI')  then
  begin
    QRLabel46.Enabled := True;
    QRLabel47.Enabled := True;
    QRLabel48.Enabled := True;
    QRDBText27.Enabled := True;
    QRDBText28.Enabled := True;
    QRDBText29.Enabled := True;
    QRDBText30.Enabled := True;
    QRDBText31.Enabled := True;
    QRDBText32.Enabled := True;
  end;
end;

procedure TFRelEspelhoNota.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'NFCE-IVO') or (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
    QRLabel4.Caption := 'Mecânico: ';
    
  if (DMParamSistema.CodEmpresa = 'DISMAVEL') then
    QRLabel12.Caption := 'NCM';
  if (DMParamSistema.CodEmpresa <> 'RRPECAS') then
  begin
    QRLabel54.Enabled := False;
    QRLabel54.Visible := False;
    QRLabel52.Enabled := False;
    QRLabel52.Visible := False;
    QRDBText38.Enabled := False;
    QRDBText38.Visible := False;
    QRDBText37.Enabled := False;
    QRDBText37.Visible := False;
  end;
  if (DMParamSistema.CodEmpresa = 'RRPECAS') then
  begin
    QRDBText33.Enabled := False;
    QRDBText33.Visible := False;
  end;
end;

end.
