unit UObra_Param;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, UFmProduto,
  UFmDatas, UFmObra, UFmFilial;

type
  TFObra_Param = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label117: TLabel;
    Me0Filial: TMaskEdit;
    Bt0Filial: TBitBtn;
    Ed0Filial: TEdit;
    Label1: TLabel;
    Label101: TLabel;
    Bt0Cadastro: TSpeedButton;
    ME0Cadastro: TMaskEdit;
    Ed0Cadastro: TMaskEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Me0DtInicio: TMaskEdit;
    Me0DtFim: TMaskEdit;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bt1Cadastro: TSpeedButton;
    Me1Filial: TMaskEdit;
    Bt1Filial: TBitBtn;
    Ed1Filial: TEdit;
    Me1Cadastro: TMaskEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Me1DtInicio: TMaskEdit;
    Me1DtFinal: TMaskEdit;
    Label9: TLabel;
    Bt1Obra: TSpeedButton;
    Me1Obra: TMaskEdit;
    Ed1Obra: TMaskEdit;
    Rg1TipoRelatorio: TRadioGroup;
    TabSheet3: TTabSheet;
    ME3Filial: TMaskEdit;
    ME3Obra: TMaskEdit;
    ME3Operador: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    GroupBox3: TGroupBox;
    ME3DtInicial: TMaskEdit;
    ME3DtFinal: TMaskEdit;
    Label13: TLabel;
    Label14: TLabel;
    SB3Filial: TSpeedButton;
    SB3Obra: TSpeedButton;
    SB3Operador: TSpeedButton;
    Ed3Filial: TEdit;
    Ed3Obra: TEdit;
    Ed3Operador: TEdit;
    TabSheet4: TTabSheet;
    Label15: TLabel;
    ME4Filial: TMaskEdit;
    Ed4Filial: TEdit;
    ME4Obra: TMaskEdit;
    Label16: TLabel;
    Ed4Obra: TEdit;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    ME4DtInicial: TMaskEdit;
    ME4DtFinal: TMaskEdit;
    SB4Obra: TSpeedButton;
    SB4Filial: TSpeedButton;
    CB4Tipo: TComboBox;
    Label17: TLabel;
    TabSheet5: TTabSheet;
    Label20: TLabel;
    ME5Filial: TMaskEdit;
    SB5Filial: TSpeedButton;
    Ed5Filial: TEdit;
    ME5Obra: TMaskEdit;
    Label21: TLabel;
    SB5Obra: TSpeedButton;
    Ed5Obra: TEdit;
    GroupBox5: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    ME5DtInicial: TMaskEdit;
    ME5DtFinal: TMaskEdit;
    Label24: TLabel;
    ME5Cadastro: TMaskEdit;
    SB5Cadastro: TSpeedButton;
    Ed5Cadastro: TEdit;
    TabSheet6: TTabSheet;
    Label25: TLabel;
    ME6Filial: TMaskEdit;
    SB6Filial: TSpeedButton;
    Ed6Filial: TEdit;
    Label26: TLabel;
    ME6Obra: TMaskEdit;
    SB6Obra: TSpeedButton;
    Ed6Obra: TEdit;
    TabSheet7: TTabSheet;
    Label30: TLabel;
    ME7Filial: TMaskEdit;
    SBFilial: TSpeedButton;
    Ed7Filial: TEdit;
    Label31: TLabel;
    ME7Obra: TMaskEdit;
    SB7Obra: TSpeedButton;
    Ed7Obra: TEdit;
    TabSheet8: TTabSheet;
    Label27: TLabel;
    ME8Filial: TMaskEdit;
    SB8Filial: TSpeedButton;
    Ed8Filial: TEdit;
    Ed8Obra: TEdit;
    SB8Obra: TSpeedButton;
    ME8Obra: TMaskEdit;
    Label28: TLabel;
    Label29: TLabel;
    Ed8CentroCusto: TEdit;
    SB8CentroCusto: TSpeedButton;
    ME8CentroCusto: TMaskEdit;
    ME8DtInicial: TMaskEdit;
    Label32: TLabel;
    Label33: TLabel;
    ME8DtFinal: TMaskEdit;
    TabSheet9: TTabSheet;
    Label34: TLabel;
    ME9Filial: TMaskEdit;
    SB9Filial: TSpeedButton;
    Ed9Filial: TEdit;
    Label35: TLabel;
    ME9Obra: TMaskEdit;
    SB9Obra: TSpeedButton;
    Ed9Obra: TEdit;
    Label36: TLabel;
    ME9Cadastro: TMaskEdit;
    SB9Cadastro: TSpeedButton;
    Ed9Cadastro: TEdit;
    Label37: TLabel;
    ME9DtInicial: TMaskEdit;
    ME9DtFinal: TMaskEdit;
    Label38: TLabel;
    Label39: TLabel;
    ME1Competencia: TMaskEdit;
    Rg1Ordem: TRadioGroup;
    Rg0Situacao: TRadioGroup;
    TabSheet10: TTabSheet;
    Fm10Filial: TFmFilial;
    Fm10Obra: TFmObra;
    Fm10Datas: TFmDatas;
    Rg1TipoPagamento: TRadioGroup;
    Label40: TLabel;
    Me1Produto: TMaskEdit;
    SbProduto: TSpeedButton;
    Label41: TLabel;
    ME1Operacao: TMaskEdit;
    SbOperacao: TSpeedButton;
    procedure Me0FilialExit(Sender: TObject);
    procedure Bt0FilialClick(Sender: TObject);
    procedure ME0CadastroExit(Sender: TObject);
    procedure Bt0CadastroClick(Sender: TObject);
    procedure Me1FilialExit(Sender: TObject);
    procedure Bt1FilialClick(Sender: TObject);
    procedure Me1CadastroExit(Sender: TObject);
    procedure Bt1CadastroClick(Sender: TObject);
    procedure Me1ObraExit(Sender: TObject);
    procedure Bt1ObraClick(Sender: TObject);
    procedure SB3FilialClick(Sender: TObject);
    procedure ME3FilialExit(Sender: TObject);
    procedure SB3ObraClick(Sender: TObject);
    procedure SB3OperadorClick(Sender: TObject);
    procedure ME3ObraExit(Sender: TObject);
    procedure ME3OperadorExit(Sender: TObject);
    procedure ME4FilialExit(Sender: TObject);
    procedure SB4FilialClick(Sender: TObject);
    procedure SB4ObraClick(Sender: TObject);
    procedure ME4ObraExit(Sender: TObject);
    procedure ME5ObraExit(Sender: TObject);
    procedure ME5FilialExit(Sender: TObject);
    procedure ME5CadastroExit(Sender: TObject);
    procedure SB5FilialClick(Sender: TObject);
    procedure SB5ObraClick(Sender: TObject);
    procedure SB5CadastroClick(Sender: TObject);
    procedure ME6FilialExit(Sender: TObject);
    procedure ME6ObraExit(Sender: TObject);
    procedure SB6FilialClick(Sender: TObject);
    procedure SB6ObraClick(Sender: TObject);
    procedure ME7FilialExit(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure ME7ObraExit(Sender: TObject);
    procedure SB7ObraClick(Sender: TObject);
    procedure SB8FilialClick(Sender: TObject);
    procedure SB8ObraClick(Sender: TObject);
    procedure SB8CentroCustoClick(Sender: TObject);
    procedure ME8ObraExit(Sender: TObject);
    procedure ME8FilialExit(Sender: TObject);
    procedure ME8CentroCustoExit(Sender: TObject);
    procedure ME9FilialExit(Sender: TObject);
    procedure ME9ObraExit(Sender: TObject);
    procedure SB9FilialClick(Sender: TObject);
    procedure SB9ObraClick(Sender: TObject);
    procedure ME9CadastroExit(Sender: TObject);
    procedure SB9CadastroClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SbProdutoClick(Sender: TObject);
    procedure SbOperacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObra_Param: TFObra_Param;

implementation

uses UFilial_cl, UOracle_cl, UFilialCons, UCadastro_cl, UCadastroCons,
  UObra_cl, UObraCons, UCentroCustoCons, UCentroCusto_cl, UParamSistema_cl,
  UProdutoCons, UProduto_cl, UOperacao_cl, UOperacaoCons;

{$R *.DFM}

procedure TFObra_Param.Me0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me0Filial.Text) <> '' Then
  With DMFilial do
    Ed0Filial.Text := DMOracle.BuscaNome('SELECT DESC_Filial FROM TB_Filial',
                                                       'COD_Filial = '+Trim(Me0Filial .Text))
  Else
    Ed0Filial.Text := 'Todos';

