unit UREstoqueClasse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFrEstoqueClasse = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLQtUltima: TQRLabel;
    QRLVlUltima: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand5: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel15: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText8: TQRDBText;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrEstoqueClasse: TFrEstoqueClasse;
implementation

uses UEstoque_cl, UOrdemCompra_cl, UOracle_cl, UProdutoRelatorio_cl;

{$R *.DFM}

procedure TFrEstoqueClasse.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  Var wDt_Inicio,wDt_Fim,wEmpresa : String;
begin
  inherited;
  wEmpresa :=DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA','COD_FILIAL>=0');
  If wEmpresa = 'CGS' Then
  Begin
    With DmOrdemCompra do
    Begin
      QOrdemCompraUltima.Close;
      QOrdemCompraUltima.SetVariable('PRODUTO',DMEstoque.QrEstoqueClasseCOD_PRODUTO.Value);
      wDt_Inicio := DateToStr(DMEstoque.QrEstoqueClasseDt_Compra.Value);
      wDt_Fim := Wdt_Inicio;
      If Trim(DMEstoque.QrEstoqueClasseDt_Compra.Text) = '' Then
       Begin
         QRLQtUltima.Caption := '';
         QRLVlUltima.Caption := '';
       End
      Else
       Begin
        QOrdemCompraUltima.SetVariable('RECEBIMENTO',wDt_Inicio);
        QOrdemCompraUltima.SetVariable('RECEBIMENTO1',wDt_Fim);
        QOrdemCompraUltima.Open;
        If QOrdemCompraUltima.Eof Then
         Begin
           QRLQtUltima.Caption := '';
           QRLVlUltima.Caption := '';
         End
        Else
         Begin
           QRLQtUltima.Caption := FormatFloat('###,##0',QOrdemCompraUltimaQt_Quantidade.Value);
           QRLVlUltima.Caption := FormatFloat('###,##0.00',QOrdemCompraUltimaVal_Unitario.Value);
         End;
       End;
     End;
   End
  Else
   Begin
     QRLQtUltima.Caption := FormatFloat('###,##0',DMEstoque.QrEstoqueClasseQt_Compra.Value);
     QRLVlUltima.Caption := FormatFloat('###,##0.00',DMEstoque.QrEstoqueClasseVL_ULTIMO_CUSTO.Value);
   End;
End;
End.
