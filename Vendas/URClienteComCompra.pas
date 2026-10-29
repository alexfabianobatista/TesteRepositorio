unit URClienteComCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRClienteComCompra = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLVendedor: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRLClasse: TQRLabel;
    QRBand4: TQRBand;
    QRLTipoCadastro: TQRLabel;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRSysData4: TQRSysData;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRExpr3: TQRExpr;
    QRLProduto: TQRLabel;
    QRLRegiao: TQRLabel;
    procedure QRPrimarioAfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRClienteComCompra: TFRClienteComCompra;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

procedure TFRClienteComCompra.QRPrimarioAfterPrint(Sender: TObject);
begin
  inherited;
  DMRelatorio_Venda.QRClienteComCompra.close;
end;

end.
