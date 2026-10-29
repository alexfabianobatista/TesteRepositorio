unit URContrato_Arroz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFrContrato_Arroz = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRSubDetail1: TQRSubDetail;
    QRDBText9: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLValor: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRLSaldo_Valor: TQRLabel;
    QRLabel14: TQRLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrContrato_Arroz: TFrContrato_Arroz;
  Var wValor_Saldo : Real;

implementation

uses UContrato_cl;

{$R *.DFM}

procedure TFrContrato_Arroz.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  Var wValor : Real;
begin
  inherited;
{  With DmContrato do
  Begin
    if QRContrato_Arroz_ItemQT_QUANTIDADE.Value > 0 Then
     Begin
      wValor := QRContrato_Arroz_ItemQT_QUANTIDADE.Value * QRContrato_Arroz_Itemval_unitario.Value / QRContrato_Arroz_ItemEmbalagem.Value;
      WValor := wValor - (wValor * QRContrato_ArrozPERC_FUNRURAL.Value / 100);
      QRLValor.Caption := FormatFloat('#,###,###0.00',wValor);
      wValor_Saldo := wValor_Saldo - wValor;
      QRLSaldo_Valor.Caption := FormatFloat('#,###,###0.00',wValor_Saldo);
     End
    Else
     Begin
      QRLValor.Caption := '0';
      QRLSaldo_Valor.Caption := FormatFloat('#,###,###0.00',wValor_Saldo);
     End;
  End;  }
end;

procedure TFrContrato_Arroz.QRGroup1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
{  With DMContrato do
  Begin
    wValor_Saldo := (QRContrato_ArrozQUANTIDADE_CONTRATO.Value * QRContrato_ArrozVL_PRECO_SACA.Value / QRContrato_ArrozNUM_EMBALAGEM.Value )
                    - (QRContrato_ArrozQUANTIDADE_CONTRATO.Value * QRContrato_ArrozVL_PRECO_SACA.Value / QRContrato_ArrozNUM_EMBALAGEM.Value * QRContrato_ArrozPERC_FUNRURAL.Value / 100);
  End;  } 
end;

end.
