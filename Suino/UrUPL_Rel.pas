unit UrUPL_Rel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFrUPL_Rel = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText3: TQRDBText;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand4: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRBand5: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLRacao: TQRLabel;
    QRLPeso: TQRLabel;
    QRLConversao: TQRLabel;
    QRLabel16: TQRLabel;
    QRLPesoMedio: TQRLabel;
    QRLabel17: TQRLabel;
    QRLIncentivo: TQRLabel;
    QRLValorPeso: TQRLabel;
    QRLabel18: TQRLabel;
    QRLVlLeitoes: TQRLabel;
    QRLabel19: TQRLabel;
    QRLFunrural: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrUPL_Rel: TFrUPL_Rel;
  wPeso, wRacao, wFator, wCabecas : Real;

implementation

uses USuino_cl, UIncentivo_cl, URemuneracaoLeitao_cl, UOracle_cl;

{$R *.dfm}

procedure TFrUPL_Rel.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wPeso := 0;
  wRacao := 0;
  wFator := 0;
  wCabecas := 0;
end;

procedure TFrUPL_Rel.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If DmSuino.QRReceitaDespesaInd_Tipo_Produto.Value = 'RAÇÃO' Then
     wRacao := wRacao + DmSuino.QRReceitaDespesaQt_Quantidade.Value;
  If DMSuino.QRReceitaDespesaDESC_TIPO.Value = 'NOTAS DE ENTRADA' Then
   Begin
     wPeso := wPeso +  DmSuino.QRReceitaDespesaQt_Quantidade.Value;
     wCabecas := wCabecas + DmSuino.QRReceitaDespesaNum_Cabecas.Value;
   End;
end;

procedure TFrUPL_Rel.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var wPesoMedio,wPreco,wConversao,wVlConversao,wPercFunrural : Real;
begin
  inherited;
  QRLRacao.Caption := FormatFloat('#,##0.00',wRacao);
  QRLPeso.Caption := FormatFloat('#,##0.00',wPeso);
  If wRacao > 0 Then
     QRLConversao.Caption := FormatFloat('#,##0.0000',wPeso / wRacao)
  Else
     QRLConversao.Caption := FormatFloat('#,##0.0000',0);
  If wCabecas > 0 Then
     QRLPesoMedio.Caption := FormatFloat('#,##0.0000',wPeso / wCabecas)
  Else
     QRLPesoMedio.Caption := FormatFloat('#,##0.0000',0);
  DMincentivo.QIncentivo_Cons.Close;
  DMincentivo.QIncentivo_Cons.SetVariable('Cod_Cadastro',DmSuino.QRReceitaDespesaCod_Cadastro.Value);
  DMincentivo.QIncentivo_Cons.Open;
  If Not(DMincentivo.QIncentivo_Cons.Eof) Then
     QRLIncentivo.Caption := FormatFloat('#,##0.00',DMincentivo.QIncentivo_ConsVal_Incentivo.Value * wCabecas)
  Else
     QRLIncentivo.Caption := FormatFloat('#,##0.00',0);
  DMRemuneracaoLeitao.QRemuneracaoLeitao_Cad.Close;
  DMRemuneracaoLeitao.QRemuneracaoLeitao_Cad.SetVariable('Pk','UPL');
  DMRemuneracaoLeitao.QRemuneracaoLeitao_Cad.Open;
  wPreco := 0;
  If Not(DMRemuneracaoLeitao.QRemuneracaoLeitao_Cad.Eof) Then
   Begin
     wPesoMedio := wPeso / wCabecas;
     wPreco := wPesoMedio - DMRemuneracaoLeitao.QRemuneracaoLeitao_CadQT_PESO_REFERENCIA.Value;
     wPreco := wPreco / DMRemuneracaoLeitao.QRemuneracaoLeitao_CadQT_INCREMENTO_REFERENCIA.Value;
     wPreco := wPreco * DMRemuneracaoLeitao.QRemuneracaoLeitao_CadVL_INCREMENTO_REFERENCIA.Value;
     wPreco := wPreco + DMRemuneracaoLeitao.QRemuneracaoLeitao_CadVL_PESO_REFERENCIA.Value;
     wConversao := wPeso / wRacao;
     wVlConversao := DMRemuneracaoLeitao.QRemuneracaoLeitao_CadQT_CONVERSAO_REFERENICIA.Value - wConversao;
     wVlConversao := wVlConversao / DMRemuneracaoLeitao.QRemuneracaoLeitao_CadQT_CONVERSAO_INCREMENTO.Value;
     wVlConversao := wVlConversao * DMRemuneracaoLeitao.QRemuneracaoLeitao_CadVL_CONVERSAO_INCREMENTO.Value;
     wPreco := wPreco + wVlConversao;
   End;
  QRLValorPeso.Caption := FormatFloat('#,##0.00',wPreco);
  QRLVlLeitoes.Caption := FormatFloat('#,##0.00',wPreco * wCabecas);
  wPercFunrural := StrToFloat('0'+DMOracle.BuscaNome('SELECT PERC_FUNRURAL FROM TB_CADASTRO','COD_CADASTRO = '+DmSuino.QRReceitaDespesaCod_Cadastro.Text));
  QRLFunrural.Caption := FormatFloat('#,##0.00',wPreco * wCabecas * wPercFunrural / 100);
end;

end.
