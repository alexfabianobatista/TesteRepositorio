unit ULivroFiscalParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFLivroFiscalParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    ME0Filial: TMaskEdit;
    Bt0ConsFilial: TBitBtn;
    Ed0Filial: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    Label2: TLabel;
    Me0Operacao: TMaskEdit;
    Bt0Operacao: TBitBtn;
    Ed0Operacao: TEdit;
    TabSheet2: TTabSheet;
    Me1Filial: TMaskEdit;
    BitBtn1: TBitBtn;
    Ed1Filial: TEdit;
    Me1Operacao: TMaskEdit;
    BitBtn2: TBitBtn;
    Ed1Operacao: TEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Me1DataI: TMaskEdit;
    Me1DataF: TMaskEdit;
    Rg1Opcao: TRadioGroup;
    Label7: TLabel;
    Label8: TLabel;
    TabSheet3: TTabSheet;
    Label9: TLabel;
    Me3Filial: TMaskEdit;
    Bt3ConsFilial: TBitBtn;
    Ed3Filial: TEdit;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Me3DataI: TMaskEdit;
    Me3DataF: TMaskEdit;
    SDlgAMagnetico: TSaveDialog;
    TabSheet4: TTabSheet;
    Label12: TLabel;
    Me4Filial: TMaskEdit;
    BitBtn3: TBitBtn;
    Ed4Filial: TEdit;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Me4DataI: TMaskEdit;
    Me4DataF: TMaskEdit;
    TabSheet5: TTabSheet;
    Label15: TLabel;
    ME5Filial: TMaskEdit;
    Ed5Filial: TEdit;
    GroupBox5: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    ME5DataI: TMaskEdit;
    ME5DataF: TMaskEdit;
    ME5Operacao: TMaskEdit;
    Label18: TLabel;
    Ed5Operacao: TEdit;
    tBtn5Filial: TBitBtn;
    BitBtn5: TBitBtn;
    Label19: TLabel;
    ME5Regiao: TMaskEdit;
    Btn5Regiao: TBitBtn;
    Ed5Regiao: TEdit;
    TabSheet6: TTabSheet;
    ME6Filial: TMaskEdit;
    Label20: TLabel;
    Btn6Filial: TBitBtn;
    Ed6Filial: TEdit;
    GroupBox6: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    ME6DataI: TMaskEdit;
    ME6DataF: TMaskEdit;
    TabSheet7: TTabSheet;
    Label21: TLabel;
    ME7_Filial: TMaskEdit;
    BT7_Filial: TBitBtn;
    ED7_Filial: TEdit;
    GroupBox7: TGroupBox;
    Label22: TLabel;
    Label25: TLabel;
    ME7_DataI: TMaskEdit;
    ME7_DataF: TMaskEdit;
    Label26: TLabel;
    ME7_Cidade: TMaskEdit;
    ME7_Estado: TMaskEdit;
    Label27: TLabel;
    BT7_Estado: TBitBtn;
    ED7_Estado: TEdit;
    Me5Cadastro: TMaskEdit;
    Label28: TLabel;
    Bt5Cadastro: TBitBtn;
    Ed5Cadastro: TEdit;
    Label29: TLabel;
    Me7Operacao1: TMaskEdit;
    BitBtn4: TBitBtn;
    Me7Operacao2: TMaskEdit;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Me7Operacao3: TMaskEdit;
    Me7Operacao4: TMaskEdit;
    BitBtn8: TBitBtn;
    Me7Operacao7: TMaskEdit;
    BitBtn11: TBitBtn;
    BitBtn10: TBitBtn;
    Me7Operacao6: TMaskEdit;
    Me7Operacao5: TMaskEdit;
    BitBtn9: TBitBtn;
    Me7Operacao8: TMaskEdit;
    BitBtn12: TBitBtn;
    ME7Operacao9: TMaskEdit;
    Me7Operacao10: TMaskEdit;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    TabSheet8: TTabSheet;
    Label30: TLabel;
    MECodFilial8: TMaskEdit;
    BtnFilialCons8: TBitBtn;
    EdDescFilial8: TEdit;
    GroupBox8: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    MEDataI8: TMaskEdit;
    MEDataF8: TMaskEdit;
    Label33: TLabel;
    MEEstado8: TMaskEdit;
    EdEstadoDesc: TEdit;
    Label34: TLabel;
    Me4Cadastro: TMaskEdit;
    Bt4Cadastro: TBitBtn;
    Ed4Cadastro: TEdit;
    TabSheet9: TTabSheet;
    Label35: TLabel;
    ME9CodFilial: TMaskEdit;
    BitBtn15: TBitBtn;
    ED9DescFilial: TEdit;
    GroupBox9: TGroupBox;
    Label36: TLabel;
    ME9Mes: TMaskEdit;
    ME9Ano: TMaskEdit;
    Label37: TLabel;
    RGTipoArquivo: TRadioGroup;
    Rg3TipoArquivo: TRadioGroup;
    Rg3TipoNota: TRadioGroup;
    Rg0Ordem: TRadioGroup;
    TabSheet10: TTabSheet;
    Label38: TLabel;
    ME9Filial: TMaskEdit;
    Bt9Filial: TBitBtn;
    Ed9Filial: TEdit;
    Gb9DataRef: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    Me9DataI: TMaskEdit;
    Me9DataF: TMaskEdit;
    ME9Cidade: TMaskEdit;
    Label41: TLabel;
    Bt9Cidade: TBitBtn;
    Ed9Cidade: TEdit;
    procedure ME0FilialExit(Sender: TObject);
    procedure Bt0ConsFilialClick(Sender: TObject);
    procedure Me0OperacaoExit(Sender: TObject);
    procedure Bt0OperacaoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Me1FilialExit(Sender: TObject);
    procedure Me1OperacaoExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Me3FilialExit(Sender: TObject);
    procedure Bt3ConsFilialClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Me4FilialExit(Sender: TObject);
    procedure ME5FilialExit(Sender: TObject);
    procedure ME5OperacaoExit(Sender: TObject);
    procedure Btn5Operacao(Sender: TObject);
    procedure tBtn5FilialClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ME5RegiaoExit(Sender: TObject);
    procedure Btn5RegiaoClick(Sender: TObject);
    procedure ME6FilialExit(Sender: TObject);
    procedure Btn6FilialClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ME7_FilialExit(Sender: TObject);
    procedure BT7_FilialClick(Sender: TObject);
    procedure ME7_EstadoExit(Sender: TObject);
    procedure BT7_EstadoClick(Sender: TObject);
    procedure Me5CadastroExit(Sender: TObject);
    procedure Bt5CadastroClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure MECodFilial8Exit(Sender: TObject);
    procedure BtnFilialCons8Click(Sender: TObject);
    procedure MEEstado8Exit(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure Me4CadastroExit(Sender: TObject);
    procedure Bt4CadastroClick(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure ME9CodFilialExit(Sender: TObject);
    procedure Bt9FilialClick(Sender: TObject);
    procedure ME9FilialExit(Sender: TObject);
    procedure Bt9CidadeClick(Sender: TObject);
    procedure ME9CidadeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLivroFiscalParam: TFLivroFiscalParam;

implementation

uses UFilial_cl, UFilialCons, UOperacao_cl, UOperacaoCons, UOracle_cl,
  URegiao_cl, URegiaoCons, UUsuario_cl, UEstado_cl, UEstadoCons,
  UCadastro_cl, UCadastroCons, UCidadeCons, UCidade_cl;

{$R *.DFM}

procedure TFLivroFiscalParam.ME0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME0Filial.Text);
    QFilial.Open;
    Ed0Filial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed0Filial.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt0ConsFilialClick(Sender: TObject);
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

procedure TFLivroFiscalParam.Me0OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Operacao.Text) <> '' Then
  With DMOperacao do
  Begin
    QOperacao.Close;
    QOperacao.SetVariable('PK',ME0Operacao.Text);
    QOperacao.Open;
    Ed0Operacao.Text := QOperacaoDesc_Operacao.Value;
  End
  Else
    Ed0Operacao.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt0OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME0Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME0OperacaoExit(Self);
  End;

