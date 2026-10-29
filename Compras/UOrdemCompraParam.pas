unit UOrdemCompraParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, DBCtrls;

type
  TFOrdemCompraParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Bt0Fornecedor: TBitBtn;
    ME0Cadastro: TMaskEdit;
    Fornecedor: TLabel;
    Label1: TLabel;
    Bt0ConsProduto: TBitBtn;
    ME0Produto: TMaskEdit;
    CB0Ordem: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Bt0ConsFilial: TBitBtn;
    ME0Filial: TMaskEdit;
    GroupBox1: TGroupBox;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    TabSheet2: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bt1Cadastro: TBitBtn;
    ME1Cadastro: TMaskEdit;
    Bt1Produto: TBitBtn;
    ME1Produto: TMaskEdit;
    CB1Ordem: TComboBox;
    Bt1Filial: TBitBtn;
    ME1Filial: TMaskEdit;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    ME1DataI: TMaskEdit;
    ME1DataF: TMaskEdit;
    Ed1Filial: TEdit;
    Ed1Cadastro: TEdit;
    Ed1Produto: TEdit;
    Ed0Filial: TEdit;
    Ed0Cadastro: TEdit;
    Ed0Produto: TEdit;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    ME2Filial: TMaskEdit;
    Bt2Filial: TBitBtn;
    Ed2Filial: TEdit;
    ME2Cadastro: TMaskEdit;
    Label13: TLabel;
    Bt2Cadastro: TBitBtn;
    Ed2Cadastro: TEdit;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    ME2DataI: TMaskEdit;
    ME2DataF: TMaskEdit;
    TabSheet4: TTabSheet;
    Label16: TLabel;
    Rg3Preco: TRadioGroup;
    TabSheet5: TTabSheet;
    Label17: TLabel;
    Me3OrdemCompra: TMaskEdit;
    Bt3Ordem: TBitBtn;
    TabSheet6: TTabSheet;
    Label18: TLabel;
    Me4OrdemCompra: TMaskEdit;
    Bt4ConsOrdemCompra: TBitBtn;
    Me4NumeroOrdemCompra: TMaskEdit;
    Rg1Situacao: TRadioGroup;
    Label19: TLabel;
    Me3Cadastro: TMaskEdit;
    Bt3Fornecedor: TBitBtn;
    Ed3Cadastro: TEdit;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Me3DtInicial: TMaskEdit;
    Me3DtFinal: TMaskEdit;
    Label22: TLabel;
    Label23: TLabel;
    Me0Classe: TMaskEdit;
    Bt0ConsClasse: TBitBtn;
    Ed0Classe: TEdit;
    Label24: TLabel;
    Me0SubClasse: TMaskEdit;
    Bt0SubClasse: TBitBtn;
    Ed0SubClasse: TEdit;
    Label25: TLabel;
    Me3Filial: TMaskEdit;
    Bt3Filial: TBitBtn;
    Ed3Filial: TEdit;
    Label26: TLabel;
    Bt3Produto: TBitBtn;
    Me3Produto: TMaskEdit;
    Ed3Produto: TEdit;
    Rg2Situacao: TRadioGroup;
    TabSheet7: TTabSheet;
    Label27: TLabel;
    Me5OrdemCompra: TMaskEdit;
    Bt5Ordem: TBitBtn;
    Label28: TLabel;
    Me5Cadastro: TMaskEdit;
    Bt5Fornecedor: TBitBtn;
    Ed5Cadastro: TEdit;
    Label29: TLabel;
    Me5Filial: TMaskEdit;
    Bt5Filial: TBitBtn;
    Ed5Filial: TEdit;
    Label30: TLabel;
    Me5Produto: TMaskEdit;
    Bt5Produto: TBitBtn;
    Ed5Produto: TEdit;
    GroupBox5: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Me5DtInicial: TMaskEdit;
    Me5DtFinal: TMaskEdit;
    TabSheet8: TTabSheet;
    GroupBox6: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Me6DtInicial: TMaskEdit;
    Me6DtFinal: TMaskEdit;
    Label35: TLabel;
    Me6Filial: TMaskEdit;
    Bt6Filial: TBitBtn;
    Ed6Filial: TEdit;
    Label36: TLabel;
    Me0Finalidade: TMaskEdit;
    Bt0Finalidade: TBitBtn;
    Ed0Finalidade: TEdit;
    Label37: TLabel;
    Me2Finalidade: TMaskEdit;
    Bt2Finalidade: TBitBtn;
    Ed2Finalidade: TEdit;
    Rg3Valores: TRadioGroup;
    procedure Bt0FornecedorClick(Sender: TObject);
    procedure ME0CadastroExit(Sender: TObject);
    procedure Bt0ConsProdutoClick(Sender: TObject);
    procedure ME0ProdutoExit(Sender: TObject);
    procedure Bt0ConsFilialClick(Sender: TObject);
    procedure ME0FilialExit(Sender: TObject);
    procedure ME1FilialExit(Sender: TObject);
    procedure ME1CadastroExit(Sender: TObject);
    procedure ME1ProdutoExit(Sender: TObject);
    procedure Bt1CadastroClick(Sender: TObject);
    procedure Bt1ProdutoClick(Sender: TObject);
    procedure Bt1FilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt2FilialClick(Sender: TObject);
    procedure ME2FilialExit(Sender: TObject);
    procedure Bt2CadastroClick(Sender: TObject);
    procedure ME2CadastroExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Bt3OrdemClick(Sender: TObject);
    procedure Bt4ConsOrdemCompraClick(Sender: TObject);
    procedure Me3CadastroExit(Sender: TObject);
    procedure Me0ClasseExit(Sender: TObject);
    procedure Bt0ConsClasseClick(Sender: TObject);
    procedure Me0SubClasseExit(Sender: TObject);
    procedure Bt0SubClasseClick(Sender: TObject);
    procedure Me3FilialExit(Sender: TObject);
    procedure Me3ProdutoExit(Sender: TObject);
    procedure Bt3FilialClick(Sender: TObject);
    procedure Bt3ProdutoClick(Sender: TObject);
    procedure Bt5OrdemClick(Sender: TObject);
    procedure Bt5FornecedorClick(Sender: TObject);
    procedure Me5CadastroExit(Sender: TObject);
    procedure Bt5FilialClick(Sender: TObject);
    procedure Me5FilialExit(Sender: TObject);
    procedure Bt5ProdutoClick(Sender: TObject);
    procedure Me5ProdutoExit(Sender: TObject);
    procedure Me6FilialExit(Sender: TObject);
    procedure Bt6FilialClick(Sender: TObject);
    procedure Me0FinalidadeExit(Sender: TObject);
    procedure Bt0FinalidadeClick(Sender: TObject);
    procedure Me2FinalidadeExit(Sender: TObject);
    procedure Bt2FinalidadeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrdemCompraParam: TFOrdemCompraParam;

