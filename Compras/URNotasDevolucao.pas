unit URNotasDevolucao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRNotasDevolucao = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLOperacao: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLSupervisor: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotasDevolucao: TFRNotasDevolucao;

implementation

uses URelatorio_Compra_cl;

{$R *.DFM}

end.
