unit UREstoqueInventarioMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, StdCtrls;

type
  TFREstoqueInventarioMes = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRLFilial: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRLSituacao: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLTipoProduto: TQRLabel;
    QRExpr3: TQRExpr;
    QRLPagina: TQRLabel;
    procedure QRPrimarioAfterPrint(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    wPagina : integer;
  end;

var
  FREstoqueInventarioMes: TFREstoqueInventarioMes;

implementation

uses UInventarioMes_cl, UEstoque_cl;

{$R *.dfm}

procedure TFREstoqueInventarioMes.QRPrimarioAfterPrint(Sender: TObject);
begin
  inherited;
  FREstoqueInventarioMes.QRExpr2.Free;
  FREstoqueInventarioMes.QRExpr3.Free;
end;

procedure TFREstoqueInventarioMes.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLPagina.Caption := IntToStr(wPagina);
end;

procedure TFREstoqueInventarioMes.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  Inc(wPagina);
end;

procedure TFREstoqueInventarioMes.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wPagina := DMEstoque.pNrPagina;
end;

end.