implementation

uses UCadastro_cl, UCadastroCons, UProdutoCons, UProduto_cl, UFilialCons,
  UFilial_cl, UParamSistema_cl, UUsuario_cl, UOrdemCompraCons,
  UOrdemCompra_cl, UOracle_cl, UClasseCons, UClasse_cl, UFinalidadeCons,
  UFinalidade_cl;

{$R *.DFM}

procedure TFOrdemCompraParam.Bt0FornecedorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME0Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME0CadastroExit(Self);
  End;
end;

procedure TFOrdemCompraParam.ME0CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Cadastro.Text) <> '' then
     Ed0Cadastro.Text :=DMOracle.BuscaNome('SELECT NOME FROM  TB_CADASTRO',
                        'COD_CADASTRO = '+ME0Cadastro.text,True)
  Else
    Ed0Cadastro.Text := 'Todos';
end;


procedure TFOrdemCompraParam.Bt0ConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME0Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME0ProdutoExit(Self);
  End;
end;

procedure TFOrdemCompraParam.ME0ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Produto.Text) <> '' then
     Ed0Produto.Text :=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                        'COD_PRODUTO = '+ME0Produto.text,True)
  Else
    Ed0Produto.Text := 'Todos';
end;


procedure TFOrdemCompraParam.Bt0ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME0FilialExit(Self);
  End;
end;

procedure TFOrdemCompraParam.ME0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Filial.Text) <> '' then
     Ed0Filial.Text :=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                        'COD_FILIAL = '+Me0Filial.text,True)
  Else
    Ed0Filial.Text := 'Todos';
