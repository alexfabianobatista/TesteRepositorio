unit URFichaEquipamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRFichaEquipamento = class(TFTRelSimples)
    v: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    c: TQRLabel;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFichaEquipamento: TFRFichaEquipamento;

implementation

uses UEquipamento_cl, URFichaEquipamentoItem, URFichaEquipamentoPeca;

{$R *.DFM}

procedure TFRFichaEquipamento.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRFichaEquipamento.QRPrimario);
  QRCompositeReport1.Reports.Add(FRFichaEquipamentoItem.QRPrimario);
 // QRCompositeReport1.Reports.Add(FRFichaEquipamentoPeca.QRPrimario);
end;

end.
