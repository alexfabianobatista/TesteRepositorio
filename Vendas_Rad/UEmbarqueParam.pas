unit UEmbarqueParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFEmbarqueParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label10: TLabel;
    BtEmbarque: TBitBtn;
    MEEmbarque: TMaskEdit;
    EdEmbarque: TEdit;
    Label22: TLabel;
    ME0Vendedor: TMaskEdit;
    Ed0Vendedor: TEdit;
    Bt0ConsVendedor: TBitBtn;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Me1Embarque: TMaskEdit;
    BitBtn1: TBitBtn;
    Ed1Embarque: TEdit;
    RgTipoPagto: TRadioGroup;
    TabSheet3: TTabSheet;
    Label2: TLabel;
    Me2Embarque1: TMaskEdit;
    BitBtn2: TBitBtn;
    Ed2Embarque1: TEdit;
    Me2Embarque2: TMaskEdit;
    BitBtn3: TBitBtn;
    Ed2Embarque2: TEdit;
    Me2Embarque3: TMaskEdit;
    BitBtn4: TBitBtn;
    Ed2Embarque3: TEdit;
    Me2Embarque4: TMaskEdit;
    BitBtn5: TBitBtn;
    Ed2Embarque4: TEdit;
    Label93: TLabel;
    MeFilial: TMaskEdit;
    BTConsFilial: TBitBtn;
    EdFilial: TEdit;
    TabSheet4: TTabSheet;
    Label3: TLabel;
    Me2Filial: TMaskEdit;
    Bt2ConsFilial: TBitBtn;
    Ed2Filial: TEdit;
    Label4: TLabel;
    Me2Embarque: TMaskEdit;
    Ed2Embarque: TEdit;
    Bt2Embarque: TBitBtn;
    Label7: TLabel;
    Me2Estado: TMaskEdit;
    Label8: TLabel;
    TabSheet5: TTabSheet;
    Label9: TLabel;
    Me3Embarque: TMaskEdit;
    BitBtn6: TBitBtn;
    Label11: TLabel;
    Me3Finalidade: TMaskEdit;
    BitBtn7: TBitBtn;
    Ed3Finalidade: TEdit;
    Me3Banco: TMaskEdit;
    BitBtn8: TBitBtn;
    Ed3Banco: TEdit;
    Label12: TLabel;
    Ed3Embarque: TEdit;
    Label13: TLabel;
    Ed3Placa: TEdit;
    Rg0Operacao: TRadioGroup;
    Rg2Operacao: TRadioGroup;
    Rg3Operacao: TRadioGroup;
    Rg4Operacao: TRadioGroup;
    Rg0Pintura: TRadioGroup;
    Rg0Estofaria: TRadioGroup;
    Rg1Tipo: TRadioGroup;
    Rg4OpcaoQtd: TRadioGroup;
    TabSheet6: TTabSheet;
    Label5: TLabel;
    Me4Embarque: TMaskEdit;
    BitBtn9: TBitBtn;
    Ed4Embarque: TEdit;
    Label6: TLabel;
    Me4Produto: TMaskEdit;
    BitBtn10: TBitBtn;
    Ed4Produto: TEdit;
    TabSheet7: TTabSheet;
    RG7Situacao: TRadioGroup;
    GroupBox1: TGroupBox;
    ME7DtInicio: TMaskEdit;
    ME7DtFim: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    TabSheet8: TTabSheet;
    Label16: TLabel;
    Me7Embarque: TMaskEdit;
    Bt7Embarque: TBitBtn;
    Ed7Embarque: TEdit;
    Label17: TLabel;
    Me3Operacao: TMaskEdit;
    BitBtn11: TBitBtn;
    Ed3Operacao: TEdit;
    TabSheet9: TTabSheet;
    Label20: TLabel;
    Me8Embarque: TMaskEdit;
    BitBtn12: TBitBtn;
    Ed8Embarque: TEdit;
    Label21: TLabel;
    Me8Cadastro: TMaskEdit;
    BitBtn13: TBitBtn;
    Ed8Cadastro: TEdit;
    TabSheet10: TTabSheet;
    ME9Embarque: TMaskEdit;
    SB9Embarque: TSpeedButton;
    GroupBox9: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    ME9DtInicial: TMaskEdit;
    ME9DtFinal: TMaskEdit;
    TabSheet11: TTabSheet;
    Label25: TLabel;
    ME9Classe: TMaskEdit;
    BitBtn14: TBitBtn;
    ED9Classe: TEdit;
    GroupBox2: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    ME9Data_I: TMaskEdit;
    ME9Data_F: TMaskEdit;
    Me0Operacao1: TMaskEdit;
    Label26: TLabel;
    BitBtn15: TBitBtn;
    Me0Operacao2: TMaskEdit;
    Label27: TLabel;
    BitBtn16: TBitBtn;
    Me0Operacao3: TMaskEdit;
    Label28: TLabel;
    BitBtn17: TBitBtn;
    Me0Operacao4: TMaskEdit;
    Label29: TLabel;
    BitBtn18: TBitBtn;
    GroupBox10: TGroupBox;
    Label91: TLabel;
    Label92: TLabel;
    ME0DtInicial: TMaskEdit;
    ME0DtFinal: TMaskEdit;
    procedure MEEmbarqueExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtEmbarqueClick(Sender: TObject);
    procedure Bt0ConsVendedorClick(Sender: TObject);
    procedure ME0VendedorExit(Sender: TObject);
    procedure Me1EmbarqueExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Me2Embarque1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Me2Embarque2Exit(Sender: TObject);
    procedure Me2Embarque3Exit(Sender: TObject);
    procedure Me2Embarque4Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BTConsFilialClick(Sender: TObject);
    procedure Me2FilialExit(Sender: TObject);
    procedure Me2EmbarqueExit(Sender: TObject);
    procedure Bt2ConsFilialClick(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
    procedure Me3EmbarqueExit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Me3FinalidadeExit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Me3BancoExit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Bt2EmbarqueClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Me4EmbarqueExit(Sender: TObject);
    procedure Me4ProdutoExit(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Bt7EmbarqueClick(Sender: TObject);
    procedure Me7EmbarqueExit(Sender: TObject);
    procedure Me3OperacaoExit(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure Me8EmbarqueExit(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure Me8CadastroExit(Sender: TObject);
    procedure SB9EmbarqueClick(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure ME9ClasseExit(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmbarqueParam: TFEmbarqueParam;

implementation

uses UEmbarque_cl, UEmbarqueCons, UVendedorCons, UVendedor_cl, UOracle_cl,
  UFilialCons, UFilial_cl, UFinalidadeCons, UFinalidade_cl, UBancosCons,
  UBancoAgencia_cl, UOperacaoCons, UOperacao_cl, UProdutoCons, UProduto_cl,
  UCadastroCons, UCadastro_cl, UClasseCons, UClasse_cl;

{$R *.DFM}

procedure TFEmbarqueParam.MEEmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(MEEmbarque.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(MEEmbarque.Text));
    QEmbarque.Open;
    EdEmbarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    EdEmbarque.Text := 'Todos';
end;

procedure TFEmbarqueParam.FormCreate(Sender: TObject);
begin
  inherited;
  MEEmbarque.Text := DMEmbarque.QEmbarqueCod_Embarque.Text;
  MEEmbarqueExit(Self);
end;

procedure TFEmbarqueParam.BtEmbarqueClick(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    MEEmbarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    MEEmbarqueExit(Self);
  End;
end;

procedure TFEmbarqueParam.Bt0ConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME0Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME0VendedorExit(Self);
  End;

end;

procedure TFEmbarqueParam.ME0VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Vendedor.Text) <> '' Then
    Ed0Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME0Vendedor.Text))
  Else
    Ed0Vendedor.Text := 'Todos';

end;

procedure TFEmbarqueParam.Me1EmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Embarque.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME1Embarque.Text));
    QEmbarque.Open;
    Ed1Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    Ed1Embarque.Text := 'Todos';

end;

procedure TFEmbarqueParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME1Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME1EmbarqueExit(Self);
  End;

end;

procedure TFEmbarqueParam.Me2Embarque1Exit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Embarque1.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME2Embarque1.Text));
    QEmbarque.Open;
    Ed2Embarque1.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    Ed2Embarque1.Text := 'Todos';


