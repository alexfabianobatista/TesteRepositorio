unit UROSManutencaoFormulario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFROSManutencaoFormulario = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLTitulo: TQRLabel;
    QRLEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel47: TQRLabel;
    QRDBText20: TQRDBText;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLNomeRel: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape15: TQRShape;
    QRLabel23: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel24: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel25: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel26: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape29: TQRShape;
    QRLabel29: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel31: TQRLabel;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRLabel32: TQRLabel;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRDBText17: TQRDBText;
    QRLabel45: TQRLabel;
    QRShape5: TQRShape;
    QRShape28: TQRShape;
    QRLabel28: TQRLabel;
    QRShape27: TQRShape;
    QRLabel27: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel46: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText21: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROSManutencaoFormulario: TFROSManutencaoFormulario;

implementation

uses UOSManutencao_cl, UROsManutencaoPeca;

{$R *.DFM}

procedure TFROSManutencaoFormulario.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  with QRCompositeReport1.Reports do
  begin
    Add(FROSManutencaoFormulario.QRPrimario);
    Add(FROsManutencaoPeca.QuickRep1);
  end;

end;

end.
