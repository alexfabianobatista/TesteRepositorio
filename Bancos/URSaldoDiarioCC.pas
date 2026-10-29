unit URSaldoDiarioCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRSaldoDiarioCC = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLPeriodo: TQRLabel;
    QRLBanco: TQRLabel;
    QRDBText2: TQRDBText;
    QRLSaldo: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    fDtReferencia : TdateTime;
  public
    Property pDtReferencia : TDateTime Read fDtReferencia Write fDtReferencia;  // utilizado para calculo saldo inicial no relatorio FRSaldoDiarioCC

    { Public declarations }
  end;

var
  FRSaldoDiarioCC: TFRSaldoDiarioCC;
  wSaldoAnt : String;
implementation

uses UBancoAgencia_cl, UOracle_cl, UBancoAgenciaRel_cl;

{$R *.DFM}

procedure TFRSaldoDiarioCC.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wSaldoAnt := DMOracle.BuscaNome('SELECT SUM(DECODE(TB_HISTORICO.IND_OPERACAO,'+chr(39)+'-'+Chr(39)+',(TB_BCO_MOVIMENTO.VAL_MOVIMENTO*(-1)),TB_BCO_MOVIMENTO.VAL_MOVIMENTO)) FROM TB_BCO_MOVIMENTO,TB_HISTORICO',
                ' TB_BCO_MOVIMENTO.COD_HISTORICO = TB_HISTORICO.COD_HISTORICO'+
                ' AND TB_BCO_MOVIMENTO.COD_CONTA_CORRENTE = '+FloatToStr(DMBancoAgenciaRel.QRSaldoDiarioCCCOD_CONTA_CORRENTE.Value) +
                ' AND TB_BCO_MOVIMENTO.IND_BAIXA_CHEQUE = ' + Chr(39) + 'N' + Chr(39) +
                ' AND TB_BCO_MOVIMENTO.DT_MOVIMENTO < ' + Chr(39) + DateToStr(pDtReferencia) + Chr(39));
  If wSaldoAnt = '' Then
     wSaldoAnt := '0';                 
end;

procedure TFRSaldoDiarioCC.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wSaldoAnt := FloatToStr(StrToFloat(wSaldoAnt) + DMBancoAgenciaRel.QRSaldoDiarioCCSaldo.Value);
  QRLSaldo.Caption := FormatFloat('#,##0.00',StrToFloat(wSaldoAnt));
end;

end.
