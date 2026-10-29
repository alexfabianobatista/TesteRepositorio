unit UREstoqueComposicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFrEstoqueComposicao = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLFilial: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLEstoque: TQRLabel;
    QRLCusto: TQRLabel;
    QRLabel12: TQRLabel;
    QRLQuantidade: TQRLabel;
    QRLabel14: TQRLabel;
    QRLCusto_Inicial: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel20: TQRLabel;
    QRLProduto: TQRLabel;
    QRLValor: TQRLabel;
    QRLCustoSaida: TQRLabel;
    QRLValorSaida: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrEstoqueComposicao: TFrEstoqueComposicao;
  wVlEstoque, wQtEstoque,wCusto_Anterior : Real;

implementation

uses UBiblioteca, URelatorioEstoque_cl;

{$R *.DFM}

procedure TFrEstoqueComposicao.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  wVlEstoque := StrToFloat(FREstoqueComposicao.QRLQuantidade.Caption) *
                StrToFloat(FREstoqueComposicao.QRLCusto_Inicial.Caption);
  wQtEstoque := StrToFloat(FREstoqueComposicao.QRLQuantidade.Caption);
  wCusto_Anterior := StrToFloat(FREstoqueComposicao.QRLCusto_Inicial.Caption);
end;

procedure TFrEstoqueComposicao.QRBand3BeforePrint(Sender: TQRCustomBand;
   var PrintBand: Boolean);
Var wQuant,wCusto : Real;
begin
  inherited;
  With DMRelatorio_Estoque Do
  Begin
    QRLCustoSaida.Caption := '';
    QRLValorSaida.Caption := '';
    QRLCusto.Caption := FormatFloat('##,##0.0000',wCusto_Anterior);
    wQuant := QREstoqueComposicaoQt_Quantidade_Entrada.Value + QREstoqueComposicaoQt_Quantidade_Saida.Value;
    wCusto := QREstoqueComposicaoVal_Custo_Entrada.Value + QREstoqueComposicaoVal_Custo_Saida.Value;
    If QREstoqueComposicaoInd_Estoque.Value = 'S' Then
       wQtEstoque := wQtEstoque + wQuant;
    QRLEstoque.Caption := FormatFloat('###,##0.00', wQtEstoque);
    If (QREstoqueComposicaoInd_Custo.Value = 'S') And
       (QREstoqueComposicaoInd_Custo_Nota.Value = 'A') Then
      Begin
        wVlEstoque := wVlEstoque + (wQuant * wCusto);
        If ((QREstoqueComposicaoInd_Tipo_Operacao.Value = 'S') Or
           (QREstoqueComposicaoInd_Vendas.Value = 'D')) And
           (QREstoqueComposicaoInd_Compras.Value <> 'D') Then
         Begin  // rotina so para saida devido ao custo //
           QRLCustoSaida.Caption := FormatFloat('##,##0.0000', wCusto);
           QRLValorSaida.Caption := FormatFloat('###,##0.00', wCusto * wQuant);
         End;
      end
    Else
      Begin
        wVlEstoque := wQtEstoque * wCusto_Anterior;
        If ((QREstoqueComposicaoInd_Tipo_Operacao.Value = 'S') Or
           (QREstoqueComposicaoInd_Vendas.Value = 'D')) Then
         Begin  // rotina so para saida devido ao custo //
           QRLCustoSaida.Caption := FormatFloat('##,##0.0000', wCusto_Anterior);
           QRLValorSaida.Caption := FormatFloat('##,##0.0000', wCusto_Anterior * wQuant);
         End;
      End;
    If wQtEstoque <> 0 then
       QRLCusto.Caption := FormatFloat('##,##0.0000', wVlEstoque / wQtEstoque)
    Else
      Begin
        QRLCusto.Caption := '0';
        wVlEstoque := 0;
      End;
    wCusto_Anterior := StrToFloat(Bib.LimpaString(QRLCusto.Caption,'.'));
    QrlValor.Caption := FormatFloat('##,###,##0.00',wVlEstoque);
  End;
end;
end.
