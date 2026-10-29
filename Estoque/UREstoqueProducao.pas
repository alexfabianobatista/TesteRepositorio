unit UREstoqueProducao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFREstoqueProducao = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    SummaryBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLParametros: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand3: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREstoqueProducao: TFREstoqueProducao;

implementation

uses UEstoque_cl, UREstoqueProducao2;

{$R *.DFM}

procedure TFREstoqueProducao.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FREstoqueProducao.QRPrimario);
  QRCompositeReport1.Reports.Add(FREstoqueProducao2.QRPrimario);  
end;

end.
