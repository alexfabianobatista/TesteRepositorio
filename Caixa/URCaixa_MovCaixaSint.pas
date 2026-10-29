unit URCaixa_MovCaixaSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt,
  StdCtrls;

type
  TFRCaixa_MovCaixaSint = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBTVal_Movimento: TQRDBText;
    QRBand5: TQRBand;
    QRLPeriodo: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand6: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand7: TQRBand;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLFilial: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCaixa_MovCaixaSint: TFRCaixa_MovCaixaSint;
  wreceita,wdespesa : Real;

implementation

uses UCaixa_cl, UOracle_cl, UCaixaRel_cl;

{$R *.DFM}

procedure TFRCaixa_MovCaixaSint.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
//  QRLSaldoAnterior.Caption:=FormatFloat('#,##0.00',DMCaixa.QSaldoCredito.Value-DMCaixa.QSaldoDebito.Value);
//  QRLSaldoAtual.Caption:=FormatFloat('#,##0.00',DMCaixa.QSaldoCredito.Value-DMCaixa.QSaldoDebito.Value+wReceita-wDespesa);
//  QRLTotal.Caption:=FormatFloat('#,##0.00',DMCaixaRel.QRCaixa_DetDinheiro.Value+
//                                           DMCaixaRel.QRCaixa_DetCheques.Value +
//                                           DMCaixaRel.QRCaixa_DetVales.Value   +
//                                           DMCaixaRel.QRCaixa_DetOutros.Value);
end;

procedure TFRCaixa_MovCaixaSint.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wreceita:=0;
  wdespesa:=0;
end;

procedure TFRCaixa_MovCaixaSint.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wReceita:=wReceita+DMCaixaRel.QRCaixa_MovCaixaSintCREDITO.Value;
  wDespesa:=wDespesa+DMCaixaRel.QRCaixa_MovCaixaSintDEBITO.Value;
end;

end.