end;

procedure TFObra_Param.Bt0FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me0FilialExit(Self);
  End;
end;

procedure TFObra_Param.ME0CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Cadastro.Text) <> '' Then
  with DMCadastro do
     Ed0Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(Me0Cadastro.Text))
  else
     Ed0Cadastro.Text := 'Todos';
end;

procedure TFObra_Param.Bt0CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    Me0Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    Me0CadastroExit(Self);
  end;

end;

procedure TFObra_Param.Me1FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me1Filial.Text) <> '' Then
  With DMFilial do
    Ed1Filial.Text := DMOracle.BuscaNome('SELECT DESC_Filial FROM TB_Filial',
                                                       'COD_Filial = '+Trim(Me1Filial .Text))
  Else
    Ed1Filial.Text := 'Todos';

end;

procedure TFObra_Param.Bt1FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me1FilialExit(Self);
  End;

end;

procedure TFObra_Param.Me1CadastroExit(Sender: TObject);
begin
  inherited;
{  if Trim(Me1Cadastro.Text) <> '' Then
  with DMCadastro do
     Ed1Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(Me1Cadastro.Text))
  else
     Ed1Cadastro.Text := 'Todos';
}
end;

procedure TFObra_Param.Bt1CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    If Trim(Me1Cadastro.Text) <> '' Then
       Me1Cadastro.Text := Me1Cadastro.Text + ',' + DMCadastro.QCadastroConsCod_Cadastro.Text
    Else
       Me1Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFObra_Param.Me1ObraExit(Sender: TObject);
