unit URContasPagar_Vencimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContasPagar_Vencimentos = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLPeriodoVenc: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand6: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLDataInicial: TQRLabel;
    QRLabel14: TQRLabel;
    QRLDataFinal: TQRLabel;
    QRLDepartamento: TQRLabel;
    QRLDiaSemana: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasPagar_Vencimentos: TFRContasPagar_Vencimentos;
  wData_Vencto : TDateTime;
implementation

uses UContasPagar_cl;

{$R *.DFM}



procedure TFRContasPagar_Vencimentos.QRBand5BeforePrint(
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

procedure TFRContasPagar_Vencimentos.QRBand4AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  wData_Vencto := DMContasPagar.QRContasPagar_VencimentosDt_Vencimento.Value; 
end;

end.
