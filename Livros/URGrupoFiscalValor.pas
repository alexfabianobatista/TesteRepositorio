unit URGrupoFiscalValor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRGrupoFiscalValor = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLIntervalo: TQRLabel;
    QRBand3: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRGrupoFiscalValor: TFRGrupoFiscalValor;

implementation

uses UGrupoFiscal_cl;

{$R *.dfm}

end.
