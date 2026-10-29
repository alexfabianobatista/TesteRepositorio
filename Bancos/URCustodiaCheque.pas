unit URCustodiaCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRelatorioCustodia = class(TForm)
    QRPrimario: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRData_Emissao: TQRLabel;
    QRLabel3: TQRLabel;
    QRHora_Emissao: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    DetailBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel14: TQRLabel;
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioCustodia: TFRelatorioCustodia;

implementation

uses UBancoAgencia_cl;

{$R *.DFM}

procedure TFRelatorioCustodia.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRData_Emissao.Caption:=DateToStr(Date);
  QRHora_Emissao.Caption:=TimeToStr(time);
end;

end.