begin
  inherited;
  if Trim(Me1Obra.Text) <> '' Then
  with DMObra do
     Ed1Obra.Text := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA','COD_OBRA = '+Trim(Me1Obra.Text))
  else
     Ed1Obra.Text := 'Todos';

end;

procedure TFObra_Param.Bt1ObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons = Nil then
     FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal = MrOk then
  begin
    Me1Obra.Text := DMObra.QObra_ConsCod_Obra.Text;
    Me1ObraExit(Self);
  end;
end;

procedure TFObra_Param.SB3FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me3Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me3FilialExit(Self);
     end;
end;

procedure TFObra_Param.ME3FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me3Filial.Text) <> '' Then
  With DMFilial do
    Ed3Filial.Text := DMOracle.BuscaNome('SELECT DESC_Filial FROM TB_Filial',
                                                       'COD_Filial = '+Trim(Me3Filial .Text))
  Else
    Ed3Filial.Text := 'Todos';

end;

procedure TFObra_Param.SB3ObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons = Nil then
     FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal = MrOk then
  begin
    Me3Obra.Text := DMObra.QObra_ConsCod_Obra.Text;
    Me3ObraExit(Self);
   end;
end;

procedure TFObra_Param.SB3OperadorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    Me3Operador.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    Me3OperadorExit(Self);

    end;
end;

procedure TFObra_Param.ME3ObraExit(Sender: TObject);
begin
  inherited;
  if Trim(Me3Obra.Text) <> '' Then
  with DMObra do
     Ed3Obra.Text := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA','COD_OBRA = '+Trim(Me3Obra.Text))
  else
     Ed3Obra.Text := 'Todos';

end;

procedure TFObra_Param.ME3OperadorExit(Sender: TObject);
begin
  inherited;
  if Trim(Me3Operador.Text) <> '' Then
  with DMCadastro do
     Ed3Operador.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(Me3operador.Text))
  else
     Ed3Operador.Text := 'Todos';

end;

procedure TFObra_Param.ME4FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me4Filial.Text) <> '' Then
  With DMFilial do
    Ed4Filial.Text := DMOracle.BuscaNome('SELECT DESC_Filial FROM TB_Filial',
                                          'COD_Filial = '+Trim(Me4Filial .Text))
  Else
    Ed4Filial.Text := 'Todos';

end;

