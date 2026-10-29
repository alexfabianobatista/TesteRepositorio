unit URelPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRPrntr, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFRelPreview = class(TForm)
    Panel1: TPanel;
    SBImprimir: TSpeedButton;
    SBConfImpressora: TSpeedButton;
    CBImpressora: TComboBox;
    Panel2: TPanel;
    QRPreview: TQRPreview;
    CBZoom: TComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SBSair: TSpeedButton;
    SpeedButton6: TSpeedButton;
    procedure SBImprimirClick(Sender: TObject);
    procedure SBConfImpressoraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CBImpressoraChange(Sender: TObject);
    procedure CBZoomChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SBSairClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    fComprimentoPagina : Real;
    fLarguraPagina : Real;
  public
    { Public declarations }
    Property pLarguraPagina : Real Read fLarguraPagina Write fLarguraPagina;
    Property pComprimentoPagina : Real Read fComprimentoPagina Write fComprimentoPagina;
  end;

var
  FRelPreview: TFRelPreview;

implementation

{$R *.DFM}

procedure TFRelPreview.SBImprimirClick(Sender: TObject);
begin
  QRPreview.QRPrinter.Print;

end;

procedure TFRelPreview.FormActivate(Sender: TObject);
begin
  CBImpressora.Items.Clear;
  CBImpressora.Items := QRPreview.QRPrinter.Printers;
  CBImpressora.ItemIndex := QRPreview.QRPrinter.PrinterIndex;
  If CBZoom.ItemIndex < 0 Then
    CBZoom.ItemIndex := 5;
  Self.WindowState := wsMaximized;
end;


procedure TFRelPreview.CBZoomChange(Sender: TObject);
Var wValor : Integer;
begin
  Case CBZoom.ItemIndex of
    0 : QRPreview.Zoom := 200;
    1 : QRPreview.Zoom := 150;
    2 : QRPreview.Zoom := 100;
    3 : QRPreview.Zoom := 75;
    4 : QRPreview.Zoom := 50;
    5 : QRPreview.ZoomToWidth;
    6 : QRPreview.ZoomToFit;
    Else
    Try
      wValor := StrToInt(CBZoom.Text);
      If wValor > 9 Then
        QRPreview.Zoom := wValor;
    Except
    End;
  End;
end;

procedure TFRelPreview.SpeedButton1Click(Sender: TObject);
begin
  QRPreview.PageNumber := 1;
end;

procedure TFRelPreview.SpeedButton4Click(Sender: TObject);
begin
  QRPreview.PageNumber := QRPreview.QRPrinter.PageCount;
end;

procedure TFRelPreview.SpeedButton2Click(Sender: TObject);
begin
  If QRpreview.PageNumber > 1 Then
    QRPreview.PageNumber := QRPreview.PageNumber-1;
end;

procedure TFRelPreview.SpeedButton3Click(Sender: TObject);
begin
  If QRpreview.PageNumber < QRPreview.QRPrinter.PageCount Then
    QRPreview.PageNumber := QRPreview.PageNumber+1;
end;

procedure TFRelPreview.CBImpressoraChange(Sender: TObject);
begin
  QRPreview.QRPrinter.PrinterIndex := CBImpressora.ItemIndex;
  QRPreview.QRPrinter.FirstPage := 1;
  QRPreview.QRPrinter.LastPage := 9999;
  //QRPreview.QRPrinter.OnPrintSetup;
  //QRPreview.QRPrinter.PrinterIndex;
end;

procedure TFRelPreview.SpeedButton5Click(Sender: TObject);
begin
  ShowMessage('Impressora Setada!'+Chr(13)+Chr(13)
             +QRPreview.QRPrinter.Printers[ QRPreview.QRPrinter.PrinterIndex ] );
end;

procedure TFRelPreview.SBConfImpressoraClick(Sender: TObject);
begin
  QRPreview.QRPrinter.PrintSetup;
end;

procedure TFRelPreview.SBSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFRelPreview.SpeedButton6Click(Sender: TObject);
begin
  MessageDlg('Configuração do Driver da Impressora:'
          +#13+' Largura:'+FloatToStr(QRPreview.QRPrinter.PaperWidth)
          +#13+' Comprimento:'+FloatToStr(QRPreview.QRPrinter.PaperLength)
          +#13+#13+'Configuração necessária para este relatório:'
          +#13+'Largura:'+FloatToStr(pLarguraPagina)
          +#13+'Comprimento:'+FloatToStr(pComprimentoPagina),mtInformation, [mbOk], 0);
end;

procedure TFRelPreview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //FRelPreview.Free;
  // FRelPreview := Nil;
end;

end.
