unit URCadastro_Cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRCadastro_Cliente = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLVendedor: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText9: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRBand4: TQRBand;
    QRLabel14: TQRLabel;
    QRLTotal: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel16: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabelN: TQRLabel;
    QRLData: TQRLabel;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCadastro_Cliente: TFRCadastro_Cliente;
  wQt_Clientes : Integer;

implementation

uses UCadastro_Rel_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRCadastro_Cliente.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLTotal.Caption := FloatToStr(wQt_Clientes);
end;

procedure TFRCadastro_Cliente.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  Inc(wQt_Clientes);
end;

procedure TFRCadastro_Cliente.FormActivate(Sender: TObject);
begin
  inherited;
  wQt_Clientes := 0;
end;

procedure TFRCadastro_Cliente.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wQt_Clientes := 0;
end;

procedure TFRCadastro_Cliente.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL') or
      (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE')) then
    QRSubDetail1.Enabled := true;
end;

procedure TFRCadastro_Cliente.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RACOESIGUA' then
  begin
    QRLabel3.Enabled := False;
    QRDBText9.Enabled := False;
    QRDBText8.DataField := 'DESC_INSCRICAO_MUNICIPAL';
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'NEOALI' then //aparecer e-mail no relat. Solicitado por Liara/Suellen Junior -16/10/2017
  begin
    QRLabel15.Caption := 'Email:';
    QRDBText13.DataField := 'DESC_E_MAIL';
    QRDBText13.AutoSize := True;
    QRLabel16.Enabled := False; //prazo
    QRDBText14.Enabled := False; //prazo
  end;
  if DMParamSistema.CodEmpresa = 'JORNAL' then
  begin
    QRLabel15.Caption := 'Vcto:';
    QRDBText13.DataField := 'DT_VENCIMENTO_TABELA_PRECO';
    QRDBText13.AutoSize := True;
    QRDBText12.DataField := 'N_VENDEDOR';
    QRLabel16.Enabled := False; //prazo
    QRDBText14.Enabled := False; //prazo
  end;
end;

end.
