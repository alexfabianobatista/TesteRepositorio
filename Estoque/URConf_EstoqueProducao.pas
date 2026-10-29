unit URConf_EstoqueProducao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRConf_EstoqueProducao = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLFilial: TQRLabel;
    QRLProduto: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLClasse: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRConf_EstoqueProducao: TFRConf_EstoqueProducao;

implementation

uses URelatorioEstoque_cl;

{$R *.DFM}

end.
