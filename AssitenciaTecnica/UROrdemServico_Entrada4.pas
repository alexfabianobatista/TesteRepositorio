unit UROrdemServico_Entrada4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl, StdCtrls, DBCtrls;

type
  TFROrdemServico_Entrada4 = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape1: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRHRule69: TQRHRule;
    QRHRule70: TQRHRule;
    QRHRule71: TQRHRule;
    QRHRule72: TQRHRule;
    QRHRule73: TQRHRule;
    QRHRule74: TQRHRule;
    QRHRule75: TQRHRule;
    QRHRule76: TQRHRule;
    QRHRule77: TQRHRule;
    QRHRule78: TQRHRule;
    QRHRule79: TQRHRule;
    QRHRule80: TQRHRule;
    QRLabel16: TQRLabel;
    QRHRule81: TQRHRule;
    QRHRule25: TQRHRule;
    QRHRule26: TQRHRule;
    QRHRule27: TQRHRule;
    QRHRule28: TQRHRule;
    QRHRule29: TQRHRule;
    QRHRule30: TQRHRule;
    QRHRule31: TQRHRule;
    QRHRule32: TQRHRule;
    QRHRule37: TQRHRule;
    QRHRule38: TQRHRule;
    QRHRule39: TQRHRule;
    QRHRule40: TQRHRule;
    QRHRule44: TQRHRule;
    QRHRule43: TQRHRule;
    QRHRule42: TQRHRule;
    QRHRule41: TQRHRule;
    QRHRule48: TQRHRule;
    QRHRule47: TQRHRule;
    QRHRule46: TQRHRule;
    QRHRule45: TQRHRule;
    QRHRule52: TQRHRule;
    QRHRule51: TQRHRule;
    QRHRule50: TQRHRule;
    QRHRule49: TQRHRule;
    QRHRule33: TQRHRule;
    QRHRule34: TQRHRule;
    QRHRule35: TQRHRule;
    QRHRule36: TQRHRule;
    QRHRule53: TQRHRule;
    QRHRule54: TQRHRule;
    QRHRule55: TQRHRule;
    QRHRule56: TQRHRule;
    QRHRule57: TQRHRule;
    QRHRule58: TQRHRule;
    QRHRule59: TQRHRule;
    QRHRule60: TQRHRule;
    QRHRule61: TQRHRule;
    QRHRule62: TQRHRule;
    QRHRule63: TQRHRule;
    QRHRule64: TQRHRule;
    QRLabel15: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText11: TQRDBText;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemServico_Entrada4: TFROrdemServico_Entrada4;

implementation
uses UOrdemServico_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFROrdemServico_Entrada4.FormCreate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.codempresa = 'PATELI') then
  begin
    QRLabel15.Enabled := True;
    QRLabel17.Enabled := True;
    QRLabel18.Enabled := True;
    QRDBText9.Enabled := True;
    QRDBText10.Enabled := True;
    QRDBText11.Enabled := True;
  end;
end;

end.