end;

procedure TFLivroFiscalParam.BitBtn1Click(Sender: TObject);
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

procedure TFLivroFiscalParam.Me1FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME1Filial.Text);
    QFilial.Open;
    Ed1Filial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed1Filial.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Me1OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Operacao.Text) <> '' Then
  With DMOperacao do
  Begin
    QOperacao.Close;
    QOperacao.SetVariable('PK',ME1Operacao.Text);
    QOperacao.Open;
    Ed1Operacao.Text := QOperacaoDesc_Operacao.Value;
  End
  Else
    Ed1Operacao.Text := 'Todos';

end;

procedure TFLivroFiscalParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME1Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME1OperacaoExit(Self);
  End;

end;

procedure TFLivroFiscalParam.Me3FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME3Filial.Text);
    QFilial.Open;
    Ed3Filial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed3Filial.Text := 'Todos';
end;

procedure TFLivroFiscalParam.Bt3ConsFilialClick(Sender: TObject);
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

procedure TFLivroFiscalParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME4Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME4FilialExit(Self);
  End;

end;

procedure TFLivroFiscalParam.Me4FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME4Filial.Text);
    QFilial.Open;
    Ed4Filial.Text := QFilialDesc_Filial.Value;
  End
  Else
    Ed4Filial.Text := 'Todos';

