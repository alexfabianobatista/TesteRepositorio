unit URRelacaoServicoPrestado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRRelacaoServicoPrestado = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape1: TQRShape;
    QRDBText5: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel18: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel19: TQRLabel;
    QRDBText6: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText7: TQRDBText;
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRelacaoServicoPrestado: TFRRelacaoServicoPrestado;
  wValorIss :real;

implementation

uses URPA_cl, UTParametro, UBiblioteca, UConhecimentoParam;

{$R *.DFM}

procedure TFRRelacaoServicoPrestado.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  inherited;
  ;
end;

procedure TFRRelacaoServicoPrestado.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  inherited;
  QRLabel12.Caption:= FormatFloat('0.00',(DMRPA.QRServicoPrestadoVal_Servico.value*(StrToFloat(QRLabel11.caption)))/100);
end;

procedure TFRRelacaoServicoPrestado.QRBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  QRLabel11.Caption:=FormatFloat('0.00',StrToFloat(FConhecimentoParam.MEAliquota.text));
end;

procedure TFRRelacaoServicoPrestado.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
   QRLabel17.Caption:= FConhecimentoParam.ME1Ano.text;
   QRLabel13.Caption:=Bib.NomeMes(StrToinT(FConhecimentoParam.CBMes.text));
end;

procedure TFRRelacaoServicoPrestado.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  inherited;
  wValorISS:= wValorISS + (StrToFloat(QRLabel12.Caption));
end;

procedure TFRRelacaoServicoPrestado.SummaryBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLabel20.Caption := FormatFloat('0.00',wValorISS);
end;

end.
