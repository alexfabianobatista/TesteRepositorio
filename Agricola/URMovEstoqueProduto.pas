unit URMovEstoqueProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRMovEstoqueProduto = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    DetailBand1: TQRBand;
    QRBand3: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRGroup2: TQRGroup;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRLParceiro: TQRLabel;
    QRLabel10: TQRLabel;
    QRLFilial: TQRLabel;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMovEstoqueProduto: TFRMovEstoqueProduto;

implementation

uses UEstoque_cl;

{$R *.DFM}

procedure TFRMovEstoqueProduto.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
//  if DMEstoque.QRMovEstoqueProdutoDESCRICAO.Value <> 'PARCERIA' then
//  begin
//    QRLabel10.Enabled := true;
    QRLabel10.Caption := FormatFloat('#,##0.00', QRExpr4.Value.dblResult - QRExpr5.Value.dblResult);
//  end
//  else
//  begin
//    QRLabel10.Enabled := false;
//  end;
end;

end.
