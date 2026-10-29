unit URNota_EntradaSaidaRetrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRNota_EntradaSaidaRetrato = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRLClasse: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRLDescricao: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel3: TQRLabel;
    QRLCadastro: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr4: TQRExpr;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_EntradaSaidaRetrato: TFRNota_EntradaSaidaRetrato;

implementation

uses URelatorioVenda_cl;

{$R *.dfm}

procedure TFRNota_EntradaSaidaRetrato.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  With DMRelatorio_Venda do
    //QRLDescricao.Caption := Trim(QRMovEntradaSaidaDesc_Produto.Value) + '-' + Trim(QRMovEntradaSaidaDesc_Lote.Value);
    QRLDescricao.Caption := Trim(QRMovEntradaSaidaDesc_Produto.Value);
end;

end.
