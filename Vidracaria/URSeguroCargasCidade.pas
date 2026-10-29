unit URSeguroCargasCidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRSeguroCargasCidade = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand6: TQRBand;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRBand4: TQRBand;
    QRDBText7: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText8: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText9: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSeguroCargasCidade: TFRSeguroCargasCidade;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

procedure TFRSeguroCargasCidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  FRSeguroCargasCidade := nil;
end;

end.
