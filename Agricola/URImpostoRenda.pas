unit URImpostoRenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRAgricolaImpostoRenda = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRLCompra_Saida: TQRLabel;
    QRLCadastro: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRBand4: TQRBand;
    QRLabel34: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel35: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRExpr4: TQRExpr;
    QRCompositeReport1: TQRCompositeReport;
    QRBand5: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel16: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel38: TQRLabel;
    QRExpr6: TQRExpr;
    QRLEndereco: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRAgricolaImpostoRenda: TFRAgricolaImpostoRenda;

implementation

uses UImpostoRenda_Cl, URImpostoRenda_Insumos, URImpostoRenda_Financeiro,
  URImpostoRenda_Outros;

{$R *.DFM}

procedure TFRAgricolaImpostoRenda.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
{  If DMNotaEntrada.QRImpostoRendaIND_ENTRADA_SAIDA.Value = 'ENTRADAS' Then
     QRLCompra_Saida.Caption := 'Vendas de Produtos Agrícolas - Fixações'
  Else
     QRLCompra_Saida.Caption := 'Compras de Produtos Agrícolas - Insumos/Sementes';
 }
end;

procedure TFRAgricolaImpostoRenda.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRAgricolaImpostoRenda.QRPrimario);
  QRCompositeReport1.Reports.Add(FRImpostoRenda_Insumos.QRPrimario);
  QRCompositeReport1.Reports.Add(FRImpostoRenda_Financeiro.QRPrimario);
  QRCompositeReport1.Reports.Add(FRImpostoRenda_Outros.QRPrimario);
end;

end.
