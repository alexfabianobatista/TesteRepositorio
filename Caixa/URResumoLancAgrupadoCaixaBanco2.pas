unit URResumoLancAgrupadoCaixaBanco2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRResumoLancAgrupadoCaixaBanco2 = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLTitulo: TQRLabel;
    QRLEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRLDepartamento: TQRLabel;
    QRShape1: TQRShape;
    QRLFilial: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLNomeRel: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel4: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRResumoLancAgrupadoCaixaBanco2: TFRResumoLancAgrupadoCaixaBanco2;

implementation

uses UCaixaRel_cl;

{$R *.DFM}

end.
