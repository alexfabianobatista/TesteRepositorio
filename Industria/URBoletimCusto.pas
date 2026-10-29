unit URBoletimCusto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, maskUtils;

type
  TFRBoletimCusto = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel12: TQRLabel;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand4: TQRBand;
    QRMemo1: TQRMemo;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    QRDBText8: TQRDBText;
    QRLabel3: TQRLabel;
    QRLTotal: TQRLabel;
    QRLabel13: TQRLabel;
    QRBand5: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText14: TQRDBText;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    { Public declarations }
  end;

var
  FRBoletimCusto: TFRBoletimCusto;

implementation

uses UBoletim_cl, UParamsistema_cl, UOracle_cl;

{$R *.dfm}

procedure TFRBoletimCusto.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var  wTotal:Real;
  var wNumclasse: integer;
  var wqtdeProduzida: Double;
begin
  inherited;
  //Marciane, Carla, Anderson. solicitaram a quantidade total do Boletim sem a Embalagem. Junior - 28/07/2014.
  if DMParamSistema.CodEmpresa = 'MFARINHA' then
  begin
    QRLabel4.Top := 15;
    QRExpr2.Top  := 15;
    QRlabel6.Top := 30;
    QRExpr1.Top  := 30;
    QRLTotal.Enabled := True;
    QRLabel13.Enabled:= True;

    DMBoletim.QRBoletim_Custo.First;
    while not DMBoletim.QRBoletim_Custo.Eof do
    begin
      wnumclasse := StrToInt(DMOracle.BuscaNome('SELECT NUM_CLASSE FROM TB_CLASSE, TB_PRODUTO', 'TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE AND TB_PRODUTO.COD_PRODUTO = '+
                                                          DMBoletim.QRBoletim_CustoCOD_PRODUTO_ITEM.Text));
      if wNumclasse <> 3 then //MUNDO DA FARINHA A NUM_CLASSE 3 (EMBALAGEM).
        wqtdeProduzida := wqtdeProduzida + DMBoletim.QRBoletim_CustoQT_PRODUZIDA.Value;
      DMBoletim.QRBoletim_Custo.Next;
    end;
    QRLTotal.Caption := FormatFloat('#,##0.00',wqtdeProduzida);
  end;
  //----------------------------------------------------------------------//

  QRMemo1.Lines.Clear;
  QRMemo1.Lines.Add('        ' + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC','CUSTO OPERACIONAL')+
                    '         '+FormatMaskText('CCCCCCCCCCCC',FloatToStr(DMBoletim.QRBoletim_CustoQT_PRODUZIDA.value))+
                    FormatFloat('#,###0.000',DMBoletim.QRBoletim_CustoVAL_CUSTO_OPERACIONAL.value)+
                    '    '+FormatFloat('#,###0.000',(DMBoletim.QRBoletim_CustoVAL_CUSTO_OPERACIONAL.value * DMBoletim.QRBoletim_CustoQT_FABRICADO.value)));
  wTotal := DMBoletim.QRBoletim_CustoVAL_CUSTO_OPERACIONAL.value * DMBoletim.QRBoletim_CustoQT_FABRICADO.value;
  While Not DMBoletim.QRCustoBoletim.Eof Do
  Begin
    QRMemo1.Lines.Add('  '+FormatMaskText('CCCCCC',DMBoletim.QRCustoBoletimCod_Formula_Custo.Text) +
                      FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',DMBoletim.QRCustoBoletimDesc_Formula_Custo.Text)+
                      '         '+FormatMaskText('CCCCCCCCCCCC',FloatToStr(DMBoletim.QRCustoBoletimQt_Quantidade.Value * DMBoletim.QRBoletim_CustoQT_FABRICADO.value))+
                      FormatFloat('#,###0.000',StrToFloat(DMBoletim.QRCustoBoletimVal_Custo.Text))+
                      '    '+FormatFloat('#,###0.000',(DMBoletim.QRCustoBoletimQt_Quantidade.Value*DMBoletim.QRCustoBoletimVal_Custo.Value * DMBoletim.QRBoletim_CustoQT_FABRICADO.value)));
    wTotal := wTotal + DMBoletim.QRCustoBoletimQt_Quantidade.Value*DMBoletim.QRCustoBoletimVal_Custo.Value * DMBoletim.QRBoletim_CustoQT_FABRICADO.value;
    DMBoletim.QRCustoBoletim.Next;
  End;
  QRMemo1.Lines.Add('              '+FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC','TOTAL CUSTOS ADICIONAIS.:')+'         '+FormatMaskText('CCCCCCCCCCCC',FormatFloat('#,###0.000', wTotal)));
  wTotal := wTotal + QRExpr2.Value.dblResult + DMBoletim.QRBoletim_Custoval_custo_perca.Value;
  QRMemo1.Lines.Add('              '+FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC','CUSTO FINAL.............:')+'         '+FormatMaskText('CCCCCCCCCCCC',FormatFloat('#,###0.000', wTotal)));
  QRMemo1.Lines.Add('              '+FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC','CUSTO UNITARIO..........:')+'         ' +
  		       				FormatMaskText('CCCCCCCCCCCC',FormatFloat('#,###0.000', wTotal / DMBoletim.QRBoletim_CustoQT_PRODUZIDA.value)));
  //wTotal := wTotal_Inicial;
  if (DMParamSistema.QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'NAO') then
  begin
    QRLabel19.Enabled := false;
    QRLabel19.Visible := false;
    QRLabel18.Enabled := false;
    QRLabel18.Visible := false;
    QRDBText11.Enabled := false;
    QRDBText11.Visible := false;
    QRDBText10.Enabled := false;
    QRDBText10.Visible := false;
    QRLabel18.Enabled := false;
    QRLabel18.Visible := false;
    QRLabel19.Enabled := false;
    QRLabel19.Visible := false;
    QRDBText11.Enabled := false;
    QRDBText11.Visible := false;
    QRDBText10.Enabled := false;
    QRDBText10.Visible := false;
    QRLabel21.Enabled := false;
    QRLabel21.Visible := false;
    QRDBText13.Enabled := false;
    QRDBText13.Visible := false;
    QRLabel22.Enabled := false;
    QRLabel22.Visible := false;
    QRDBText14.Enabled := false;
    QRDBText14.Visible := false;
  end;
end;

procedure TFRBoletimCusto.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DMBoletim Do
  Begin
    QRCustoBoletim.Close;
    QRCustoBoletim.SetVariable('Cod_Formula',QRBoletim_CustoCOD_FORMULA.Value);
    QRCustoBoletim.Open;
  End;
end;

procedure TFRBoletimCusto.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.QParamSistemaIND_CONTROLA_PERCA_PRODUCAO.Value = 'NAO') then
  begin
    QRLabel20.Enabled := false;
    QRLabel20.Visible := false;
    QRDBText12.Enabled := false;
    QRDBText12.Visible := false;
  end;
end;

end.
