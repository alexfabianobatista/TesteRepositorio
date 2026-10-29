unit URVendaVendedorCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRVendaVendedorCliente = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLbFilial: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRGroup1: TQRGroup;
    QRGFVendedor: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRLbClasse: TQRLabel;
    QRGroup2: TQRGroup;
    QRBFCadastro: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVendaVendedorCliente: TFRVendaVendedorCliente;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

procedure TFRVendaVendedorCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  FRVendaVendedorCliente := nil
end;

procedure TFRVendaVendedorCliente.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  If(DMRelatorio_Venda.QRVendaVendedorClienteSVAL_TOTAL.Value <> 0)Then
  Begin
    QRDBText3.Mask :=  '#,##0.00';
    QRDBText4.Mask :=  '#,##0.00';
  End
  Else
  Begin
    QRDBText3.Mask :=  '#,###.##';
    QRDBText4.Mask :=  '#,###.##';
  End;
end;

end.