end;

procedure TFEmbarqueParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME2Embarque1.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME2Embarque1Exit(Self);
  End;

end;

procedure TFEmbarqueParam.Me2Embarque2Exit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Embarque2.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME2Embarque2.Text));
    QEmbarque.Open;
    Ed2Embarque2.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    Ed2Embarque2.Text := 'Todos';


end;

procedure TFEmbarqueParam.Me2Embarque3Exit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Embarque3.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME2Embarque3.Text));
    QEmbarque.Open;
    Ed2Embarque3.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    Ed2Embarque3.Text := 'Todos';


end;

procedure TFEmbarqueParam.Me2Embarque4Exit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Embarque4.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',StrToInt(Trim(ME2Embarque4.Text)));
    QEmbarque.Open;
    Ed2Embarque4.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    Ed2Embarque4.Text := 'Todos';


end;

procedure TFEmbarqueParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME2Embarque2.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME2Embarque2Exit(Self);
  End;

end;

procedure TFEmbarqueParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME2Embarque3.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME2Embarque3Exit(Self);
  End;

end;

procedure TFEmbarqueParam.BitBtn5Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME2Embarque4.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME2Embarque4exit(Self);
  End;

end;

procedure TFEmbarqueParam.BTConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    MEFilialExit(Self);
  End;

