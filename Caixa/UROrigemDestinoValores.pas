unit UROrigemDestinoValores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, grimgctrl;

type
  TFROrigemDestinoValores = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLFilial: TQRLabel;
    QRLDataRef: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRBand2: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRHRule1: TQRHRule;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrigemDestinoValores: TFROrigemDestinoValores;

implementation

uses UCaixaRel_cl, UROrigemDestinoValoresHoje, UROrigemDestinoValoresFinal,
  URRazaoPagamentos;

{$R *.dfm}

procedure TFROrigemDestinoValores.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  QRCompositeReport1.Reports.Add(FROrigemDestinoValores.QuickRep1);
  QRCompositeReport1.Reports.Add(FROrigemDestinoValoresHoje.QuickRep1);
  QRCompositeReport1.Reports.Add(FROrigemDestinoValoresFinal.QuickRep1);
  QRCompositeReport1.Reports.Add(FRRazaoPagamentos.QuickRep1);
end;

end.
