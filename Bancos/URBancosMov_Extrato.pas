unit URBancosMov_Extrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QRExport, QRWebFilt, QRPDFFilt, QuickRpt,
  ExtCtrls;

type
  TFRBancosMov_Extrato = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    DbCredito: TQRDBText;
    DbDebito: TQRDBText;
    DbSaldo: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRGroup2: TQRGroup;
    QRBand4: TQRBand;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBancosMov_Extrato: TFRBancosMov_Extrato;

implementation

uses UBancoAgenciaRel_cl;

{$R *.dfm}

procedure TFRBancosMov_Extrato.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  DbCredito.Enabled := not ((DMBancoAgenciaRel.CdRExtratoVAL_CREDITO.IsNull) or (DMBancoAgenciaRel.CdRExtratoVAL_CREDITO.Value = 0));
  DbDebito.Enabled := not ((DMBancoAgenciaRel.CdRExtratoVAL_DEBITO.IsNull) or (DMBancoAgenciaRel.CdRExtratoVAL_DEBITO.Value = 0));

  if ((DMBancoAgenciaRel.CdRExtratoIND_TIPO_REGISTRO.AsInteger = 0) or (DMBancoAgenciaRel.CdRExtratoIND_TIPO_REGISTRO.AsInteger = 2)) then
  begin
    QRDBText1.Font.Style := QRDBText1.Font.Style + [fsBold];
    QRDBText2.Font.Style := QRDBText2.Font.Style + [fsBold];
    QRDBText3.Font.Style := QRDBText3.Font.Style + [fsBold];
    DbSaldo.Font.Style := DbSaldo.Font.Style + [fsBold];
  end
  else
  begin
    QRDBText1.Font.Style := QRDBText1.Font.Style - [fsBold];
    QRDBText2.Font.Style := QRDBText2.Font.Style - [fsBold];
    QRDBText3.Font.Style := QRDBText3.Font.Style - [fsBold];
    DbSaldo.Font.Style := DbSaldo.Font.Style - [fsBold];
  end;
end;

end.