end;

procedure TFOrdemCompraParam.ME1FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Filial.Text) <> '' then
     Ed1Filial.Text :=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                        'COD_FILIAL = '+Me1Filial.text,True)
  Else
    Ed1Filial.Text := 'Todos';
end;

procedure TFOrdemCompraParam.ME1CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Cadastro.Text) <> '' then
     Ed1Cadastro.Text :=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                        'COD_CADASTRO = '+ME1Cadastro.text,True)
  Else
    Ed1Cadastro.Text := 'Todos';
end;

procedure TFOrdemCompraParam.ME1ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Produto.Text) <> '' then
     Ed1Produto.Text :=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                        'COD_PRODUTO = '+ME1Produto.text,True)
  Else
    Ed1Produto.Text := 'Todos';
end;

procedure TFOrdemCompraParam.Bt1CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME1Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME1CadastroExit(Self);
  End;
end;

procedure TFOrdemCompraParam.Bt1ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME1Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME1ProdutoExit(Self);
  End;
end;

procedure TFOrdemCompraParam.Bt1FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME1FilialExit(Self);
  End;
end;

procedure TFOrdemCompraParam.FormCreate(Sender: TObject);
begin
  inherited;
  CB0Ordem.ItemIndex := 0;
  CB1Ordem.ItemIndex := 0;  
end;

procedure TFOrdemCompraParam.Bt2FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME2Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME2FilialExit(Self);
  End;

end;

procedure TFOrdemCompraParam.ME2FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Filial.Text) <> '' then
     Ed2Filial.Text :=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                        'COD_FILIAL = '+ME2Filial.text,True)
  Else
    Ed2Filial.Text := 'Todos';

end;

procedure TFOrdemCompraParam.Bt2CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME2Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME2CadastroExit(Self);
  End;

end;

procedure TFOrdemCompraParam.ME2CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Cadastro.Text) <> '' then
     Ed2Cadastro.Text :=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                        'COD_CADASTRO = '+Me2Cadastro.text,True)
  Else
    Ed2Cadastro.Text := 'Todos';

end;

procedure TFOrdemCompraParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME0Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME1Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME2Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);

end;

procedure TFOrdemCompraParam.TabSheet2Show(Sender: TObject);
begin
  inherited;
  FOrdemCompraParam.HelpContext:=17;
end;

procedure TFOrdemCompraParam.TabSheet1Show(Sender: TObject);
begin
  inherited;
  FOrdemCompraParam.HelpContext:=16;
end;

procedure TFOrdemCompraParam.Bt3OrdemClick(Sender: TObject);
begin
  inherited;
  If FOrdemCompraCons = Nil then
    FOrdemCompraCons := TFOrdemCompraCons.Create(Application);
  If FOrdemCompraCons.ShowModal = mrOk then
    Me3OrdemCompra.Text := DMOrdemCompra.QOrdemCompraConsNum_Ordem_Compra.Text;

end;

procedure TFOrdemCompraParam.Bt4ConsOrdemCompraClick(Sender: TObject);
begin
  inherited;
  If FOrdemCompraCons = Nil then
    FOrdemCompraCons := TFOrdemCompraCons.Create(Application);
  If FOrdemCompraCons.ShowModal = mrOk then
   Begin
    Me4OrdemCompra.Text := DMOrdemCompra.QOrdemCompraConsCod_Ordem_Compra_Cab.Text;
    Me4NumeroOrdemCompra.Text := DMOrdemCompra.QOrdemCompraConsNum_Ordem_Compra.Text;
   End;
end;

procedure TFOrdemCompraParam.Me3CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(Me3Cadastro.Text) <> '' then
     Ed3Cadastro.Text :=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                        'COD_CADASTRO = '+Me3Cadastro.text,True)
  Else
    Ed3Cadastro.Text := 'Todos';

end;

procedure TFOrdemCompraParam.Me0ClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Classe.Text) <> '' then
     Ed0Classe.Text :=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                        'NUM_CLASSE = '+ME0Classe.text+' AND NUM_SUBCLASSE=0',True)
  Else
    Ed0Classe.Text := 'Todos';

end;

procedure TFOrdemCompraParam.Bt0ConsClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME0Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME0ClasseExit(Self);
  End;

end;

