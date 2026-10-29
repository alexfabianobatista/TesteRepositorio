unit URPisCofinsOperacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, StdCtrls;

type
  TFRPisCofinsOperacao = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel8: TQRLabel;
    QRCompositeReport1: TQRCompositeReport;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPisCofinsOperacao: TFRPisCofinsOperacao;

implementation

uses USpedRel_cl, URPisCofinsNota, URPisCofinsCST;

{$R *.dfm}

procedure TFRPisCofinsOperacao.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRPisCofinsOperacao.QRPrimario);
  QRCompositeReport1.Reports.Add(FRPisCofinsNota.QRPrimario);
  QRCompositeReport1.Reports.Add(FRPisCofinsCST.QRPrimario);
end;

end.
