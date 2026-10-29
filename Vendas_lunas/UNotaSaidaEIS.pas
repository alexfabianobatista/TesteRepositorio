unit UNotaSaidaEIS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, mxDB, Db, mxtables, mxstore, TeeProcs, TeEngine, Chart,
  mxgraph, Grids, mxgrid, ExtCtrls, mxpivsrc, ComCtrls, StdCtrls, Buttons,
  DBCtrls, Mask, Series, ImgList;

type
  TFNotaSaidaEIS = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BitBtn1: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    MECadastro: TMaskEdit;
    BtCadastro: TBitBtn;
    MEProduto: TMaskEdit;
    BtProduto: TBitBtn;
    MEFilial: TMaskEdit;
    BtFilial: TBitBtn;
    EdFilial: TEdit;
    EdCadastro: TEdit;
    EdProduto: TEdit;
    GroupBox1: TGroupBox;
    MEDataF: TMaskEdit;
    MEDataI: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MEOperacao: TMaskEdit;
    BtConsOperacao: TBitBtn;
    EdOperacao: TEdit;
    RGTipoGrafico: TRadioGroup;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    Planilha: TTabSheet;
    Label4: TLabel;
    BtTipoProduto: TBitBtn;
    EdTipoProduto: TEdit;
    Memo1: TMemo;
    BtImprimeGraf: TBitBtn;
    procedure BtFilialClick(Sender: TObject);
    procedure BtCadastroClick(Sender: TObject);
    procedure BtProdutoClick(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
    procedure MECadastroExit(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtConsOperacaoClick(Sender: TObject);
    procedure MEOperacaoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtTipoProdutoClick(Sender: TObject);
    procedure BtImprimeGrafClick(Sender: TObject);
    procedure DSNotasStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaSaidaEIS: TFNotaSaidaEIS;

implementation

uses UFilialCons, UFilial_cl, UCadastroCons, UProdutoCons,
  UProduto_cl, UCadastro_cl, UOperacaoCons, UOperacao_cl, UTipoProdCons;

{$R *.DFM}

procedure TFNotaSaidaEIS.BtFilialClick(Sender: TObject);
begin
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    MEFilialExit(Self);
  End;
end;

procedure TFNotaSaidaEIS.BtCadastroClick(Sender: TObject);
begin
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    MECadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    MECadastroExit(Self);
  End;
end;

procedure TFNotaSaidaEIS.BtProdutoClick(Sender: TObject);
begin
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    MEProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    MEProdutoExit(Self);
  End;
end;

procedure TFNotaSaidaEIS.MEFilialExit(Sender: TObject);
begin
  If Trim(MEFilial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',MEFilial.Text);
    QFilial.Open;
    EdFilial.Text := QFilialDesc_Filial.Value;
  End
  Else
    EdFilial.Text := 'Todos';
end;

procedure TFNotaSaidaEIS.MECadastroExit(Sender: TObject);
begin
  If Trim(MECadastro.Text) <> '' Then
  With DMCadastro do
  Begin
    QCadastro.Close;
    QCadastro.SetVariable('PK',MECadastro.Text);
    QCadastro.Open;
    EdCadastro.Text := QCadastroNome.Value;
  End
  Else
    EdCadastro.Text := 'Todos';
end;

procedure TFNotaSaidaEIS.MEProdutoExit(Sender: TObject);
begin
  If Trim(MEProduto.Text) <> '' Then
  With DMProduto do
  Begin
    QProduto.Close;
    QProduto.SetVariable('PK',MEProduto.Text);
    QProduto.Open;
    EdProduto.Text := QProdutoDesc_Produto.Value;
  End
  Else
    EdProduto.Text := 'Todos';
end;

procedure TFNotaSaidaEIS.BitBtn1Click(Sender: TObject);
begin
  DQNotas.Close;
  DQNotas.ParambyName('DATA_I').AsDate := StrToDate(MEDataI.Text);
  DQNotas.ParambyName('DATA_F').AsDate := StrToDate(MEDataF.Text);
  If RGTipoGrafico.ItemIndex = 0 then
    DQNotas.ParamByName('TIPO_NOTA').AsString := 'E'
  Else
    DQNotas.ParamByName('TIPO_NOTA').AsString := 'S';
  If Trim(MEFilial.Text) = '' Then
    DQNotas.ParamByName('FILIAL').Clear
  Else
    DQNotas.ParambyName('FILIAL').AsFloat := StrToFloat(MEFilial.Text);

  If Trim(MECadastro.Text) = '' Then
    DQNotas.ParamByName('CADASTRO').Clear
  Else
    DQNotas.ParambyName('CADASTRO').AsFloat := StrToFloat(MECadastro.Text);

  If Trim(MEProduto.Text) = '' Then
    DQNotas.ParamByName('PRODUTO').Clear
  Else
    DQNotas.ParambyName('PRODUTO').AsFloat := StrToFloat(MEProduto.Text);

  If Trim(EdTipoProduto.Text) = 'Todos' Then
    DQNotas.ParamByName('TIPO_PRODUTO').Clear
  Else
    DQNotas.ParambyName('TIPO_PRODUTO').AsString := EdTipoProduto.Text;

  If Trim(MEOperacao.Text) = '' Then
    DQNotas.ParamByName('OPERACAO').Clear
  Else
    DQNotas.ParambyName('OPERACAO').AsFloat := StrToFloat(MEOperacao.Text);

  DQNotas.Open;

end;

procedure TFNotaSaidaEIS.BtConsOperacaoClick(Sender: TObject);
begin
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    MEOperacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    MEOperacaoExit(Self);
  End;
end;

procedure TFNotaSaidaEIS.MEOperacaoExit(Sender: TObject);
begin
  If Trim(MEOperacao.Text) <> '' Then
  With DMOperacao do
  Begin
    QOperacao.Close;
    QOperacao.SetVariable('PK',MEOperacao.Text);
    QOperacao.Open;
    EdOperacao.Text := QOperacaoDesc_Operacao.Value;
  End
  Else
    EdOperacao.Text := 'Todos';
end;

procedure TFNotaSaidaEIS.FormActivate(Sender: TObject);
begin
  MEDataI.Text := DateToStr(Date-360);
  MEDataF.Text := DateToStr(Date);  
end;

procedure TFNotaSaidaEIS.BtTipoProdutoClick(Sender: TObject);
begin
  If FTipoProdCons = Nil then
    FTipoProdCons := TFTipoProdCons.Create(Application);
  If FTipoProdCons.ShowModal = mrOk then
  Begin
    EdTipoProduto.Text := DMProduto.QTipoProdConsInd_Tipo_Produto.Text;
    //METipoProdutoExit(Self);
  End;
end;

procedure TFNotaSaidaEIS.BtImprimeGrafClick(Sender: TObject);
begin
  DGNotas.Print;
end;

procedure TFNotaSaidaEIS.DSNotasStateChange(Sender: TObject);
begin
  BtImprimeGraf.Enabled := DQNotas.State = dsBrowse;
end;

end.
