unit UREmbarque2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFREmbarque2 = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRBRodPedido: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText10: TQRDBText;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QrDescricao: TQRLabel;
    QRLabel13: TQRLabel;
    QrNrPedidos: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText11: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText12: TQRDBText;
    QRExpr4: TQRExpr;
    QRGroup2: TQRGroup;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRBand5: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREmbarque2: TFREmbarque2;

implementation

uses UEmbarque_cl;

{$R *.DFM}

procedure TFREmbarque2.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DmEmbarque do
  Begin
    QrDescricao.Caption := Trim(QrEmbarque2Desc_Produto.Value) + '-'+Trim(QrEmbarque2Desc_Lote.Value);
  End;
end;

procedure TFREmbarque2.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QrNrPedidos.Caption := '';
end;

end.
