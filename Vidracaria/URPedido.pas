unit URPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QuickRpt, QRExport, QRWebFilt, QRPDFFilt, QRCtrls,
  ExtCtrls, grimgctrl;

type
  TFRPedido = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRLFantasia: TQRLabel;
    QRLabel4: TQRLabel;
    QRLCliente: TQRLabel;
    QRLabel3: TQRLabel;
    QRLRuaFilial: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLEndFilial: TQRLabel;
    QRLabel6: TQRLabel;
    QRLDtEmissao: TQRLabel;
    QRLabel7: TQRLabel;
    QRLFone: TQRLabel;
    QRLabel9: TQRLabel;
    QRLBairro: TQRLabel;
    QRLabel8: TQRLabel;
    QRLPedido: TQRLabel;
    QRLNatOp: TQRLabel;
    QRLTipoPagto: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRHRule1: TQRHRule;
    QRDBText7: TQRDBText;
    QRExpr2: TQRExpr;
    QRMObservacao: TQRMemo;
    QRBand5: TQRBand;
    QRLabel17: TQRLabel;
    QRExpr1: TQRExpr;
    QRM1: TQRMemo;
    QRM2: TQRMemo;
    QRM3: TQRMemo;
    QRLabel10: TQRLabel;
    QRLEntrada: TQRLabel;
    QRLabel5: TQRLabel;
    QRLCidade: TQRLabel;
    QRLabel19: TQRLabel;
    QRLCep: TQRLabel;
    QRLEmbalagem: TQRLabel;
    QRM4: TQRMemo;
    QRM5: TQRMemo;
    QRLabel18: TQRLabel;
    QRLCelular: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedido: TFRPedido;

implementation

uses UNotaSaida_cl;

{$R *.dfm}

procedure TFRPedido.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  wAux: TQRMemo;
begin
  inherited;
  QRM4.Lines.Append(' ');
  QRM5.Lines.Append(' ');
  QRM1.Height := (QRM1.Lines.Count * 16) + 1;
  QRM2.Height := (QRM2.Lines.Count * 16) + 1;
  QRM3.Height := (QRM3.Lines.Count * 16) + 1;
  QRM4.Height := (QRM4.Lines.Count * 16) + 1;
  QRM5.Height := (QRM5.Lines.Count * 16) + 1;
  if (QRM1.Height > QRM2.Height) and (QRM1.Height > QRM3.Height) then
    wAux := QRM1
  else
    if (QRM2.Height > QRM3.Height) then
      wAux := QRM2
    else
      wAux := QRM3;
  QRM4.Top := wAux.Height + wAux.Top + 16;
  QRM5.Top := QRM4.Top;
  if (QRM4.Height > QRM5.Height) then
    wAux := QRM4
  else
    wAux := QRM5;
  QRBand5.Height := wAux.Top + wAux.Height;
end;

end.
