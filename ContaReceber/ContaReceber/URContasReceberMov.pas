unit URContasReceberMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContasReceberMov = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLTotalPrincipal: TQRLabel;
    QRLTotalBaixa: TQRLabel;
    QRLTotalDesconto: TQRLabel;
    QRLTotalJuro: TQRLabel;
    QRLabel12: TQRLabel;
    QRPeriodo: TQRLabel;
    QRLabel13: TQRLabel;
    QRLTotalPagtoJuro: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText9: TQRDBText;
    QRLCC: TQRLabel;
    QRDBText10: TQRDBText;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel18: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRSysData4: TQRSysData;
    QRGroup2: TQRGroup;
    QRLabel21: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand6: TQRBand;
    QRLabel22: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText13: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasReceberMov: TFRContasReceberMov;

implementation

uses UContasReceber_cl;

{$R *.DFM}

procedure TFRContasReceberMov.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  QRLTotalPrincipal.Caption:='0,00';
  QRLTotalBaixa.Caption:='0,00';
  QRLTotalDesconto.Caption:='0,00';
  QRLTotalJuro.Caption:='0,00';
  QRLTotalPagtoJuro.Caption:='0,00';

  with DMContasReceber do
  begin
    QRCReceber_MovTot.First;
    While not QRCReceber_MovTot.Eof do
      begin
        if QRCReceber_MovTotInd_Tipo_Movimento.Value='PRINCIPAL' then
          QRLTotalPrincipal.Caption:=FormatFloat('#,##0.00',QRCReceber_MovTotTotal.Value);
        if QRCReceber_MovTotInd_Tipo_Movimento.Value='RECEBTO. PRINCIPAL' then
          QRLTotalBaixa.Caption:=FormatFloat('#,##0.00',QRCReceber_MovTotTotal.Value);
        if QRCReceber_MovTotInd_Tipo_Movimento.Value='DESC. CONCEDIDO' then
          QRLTotalDesconto.Caption:=FormatFloat('#,##0.00',QRCReceber_MovTotTotal.Value);
        if QRCReceber_MovTotInd_Tipo_Movimento.Value='JUROS' then
          QRLTotalJuro.Caption:=FormatFloat('#,##0.00',QRCReceber_MovTotTotal.Value);
        if QRCReceber_MovTotInd_Tipo_Movimento.Value='RECEBTO. JUROS' then
          QRLTotalPagtoJuro.Caption:=FormatFloat('#,##0.00',QRCReceber_MovTotTotal.Value);
        QRCReceber_MovTot.Next;
      end;
  end;
end;

end.
