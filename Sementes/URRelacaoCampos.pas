unit URRelacaoCampos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRRelacaoCampos = class(TForm)
    QRPrimario: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText17: TQRDBText;
    QrLinh19: TQRShape;
    QRLabel8: TQRLabel;
    QRLinha13: TQRShape;
    QRLinha14: TQRShape;
    QrLinha16: TQRShape;
    QrLinha18: TQRShape;
    QRLinha15: TQRShape;
    QRLinha12: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel10: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText18: TQRDBText;
    QRLDT_Emissao: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel14: TQRLabel;
    QRLinha11: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QrLinha17: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRBand1: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLinha10: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QrLinha1: TQRShape;
    QRLinha2: TQRShape;
    QRLinha3: TQRShape;
    QRLinha4: TQRShape;
    QRLinha5: TQRShape;
    QRLinha6: TQRShape;
    QRLinha7: TQRShape;
    QRLinha8: TQRShape;
    QRLinha9: TQRShape;
    QrLinha20: TQRShape;
    QRLinha21: TQRShape;
    QRDBText13: TQRDBText;
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRelacaoCampos: TFRRelacaoCampos;

implementation

uses UCampoPlantio_cl, UrRelacaoCampos_Anexo;

{$R *.DFM}


procedure TFRRelacaoCampos.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (DMCampoPlantio.QRRelacaoCamposDT_Cancelamento.Text <> '') or
 (DMCampoPlantio.QRRelacaoCamposDesc_Motivo.Text <> '')  then
  begin
//    QRShape17.enabled:=true;
    QRLinha10.enabled:=true;
  end
  else
  begin
//    QRShape17.enabled:=False;
    QRLinha10.enabled:=False;
//    DetailBand1.enabled:=True;
  end;
end;

end.
