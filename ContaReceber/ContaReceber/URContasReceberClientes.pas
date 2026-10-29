unit URContasReceberClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContasReceber_Clientes = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRBCReceberCab: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    GHBCReceberMov: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRSDCPagarMov: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    GHBCReceberNota: TQRBand;
    QRLabel10: TQRLabel;
    QRSDCReceberMovNota: TQRSubDetail;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr3: TQRExpr;
    QRBand4: TQRBand;
    QRLabel17: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRLPeriodo: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText13: TQRDBText;
    QRLDepartamento: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRExpr5: TQRExpr;
    QRChildBand1: TQRChildBand;
    QRDBText7: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    procedure QRPrimarioAfterPreview(Sender: TObject);
    procedure QRBCReceberCabAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasReceber_Clientes: TFRContasReceber_Clientes;

implementation

uses UContasReceber_cl, UOracle_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRContasReceber_Clientes.QRPrimarioAfterPreview(
  Sender: TObject);
begin
  inherited;
  If DMOracle.DBCemapa.InTransaction then
    begin
      DMOracle.DBCemapa.Rollback;
    end;
end;

procedure TFRContasReceber_Clientes.QRBCReceberCabAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  If Trim(DMContasReceber.QRContasReceber_CabDesc_Observacao.Text) <> '' Then
     QRChildBand1.Enabled := True
  Else
     QRChildBand1.Enabled := False;

end;

procedure TFRContasReceber_Clientes.FormCreate(Sender: TObject);
begin
  inherited;
  //pedido pelo Fernando, pois esse relatório é enviado aos clientes
  //não mostrar a classificacao do cadastro do cliente
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GONZATTI' then
    QRDBText16.Enabled := false;
end;

end.
