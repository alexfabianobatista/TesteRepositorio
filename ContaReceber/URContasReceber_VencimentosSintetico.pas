unit URContasReceber_VencimentosSintetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContasReceber_VencimentosSintetico = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLPeriodo: TQRLabel;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel4: TQRLabel;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRBand5: TQRBand;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    QRLReferencia: TQRLabel;
    QRLabel5: TQRLabel;
    QRLDiaSemana: TQRLabel;
    QRLPeriodoEmissao: TQRLabel;
    QRLPlaca: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasReceber_VencimentosSintetico: TFRContasReceber_VencimentosSintetico;

implementation

uses UContasReceber_cl;

{$R *.DFM}

procedure TFRContasReceber_VencimentosSintetico.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
Var wDia : Integer;
begin
  inherited;
  wDia := DayOfWeek(DMContasReceber.QRContasReceber_VencimentosDt_Vencimento.Value);
  Case wDia Of
   1 : QRLDiaSemana.Caption := ' - Domingo';
   2 : QRLDiaSemana.Caption := ' - Segunda';
   3 : QRLDiaSemana.Caption := ' - Terca';
   4 : QRLDiaSemana.Caption := ' - Quarta';
   5 : QRLDiaSemana.Caption := ' - Quinta';
   6 : QRLDiaSemana.Caption := ' - Sexta';
   7 : QRLDiaSemana.Caption := ' - Sabado';
  End;

end;

end.
