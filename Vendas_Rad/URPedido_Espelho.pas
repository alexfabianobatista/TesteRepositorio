unit URPedido_Espelho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRPedido_Espelho = class(TFTRelSimples)
    QRBSumOC: TQRBand;
    QRBCabOC: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRBDetail: TQRSubDetail;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel17: TQRLabel;
    QRLTotal: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText25: TQRDBText;
    QRLTotalQtde: TQRLabel;
    QrDescricao: TQRLabel;
    QRLabel25: TQRLabel;
    QRLM3: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText28: TQRDBText;
    QRLabel28: TQRLabel;
    QRLVolumes: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel31: TQRLabel;
    QRLPrazo: TQRLabel;
    QRLDesconto: TQRLabel;
    QRLLDesconto: TQRLabel;
    QRLabel32: TQRLabel;
    QRMVencimento: TQRMemo;
    QRShape2: TQRShape;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    QRLabel33: TQRLabel;
    QRLVlrLiquido: TQRLabel;
    QRLLEntrada: TQRLabel;
    QRLEntrada: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText30: TQRDBText;
    QRLOperacao: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBDetailAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBSumOCBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBCabOCBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedido_Espelho: TFRPedido_Espelho;
  wTotalPedido, wQtdeTotal, wM3, wVolumes : Real;


implementation

uses UPedido_cl, UOracle_cl, UParamSistema_cl, UBiblioteca,
  UPrazoVencimento_cl;

{$R *.DFM}

procedure TFRPedido_Espelho.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  wTotalPedido := 0;
  wQtdeTotal :=0;
  wM3 := 0;
  wVolumes := 0;
end;

procedure TFRPedido_Espelho.QRBDetailAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
  Var wEmbalagem, wVol : String;
begin
  inherited;
  wTotalPedido := wTotalPedido+DMPedido.QPedidoItemValor_Total.Value;
  wQtdeTotal  := wQtdeTotal+DMPedido.QPedidoItemQt_Pedido.Value;
  wEmbalagem := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMPedido.QPedidoItemCod_Produto.Value));
  wVol := DMOracle.BuscaNome('SELECT NUM_VOLUMES FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMPedido.QPedidoItemCod_Produto.Value));
  If Trim(wEmbalagem) <> '' Then
     wM3 := wM3 + DMPedido.QPedidoItemQt_Pedido.Value * StrToFloat(wEmbalagem);
  If Trim(wVol) <> '' Then
     wVolumes := wVolumes + DMPedido.QPedidoItemQt_Pedido.Value * StrToFloat(wVol);
end;

procedure TFRPedido_Espelho.QRBSumOCBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  procedure AddVenc(var Cont: Integer; var Str: String; Dias: Integer; Valor: Extended; MaxLinha: Integer = 3);
  begin
    Inc(Cont);
    if Cont mod MaxLinha <> 1 then //Se nao for primeira linha, adiciona o espaçamento
      Str := Str + Bib.Chars(' ', 3);
    Str := Str + FormatFloat('00',Cont) + ' - ' +
      FormatDateTime('dd/MM/yyyy', DMPedido.QPedidoDT_EMISSAO.Value + Dias) +
      ' R$ ' + FormatFloat('#,##0.00', Valor);
    if Cont mod MaxLinha = 0 then //De 3 em 3, quebra a linha
      Str := Str + #13 + #10; //Nova linha
  end;
var
  Vencimentos: String;
  VencCont: Integer;
  Valor: Extended;
begin
  inherited;
  QRLTotal.Caption := FormatFloat(' ###,###,##0.00',wTotalPedido);
  QRLTotalQtde.caption := FormatFloat(' ###,###,##0.00',wQtdeTotal);
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' Then
  Begin
    QrLabel25.Caption := 'M3:';
    QRLM3.Caption := FormatFloat(' ###,###,##0.00',wM3);
    QRLVolumes.Caption := FormatFloat(' #,##0.00',wVolumes);
  End
  Else
  Begin
    QrLabel25.Caption := '';
    QRLM3.Caption := '';
    QRLVolumes.Caption := '';
  End;
  with DMPedido do
  begin
    if QSomaPedido.Eof then
    begin
      QSomaPedido.Close;
      QSomaPedido.Open;
    end;
    QRLDesconto.Caption := FormatFloat('#,##0.00', QPedidoVAL_DESCONTO.Value);
    QRLEntrada.Caption := FormatFloat('#,##0.00', QPedidoVAL_ENTRADA.Value);
    QRLVlrLiquido.Caption := FormatFloat('#,##0.00', QSomaPedidoSTOTAL_PEDIDO_LIQ.Value);

    QRLLDesconto.Enabled := QPedidoVAL_DESCONTO.Value > 0;
    QRLDesconto.Enabled := QPedidoVAL_DESCONTO.Value > 0;
    QRLEntrada.Enabled := QPedidoVAL_ENTRADA.Value > 0;
    QRLLEntrada.Enabled := QPedidoVAL_ENTRADA.Value > 0;

    Vencimentos := '';
    if not QPedidoCOD_PRAZO_VENCIMENTO.IsNull then
      with DMPrazoVencimento do
      begin
        QPrazoVencimento.Close;
        QPrazoVencimento.SetVariable('PK', QPedidoCOD_PRAZO_VENCIMENTO.Value);
        QPrazoVencimento.Open;
        Valor := (QSomaPedidoSTOTAL_PEDIDO_LIQ.Value - QPedidoVAL_ENTRADA.Value) / QPrazoVencimentoNUM_PARCELAS.Value;

        QPrazoVencimentoDias.Close;
        QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO', QPedidoCOD_PRAZO_VENCIMENTO.Value);
        QPrazoVencimentoDias.Open;
        QPrazoVencimentoDias.First;

        VencCont := 0;
        while not QPrazoVencimentoDias.Eof do
        begin
          If (VencCont = 0) And (QPedidoNUM_PALM.Value <> 0) Then
            AddVenc(VencCont, Vencimentos, QPedidoNUM_PALM.Value, Valor)  //NO CAMPO NUM_PALM TEM OS DIAS DE CARENCIA
          Else
            If QPedidoNUM_PALM.Value <> 0 Then  // para acima da primeira parcela e com dias de carencia tem que descontar 30 dias
               AddVenc(VencCont, Vencimentos, QPrazoVencimentoDiasNUM_DIAS.Value + QPedidoNUM_PALM.Value - 30, Valor)
            Else
               AddVenc(VencCont, Vencimentos, QPrazoVencimentoDiasNUM_DIAS.Value + QPedidoNUM_PALM.Value - 30, Valor);
          QPrazoVencimentoDias.Next;
        end;
      end;
    QRMVencimento.Lines.Text := Trim(Vencimentos);
  end;
end;

procedure TFRPedido_Espelho.QRBDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DmPedido do
  Begin
    QrDescricao.Caption := Trim(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value)));
    QrDescricao.Caption := QrDescricao.Caption + '-'+ Trim(DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO', 'COD_LOTE_TIPO = '+FloatToStr(QPedidoItemCod_Lote_Tipo.Value)));
  End;
end;

procedure TFRPedido_Espelho.QRBCabOCBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLOperacao.Caption := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO=' + DMPedido.QPedidoCOD_OPERACAO.Text);
end;

end.
