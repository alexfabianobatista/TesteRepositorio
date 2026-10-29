unit URNota_Inadimplencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRNota_Inadimplencia = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLIndice: TQRLabel;
    QRBand4: TQRBand;
    QRLabel7: TQRLabel;
    QREVenda: TQRExpr;
    QREReceber: TQRExpr;
    QRLIndiceTotal: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_Inadimplencia: TFRNota_Inadimplencia;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

procedure TFRNota_Inadimplencia.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  with DMRelatorio_Venda do
  begin
    if QRInadimplenciaSVal_Venda.Value = 0 then
       QRLIndice.Caption := '0,00'
    else
       QRLIndice.Caption := FormatFloat('###,###,##0.00',QRInadimplenciaSVal_Receber.Value/QRInadimplenciaSVal_Venda.Value*100);
  end;
end;

procedure TFRNota_Inadimplencia.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If QREVenda.Value.dblResult = 0 then
    QRLIndiceTotal.Caption := '0,00'
  Else
    QRLIndiceTotal.Caption := FormatFloat('###,###,##0.00',QREReceber.Value.dblResult/QREVenda.Value.dblResult*100);
end;

end.
