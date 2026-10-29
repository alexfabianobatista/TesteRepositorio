unit URNotasOperacao2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRNotasOperacao2 = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRBTotOper: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText10: TQRDBText;
    QRLFilial: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel6: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotasOperacao2: TFRNotasOperacao2;

implementation

uses ULivroFiscal_Cl, URNotasOperacaoResumo;

{$R *.DFM}

end.
