unit UROrdemServico_Entrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TFROrdemServico_Entrada = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRMEquipamento: TQRMemo;
    QRLabel7: TQRLabel;
    QRMManutencao: TQRMemo;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape1: TQRShape;
    QRDBText10: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioAfterPrint(Sender: TObject);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemServico_Entrada: TFROrdemServico_Entrada;

implementation

uses UOrdemServico_cl, URelPreview;

{$R *.DFM}

procedure TFROrdemServico_Entrada.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With DMOrdemServico do
  Begin
    QRMEquipamento.Lines.Text := QREntradaDesc_Equipamento.Value ;
    QRMManutencao.Lines.Text := QREntradaDesc_Solicitacao.Text;
  end;
end;

procedure TFROrdemServico_Entrada.QRPrimarioAfterPrint(Sender: TObject);
begin
  (*
  If FRelPreview = Nil Then
    FRelPreview := TFRelPreview.Create(Application);
  FRelPreview.QRPreview.QRPrinter := QRPrimario.QRPrinter;
  FRelPreview.Show;
  *)
end;

procedure TFROrdemServico_Entrada.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  QRPrimario.QRPrinter.PaperSize := QRPrimario.Page.PaperSize;
  QRPrimario.QRPrinter.PaperLength := Round(QRPrimario.Page.Length);
  QRPrimario.QRPrinter.PaperWidth := Round(QRPrimario.Page.Width);
end;

end.
 