end;

procedure TFEmbarqueParam.Me2FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Filial.Text) <> '' Then
    Ed2Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME2Filial.Text))
  Else
    Ed2Filial.Text := 'Todos';

end;

procedure TFEmbarqueParam.Me2EmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Embarque.Text) <> '' then
  With DMEmbarque do
   Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME2Embarque.Text));
    QEmbarque.Open;
    Ed2Embarque.Text := QEmbarqueNome_Motorista.Value +' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
   End
  Else
    Ed2Embarque.Text := 'Todos';
end;

procedure TFEmbarqueParam.Bt2ConsFilialClick(Sender: TObject);
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

procedure TFEmbarqueParam.MeFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(MEFilial.Text) <> '' Then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(MEFilial.Text))
  Else
    EdFilial.Text := 'Todos';

end;

procedure TFEmbarqueParam.Me3EmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3Embarque.Text) <> '' then
  With DMEmbarque do
   Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME3Embarque.Text));
    QEmbarque.Open;
    Ed3Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
   End
  Else
    Ed3Embarque.Text := 'Deve Ser Informado Embarque';

end;

procedure TFEmbarqueParam.BitBtn6Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME3Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    Ed3Embarque.Text := DMEmbarque.QEmbarqueConsNome_Motorista.Value+
                        ' = '+DMEmbarque.QEmbarqueConsDt_Embarque.Text;
  End;

end;

procedure TFEmbarqueParam.Me3FinalidadeExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3Finalidade.Text) <> '' then
    Ed3Finalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+Trim(ME3Finalidade.Text))
  Else
    Ed3Finalidade.Text := 'Deve Ser Informado Uma Finalidade';

end;

procedure TFEmbarqueParam.BitBtn7Click(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal = mrOk then
  Begin
    Me3Finalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    Ed3Finalidade.Text := DMFinalidade.QFinalidadeConsDesc_Finalidade.Value;
  End;

end;

procedure TFEmbarqueParam.Me3BancoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3Banco.Text) <> '' Then
    Ed3Banco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME3Banco.Text)
  Else
    Ed3Banco.Text := '';

end;

procedure TFEmbarqueParam.BitBtn8Click(Sender: TObject);
begin
  inherited;
  If FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  If FBancosCons.showModal = mrOk then
  Begin
    ME3Banco.Text := DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Text;
    Ed3Banco.Text := DMBancoAgencia.QBancoAgenciaConsDesc_Banco_Agencia.Text;
  End;

