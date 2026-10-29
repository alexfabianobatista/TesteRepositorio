unit UREstoqueProducao2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFREstoqueProducao2 = class(TFTRelSimples)
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLTurno: TQRLabel;
    QRLLinha: TQRLabel;
    QRLParametros: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREstoqueProducao2: TFREstoqueProducao2;

implementation

uses UEstoque_cl;

{$R *.DFM}

end.