procedure TFObra_Param.SB4FilialClick(Sender: TObject);
begin
  inherited;
 If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me4Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me4FilialExit(Self);
     end;
end;

procedure TFObra_Param.SB4ObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons = Nil then
     FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal = MrOk then
  begin
    Me4Obra.Text := DMObra.QObra_ConsCod_Obra.Text;
    Me4ObraExit(Self);
   end;

end;

procedure TFObra_Param.ME4ObraExit(Sender: TObject);
begin
  inherited;
  if Trim(Me4Obra.Text) <> '' Then
  with DMObra do
     Ed4Obra.Text := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA',
                                        'COD_OBRA = '+Trim(Me4Obra.Text))
  else
     Ed4Obra.Text := 'Todos';

end;

procedure TFObra_Param.ME5ObraExit(Sender: TObject);
begin
  inherited;
  if Trim(Me5Obra.Text) <> '' Then
  with DMObra do
     Ed5Obra.Text := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA',
                                        'COD_OBRA = '+Trim(Me5Obra.Text))
  else
     Ed5Obra.Text := 'Todos';

end;

procedure TFObra_Param.ME5FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me5Filial.Text) <> '' Then
  With DMFilial do
    Ed5Filial.Text := DMOracle.BuscaNome('SELECT DESC_Filial FROM TB_Filial',
                                          'COD_Filial = '+Trim(Me5Filial.Text))
  Else
    Ed5Filial.Text := 'Todos';

end;

procedure TFObra_Param.ME5CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(Me5Cadastro.Text) <> '' Then
  with DMCadastro do
     Ed5Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(Me5Cadastro.Text))
  else
     Ed5Cadastro.Text := 'Todos';

end;

procedure TFObra_Param.SB5FilialClick(Sender: TObject);
begin
  inherited;
 If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me5Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me5FilialExit(Self);
     end;

end;

procedure TFObra_Param.SB5ObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons = Nil then
     FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal = MrOk then
  begin
    Me5Obra.Text := DMObra.QObra_ConsCod_Obra.Text;
    Me5ObraExit(Self);
   end;

end;

procedure TFObra_Param.SB5CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    Me5Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    Me5CadastroExit(Self);
  end;
end;

procedure TFObra_Param.ME6FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me6Filial.Text) <> '' Then
  With DMFilial do
    Ed6Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                          'COD_FILIAL = '+Trim(Me6Filial.Text))
  Else
    Ed6Filial.Text := 'Todos';

end;

procedure TFObra_Param.ME6ObraExit(Sender: TObject);
begin
  inherited;
  if Trim(Me6Obra.Text) <> '' Then
  with DMObra do
     Ed6Obra.Text := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA',
                                        'COD_OBRA = '+Trim(Me6Obra.Text))
  else
     Ed6Obra.Text := 'Todos';
end;

procedure TFObra_Param.SB6FilialClick(Sender: TObject);
begin
  inherited;
 If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me6Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me6FilialExit(Self);
     end;

end;

procedure TFObra_Param.SB6ObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons = Nil then
     FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal = MrOk then
  begin
    Me6Obra.Text := DMObra.QObra_ConsCod_Obra.Text;
    Me6ObraExit(Self);
   end;

end;

procedure TFObra_Param.ME7FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me7Filial.Text) <> '' Then
  With DMFilial do
    Ed7Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                          'COD_FILIAL = '+Trim(Me7Filial .Text))
  Else
    Ed7Filial.Text := 'Todos';

end;

procedure TFObra_Param.SBFilialClick(Sender: TObject);
begin
  inherited;
 If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me7Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me7FilialExit(Self);
     end;

end;

procedure TFObra_Param.ME7ObraExit(Sender: TObject);
begin
  inherited;
    if Trim(Me7Obra.Text) <> '' Then
  with DMObra do
     Ed7Obra.Text := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA',
                                        'COD_OBRA = '+Trim(Me7Obra.Text))
  else
     Ed7Obra.Text := 'Todos';


end;

procedure TFObra_Param.SB7ObraClick(Sender: TObject);
begin
  inherited;
    if FObraCons = Nil then
     FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal = MrOk then
  begin
    Me7Obra.Text := DMObra.QObra_ConsCod_Obra.Text;
    Me7ObraExit(Self);
   end;


