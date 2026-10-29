unit URCurvaABC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRCurvaABC = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBValor: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLPerc: TQRLabel;
    QRLClassificacao: TQRLabel;
    QRLabel6: TQRLabel;
    QRLPercTotal: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    Procedure Proc_Calcula_indices(pValor : Real);
    { Private declarations }
  public
    wTotal : Real;
    wIndTipo : Integer;
    { Public declarations }
  end;

var
  FRCurvaABC: TFRCurvaABC;
  wSomaPerc, wDiferenca, wSomaPercentual, wPercentual : Real;

implementation

uses II, URelatorioVenda_cl;

{$R *.dfm}

procedure TFRCurvaABC.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  Case wIndTipo Of
    0 :
      Proc_Calcula_indices(DMRelatorio_Venda.QRCurvaABCVAL_CUSTO.Value);
    1 :
      Proc_Calcula_indices(DMRelatorio_Venda.QRCurvaABCSVAL_TOTAL.Value);
    2 :
      Proc_Calcula_indices(DMRelatorio_Venda.QRCurvaABCSQT_QUANTIDADE.Value);
  End;

end;

procedure TFRCurvaABC.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wSomaPerc := 0;
  wPercentual := 0;
  wSomaPercentual := 0;
end;

Procedure TFRCurvaABC.Proc_Calcula_indices(pValor : Real);
Begin
{Comentado este bloco pois o calculo da curva ABC estava correto, porém os indicadores não estavam aparecendo corretamente, sempre estava atribuindo 'A' ao
Classificador do produto. A nova versão foi criada com ajuda do ChatGPT. Alex - 16/05/2023
  QRLPerc.Caption := FormatFloat('#0.0',pValor / wTotal * 100);
  QRLPercTotal.Caption := FormatFloat('#0.0',wSomaPerc + pValor / wTotal * 100);

  If wSomaPerc + (pValor / wTotal * 100) < 80 Then
     QRLClassificacao.Caption := 'A'
  Else
  begin
    If QRLClassificacao.Caption = 'A' Then
    begin
       If ((80 - wSomaPerc) < (wSomaPerc + (pValor / wTotal * 100) - 80)) And
          ((80 - wSomaPerc) > 0)  Then { este teste foi colocado para quando já ultrapassou a Classificacao A e vai ficar negativo e nao pode
          QRLClassificacao.Caption := 'B'
       Else
          QRLClassificacao.Caption := 'A';
    end
    Else
    begin
      If (QRLClassificacao.Caption = 'B') And ((wSomaPerc + (pValor / wTotal * 100)) <  95) Then
         QRLClassificacao.Caption := 'B'
      Else
      begin
         If ((95 - wSomaPerc) > (wSomaPerc + (pValor / wTotal * 100) - 95)) And
            ((95 - wSomaPerc) > 0) Then
            QRLClassificacao.Caption := 'B'
         Else
            QRLClassificacao.Caption := 'C';
      end;
    end;
  end;
  wSomaPerc :=wSomaPerc + (pValor / wTotal * 100);}

  wPercentual := pValor / wTotal * 100;
  QRLPerc.Caption := FormatFloat('#0.0', wPercentual);
  QRLPercTotal.Caption := FormatFloat('#0.0', wSomaPercentual + wPercentual);

  if wSomaPercentual + wPercentual < 80 then
    QRLClassificacao.Caption := 'A'
  else if wSomaPercentual + wPercentual < 95 then
    QRLClassificacao.Caption := 'B'
  else
    QRLClassificacao.Caption := 'C';

  wSomaPercentual := wSomaPercentual + wPercentual;
End;

end.
