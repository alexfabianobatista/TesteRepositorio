unit URNotasES_MovEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNotasES_MovEstoque = class(TFTRelSimples)
    QRDetalhe: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QrlCadastro: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel8: TQRLabel;
    QRBand4: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLFilial: TQRLabel;
    QRLParceiro: TQRLabel;
    QRDBTextQtChegada: TQRDBText;
    QRLbQtChegada: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLSerie: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRLcnpj: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLDCO: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRNumFabricante: TQRLabel;
    QRExprItatiba: TQRExpr;
    QRDBTextQtPorM3: TQRDBText;
    QRExpr9: TQRExpr;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotasES_MovEstoque: TFRNotasES_MovEstoque;

implementation

uses URelatorioVenda_cl, UParamSistema_cl, UOracle_cl;

{$R *.DFM}

procedure TFRNotasES_MovEstoque.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ' then
  begin
    QRNumFabricante.Top := 4;
    QRDBText1.Top       := 25;
  end
  else
  begin
    QRNumFabricante.Top := 25;
    QRDBText1.Top       := 4;
  end;
end;

procedure TFRNotasES_MovEstoque.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ' then
  begin
    QRNumFabricante.Caption := DMOracle.BuscaNome('SELECT NUM_FABRICANTE FROM TB_PRODUTO ', 'COD_PRODUTO = ' + DMRelatorio_Venda.QRMovEstoqueCOD_PRODUTO.Text);
  end;
end;

procedure TFRNotasES_MovEstoque.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ITATIBA' then
  begin
    QRExpr7.Enabled := False;
    QRExpr5.Enabled := False;
    QRExprItatiba.Enabled := True;
    QRExprItatiba.Left := 590;
    QRExpr1.Left := 425;
  end;
end;

procedure TFRNotasES_MovEstoque.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ITATIBA' then
  begin
    QRLabel14.Enabled := False;
    QRLbQtChegada.Caption := 'Qt/m3';
    QRLbQtChegada.Left := 625;
    QRLabel16.Left := 571;
    QRLabel5.Left := 510;
    QRLabel15.Left := 445;
    QRLabel10.Left := 421;
  end;
end;

procedure TFRNotasES_MovEstoque.QRDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ITATIBA' then
  begin
    QRDBTextQtChegada.Enabled:= False;
    QRDBTextQtPorM3.Enabled := True;
    QRDBText12.Enabled := False;
    QRDBTextQtPorM3.Left := 620;
    QRDBText14.Left := 548;
    QRDBText6.Left := 465;
    QRDBText13.Left := 435;
    QRDBText9.Left := 411;
    QRDBText10.Width := 210;
  end;
end;

procedure TFRNotasES_MovEstoque.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ITATIBA' then
  begin
    QRExpr8.Enabled := False;
    QRExpr6.Enabled := False;
    QRExpr9.Enabled := True;
    QRExpr9.Left := 590;
    QRExpr3.Left := 425;
  end;
end;

end.