end;

procedure TFLivroFiscalParam.ME5FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5Filial.Text) <> '' Then
  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME5Filial.Text);
    QFilial.Open;
    Ed5Filial.Text := QFilialDesc_Filial.Value;
  end
  else
    Ed5Filial.Text := 'Todos';

end;

procedure TFLivroFiscalParam.ME5OperacaoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5Operacao.Text) <> '' Then
  with DMOperacao do
  begin
    QOperacao.Close;
    QOperacao.SetVariable('PK',ME5Operacao.Text);
    QOperacao.Open;
    Ed5Operacao.Text := QOperacaoDesc_Operacao.Value;
  end
  else
    Ed5Operacao.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Btn5Operacao(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME5Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME5OperacaoExit(Self);
  End;

end;

procedure TFLivroFiscalParam.tBtn5FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME5Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME5FilialExit(Self);
  end;
end;

procedure TFLivroFiscalParam.BitBtn5Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME5Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME5OperacaoExit(Self);
  End;

end;

procedure TFLivroFiscalParam.ME5RegiaoExit(Sender: TObject);

begin
  inherited;
  if Trim(ME5Regiao.Text) <> '' Then
  with DMRegiao do
  begin
    QRegiao.Close;
    QRegiao.SetVariable('PK',ME5Filial.Text);
    QRegiao.Open;
    Ed5Regiao.Text := QRegiaoDesc_Regiao.Value;
  end
  else
    Ed5Regiao.Text := 'Todos';
end;

procedure TFLivroFiscalParam.Btn5RegiaoClick(Sender: TObject);
begin
  inherited;
  if FRegiaoCons = Nil then
     FRegiaoCons := TFRegiaoCons.Create(Application);
  if FRegiaoCons.ShowModal = mrOk then
  begin
    ME5Regiao.Text := DMRegiao.QRegiaoConsCod_Regiao.Text;
    ME5RegiaoExit(Self);
  end;

end;

procedure TFLivroFiscalParam.ME6FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME6Filial.Text) <> '' Then
  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME6Filial.Text);
    QFilial.Open;
    Ed6Filial.Text := QFilialDesc_Filial.Value;
  end
  else
    Ed6Filial.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Btn6FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME6Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME6FilialExit(Self);
  end;

end;

procedure TFLivroFiscalParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME0Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me1Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me3Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me4Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME5Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME6Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME7_Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  MECodFilial8.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me0FilialExit(Self);
  Me1FilialExit(Self);
  Me3FilialExit(Self);
  Me4FilialExit(Self);
  ME5FilialExit(Self);
  ME6FilialExit(Self);
  ME7_FilialExit(Self);
  MECodFilial8Exit(Self);  
end;

procedure TFLivroFiscalParam.ME7_FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7_Filial.Text) <> '' Then
  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME7_Filial.Text);
    QFilial.Open;
    ED7_Filial.Text := QFilialDesc_Filial.Value;
  end
  else
    ED7_Filial.Text := 'Todos';
end;

procedure TFLivroFiscalParam.BT7_FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME7_Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME7_FilialExit(Self);
  end;
end;

procedure TFLivroFiscalParam.ME7_EstadoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7_Estado.Text) <> '' Then
  with DMEstado do
  begin
    QEstado.Close;
    QEstado.SetVariable('COD_ESTADO',FLivroFiscalParam.ME7_Estado.Text);
    QEstado.Open;
    ED7_Estado.Text := QEstadoDesc_Estado.Text
  end
  else
    ED7_Estado.Text := 'Todos';
end;

procedure TFLivroFiscalParam.BT7_EstadoClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = mrOk then
  begin
    ME7_Estado.Text := DMEstado.QEstadoConsCod_Estado.Text;
    ED7_Estado.Text := DMEstado.QEstadoConsDesc_Estado.Text;
  end;
