unit UOperador_Cons1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, ComCtrls, StdCtrls, Buttons, Db, Grids, DBGrids, Mask, variants;

type
  TFOperador_Cons1 = class(TFTConsulta)
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    MECodProduto: TMaskEdit;
    MEProduto: TMaskEdit;
    MECodFilial: TMaskEdit;
    MEFilial: TMaskEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    MEDtInicial: TMaskEdit;
    MEDtFinal: TMaskEdit;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label6: TLabel;
    DBGrid2: TDBGrid;
    MeSaldoContrato: TMaskEdit;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    DBGrid3: TDBGrid;
    MeValorCompra: TMaskEdit;
    MeMediaCompra: TMaskEdit;
    MeSaldo: TMaskEdit;
    TabSheet3: TTabSheet;
    Label10: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBGrid4: TDBGrid;
    MeQuantReal: TMaskEdit;
    TabSheet4: TTabSheet;
    Label11: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBGrid5: TDBGrid;
    MeQuantCf: TMaskEdit;
    MeValorCf: TMaskEdit;
    MeMediaCf: TMaskEdit;
    TabSheet5: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    Label25: TLabel;
    DBGrid6: TDBGrid;
    MeSaldoEmbRetirar: TMaskEdit;
    MeSaldoEmbEntregue: TMaskEdit;
    MeValorReal: TMaskEdit;
    MeValorDolar: TMaskEdit;
    MeMediaReal: TMaskEdit;
    MeMediaDolar: TMaskEdit;
    MeQuantDolar: TMaskEdit;
    procedure MECodFilialExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MECodProdutoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperador_Cons1: TFOperador_Cons1;

implementation

uses UOracle_cl, UFilialCons, UFilial_cl, UProdutoCons, UProduto_cl,
  UOperador_cl;

{$R *.DFM}

procedure TFOperador_Cons1.MECodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial.text) <> '' then
    MEFilial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.text)
  else
    MEFilial.text:='Todos';

end;

procedure TFOperador_Cons1.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil  then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal  = mrOK then
    begin
      MECodFilial.text := DMfilial.QFilialConsCod_filial.text;
      MECodFilialExit(Self);
    end;

end;

procedure TFOperador_Cons1.MECodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodProduto.Text) <> '' then
    MEProduto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MECodProduto.text)
  else
    MEProduto.text:='Todos';

end;

procedure TFOperador_Cons1.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:= TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      MECodProduto.text:=DMProduto.QProdutoConsCod_produto.text;
      MECodProdutoExit(Self);
    end;

end;

procedure TFOperador_Cons1.BitBtn1Click(Sender: TObject);
Var wQuant,wSaldo,wQtEntregue,wQtRetirar,wQuant_Dolar,wSaldo_Dolar : Real;
begin
  inherited;
  With DMOperador Do
  Begin
    QContratoVendAberto.Close;
    QNotaAgricola_Aberto.Close;
    QContratoGP_Aberto.Close;
    QContratoC_Aberto.Close;
    QContratoVenda_SaldoEmb.Close;
    If Trim(MeCodFilial.Text) <> '' Then
     Begin
      QContratoVendAberto.SetVariable('COD_FILIAL',MeCodFilial.Text);
      QNotaAgricola_Aberto.SetVariable('COD_FILIAL',MeCodFilial.Text);
      QContratoGP_Aberto.SetVariable('COD_FILIAL',MeCodFilial.Text);
      QContratoC_Aberto.SetVariable('COD_FILIAL',MeCodFilial.Text);
      QContratoVenda_SaldoEmb.SetVariable('COD_FILIAL',MeCodFilial.Text);
     End
    Else
     Begin
      QContratoVendAberto.SetVariable('COD_FILIAL',Null);
      QNotaAgricola_Aberto.SetVariable('COD_FILIAL',Null);
      QContratoGP_Aberto.SetVariable('COD_FILIAL',Null);
      QContratoC_Aberto.SetVariable('COD_FILIAL',Null);
      QContratoVenda_SaldoEmb.SetVariable('COD_FILIAL',Null);
     End;
    If Trim(MeCodProduto.Text) <> '' Then
     Begin
      QContratoVendAberto.SetVariable('COD_PRODUTO',MeCodProduto.Text);
      QNotaAgricola_Aberto.SetVariable('COD_PRODUTO',MeCodProduto.Text);
      QContratoGP_Aberto.SetVariable('COD_PRODUTO',MeCodProduto.Text);
      QContratoC_Aberto.SetVariable('COD_PRODUTO',MeCodProduto.Text);
      QContratoVenda_SaldoEmb.SetVariable('COD_PRODUTO',MeCodProduto.Text);
     End
    Else
     Begin
      QContratoVendAberto.SetVariable('COD_PRODUTO',Null);
      QNotaAgricola_Aberto.SetVariable('COD_PRODUTO',Null);
      QContratoGP_Aberto.SetVariable('COD_PRODUTO',Null);
      QContratoC_Aberto.SetVariable('COD_PRODUTO',Null);
      QContratoVenda_SaldoEmb .SetVariable('COD_PRODUTO',Null);
     End;
