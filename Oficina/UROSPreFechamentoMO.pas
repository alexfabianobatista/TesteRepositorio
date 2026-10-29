unit UROSPreFechamentoMO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFROSPreFechamentoMO = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand5: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLVlrHoraTrabalhada: TQRLabel;
    QRLHoraTrabalhada: TQRLabel;
    QRLQtdeHoraCad: TQRLabel;
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
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
  FROSPreFechamentoMO: TFROSPreFechamentoMO;
  wHora_inicio,whora_final,wMinuto_inicio,wminuto_final, whoras, wminutos : Real;

implementation

uses UOficina_cl, UBiblioteca;

{$R *.DFM}

procedure TFROSPreFechamentoMO.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  inherited;
  {Value:= FormatFloat('##:##',StrToFloat(DMOficina.QROSPreFechamentoMODT_LIMITEHORAS.Value));}
end;

procedure TFROSPreFechamentoMO.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Bib.NumToTexto(DmOficina.QROSPreFechamentoMOHR_INICIO.Value, 2, 5);
  {Value := Copy(FloatToStr(DMOficina.QROSPreFechamentoMOHR_INICIO.Value),1,2)+':'+
           Copy(FloatToStr(DMOficina.QROSPreFechamentoMOHR_INICIO.Value),4,2);}
end;

procedure TFROSPreFechamentoMO.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Bib.NumToTexto(DmOficina.QROSPreFechamentoMOHR_FINAL.Value, 2, 5);
  {Value := Copy(FloatToStr(DMOficina.QROSPreFechamentoMOHR_FINAL.Value),1,2)+':'+
           Copy(FloatToStr(DMOficina.QROSPreFechamentoMOHR_FINAL.Value),4,2);}
end;

procedure TFROSPreFechamentoMO.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  {with DMOficina do
  begin
    whora_inicio  := whora_inicio  + StrToFloat(Copy(FloatToStr(QROSPreFechamentoMOHR_INICIO.Value),1,2));
    whora_final   := whora_final   + StrToFloat(Copy(FloatToStr(QROSPreFechamentoMOHR_FINAL.Value),1,2));
    wminuto_inicio:= wminuto_inicio+ StrToFloat(Copy(FloatToStr(QROSPreFechamentoMOHR_INICIO.Value),4,2));
    wminuto_final := wminuto_final + StrToFloat(Copy(FloatToStr(QROSPreFechamentoMOHR_FINAL.Value),4,2));
  end;}  
end;

procedure TFROSPreFechamentoMO.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
 { whoras  := whora_final-whora_inicio;
  wminutos:= wminuto_inicio+wminuto_final;
  while wminutos >= 60 do
  begin
    wminutos := wminutos - 60;
      whoras := whoras + 1;
  end;
  with DMOficina do
  begin
    QROSPreFechamentoMOhoras_trabalhadas.Value := FloatToStr(whoras)+':'+FloatToStr(wminutos);
    QROSPreFechamentoMOvalor_horas_trabalhadas.Value:=
    FloatToStr(QROSPreFechamentoMOVAL_HORA_MECANICO.Value * whoras + (wminutos/60*QROSPreFechamentoMOVAL_HORA_MECANICO.Value));
  end;
  // inicializa valor das variaveis para impressão.
  wHora_inicio  := 0;
  whora_final   := 0;
  wMinuto_inicio:= 0;
  wminuto_final := 0;
         whoras := 0;
       wminutos := 0;}
end;

end.
