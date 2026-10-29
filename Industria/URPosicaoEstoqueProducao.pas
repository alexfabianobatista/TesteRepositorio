unit URPosicaoEstoqueProducao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, QRExport, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRPosicaoEstoqueProducao = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLPeriodo: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPosicaoEstoqueProducao: TFRPosicaoEstoqueProducao;

implementation

uses UFormula_cl, UOrdemProducao_cl, UOracle_cl;

{$R *.DFM}

end.
