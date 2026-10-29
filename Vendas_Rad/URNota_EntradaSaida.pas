unit URNota_EntradaSaida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_EntradaSaida = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRLDescricao: TQRLabel;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRLFilial: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRExpr5: TQRExpr;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_EntradaSaida: TFRNota_EntradaSaida;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

procedure TFRNota_EntradaSaida.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DMRelatorio_Venda do
    QRLDescricao.Caption := Trim(QRMovEntradaSaidaDesc_Produto.Value) + '-' + Trim(QRMovEntradaSaidaDesc_Lote.Value);
end;

end.
