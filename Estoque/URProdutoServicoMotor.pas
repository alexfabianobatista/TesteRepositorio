unit URProdutoServicoMotor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRProdutoServicoMotor = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLMarca: TQRLabel;
    QRLabel4: TQRLabel;
    QRLProduto: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLCusto: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    DBTDescProduto: TQRDBText;
    QRDBText5: TQRDBText;
    DBTValCusto: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProdutoServicoMotor: TFRProdutoServicoMotor;

implementation

uses UProdutoRelatorio_cl;

{$R *.dfm}

end.