procedure TFOrdemCompraParam.Me0SubClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0SubClasse.Text) <> '' then
     Ed0SubClasse.Text :=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                        'NUM_CLASSE = '+ME0Classe.text+' AND NUM_SUBCLASSE='+Me0SubClasse.Text,True)
  Else
    Ed0SubClasse.Text := 'Todos';

end;

procedure TFOrdemCompraParam.Bt0SubClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME0SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME0SubClasseExit(Self);
  End;

end;

procedure TFOrdemCompraParam.Me3FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3Filial.Text) <> '' then
     Ed3Filial.Text :=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                        'COD_FILIAL = '+ME3Filial.text,True)
  Else
    Ed3Filial.Text := 'Todas';
end;

procedure TFOrdemCompraParam.Me3ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3Produto.Text) <> '' then
    Ed3Produto.Text :=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                        'COD_PRODUTO = '+ME3Produto.text,True)
  Else
    Ed3Produto.Text := 'Todos';
end;

procedure TFOrdemCompraParam.Bt3FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME3Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME3FilialExit(Self);
  End;
end;

procedure TFOrdemCompraParam.Bt3ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME3Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME3ProdutoExit(Self);
  End;
end;

procedure TFOrdemCompraParam.Bt5OrdemClick(Sender: TObject);
begin
  inherited;
  If FOrdemCompraCons = Nil then
    FOrdemCompraCons := TFOrdemCompraCons.Create(Application);
  If FOrdemCompraCons.ShowModal = mrOk then
   Begin
    Me5OrdemCompra.Text := DMOrdemCompra.QOrdemCompraConsNUM_ORDEM_COMPRA.Text;
   End;
end;

procedure TFOrdemCompraParam.Bt5FornecedorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME5Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME5CadastroExit(Self);
  End;
end;

procedure TFOrdemCompraParam.Me5CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(Me5Cadastro.Text) <> '' then
     Ed5Cadastro.Text :=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                        'COD_CADASTRO = '+Me5Cadastro.text,True)
  Else
    Ed5Cadastro.Text := 'Todos';
end;

procedure TFOrdemCompraParam.Bt5FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME5Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME5FilialExit(Self);
end;

procedure TFOrdemCompraParam.Me5FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME5Filial.Text) <> '' then
     Ed5Filial.Text :=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                        'COD_FILIAL = '+ME5Filial.text,True)
  Else
    Ed5Filial.Text := 'Todas';
end;

procedure TFOrdemCompraParam.Bt5ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME5Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME5ProdutoExit(Self);
  End;
end;

procedure TFOrdemCompraParam.Me5ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME5Produto.Text) <> '' then
    Ed5Produto.Text :=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                        'COD_PRODUTO = '+ME5Produto.text,True)
  Else
    Ed5Produto.Text := 'Todos';
end;

procedure TFOrdemCompraParam.Me6FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me6Filial.Text) <> '' then
     Ed6Filial.Text :=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                        'COD_FILIAL = '+Me6Filial.text,True)
  Else
    Ed6Filial.Text := 'Todas';

end;

procedure TFOrdemCompraParam.Bt6FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    Me6Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  Me6FilialExit(Self);

end;

procedure TFOrdemCompraParam.Me0FinalidadeExit(Sender: TObject);
begin
  inherited;
  If Trim(Me0Finalidade.Text) <> '' then
     Ed0Finalidade.Text :=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE',
                        'COD_FINALIDADE = '+Me0Finalidade.Text,True)
  Else
    Ed0Finalidade.Text := 'Todos';

end;

procedure TFOrdemCompraParam.Bt0FinalidadeClick(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal = mrOk then
    ME0Finalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
  Me0FinalidadeExit(Self);
end;

procedure TFOrdemCompraParam.Me2FinalidadeExit(Sender: TObject);
begin
  inherited;
  If Trim(Me2Finalidade.Text) <> '' then
     Ed2Finalidade.Text :=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE',
                        'COD_FINALIDADE = '+Me2Finalidade.Text,True)
  Else
    Ed2Finalidade.Text := 'Todos';

end;

procedure TFOrdemCompraParam.Bt2FinalidadeClick(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal = mrOk then
    Me2Finalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
  Me2FinalidadeExit(Self);

end;

end.
