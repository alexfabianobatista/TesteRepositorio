unit UREtiquetaConfirmadaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFREtiquetaConfirmadaEstoque = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBSummary: TQRBand;
    QRLabel14: TQRLabel;
    QRMUsuario: TQRMemo;
    QRMUsuarioPeso: TQRMemo;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRMUsuarioVolume: TQRMemo;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBSummaryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREtiquetaConfirmadaEstoque: TFREtiquetaConfirmadaEstoque;

implementation

uses URelatorioEstoque_cl,UBiblioteca;

{$R *.dfm}

procedure TFREtiquetaConfirmadaEstoque.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
VAR
wPeso : String;
begin
  inherited;
  with DMRelatorio_Estoque do
  Begin
    wPeso := copy(QREtiquetaConfirmadaEstoqueNUM_PESO_LIQUIDO.Text,1,2)+ copy(QREtiquetaConfirmadaEstoqueNUM_PESO_LIQUIDO.Text,4,2);
      if Length(wPeso) = 3 then
        wPeso := wPeso + '0';
      if Length(wPeso) = 2 then
        wPeso := wPeso + '00';

    QRLabel9.Caption := bib.StrZero(QREtiquetaConfirmadaEstoqueCOD_PESAGEM.Text,7) +
                        bib.StrZero(QREtiquetaConfirmadaEstoqueCOD_PRODUTO.Text,3) + wPeso;
  end;                      
end;

procedure TFREtiquetaConfirmadaEstoque.QRBSummaryBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
  procedure AdicionaStr(var Onde: String; OQue: String);
  begin
    Onde := Onde + Oque + #13 + #10;
  end;
var
  Usuarios, Volumes, Pesos: String;
  Altura, AlturaLinha, TotalVol: Integer;
  Total: Extended;
begin
  inherited;
  Usuarios := '';
  Pesos := '';
  Total := 0;
  TotalVol := 0;
  AlturaLinha := QRMUsuario.Height; //Altura de uma linha
  Altura := 0;
  with DMRelatorio_Estoque do
  begin
    QREtiqConfEstUsuario.First;
    while not QREtiqConfEstUsuario.Eof do
    begin
      AdicionaStr(Usuarios, QREtiqConfEstUsuarioUSUARIO.Value);
      AdicionaStr(Volumes, FormatFloat('#,##0', QREtiqConfEstUsuarioQT_VOLUME.Value));
      AdicionaStr(Pesos, FormatFloat('#,##0.00', QREtiqConfEstUsuarioQT_PESO.Value));

      TotalVol := TotalVol + Trunc(QREtiqConfEstUsuarioQT_VOLUME.Value);
      Total := Total + QREtiqConfEstUsuarioQT_PESO.Value;

      QREtiqConfEstUsuario.Next;
      Inc(Altura, AlturaLinha);
    end;
    AdicionaStr(Usuarios, Bib.Chars('-', 20));
    AdicionaStr(Volumes, Bib.Chars('-', 6));
    AdicionaStr(Pesos, Bib.Chars('-', 9));
    Inc(Altura, AlturaLinha);

    AdicionaStr(Usuarios, 'TOTAL');
    AdicionaStr(Volumes, FormatFloat('#,##0', TotalVol));
    AdicionaStr(Pesos, FormatFloat('#,##0.00', Total));
    Inc(Altura, AlturaLinha);
  end;
  QRBSummary.Height := QRBSummary.Height + Altura - AlturaLinha;
  QRMUsuario.Height := Altura;
  QRMUsuarioVolume.Height := Altura;
  QRMUsuarioPeso.Height := Altura;

  QRMUsuario.Lines.Text := Usuarios;
  QRMUsuarioVolume.Lines.Text := Volumes;
  QRMUsuarioPeso.Lines.Text := Pesos;
end;

end.
