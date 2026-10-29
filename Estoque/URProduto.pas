unit URProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, Grids, DBGrids, QRExport,
  QRWebFilt, QRPDFFilt;

type
  TFRProdutos = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLPrecoAtacMin: TQRLabel;
    QRLPrecoVarMax: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLFilial: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBDescCodBarras: TQRDBText;
    QRLucro: TQRLabel;
    QRExpr1: TQRExpr;
    procedure FormCreate(Sender: TObject);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProdutos: TFRProdutos;

implementation

uses UProduto_cl, UParamSistema_cl, UProdutoRelatorio_cl;

{$R *.DFM}

procedure TFRProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa <> 'GARAGE280' then
  begin
    QRLPrecoAtacMin.Caption:='Preço '
      + Lowercase(DMParamSistema.QParamSistemaInd_Preco.value);
    QRLPrecoVarMax.Caption:='Preço '
      + Lowercase(DMParamSistema.QParamSistemaInd_Preco2.value);
  end;
end;

procedure TFRProdutos.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'GARAGE280' then
  begin
    QRDBDescCodBarras.Enabled := True;
    QRBand4.Height := 40;
  end;
  if (DMParamSistema.CodEmpresa = 'FRACTA') then
  begin
    QRDBText4.Enabled := false;
    QRDBText4.Visible := false;
    QRDBText8.Left := 485;
    QRDBText5.Left := 410;
    QRDBText6.Left := 540;
  end;
end;

procedure TFRProdutos.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'FRACTA') then
  begin
    QRLabel7.Enabled := false;
    QRLabel7.Visible := false;
    QRLabel11.Left := 516;
    QRLPrecoAtacMin.Left := 570;
    QRLabel8.Left := 408;
    QRLPrecoVarMax.Caption := 'Preço Var.';
  end;
end;

end.
