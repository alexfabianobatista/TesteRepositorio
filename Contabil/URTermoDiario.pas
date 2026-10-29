unit URTermoDiario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRTermoDiario = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLOrgao: TQRLabel;
    QRLNumInscricao: TQRLabel;
    QRBand3: TQRBand;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape1: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRShape2: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBTFuncao: TQRDBText;
    QRDBText12: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTermoDiario: TFRTermoDiario;

implementation

uses UTermoAbertura_cl;

{$R *.dfm}

end.
