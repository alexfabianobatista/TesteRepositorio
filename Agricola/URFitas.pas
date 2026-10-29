unit URFitas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt,
  QrPrntr;

type
  TFRFitas = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel11: TQRLabel;
    QRLTotalPositivo: TQRLabel;
    QRLTotalNegativo: TQRLabel;
    QRLTotalEstragado: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    wTotalPositivo: double;
    wTotalNegativo: double;
    wTotalEstragado: double;
  public
    { Public declarations }
    property TotalPositivo: double read wTotalPositivo write wTotalPositivo;
    property TotalNegativo: double read wTotalNegativo write wTotalNegativo;
    property TotalEstragado: double read wTotalEstragado write wTotalEstragado;
  end;

var
  FRFitas: TFRFitas;

implementation

uses URomaneioAgricola_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRFitas.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INOVAR' then
    QRLabel9.Caption := 'DECLARADA';
  QRLTotalPositivo.Caption := FormatFloat('#,##0.00', TotalPositivo);
  QRLTotalNegativo.Caption := FormatFloat('#,##0.00', TotalNegativo);
  QRLTotalEstragado.Caption := FormatFloat('#,##0.00', TotalEstragado);
end;

procedure TFRFitas.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  with DMRomaneioAgricola do
  begin
  if QRPrimario.QRPrinter.Destination <> qrdPrinter then
    begin
      if QRFitasIND_RESULTADO.Value = 'POSITIVO' then
        TotalPositivo := TotalPositivo + QRFitaspeso_liquido.Value;
      if QRFitasIND_RESULTADO.Value = 'NEGATIVO' then
        TotalNegativo := TotalNegativo + QRFitaspeso_liquido.Value;
      if (QRFitasIND_RESULTADO.Value = 'ESTRAGA') or (QRFitasIND_RESULTADO.Value = 'DECLARADA') then
        TotalEstragado := TotalEstragado + QRFitaspeso_liquido.Value;
    end;
  end;
end;

procedure TFRFitas.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  TotalPositivo := 0; //Ao salvar o relatório, esses valores eram somandos novamente, deixando o totalizador com valor duplicado - Andrio(Inovar). Junior 14/08/2020
  TotalNegativo := 0;
  TotalEstragado :=0;
end;

end.
