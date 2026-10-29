unit URChequePDatadoPendente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRChequePDatadoPendente = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRBand5: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRLComplemento: TQRLabel;
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRChequePDatadoPendente: TFRChequePDatadoPendente;

implementation

uses UBancoAgencia_cl, UBancoAgenciaRel_cl;

{$R *.DFM}

procedure TFRChequePDatadoPendente.QRBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  with DMBancoAgenciaRel do
       QRLComplemento.Caption:= Trim(QRChequePDatadoPendenteDESC_OBSERVACAO.Text) + ' - '+ Trim(QRChequePDatadoPendenteDESC_COMPLEMENTO1.Text);
end;

end.
