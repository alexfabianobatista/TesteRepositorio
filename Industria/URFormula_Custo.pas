unit URFormula_Custo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport,Menus, Mask, Buttons, maskUtils,
  QRWebFilt, QRPDFFilt;

type
  TFRFormula_Custo = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    QRLPerc: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr3: TQRExpr;
    QRMemo1: TQRMemo;
    QRDBText10: TQRDBText;
    QRLabel15: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel16: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    wTotal,wTotal_Inicial,wQuant : Real;
    { Public declarations }
  end;

var
  FRFormula_Custo: TFRFormula_Custo;

implementation

uses UFormula_cl,UParamSistema_cl;

{$R *.DFM}

procedure TFRFormula_Custo.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLPerc.Caption := FormatFloat('##.#0',DMFormula.QRFormula_CustoQT_ITEM.Value * DMFormula.QRFormula_CustoVL_CUSTO_MEDIO.Value / wTotal * 100);
  if (DMParamSistema.CodEmpresa <> 'ARZ') then
  begin
    QRDBText10.Enabled := False;
    QRDBText10.Visible := False;
  end;
end;

procedure TFRFormula_Custo.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRMemo1.Lines.Clear;
  While Not DMFormula.QRCustoFormula.Eof Do
  Begin
    QRMemo1.Lines.Add('  '+FormatMaskText('CCCCCC',DMFormula.QRCustoFormulaCod_Formula_Custo.Text) +
                      FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',DMFormula.QRCustoFormulaDesc_Formula_Custo.Text)+
                      '         '+FormatMaskText('CCCCCCCCCCCC',DMFormula.QRCustoFormulaQt_Quantidade.Text)+
                      FormatFloat('#,###0.000',StrToFloat(DMFormula.QRCustoFormulaVal_Custo.Text))+
                      '    '+FormatFloat('#,###0.000',(DMFormula.QRCustoFormulaQt_Quantidade.Value*DMFormula.QRCustoFormulaVal_Custo.Value)));
    wTotal := wTotal + DMFormula.QRCustoFormulaQt_Quantidade.Value*DMFormula.QRCustoFormulaVal_Custo.Value;
    DMFormula.QRCustoFormula.Next;
  End;
  QRMemo1.Lines.Add('        '+FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC','CUSTO FINAL')+'                               '+FormatMaskText('CCCCCCCCCCCC',FloatToStr(wTotal + dmformula.QRFormula_CustoVAL_CUSTO_OPERACIONAL.Value)));
  QRMemo1.Lines.Add('        '+FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC','QT.PRODUÇÃO')+'                               '+ FormatMaskText('CCCCCCCCCCCC',DMFormula.QRFormula_CustoQT_PRODUCAO.Text));
  QRMemo1.Lines.Add('        '+FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC','CUSTO UNITARIO 2')+'                               '+ FormatMaskText('CCCCCCCCCCCC',FloatToStr((wTotal + dmformula.QRFormula_CustoVAL_CUSTO_OPERACIONAL.Value) / DMFormula.QRFormula_CustoQT_PRODUCAO.value)));
  wTotal := wTotal_Inicial + dmformula.QRFormula_CustoVAL_CUSTO_OPERACIONAL.Value;
  if (DMParamSistema.CodEmpresa <> 'ARZ') then
  begin
    QRLabel16.Enabled := False;
    QRLabel16.Visible := False;
    QRExpr4.Enabled := False;
    QRExpr4.Visible := False;
  end;
end;

procedure TFRFormula_Custo.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DMFormula Do
  Begin
    QRCustoFormula.Close;
    QRCustoFormula.SetVariable('Cod_Formula',QRFormula_CustoCod_Formula.Value);
    QRCustoFormula.Open;
  End;
end;

procedure TFRFormula_Custo.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa <> 'ARZ') then
  begin
    QRLabel15.Enabled := False;
    QRLabel15.Visible := False;
  end;
end;

end.
