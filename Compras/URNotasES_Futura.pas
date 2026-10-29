unit URNotasES_Futura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNotasES_Futura = class(TFTRelSimples)
    QRBDetalhe: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLFilial: TQRLabel;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRExpr5: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRExpr6: TQRExpr;
    QRLVendedor: TQRLabel;
    QRExpr7: TQRExpr;
    QRLClasse: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText11: TQRDBText;
    QRBand4: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotasES_Futura: TFRNotasES_Futura;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
