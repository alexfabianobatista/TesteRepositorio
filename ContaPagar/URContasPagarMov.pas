unit URContasPagarMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContasPagarMov = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLTotalPrincipal: TQRLabel;
    QRLTotalBaixa: TQRLabel;
    QRLTotalDesconto: TQRLabel;
    QRLTotalJuro: TQRLabel;
    QRLabel12: TQRLabel;
    QRPeriodo: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel15: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand5: TQRBand;
    QRLabel17: TQRLabel;
    QRExpr1: TQRExpr;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasPagarMov: TFRContasPagarMov;

implementation

uses UContasPagar_cl;

{$R *.DFM}

procedure TFRContasPagarMov.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  QRLTotalPrincipal.Caption:='0,00';
  QRLTotalBaixa.Caption:='0,00';
  QRLTotalDesconto.Caption:='0,00';
  QRLTotalJuro.Caption:='0,00';

  with DMContasPagar do
  begin
    QRCPagar_MovTot.First;
    While not QRCPagar_MovTot.Eof do
      begin
        if QRCPagar_MovTotInd_Tipo_Movimento.Value='PRINCIPAL' then
          QRLTotalPrincipal.Caption:=FormatFloat('#,##0.00',QRCPagar_MovTotTotal.Value);
        if QRCPagar_MovTotInd_Tipo_Movimento.Value='PGTO. PRINCIPAL' then
          QRLTotalBaixa.Caption:=FormatFloat('#,##0.00',QRCPagar_MovTotTotal.Value);
        if QRCPagar_MovTotInd_Tipo_Movimento.Value='DESCONTO' then
          QRLTotalDesconto.Caption:=FormatFloat('#,##0.00',QRCPagar_MovTotTotal.Value);
        if QRCPagar_MovTotInd_Tipo_Movimento.Value='PGTO. JUROS' then
          QRLTotalJuro.Caption:=FormatFloat('#,##0.00',QRCPagar_MovTotTotal.Value);
        QRCPagar_MovTot.Next;
      end;
  end;
end;

end.