end;

procedure TFObra_Param.SB8FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me8Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me8FilialExit(Self);
  end;
end;

procedure TFObra_Param.SB8ObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons = Nil then
     FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal = MrOk then
  begin
    Me8Obra.Text := DMObra.QObra_ConsCod_Obra.Text;
    Me8ObraExit(Self);
  end;
end;

procedure TFObra_Param.SB8CentroCustoClick(Sender: TObject);
begin
  inherited;
  if FCentroCustoCons = Nil then
     FCentroCustoCons := TFCentroCustoCons.Create(Application);
  if FCentroCustoCons.ShowModal = MrOk then
  begin
    Me8CentroCusto.Text := DMCentroCusto.QCentroCustoConsCod_Centro_Custo.Text;
    Me8CentroCustoExit(Self);
  end;
end;

procedure TFObra_Param.ME8ObraExit(Sender: TObject);
begin
  inherited;
 if Trim(Me8Obra.Text) <> '' Then
  with DMObra do
     Ed8Obra.Text := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA',
                                        'COD_OBRA = '+Trim(Me8Obra.Text))
  else
     Ed8Obra.Text := 'Todos';
end;

procedure TFObra_Param.ME8FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me8Filial.Text) <> '' Then
  With DMFilial do
    Ed8Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                          'COD_FILIAL = '+Trim(Me8Filial .Text))
  Else
    Ed8Filial.Text := 'Todas';
end;

procedure TFObra_Param.ME8CentroCustoExit(Sender: TObject);
begin
  inherited;
If Trim(Me8CentroCusto.Text) <> '' Then
  With DMCentroCusto do
    Ed8CentroCusto.Text := DMOracle.BuscaNome('SELECT DESC_CENTRO_CUSTO FROM TB_CENTRO_CUSTO',
                                          'COD_CENTRO_CUSTO = '+Trim(Me8CentroCusto .Text))
  Else
    Ed8CentroCusto.Text := 'Todos';
end;

procedure TFObra_Param.ME9FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me9Filial.Text) <> '' Then
  With DMFilial do
    Ed9Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                          'COD_FILIAL = '+Trim(Me9Filial .Text))
  Else
    Ed9Filial.Text := 'Todas';
end;

procedure TFObra_Param.ME9ObraExit(Sender: TObject);
begin
  inherited;
 if Trim(Me9Obra.Text) <> '' Then
  with DMObra do
     Ed9Obra.Text := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA',
                                        'COD_OBRA = '+Trim(Me9Obra.Text))
  else
     Ed9Obra.Text := 'Todos';
end;

procedure TFObra_Param.SB9FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me9Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me9FilialExit(Self);
  end;
end;

procedure TFObra_Param.SB9ObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons = Nil then
     FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal = MrOk then
  begin
    Me9Obra.Text := DMObra.QObra_ConsCod_Obra.Text;
    Me9ObraExit(Self);
  end;
end;

procedure TFObra_Param.ME9CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(Me9Cadastro.Text) <> '' Then
//  with DMCadastro do
     Ed9Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(Me9Cadastro.Text))
  else
     Ed9Cadastro.Text := 'Todos';
end;

procedure TFObra_Param.SB9CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    Me9Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    Me9CadastroExit(Self);
  end;
end;

procedure TFObra_Param.FormActivate(Sender: TObject);
begin
  inherited;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'RAZENTE' Then
   Begin
     Label39.Visible := False;
     Me1Competencia.Visible := False;
     Rg1Ordem.Left := 8;
   End;
end;

procedure TFObra_Param.SbProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    If Trim(Me1Produto.Text) <> '' Then
       Me1Produto.Text := Me1Produto.Text + ',' + DMProduto.QProdutoConsCod_Produto.Text
    Else
       Me1Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;

end;

procedure TFObra_Param.SbOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = Nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    If Trim(Me1Operacao.Text) <> '' Then
       Me1Operacao.Text := Me1Operacao.Text + ',' + DMOperacao.QOperacaoConsCod_Operacao.Text
    Else
       Me1Operacao.Text := DMoperacao.QOperacaoConsCod_Operacao.Text;

end;

end.
