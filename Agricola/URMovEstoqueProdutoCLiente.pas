unit URMovEstoqueProdutoCLiente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRMovEstoqueProdutoCliente = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr4: TQRExpr;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLPeriodo: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRGroup3: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRExpr1: TQRExpr;
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    wLiquido : Real;

  end;

var
  FRMovEstoqueProdutoCliente: TFRMovEstoqueProdutoCliente;
  wAux2 : Real;
implementation

uses UEstoque_cl, UNotaEntradaParam, URomaneioAgricola_cl;

{$R *.dfm}

procedure TFRMovEstoqueProdutoCliente.QRBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  DMRomaneioAgricola.QRMovEstoqueClienteliquido.Value := wLiquido;
end;

procedure TFRMovEstoqueProdutoCliente.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);

begin
  inherited;
  wAux2 := wAux2 + (DMRomaneioAgricola.QRMovEstoqueClienteestoqueinicial.Value+DMRomaneioAgricola.QRMovEstoqueClienteQT_ENTRADA.Value) - DMRomaneioAgricola.QRMovEstoqueClienteQT_SAIDA.Value;
  QRLabel12.Caption := FormatFloat('#,##0.00',wAux2);
end;

procedure TFRMovEstoqueProdutoCliente.QRGroup3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  wAux1 : Real;
begin
  inherited;
  wLiquido := 0;
  with DMRomaneioAgricola do
  Begin
    QRRomDesconto.Close;
    if trim(FNotaEntradaParam.ME10Filial.Text)<>'' then
      QrRomDesconto.SetVariable('FILIAL',StrToInt(Trim(FNotaEntradaParam.ME10Filial.Text)))
    else
      QrRomDesconto.SetVariable('FILIAL',Null);
    QrRomDesconto.SetVariable('PRODUTO',DMRomaneioAgricola.QRMovEstoqueClienteCod_Produto.Value);
    if trim(FNotaEntradaParam.ME10DtInicial.Text) <> '' then
      QrRomDesconto.SetVariable('DATAI',StrToDate(FNotaEntradaParam.ME10DtInicial.Text));
    if trim(FNotaEntradaParam.ME10DtFinal.Text)<>'' then
      QrRomDesconto.SetVariable('DATAF',StrToDate(FNotaEntradaParam.ME10DtFinal.Text));
    QrRomDesconto.SetVariable('IND_SITUACAO','T');
    QrRomDesconto.SetVariable('TIPO_ROMANEIO','ROMANEIO');
    Case FNotaEntradaParam.Rg10Pessoa.ItemIndex Of
        0 : QrRomDesconto.SetVariable('IND_FISICA_JURIDICA',NULL);
        1 : QrRomDesconto.SetVariable('IND_FISICA_JURIDICA',NULL);
        2 : QrRomDesconto.SetVariable('IND_FISICA_JURIDICA',NULL);
    End;
    QRRomDesconto.Open;

    while not QRRomDesconto.Eof do
    Begin
      wLiquido := wLiquido + QrRomDescontoliquido.Value;
      QrRomDesconto.Next;
    end;
    QRMovEstoqueClienteliquido.Value := wLiquido;
  end;
  wAux1 := StrTOFLoat(FNotaEntradaParam.Me10EstoqueInicial.Text);
  FRMovEstoqueProdutoCliente.QRLabel13.Caption := FormatFloat('#,##0.00',wAux1);   
  wAux2 := StrToFloat(FNotaEntradaParam.Me10EstoqueInicial.Text);
  FRMovEstoqueProdutoCliente.QRLabel12.Caption := FormatFloat('#,##0.00',wAux2);

end;

end.
