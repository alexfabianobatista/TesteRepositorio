unit UREstoque_Posicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFREstoque_Posicao = class(TFTRelSimples)
    QRBDetail: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLFilial: TQRLabel;
    QRExpr1: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBTCodFilial: TQRLabel;
    QRDBTDescFilial: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBGoupFooter: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRExpr7: TQRExpr;
    QRLMarca: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREstoque_Posicao: TFREstoque_Posicao;

implementation

uses UEstoque_cl;

{$R *.DFM}

end.
