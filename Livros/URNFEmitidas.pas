unit URNFEmitidas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRNF_Emitidas = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand4: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRLFilial: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText5: TQRDBText;
    QRExpr3: TQRExpr;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNF_Emitidas: TFRNF_Emitidas;

implementation

uses ULivroFiscal_Cl;

{$R *.DFM}

end.
