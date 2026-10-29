unit URQuotaSupervisorVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRQuotaSupervisorVendedor = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGSupervisor: TQRGroup;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLFilial: TQRLabel;
    QRLProduto: TQRLabel;
    QRLabel6: TQRLabel;
    QRLSupervisor: TQRLabel;
    QRLabel8: TQRLabel;
    QRLVendedor: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRGProduto: TQRGroup;
    QRBand5: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QREQuotaPadrao: TQRExpr;
    QREQuotaKG: TQRExpr;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRExpr5: TQRExpr;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRQuotaSupervisorVendedor: TFRQuotaSupervisorVendedor;
  TotalVendedores: Extended;
  TotalVendedoresKG: Extended;

implementation

uses UVendedor_cl;

{$R *.dfm}

procedure TFRQuotaSupervisorVendedor.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  TotalVendedores := 0;
  TotalVendedoresKG := 0;
end;

procedure TFRQuotaSupervisorVendedor.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  TotalVendedores := TotalVendedores + DMVendedor.QRQuotaSupervisorVendedorPADRAO_VENDEDOR.Value;
  TotalVendedoresKG := TotalVendedoresKG + DMVendedor.QRQuotaSupervisorVendedorKG_VENDEDOR.Value;
end;

procedure TFRQuotaSupervisorVendedor.QRBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  val: Extended;
begin
  inherited;
  //ISSO AQUI É GAMBIARRA... MAS NAO ENCONTREI OUTRO JEITO DE FAZER. DIEGO A. S. 29/10/2010
  QREQuotaPadrao.Font.Style := QREQuotaPadrao.Font.Style - [fsBold];
  QREQuotaKG.Font.Style := QREQuotaKG.Font.Style - [fsBold];

  val := DMVendedor.QRQuotaSupervisorVendedorPADRAO_SUPERVISOR.Value - TotalVendedores;
  if StrToFloat(FormatFloat('#0.00', val)) < 0 then
    QREQuotaPadrao.Font.Style := QREQuotaPadrao.Font.Style + [fsBold];

  val := DMVendedor.QRQuotaSupervisorVendedorKG_SUPERVISOR.Value - TotalVendedoresKG;
  if StrToFloat(FormatFloat('#0.00', val)) < 0 then
    QREQuotaKG.Font.Style := QREQuotaKG.Font.Style + [fsBold];

  TotalVendedores := 0;
  TotalVendedoresKG := 0;
end;

end.
