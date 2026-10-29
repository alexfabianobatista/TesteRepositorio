unit URClienteComCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRClienteComCompra = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLVendedor: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRLClasse: TQRLabel;
    QRBand4: TQRBand;
    QRSysData3: TQRSysData;
    QRLabel8: TQRLabel;
    QRLTipoCadastro: TQRLabel;
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
