unit URPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRPlanoContas = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLNumPagina: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRLFilial: TQRLabel;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    FPag_Inicial,FPag_Inicial_Param: Integer;
   public
    { Public declarations }
    Property Pag_Inicial: Integer Read FPag_Inicial write FPag_Inicial;
    Property Pag_Inicial_Param: Integer Read FPag_Inicial_Param write FPag_Inicial_Param;
  end;

var
  vNum_Pagina : Integer;
  FRPlanoContas: TFRPlanoContas;

implementation

uses UPlanoConta_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRPlanoContas.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaNUM_GRAUS_CONTABIL.Value = 4 then
    case (DMPlanoConta.QRPlanoContasNUM_GRAU.Value) of
      1 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#;0;';
      2 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#.##;0;';
      3 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#.##.##.##;0;';
      4 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#.##.##.######;0;';
    end else if DMParamSistema.QParamSistemaNUM_GRAUS_CONTABIL.Value = 5 then
    case (DMPlanoConta.QRPlanoContasNUM_GRAU.Value) of
      1 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#;0;';
      2 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#.##;0;';
      3 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#.##.##;0;';
      4 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#.##.##.##;0;';
      5 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#.##.##.##.######;0;';
    end else if DMParamSistema.QParamSistemaNUM_GRAUS_CONTABIL.Value = 6 then
    case (DMPlanoConta.QRPlanoContasNUM_GRAU.Value) of
      1 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#;0;';
      2 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#.##;0;';
      3 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#.##.##;0;';
      4 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#.##.##.##;0;';
      5 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#.##.##.##.##;0;';
      6 : DMPlanoConta.QRPlanoContasNUM_PLANO_CONTA.EditMask := '#.##.##.##.##.######;0;';
    end;
  if DMPlanoConta.QRPlanoContasNUM_GRAU.Value = 1 then
    begin
      QRBand4.Font.Style:=[fsBold];
      //QRBand4.Font.Size:=11;
    end
  else
    begin
      QRBand4.Font.Style:=[];
      //QRBand4.Font.Size:=10;
    end;
  if (DMPlanoConta.QRPlanoContasNUM_GRAU.Value = 1) OR
     (DMPlanoConta.QRPlanoContasNUM_GRAU.Value = 2) OR
     (DMPlanoConta.QRPlanoContasNUM_GRAU.Value = 3) OR
     (DMPlanoConta.QRPlanoContasNUM_GRAU.Value = 4) then
     Begin
      QRDbtext1.Font.Style:=[fsBold];
      QRDbtext3.Font.Style:=[fsBold];
      QRBand4.Height := 30;
      QRDbText1.Top := 6;
      QRDbText2.Top := 6;
      QRDbText3.Top := 6;
      QRDbText5.Top := 6;
      QRDbText6.Top := 6;
     End
  else
     Begin
      QRDbtext1.Font.Style:=[];
      QRDbtext3.Font.Style:=[];
      QRBand4.Height := 16;
      QRDbText1.Top := 0;
      QRDbText2.Top := 0;
      QRDbText3.Top := 0;
      QRDbText5.Top := 0;
      QRDbText6.Top := 0;
     End;

end;

procedure TFRPlanoContas.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  vNum_Pagina:=Pag_Inicial;

end;

procedure TFRPlanoContas.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  vNum_Pagina:=vNum_Pagina+1;
  QRLNumPagina.Caption:=FloatToStr(vNum_Pagina);

end;

procedure TFRPlanoContas.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  FPag_Inicial:=FPag_Inicial_Param;
end;

end.
