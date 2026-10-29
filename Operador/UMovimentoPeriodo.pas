unit UMovimentoPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, ComCtrls, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFMovimentoPeriodo = class(TFTConsulta)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    SpeedButton1: TSpeedButton;
    MEFilial: TMaskEdit;
    MECodProduto: TMaskEdit;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    MEProduto: TMaskEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    MEDtInicial: TMaskEdit;
    MEDtFinal: TMaskEdit;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    TabSheet3: TTabSheet;
    DBGrid4: TDBGrid;
    TabSheet4: TTabSheet;
    DBGrid5: TDBGrid;
    MeQtFixacao: TMaskEdit;
    MeValFixacao: TMaskEdit;
    Label3: TLabel;
    Label6: TLabel;
    MeQtCompras: TMaskEdit;
    MeValCompras: TMaskEdit;
    MeVlGp: TMaskEdit;
    MeQtGp: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    MeQtCf: TMaskEdit;
    MeVlCf: TMaskEdit;
    TabSheet5: TTabSheet;
    Label9: TLabel;
    MeQtFixacaoRes: TMaskEdit;
    MeVlFixacaoRes: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    MeQtCompraRes: TMaskEdit;
    MeVlCompraRes: TMaskEdit;
    Label13: TLabel;
    MeQtGpRes: TMaskEdit;
    MeVlGpRes: TMaskEdit;
    Label14: TLabel;
    MeQtCfRes: TMaskEdit;
    MeVlCfRes: TMaskEdit;
    Label15: TLabel;
    MeQtTotal: TMaskEdit;
    MeVlTotal: TMaskEdit;
    MeMediaFixacao: TMaskEdit;
    MeMediaCompras: TMaskEdit;
    MeMediaGp: TMaskEdit;
    MeMediaCf: TMaskEdit;
    MeMediaFixacaoRes: TMaskEdit;
    MeMediaComprasRes: TMaskEdit;
    MeMediaGpRes: TMaskEdit;
    MeMediaCfRes: TMaskEdit;
    MeMediaTotal: TMaskEdit;
    Label16: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure METextoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MECodProdutoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMovimentoPeriodo: TFMovimentoPeriodo;

implementation

uses UDMComprasDia_cl, UFilial_cl, UProdutoCons, UProduto_cl, UOracle_cl,
  UFilialCons;

{$R *.DFM}

