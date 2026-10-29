unit URComissaoTecnico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRComissaoTecnico = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRBand4: TQRBand;
    QRLabel13: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRGFTotalTecnico: TQRBand;
    QRLabel15: TQRLabel;
    QRGCabVendedor: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText15: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand5: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel4: TQRLabel;
    QRCompositeReport1: TQRCompositeReport;
    QRLabel16: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    procedure QRGCabVendedorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGFTotalTecnicoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRComissaoTecnico: TFRComissaoTecnico;

implementation

uses URelatorioVenda_cl, UParamSistema_cl, URComissaoVendedor;

{$R *.dfm}

procedure TFRComissaoTecnico.QRGCabVendedorBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'REFRISM') then
    QRLabel3.Caption := 'Vendedor';
end;

procedure TFRComissaoTecnico.QRGFTotalTecnicoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'REFRISM') then
    QRLabel15.Caption := 'Vendedor';
end;

procedure TFRComissaoTecnico.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'REFRISM') then
    QRLabel14.Caption := 'Total Geral Vendedor';
end;

procedure TFRComissaoTecnico.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'REFRISM') then
    QRLTitulo.Caption := 'Comissão de Vendedores';
end;

procedure TFRComissaoTecnico.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'NFCE-IVO') then
  begin
    if (DMRelatorio_Venda.QRComissaoTecnicoOBS_NOTA.Value <> '') then
      QRBand4.Height := 40
    else
      QRBand4.Height := 20;
  end;
end;

end.
