unit UrFinanceiroObra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFrFinanceiroObra = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRLMAO_OBRA: TQRLabel;
    QRLabel14: TQRLabel;
    QRLPagto: TQRLabel;
    QRLabel16: TQRLabel;
    QRLSaldo: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRShape1: TQRShape;
    QRLabel23: TQRLabel;
    QRDBText15: TQRDBText;
    QRShape2: TQRShape;
    QRLabel24: TQRLabel;
    QRShape3: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLReceber: TQRLabel;
    QRLabel28: TQRLabel;
    QRLCrPago: TQRLabel;
    QRLabel27: TQRLabel;
    QRLCrSaldo: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLCpSaldo: TQRLabel;
    QRLCpPago: TQRLabel;
    QRLPagar: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLCpSaldo1: TQRLabel;
    QRLabel33: TQRLabel;
    QRLSaldoObra: TQRLabel;
    QRLPorcentagem_Saldo: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel34: TQRLabel;
    QRLPagoRes: TQRLabel;
    QRLabel37: TQRLabel;
    QRLSaldoRes: TQRLabel;
    QRLabel36: TQRLabel;
    QRLRecebido_Res: TQRLabel;
    QRShape5: TQRShape;
    QRShape4: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLCrINCC: TQRLabel;
    QRLabel40: TQRLabel;
    QRLPercent: TQRLabel;
    QRLVlContrato: TQRLabel;
    QRLabel41: TQRLabel;
    QRLCustoPagar: TQRLabel;
    QRLValM2: TQRLabel;
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
     wSaldo : Real;
  end;

var
  FrFinanceiroObra: TFrFinanceiroObra;
implementation

uses UObra_Rel_cl, UOracle_cl;

{$R *.dfm}

procedure TFrFinanceiroObra.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If DMObra_Rel.QRObraFinanceiroInd_Tipo.Value <> 'PRODUTOS' Then
   Begin
     QRLabel5.Caption := '';
     QRLabel7.Caption := '';
     QRLabel8.Caption := 'Valor Aberto';
     QRLabel9.Caption := 'Valor Pago';
     QRLabel11.Caption := 'Vencto';
     QRLabel12.Caption := 'Baixa';
     QRLabel40.Caption := '';
   End
  Else
   Begin
     QRLabel5.Caption := 'Produto';
     QRLabel7.Caption := 'UN';
     QRLabel8.Caption := 'Quantidade';
     QRLabel9.Caption := 'Valor';
     QRLabel11.Caption := '';
     QRLabel12.Caption := '';
     QRLabel40.Caption := '%';
   End;
end;

procedure TFrFinanceiroObra.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var wTotal, wCustoM2 : Real;
begin
  inherited;
  wTotal:=StrToFloat('0' + DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE * VAL_UNITARIO) FROM TB_OBRA_REQ_ITEM,TB_OBRA_REQ_CAB,TB_PRODUTO',
                      'TB_OBRA_REQ_CAB.COD_OBRA_REQ_CAB = TB_OBRA_REQ_ITEM.COD_OBRA_REQ_CAB AND TB_OBRA_REQ_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO ' +
                      'AND TB_OBRA_REQ_ITEM.COD_OBRA = '+DMObra_Rel.QRObraFinanceiroCod_Obra.Text +
                      ' AND IND_TIPO_PRODUTO = ' + QuoteDStr('MAO OBRA')  + ' AND IND_CONDICAO_PAGTO = ' + QuoteDStr('1')));
  QRLMAO_OBRA.Caption := FormatFloat('#,##0.00',wTotal);
  wCustoM2 := wTotal;
  wTotal:=StrToFloat('0' + DMOracle.BuscaNome('SELECT SUM(VAL_TITULO) FROM TB_CONTA_PAGAR_CAB','COD_OBRA = '+DMObra_Rel.QRObraFinanceiroCod_Obra.Text +
                      ' AND COD_FINALIDADE = 6'));
  QRLSaldo.Caption := FormatFloat('#,##0.00',wTotal);
  wCustoM2 := wCustoM2 + wTotal;
  wTotal:=StrToFloat('0' + DMOracle.BuscaNome('SELECT SUM(VAL_ORIGINAL - VAL_TITULO) FROM TB_CONTA_PAGAR_CAB','COD_OBRA = '+DMObra_Rel.QRObraFinanceiroCod_Obra.Text +
                      ' AND COD_FINALIDADE = 6'));
  QRLPAGTO.Caption := FormatFloat('#,##0.00',wTotal);
  wCustoM2 := wCustoM2 + wTotal;
  If DMObra_Rel.QRObraFinanceiroNum_Area_Obra.Value > 0 Then
     wCustoM2:= wCustoM2 / DMObra_Rel.QRObraFinanceiroNum_Area_Obra.Value;
  QRLValM2.Caption := FormatFloat('#,##0.000',wCustoM2);
end;

procedure TFrFinanceiroObra.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If (DMObra_Rel.QRObraFinanceiroInd_Tipo.Value = 'PRODUTOS') and (wSaldo > 0) Then
     QRLPercent.Caption := '%' + FormatFloat('#0.000', DMObra_Rel.QRObraFinanceiroValor.Value / wSaldo * 100)
  Else
     QRLPercent.Caption := '';
end;

end.