procedure TFMovimentoPeriodo.BtProcurarClick(Sender: TObject);
Var wQtFixacao,wVlFixacao,wQtCompras,wVlCompras,wQtGp,wVlGp,wQtCf,wVlCf : Real;
begin
  inherited;
  With DMComprasDia do
  Begin
    QNotasFixacao.Close;
    QNotasCompras.Close;
    QContratoGp.Close;
    QContratoCf.Close;
    If Trim(MeTexto.Text) <> '' Then
     Begin
      QNotasFixacao.SetVariable('COD_FILIAL',MeTexto.Text);
      QNotasCompras.SetVariable('COD_FILIAL',MeTexto.Text);
      QContratoGp.SetVariable('COD_FILIAL',MeTexto.Text);
      QContratoCf.SetVariable('COD_FILIAL',MeTexto.Text);
     End
    Else
     Begin
      QNotasFixacao.SetVariable('COD_FILIAL',Null);
      QNotasCompras.SetVariable('COD_FILIAL',Null);
      QContratoGp.SetVariable('COD_FILIAL',Null);
      QContratoCf.SetVariable('COD_FILIAL',Null);
     End;
    If Trim(MeCodProduto.Text) <> '' Then
     Begin
      QNotasFixacao.SetVariable('COD_PRODUTO',MeCodProduto.Text);
      QNotasCompras.SetVariable('COD_PRODUTO',MeCodProduto.Text);
      QContratoGp.SetVariable('COD_PRODUTO',MeCodProduto.Text);
      QContratoCf.SetVariable('COD_PRODUTO',MeCodProduto.Text);
     End
    Else
      Raise Exception.Create('Deve ser Informado o código do produto');
    QNotasFixacao.SetVariable('DATAI',StrToDate(MeDtInicial.Text));
    QNotasFixacao.SetVariable('DATAF',StrToDate(MeDtFinal.Text));
    QNotasCompras.SetVariable('DATAI',StrToDate(MeDtInicial.Text));
    QNotasCompras.SetVariable('DATAF',StrToDate(MeDtFinal.Text));
    QContratoGp.SetVariable('DATAI',StrToDate(MeDtInicial.Text));
    QContratoGp.SetVariable('DATAF',StrToDate(MeDtFinal.Text));
    QContratoCf.SetVariable('DATAI',StrToDate(MeDtInicial.Text));
    QContratoCf.SetVariable('DATAF',StrToDate(MeDtFinal.Text));
    QNotasFixacao.Open;
    wQtFixacao := 0;
    wVlFixacao := 0;
    QNotasFixacao.First;
    While Not (QNotasFixacao.Eof) Do
    begin
      wQtFixacao := wQtFixacao + QNotasFixacaoTotal_Item.Value;
      wVlFixacao := wVlFixacao + QNotasFixacaoVal_Total.Value;
      QNotasFixacao.Next;
    End;
    MeQtFixacao.Text := FormatFloat('#,##0',wQtFixacao);
    MeValFixacao.Text := FormatFloat('#,##0.00',wVlFixacao);
    MeQtFixacaoRes.Text := FormatFloat('#,##0',wQtFixacao);
    MeVlFixacaoRes.Text := FormatFloat('#,##0.00',wVlFixacao);
    If wQtFixacao <> 0 Then
     Begin
      MeMediaFixacao.Text := FormatFloat('#,##0.00',wVlFixacao / wQtFixacao * 60);
      MeMediaFixacaoRes.Text := FormatFloat('#,##0.00',wVlFixacao / wQtFixacao * 60);
     End
    Else
     Begin
      MeMediaFixacao.Text := '0';
      MeMediaFixacaoRes.Text := '0';
     End;

    QNotasCompras.Open;
    wQtCompras := 0;
    wVlCompras := 0;
    QNotasCompras.First;
    While Not (QNotasCompras.Eof) Do
    begin
      wQtCompras := wQtCompras + QNotasComprasTotal_Item.Value;
      wVlCompras := wVlCompras + QNotasComprasVal_Total.Value;
      QNotasCompras.Next;
    End;
    MeQtCompras.Text := FormatFloat('#,##0',wQtCompras);
    MeValCompras.Text := FormatFloat('#,##0.00',wVlCompras);
    MeQtCompraRes.Text := FormatFloat('#,##0',wQtCompras);
    MeVlCompraRes.Text := FormatFloat('#,##0.00',wVlCompras);
    If wQtCompras <> 0 Then
     Begin
      MeMediaCompras.Text := FormatFloat('#,##0.00',wVlCompras / wQtCompras * 60);
      MeMediaComprasRes.Text := FormatFloat('#,##0.00',wVlCompras / wQtCompras * 60);
     End
    Else
     Begin
      MeMediaCompras.Text := '0';
      MeMediaComprasRes.Text := '0';
     End;

    QContratoGp.Open;
    wQtGp := 0;
    wVlGp := 0;
    QContratoGp.First;
    While Not (QContratoGp.Eof) Do
    begin
      wQtGp := wQtGp + QContratoGpQt_Saldo.Value;
      wVlGp := wVlGp + QContratoGpValor.Value;
      QContratoGp.Next;
    End;
    MeQtGp.Text := FormatFloat('#,##0',wQtGp);
    MeVlGp.Text := FormatFloat('#,##0.00',wVlGp);
    MeQtGpRes.Text := FormatFloat('#,##0',wQtGp);
    MeVlGpRes.Text := FormatFloat('#,##0.00',wVlGp);
    If wQtGp <> 0 Then
     Begin
      MeMediaGp.Text := FormatFloat('#,##0.00',wVlGp / wQtGp * 60);
      MeMediaGpRes.Text := FormatFloat('#,##0.00',wVlGp / wQtGp * 60);
     End
    Else
     Begin
      MeMediaGp.Text := '0';
      MeMediaGpRes.Text := '0';
     End;

    QContratoCf.Open;
    wQtCf := 0;
    wVlCf := 0;
    QContratoCf.First;
    While Not (QContratoCf.Eof) Do
    begin
      wQtCf := wQtCf + QContratoCfQt_Saldo.Value;
      wVlCf := wVlCf + QContratoCfVal_Total.Value;
      QContratoCf.Next;
    End;
    MeQtCf.Text := FormatFloat('#,##0',wQtCf);
    MeVlCf.Text := FormatFloat('#,##0.00',wVlCf);
    MeQtCfRes.Text := FormatFloat('#,##0',wQtCf);
    MeVlCfRes.Text := FormatFloat('#,##0.00',wVlCf);
    If wQtCf <> 0 Then
     Begin
      MeMediaCfRes.Text := FormatFloat('#,##0.00',wVlCf / wQtCf * 60);
      MeMediaCf.Text := FormatFloat('#,##0.00',wVlCf / wQtCf * 60);
     End
    Else
     Begin
      MeMediaCfRes.Text := '0';
      MeMediaCf.Text := '0';
     End;
    MeQtTotal.Text := FormatFloat('#,##0',wQtCf + wQtGp + wQtCompras + wQtFixacao);
    MeVlTotal.Text := FormatFloat('#,##0.00',wVlCf + wVlGp + wVlCompras + wVlFixacao);
    If (wQtCf + wQtGp + wQtCompras + wQtFixacao) <> 0 Then
       MeMediaTotal.Text := FormatFloat('#,##0.00',(wVlCf + wVlGp + wVlCompras + wVlFixacao) / (wQtCf + wQtGp + wQtCompras + wQtFixacao) * 60)
    Else
       MeMediaTotal.Text := '0';
  End;
end;

procedure TFMovimentoPeriodo.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil  then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal  = mrOK then
   begin
     METexto.text := DMFilial.QFilialConsCod_filial.text;
     METextoExit(Self);
   end;
end;

procedure TFMovimentoPeriodo.METextoExit(Sender: TObject);
begin
  inherited;
  if Trim(METexto.text) <> '' then
    MEFilial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+METexto.text)
  else
    MEFilial.text:='Todos';

end;

procedure TFMovimentoPeriodo.SpeedButton2Click(Sender: TObject);
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

procedure TFMovimentoPeriodo.MECodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodProduto.Text) <> '' then
    MEProduto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MECodProduto.text)
  else
    MEProduto.text:='Todos';

end;

end.