//    QContratoVendAberto.SetVariable('DATA_I',StrToDate(MeDtInicial.Text));
//    QContratoVendAberto.SetVariable('DATA_F',StrToDate(MeDtFinal.Text));
    QNotaAgricola_Aberto.SetVariable('DATAI',StrToDate(MeDtInicial.Text));
    QNotaAgricola_Aberto.SetVariable('DATAF',StrToDate(MeDtFinal.Text));
    QContratoGP_Aberto.SetVariable('DT_ENTREGA_INIC',StrToDate(MeDtInicial.Text));
    QContratoGP_Aberto.SetVariable('DT_ENTREGA_FIM',StrToDate(MeDtFinal.Text));
    QContratoC_Aberto.SetVariable('DT_ENTREGA',StrToDate(MeDtFinal.Text));
    QContratoVendAberto.Open;
    QNotaAgricola_Aberto.Open;
    QContratoGP_Aberto.Open;
    QContratoC_Aberto.Open;
    QContratoVenda_SaldoEmb.Open;
    //contrato de venda em aberto
    wSaldo := 0;
    QContratoVendAberto.First;
    While Not (QContratoVendAberto.Eof) Do
    begin
      wSaldo := wSaldo + QContratoVendAbertoVal_Saldo.Value;
      QContratoVendAberto.Next;
    End;
    MeSaldoContrato.Text := FormatFloat('#,##0',wSaldo);

    // notas agricola em aberto
    wQuant := 0;
    wSaldo := 0;
    While Not (QNotaAgricola_Aberto.Eof) do
    Begin
      wQuant := wQuant + QNotaAgricola_AbertoSaldo.Value;
      wSaldo := wSaldo + QNotaAgricola_AbertoVal_Total.Value;
      QNotaAgricola_Aberto.Next;
    End;
    MeSaldo.Text := FormatFloat('#,##0',wQuant);
    MeValorCompra.Text := FormatFloat('#,##0.00',wSaldo);
    If wQuant <> 0 Then
       MeMediaCompra.Text := FormatFloat('#,##0.00',wSaldo / wQuant * 60);

    // contrato de garantia de preco em aberto
    wQuant := 0;
    wSaldo := 0;
    wQuant_Dolar := 0;
    wSaldo_Dolar := 0;
    While Not (QContratoGP_Aberto.Eof) Do
    Begin
      If QContratoGP_AbertoDesc_Tipo_Preco.Value = 'REAL' Then
       Begin
         wQuant := wQuant + QContratoGP_AbertoQt_Saldo.Value;
         wSaldo := wSaldo + QContratoGP_AbertoValor.Value;
       End
      Else
       Begin
         wQuant_Dolar := wQuant_Dolar + QContratoGP_AbertoQt_Saldo.Value;
         wSaldo_Dolar := wSaldo_Dolar + QContratoGP_AbertoValor.Value;
       End;
      QContratoGP_Aberto.Next;
    End;
    MeQuantReal.Text := FormatFloat('#,##0',wQuant);
    MeValorReal.Text := FormatFloat('#,##0.00',wSaldo);
    If wQuant <> 0 Then
       MeMediaReal.Text := FormatFloat('#,##0.00',wSaldo / wQuant * 60);
    MeQuantDolar.Text := FormatFloat('#,##0',wQuant_Dolar);
    MeValorDolar.Text := FormatFloat('#,##0.00',wSaldo_Dolar);
    If wQuant_Dolar <> 0 Then
       MeMediaDolar.Text := FormatFloat('#,##0.00',wSaldo_Dolar / wQuant_Dolar * 60);

    // cotrato de compra futura em aberto
    wQuant := 0;
    wSaldo := 0;
    While Not (QContratoC_Aberto.Eof) Do
    Begin
      wQuant := wQuant + QContratoC_AbertoQt_Saldo.Value;
      wSaldo := wSaldo + QContratoC_AbertoVal_Total.Value;
      QContratoC_Aberto.Next;
    End;
    MeQuantCf.Text := FormatFloat('#,##0',wQuant);
    MeValorCf.Text := FormatFloat('#,##0.00',wSaldo);
    If wQuant <> 0 Then
       MeMediaCf.Text := FormatFloat('#,##0.00',wSaldo / wQuant * 60);

    // cotrato de venda a embarcar
    wQtEntregue := 0;
    wQtRetirar := 0;
    While Not (QContratoVenda_SaldoEmb.Eof) Do
    Begin
      If QContratoVenda_SaldoEmbIND_RET_ENTR.Value = 'ENTREGA' Then
        wQtEntregue := wQtEntregue + QContratoVenda_SaldoEmbQt_Saldo.Value
      Else
        wQtRetirar := wQtRetirar + QContratoVenda_SaldoEmbQt_Saldo.Value;
      QContratoVenda_SaldoEmb.Next;
    End;
    MeSaldoEmbRetirar.Text := FormatFloat('#,##0',wQtRetirar);
    MeSaldoEmbEntregue.Text := FormatFloat('#,##0',wQtEntregue);
  End;

end;

end.
