unit UREstoque_Posicao_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFREstoque_Posicao_Sintetico = class(TFTRelSimples)
    QRBDetail: TQRBand;
    QRDBTCodProduto: TQRDBText;
    QRDBTDescProduto: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLMarca: TQRLabel;
    QRLFilial: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREstoque_Posicao_Sintetico: TFREstoque_Posicao_Sintetico;

implementation

uses UEstoque_cl;

{$R *.DFM}

procedure TFREstoque_Posicao_Sintetico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  FREstoque_Posicao_Sintetico := nil;
end;

end.
