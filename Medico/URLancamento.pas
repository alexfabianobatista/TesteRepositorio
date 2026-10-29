unit URLancamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRLancamento = class(TFTRelSimples)
    QRGroupMes: TQRGroup;
    QRDBQuebra: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRBandFooter: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLData_I: TQRLabel;
    QRLabel12: TQRLabel;
    QRLData_F: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRLDtQuebra: TQRLabel;
    QRDBDtQuebra: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRLancamento: TFRLancamento;

implementation

uses ULancamento_cl;

{$R *.dfm}

end.
