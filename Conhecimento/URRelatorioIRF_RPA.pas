unit URRelatorioIRF_RPA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRRelatorioIRF_RPA = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand5: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel6: TQRLabel;
    QRExpr4: TQRExpr;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRelatorioIRF_RPA: TFRRelatorioIRF_RPA;

implementation

uses URPA_cl;

{$R *.DFM}

procedure TFRRelatorioIRF_RPA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  FRRelatorioIRF_RPA := nil;
end;

end.
