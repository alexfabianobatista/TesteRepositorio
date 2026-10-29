unit URSaldoMedioPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRSaldoMedioPeriodo = class(TFTRelSimples)
    QRLBanco: TQRLabel;
    QRLContaCorrente: TQRLabel;
    QRLPeriodo: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLSaldo_dia: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLSaldo_Lanc: TQRLabel;
    QRLabel8: TQRLabel;
    QRLTotal: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSaldoMedioPeriodo: TFRSaldoMedioPeriodo;

implementation

uses UBancoMovParam, UBancoAgenciaRel_cl;

{$R *.DFM}

procedure TFRSaldoMedioPeriodo.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var wData :TDate;
    wCont, wContLinha :integer;
    wSaldo :Real;
begin
  inherited;
  wSaldo := 0;
  wCont := 0;
  wContLinha := 0;
  wData:= StrToDate(FBancoMovParam.ME16DtInicial.Text);
  while (wdata >= StrToDate(FBancoMovParam.ME16DtInicial.Text)) and (wdata <= StrToDate(FBancoMovParam.ME16DtFinal.Text)) do
    Begin
      inc(wCont);
      wData := wData + 1;
    end;  
  DMBancoAgenciaRel.QRSaldoMedioPeriodo.open;
  DMBancoAgenciaRel.QRSaldoMedioPeriodo.first;
  While not DMBancoAgenciaRel.QRSaldoMedioPeriodo.Eof Do
    Begin
      inc(wContLinha);
      wSaldo := wSaldo + DMBancoAgenciaRel.QRSaldoMedioPeriodoSALDO.Value;
      DMBancoAgenciaRel.QRSaldoMedioPeriodo.next;
    end;
  FrSaldoMedioPeriodo.QRLSaldo_Dia.Caption:=FormatFloat('#,##0.00',(wSaldo/wCont));
  FrSaldoMedioPeriodo.QRLSaldo_Lanc.Caption:=FormatFloat('#,##0.00',(wSaldo/wContLinha));
  FrSaldoMedioPeriodo.QRLTotal.Caption:=FormatFloat('#,##0.00',(wSaldo));
end;

end.
