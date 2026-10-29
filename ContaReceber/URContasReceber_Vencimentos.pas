unit URContasReceber_Vencimentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContasReceber_Vencimentos = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText8: TQRDBText;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLPeriodoVenc: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand6: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr2: TQRExpr;
    QRLDataInicial: TQRLabel;
    QRLabel14: TQRLabel;
    QRLDataFinal: TQRLabel;
    QRLDepartamento: TQRLabel;
    QRLabel11: TQRLabel;
    QRLReferencia: TQRLabel;
    QRLDiaSemana: TQRLabel;
    QRLPeriodoEmissao: TQRLabel;
    ChildBand1: TQRChildBand;
    QRDBText10: TQRDBText;
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasReceber_Vencimentos: TFRContasReceber_Vencimentos;
  wData_Vencto : TDateTime;

implementation

uses UContasReceber_cl;

{$R *.DFM}

procedure TFRContasReceber_Vencimentos.QRBand4AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  wData_Vencto := DMContasReceber.QRContasReceber_VencimentosDt_Vencimento.Value;
end;

procedure TFRContasReceber_Vencimentos.QRBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
Var wDia : Integer;
begin
  inherited;
  wDia := DayOfWeek(wData_Vencto);
  Case wDia Of
   1 : QRLDiaSemana.Caption := DateToStr(wData_Vencto) + ' - Domingo';
   2 : QRLDiaSemana.Caption := DateToStr(wData_Vencto) + ' - Segunda';
   3 : QRLDiaSemana.Caption := DateToStr(wData_Vencto) + ' - Terca';
   4 : QRLDiaSemana.Caption := DateToStr(wData_Vencto) + ' - Quarta';
   5 : QRLDiaSemana.Caption := DateToStr(wData_Vencto) + ' - Quinta';
   6 : QRLDiaSemana.Caption := DateToStr(wData_Vencto) + ' - Sexta';
   7 : QRLDiaSemana.Caption := DateToStr(wData_Vencto) + ' - Sabado';
  End;
end;

procedure TFRContasReceber_Vencimentos.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  PrintBand := Trim(DMContasReceber.QRContasReceber_VencimentosDESC_PLACA.AsString) <> '';
end;

end.
