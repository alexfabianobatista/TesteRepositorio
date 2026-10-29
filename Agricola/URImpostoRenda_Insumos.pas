unit URImpostoRenda_Insumos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRImpostoRenda_Insumos = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRBand4: TQRBand;
    QRLabel21: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand5: TQRBand;
    QRLabel3: TQRLabel;
    QRLCadastro: TQRLabel;
    QRLEndereco: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRImpostoRenda_Insumos: TFRImpostoRenda_Insumos;

implementation

uses UImpostoRenda_cl;

{$R *.DFM}

end.