end;
procedure TFLivroFiscalParam.Me5CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5Cadastro.Text) <> '' Then
     Ed5Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME5Cadastro.Text);

  if Ed5Cadastro.Text = '' then
     Ed5Cadastro.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt5CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    ME5Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME5CadastroExit(Self);
  end;

end;

procedure TFLivroFiscalParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME7Operacao1.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
  End;

end;

procedure TFLivroFiscalParam.BitBtn6Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME7Operacao2.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
  End;

end;

procedure TFLivroFiscalParam.BitBtn7Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME7Operacao3.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
  End;
End;

procedure TFLivroFiscalParam.BitBtn8Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME7Operacao4.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
  End;
End;

procedure TFLivroFiscalParam.BitBtn9Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME7Operacao5.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
  End;
End;

procedure TFLivroFiscalParam.BitBtn10Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME7Operacao6.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
  End;
End;

procedure TFLivroFiscalParam.BitBtn11Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME7Operacao7.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
  End;
End;

procedure TFLivroFiscalParam.BitBtn12Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME7Operacao8.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
  End;
End;

procedure TFLivroFiscalParam.BitBtn13Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME7Operacao9.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
  End;
End;

procedure TFLivroFiscalParam.BitBtn14Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME7Operacao10.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
  End;
End;

procedure TFLivroFiscalParam.MECodFilial8Exit(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial8.Text) <> '' Then
  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK',MECodFilial8.Text);
    QFilial.Open;
    EdDescFilial8.Text := QFilialDesc_Filial.Value;
  end
  else
    EdDescFilial8.Text := 'Todos';
end;

procedure TFLivroFiscalParam.BtnFilialCons8Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    MECodFilial8.Text := DMFilial.QFilialConsCod_Filial.Text;
    MECodFilial8Exit(Self);
  end;
end;

procedure TFLivroFiscalParam.MEEstado8Exit(Sender: TObject);
begin
  inherited;
  if Trim(MEEstado8.Text) <> '' then
     EdEstadoDesc.Text:= DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO','COD_ESTADO = '+CHR(39)+MEEstado8.Text+CHR(39))
  else
     EdEstadoDesc.Text := 'Todos';
  if EdEstadoDesc.Text = '' then
     MEEstado8.Text:= '';
end;

procedure TFLivroFiscalParam.TabSheet3Show(Sender: TObject);
begin
  inherited;
  FLivroFiscalParam.helpcontext:=12;
end;

procedure TFLivroFiscalParam.Me4CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME4Cadastro.Text) <> '' Then
     Ed4Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME4Cadastro.Text);
  if Ed4Cadastro.Text = '' then
     Ed4Cadastro.Text := 'Todos';

end;

procedure TFLivroFiscalParam.Bt4CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    Me4Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    Me4CadastroExit(Self);
  end;
end;

procedure TFLivroFiscalParam.BitBtn15Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME9CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME9CodFilialExit(Self);
  end;
end;

procedure TFLivroFiscalParam.ME9CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9CodFilial.Text) <> '' Then
  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME9CodFilial.Text);
    QFilial.Open;
    Ed9DescFilial.Text := QFilialDesc_Filial.Value;
  end
  else
    Ed9DescFilial.Text := 'Todos';
end;

procedure TFLivroFiscalParam.Bt9FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME9Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME9FilialExit(Self);
  End;
end;

procedure TFLivroFiscalParam.ME9FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME9Filial.Text) <> '' Then
    Ed9Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + Trim(ME9Filial.Text))
  Else
    Ed9Filial.Text := 'Todos';
end;

procedure TFLivroFiscalParam.Bt9CidadeClick(Sender: TObject);
begin
  inherited;
  If FCidadeCons = Nil then
     FCidadeCons := TFCidadeCons.Create(Application);
  If FCidadeCons.ShowModal = mrOk then
  Begin
    ME9Cidade.Text := DMCidade.QCidadeConsCod_Cidade.Text;
    ME9CidadeExit(Self);
  End;

end;

procedure TFLivroFiscalParam.ME9CidadeExit(Sender: TObject);
begin
  inherited;
  If Trim(ME9Cidade.Text) <> '' Then
    Ed9Cidade.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE', 'COD_CIDADE = ' + Trim(ME9Cidade.Text))
  Else
    Ed9Cidade.Text := 'Todos';
end;

end.
