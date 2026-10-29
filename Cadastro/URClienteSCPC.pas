unit URClienteSCPC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls;

type
  TFRClienteSCPC = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRLPeriodo: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRClienteSCPC: TFRClienteSCPC;

implementation

uses UCadastro_cl;

{$R *.dfm}

procedure TFRClienteSCPC.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if Trim(DMCadastro.QRClienteSCPCDESC_COMPRADOR_AUTORIZADO.Text) <> '' then
  begin
    QRLabel9.Visible := true;
    QRLabel10.Visible := true;
    QRDBText8.Visible := true;
    QRDBText9.Visible := true;
    QRBand3.Height := 37;
  end
  else
  begin
    QRLabel9.Visible := false;
    QRLabel10.Visible := false;
    QRDBText8.Visible := false;
    QRDBText9.Visible := false;
    QRBand3.Height := 18;
  end;
end;

end.