end;

procedure TFEmbarqueParam.Bt2EmbarqueClick(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME2Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME2EmbarqueExit(Self);
  End;
end;

procedure TFEmbarqueParam.BitBtn9Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME4Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    Ed4Embarque.Text := DMEmbarque.QEmbarqueConsNome_Motorista.Value+
                        ' = '+DMEmbarque.QEmbarqueConsDt_Embarque.Text;
  End;

end;

procedure TFEmbarqueParam.Me4EmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(Me4Embarque.Text) <> '' then
  With DMEmbarque do
   Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(Me4Embarque.Text));
    QEmbarque.Open;
    Ed4Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
   End
  Else
    Ed4Embarque.Text := 'Deve Ser Informado Embarque';

end;

procedure TFEmbarqueParam.Me4ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me4Produto.Text) <> '' then
    Ed4Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(Me4Produto.Text))
  Else
    Ed4Produto.Text := 'Deve Ser Informado Um Produto';

end;

procedure TFEmbarqueParam.BitBtn10Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    Me4Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    Ed4Produto.Text := DMProduto.QProdutoConsDesc_Produto.Value;
  End;

end;

procedure TFEmbarqueParam.Bt7EmbarqueClick(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    Me7Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    Ed7Embarque.Text := DMEmbarque.QEmbarqueConsNome_Motorista.Value+
                        ' = '+DMEmbarque.QEmbarqueConsDt_Embarque.Text;
  End;

end;

procedure TFEmbarqueParam.Me7EmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(Me7Embarque.Text) <> '' then
  With DMEmbarque do
   Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(Me7Embarque.Text));
    QEmbarque.Open;
    Ed7Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
   End
  Else
    Ed7Embarque.Text := 'Deve Ser Informado Embarque';

end;

procedure TFEmbarqueParam.Me3OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me3Operacao.Text) <> '' Then
    Ed3Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+Me3Operacao.Text)
  Else
    Ed3Operacao.Text := '';

end;

procedure TFEmbarqueParam.BitBtn12Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    Me8Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    Ed8Embarque.Text := DMEmbarque.QEmbarqueConsNome_Motorista.Value+
                        ' = '+DMEmbarque.QEmbarqueConsDt_Embarque.Text;
  End;

end;

procedure TFEmbarqueParam.Me8EmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(Me4Embarque.Text) <> '' then
  With DMEmbarque do
   Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(Me4Embarque.Text));
    QEmbarque.Open;
    Ed8Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
   End
  Else
    Ed8Embarque.Text := 'Deve Ser Informado Embarque';

end;

procedure TFEmbarqueParam.BitBtn13Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    Me8Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    Ed8Cadastro.Text := DMCadastro.QCadastroConsNome.Value;
  End;
end;

procedure TFEmbarqueParam.Me8CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(Me8Cadastro.Text) <> '' Then
    Ed8Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(Me8Cadastro.Text))
  Else
    Ed8Cadastro.Text := '';
end;

procedure TFEmbarqueParam.SB9EmbarqueClick(Sender: TObject);
begin
  inherited;
If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    Me9Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
   End;
end;

procedure TFEmbarqueParam.BitBtn14Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME9Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
  End;
end;

procedure TFEmbarqueParam.ME9ClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(Me9Classe.Text) <> '' Then
    ED9Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','COD_CLASSE = '+Trim(ME9Classe.Text))
  Else
    Ed9Classe.Text := 'Todas';
end;

procedure TFEmbarqueParam.BitBtn17Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.showModal = mrOk then
    Me0Operacao3.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFEmbarqueParam.BitBtn16Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.showModal = mrOk then
    Me0Operacao2.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFEmbarqueParam.BitBtn18Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.showModal = mrOk then
    Me0Operacao4.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFEmbarqueParam.BitBtn15Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.showModal = mrOk then
    Me0Operacao1.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
end;

procedure TFEmbarqueParam.BitBtn11Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.showModal = mrOk then
  Begin
    Me3Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    Ed3Operacao.Text := DMOperacao.QOperacaoConsDesc_Operacao.Text;
  End;
end;

end.
