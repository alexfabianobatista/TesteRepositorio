unit URContratoVend_Mov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContratoVend_Mov = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel13: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRBand3: TQRBand;
    QRLabel14: TQRLabel;
    QRLQuantidade: TQRLabel;
    QRLValor: TQRLabel;
    QRBand4: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel16: TQRLabel;
    QRLSaldo_Emb: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRObservacao: TQRMemo;
    QRDBText14: TQRDBText;
    QRLabel21: TQRLabel;
    QRLChegada: TQRLabel;
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContratoVend_Mov: TFRContratoVend_Mov;
Var   wQuantidade,wValor,wChegada : Real;

implementation


uses Ucontrato_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRContratoVend_Mov.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wQuantidade := 0;
  wValor := 0;
  wChegada := 0
end;

procedure TFRContratoVend_Mov.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLQuantidade.Caption := FormatFloat('###,###,##0',wQuantidade);
  QRLValor.Caption := FormatFloat('###,###,##0.00',wValor);
  QRLChegada.Caption := FormatFloat('###,###,##0',wChegada);
end;

procedure TFRContratoVend_Mov.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  if DMContrato.QRContratoVend_MovIND_TIPO_OPERACAO.Value = 'S' then
  begin
    DMContrato.QRContratoVend_MovQT_QUANTIDADE.Value := DMContrato.QRContratoVend_MovQT_QUANTIDADE.Value * (-1);
    DMContrato.QRContratoVend_MovQT_PESO_CHEGADA.Value := DMContrato.QRContratoVend_MovQT_PESO_CHEGADA.Value * (-1);
    DMContrato.QRContratoVend_MovVAL_TOTAL.Value :=  DMContrato.QRContratoVend_MovVAL_TOTAL.Value * (-1);
  end;
  wQuantidade := wQuantidade + DMContrato.QRContratoVend_MovQt_Quantidade.Value;
  wChegada := wChegada + DMContrato.QRContratoVend_MovQT_PESO_CHEGADA.Value;
  wValor := wValor + DMContrato.QRContratoVend_MovVal_Total.Value;
  if wQuantidade >= 0 then
    QRLSaldo_Emb.Caption := FormatFloat('###,###,##0',DMContrato.QRContrato_VendaQT_Quantidade.Value - wQuantidade)
  else
    QRLSaldo_Emb.Caption := FormatFloat('###,###,##0',DMContrato.QRContrato_VendaQT_Quantidade.Value + wQuantidade);
end;

procedure TFRContratoVend_Mov.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var
    wAux : String;
    i: Integer;
  const
    wBranco :String = '                  '; //18
begin
  inherited;
  wAux := '';
  With DMContrato Do
  Begin
    QRContrato_Venda_Parcelas.Close;
    QRContrato_Venda_Parcelas.SetVariable('Cod_Contrato_Vend',QRContrato_VendaCod_Contrato_Vend.Value);
    QRContrato_Venda_Parcelas.Open;
    QRObservacao.Lines.Clear;
    While not(QRContrato_Venda_Parcelas.Eof) Do
     Begin
       wAux := QRContrato_Venda_ParcelasDT_PAGTO.Text;
       wAux := wAux + copy(wBranco,1,(length(wBranco)-length(FormatFloat('#,##0.00',QRContrato_Venda_ParcelasVAL_PAGTO.Value)))) + FormatFloat('#,##0.00',QRContrato_Venda_ParcelasVAL_PAGTO.Value);
       wAux := wAux + '    ' + QRContrato_Venda_ParcelasDESC_OBSERVACAO.Text;
       QRObservacao.Lines.Add(wAux);
       QRContrato_Venda_Parcelas.Next;
     End;

     QRObservacao.Height := QRObservacao.Lines.Count * 16;
     QRBand3.Height := QRObservacao.Top + QRObservacao.Height + 2;

//     ShowMessage(IntToStr(QRObservacao.Height) + ' - ' + IntToStr(QRBand3.Height));
  End;
end;

end.
