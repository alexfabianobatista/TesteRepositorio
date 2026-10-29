unit URFluxoCaixaRealizado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRFluxoCaixaRealizado = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRLEntradas: TQRLabel;
    QRLSaidas: TQRLabel;
    QRBand5: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText11: TQRDBText;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRBand6: TQRBand;
    QRLabel10: TQRLabel;
    QRLEntradaTipo: TQRLabel;
    QRLSaidaTipo: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFluxoCaixaRealizado: TFRFluxoCaixaRealizado;
  wReceitaDep :Real = 0;
  wDespesaDep :Real = 0;
  wDespesaTipo :Real = 0;
  wReceitaTipo :Real = 0;

implementation

uses UCaixaRel_cl;

{$R *.dfm}

procedure TFRFluxoCaixaRealizado.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMCaixaRel.QRFluxoCaixaRealizadoIND_OPERACAO.Value = '+' then
  begin
    QRDBText9.Left := 589;
    wReceitaDep := wReceitaDep + DMCaixaRel.QRFluxoCaixaRealizadoVAL_MOVIMENTO.Value;
    wReceitaTipo := wReceitaTipo + DMCaixaRel.QRFluxoCaixaRealizadoVAL_MOVIMENTO.Value;
  end
  else
  begin
    QRDBText9.Left := 679;
    wDespesaDep := wDespesaDep + DMCaixaRel.QRFluxoCaixaRealizadoVAL_MOVIMENTO.Value;
    wDespesaTipo := wDespesaTipo + DMCaixaRel.QRFluxoCaixaRealizadoVAL_MOVIMENTO.Value;
  end;

end;

procedure TFRFluxoCaixaRealizado.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
    QRLEntradas.Caption := formatFloat('#,##0.00', wReceitaDep);
    QRLSaidas.Caption := formatFloat('#,##0.00', wDespesaDep);
    wReceitaDep := 0;
    wDespesaDep := 0;
end;

procedure TFRFluxoCaixaRealizado.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLEntradaTipo.Caption := formatFloat('#,##0.00', wReceitaTipo);
  QRLSaidaTipo.Caption := formatFloat('#,##0.00', wDespesaTipo);
  wReceitaTipo := 0;
  wDespesaTipo := 0;
end;

end.
