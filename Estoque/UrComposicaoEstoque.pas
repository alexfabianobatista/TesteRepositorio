unit UrComposicaoEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFrComposicaoEstoque = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLProduto: TQRLabel;
    QRLDescricao: TQRLabel;
    QRLQuantidade: TQRLabel;
    QRLCusto: TQRLabel;
    QRLTotal: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLLote: TQRLabel;
    QRLUnidade: TQRLabel;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRLGeral: TQRLabel;
    QRLFilial: TQRLabel;
    QRLabel11: TQRLabel;
    QRLEmb: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrComposicaoEstoque: TFrComposicaoEstoque;
  wQuant,wCusto,wVlEstoque,wQtEstoque,wCusto_Anterior,wTotal : Real;
  wLote, wUnidade : String;

implementation

uses UBiblioteca, URelatorioEstoque_cl, UOracle_cl;

{$R *.DFM}

procedure TFrComposicaoEstoque.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DMRelatorio_Estoque Do
  Begin
    wQuant := QRComposicaoEstoqueQt_Quantidade_Entrada.Value + QRComposicaoEstoqueQt_Quantidade_Saida.Value;
    wCusto := QRComposicaoEstoqueVal_Custo_Entrada.Value + QRComposicaoEstoqueVal_Custo_Saida.Value;
    If QRComposicaoEstoqueInd_Estoque.Value = 'S' Then
       wQtEstoque := wQtEstoque + wQuant;
    If (QRComposicaoEstoqueInd_Custo.Value = 'S') And
       (QRComposicaoEstoqueInd_Custo_Nota.Value = 'A') Then
       If QRComposicaoEstoqueIND_COMPRAS.Value = 'D' Then
          wVlEstoque := wVlEstoque - (wQuant * wCusto) // quando e devolucao (-) com (-) estava somando
        Else
          wVlEstoque := wVlEstoque + (wQuant * wCusto)
    Else
        wVlEstoque := wQtEstoque * wCusto_Anterior;
    If wQtEstoque <> 0 then
       QRLCusto.Caption := FormatFloat('##,##0.0000', wVlEstoque / wQtEstoque)
    Else
      Begin
        wCusto_Anterior := 0;
        wVlEstoque := 0;
        QRLCusto.Caption := '0';
      End;
    QRLTotal.Caption := FormatFloat('##,###,##0.00',wVlEstoque);
    QRLQuantidade.Caption := FormatFloat('##,###,##0.00',wQtEstoque);
    QRLProduto.Caption := QRComposicaoEstoqueCod_produto.Text;
    QRLDescricao.Caption := QRComposicaoEstoqueDesc_produto.Text;
    wCusto_Anterior := StrToFloat(Bib.LimpaString(QRLCusto.Caption,'.'));
    QRLUnidade.Caption := QRComposicaoEstoqueDesc_unidade.Text;
    QRLLote.Caption := QRComposicaoEstoqueCod_Lote_Tipo.Text;
    QRLEmb.Caption := QRComposicaoEstoqueNum_Embalagem.Text;
    If wQtEstoque <> 0 Then
       QRBand4.Enabled := True
    else
       QRBand4.Enabled := False;
  End;
end;

procedure TFrComposicaoEstoque.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var wEstoque,wCusto : String;
begin
  inherited;
  With DMRelatorio_Estoque Do
  Begin
    wEstoque := DMOracle.BuscaNome('SELECT QT_INVENTARIO FROM TB_ESTOQUE',
                'COD_PRODUTO='+FloatToStr(QRComposicaoEstoqueCod_produto.value) +
                ' AND COD_FILIAL='+FloatToStr(QRComposicaoEstoqueCod_Filial.value) +
                ' AND COD_LOTE_TIPO='+FloatToStr(QRComposicaoEstoqueCod_Lote_Tipo.value));
    If wEstoque = '' Then
       wEstoque := '0';
    wCusto:=DMOracle.BuscaNome('SELECT VL_CUSTO_INVENTARIO FROM TB_ESTOQUE',
            'COD_PRODUTO='+FloatToStr(QRComposicaoEstoqueCod_produto.value) +
            ' AND COD_FILIAL='+FloatToStr(QRComposicaoEstoqueCod_Filial.value) +
            ' AND COD_LOTE_TIPO='+FloatToStr(QRComposicaoEstoqueCod_Lote_Tipo.value));
    If wCusto = '' Then
       wCusto := '0';
    wVlEstoque := StrToFloat(wEstoque) * StrToFloat(wCusto);
    wQtEstoque := StrToFloat(wEstoque);
    wCusto_Anterior := StrToFloat(wCusto);
  End;
end;

procedure TFrComposicaoEstoque.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wTotal := wTotal + StrToFloat(Bib.LimpaString(QRLTotal.Caption,'.'));
  QRLGeral.Caption := FormatFloat('##,###,##0.00',wTotal);
end;

procedure TFrComposicaoEstoque.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wTotal := 0;
end;

End.
