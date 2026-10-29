unit UNotaConsumidorNome;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFNotaConsumidorNome = class(TForm)
    Label14: TLabel;
    MECadastro: TMaskEdit;
    EdCadastro: TEdit;
    Bt3Cadastro: TBitBtn;
    Label17: TLabel;
    MEOperacao: TMaskEdit;
    BtOperacao: TBitBtn;
    EdOperacao: TEdit;
    BtCancela: TBitBtn;
    BtOk: TBitBtn;
    Label1: TLabel;
    MeSerie: TMaskEdit;
    MeEndereco: TMaskEdit;
    MeCgc_Cpf: TMaskEdit;
    MeInscricao: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MeNumero: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    MECidade: TMaskEdit;
    edCidade: TEdit;
    BitBtn1: TBitBtn;
    edEstado: TEdit;
    edCEP: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    procedure MECadastroExit(Sender: TObject);
    procedure Bt3CadastroClick(Sender: TObject);
    procedure MEOperacaoExit(Sender: TObject);
    procedure BtOperacaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MECidadeExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaConsumidorNome: TFNotaConsumidorNome;

implementation

uses UCadastro_cl, UCadastroCons, UOperacao_cl, UOperacaoCons,
  UParamSistema_cl, UOracle_cl, UCidadeCons, UCidade_cl;

{$R *.DFM}

procedure TFNotaConsumidorNome.MECadastroExit(Sender: TObject);
begin
  If Trim(MECadastro.Text) <> '' Then
  With DMCadastro do
  Begin
    QCadastro.Close;
    QCadastro.SetVariable('PK',MECadastro.Text);
    QCadastro.Open;
    EdCadastro.Text := QCadastroNome.Value;
  End;
end;

procedure TFNotaConsumidorNome.Bt3CadastroClick(Sender: TObject);
begin
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    MECadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    MECadastroExit(Self);
  End;

end;

procedure TFNotaConsumidorNome.MEOperacaoExit(Sender: TObject);
begin
  If Trim(MEOperacao.Text) <> '' Then
  With DMOperacao do
  Begin
    QOperacao.Close;
    QOperacao.SetVariable('PK',MEOperacao.Text);
    QOperacao.Open;
    EdOperacao.Text := QOperacaoDesc_Operacao.Value;
  End;

end;

procedure TFNotaConsumidorNome.BtOperacaoClick(Sender: TObject);
begin
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    MEOperacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    MEOperacaoExit(Self);
  End;

end;

procedure TFNotaConsumidorNome.FormActivate(Sender: TObject);
begin
  MeEndereco.Text := '';
  MeCgc_Cpf.Text := '';
  MeInscricao.Text := '';
  MeCadastro.Text := '';
  MeOperacao.Text := '10';
  EdCadastro.Text := '';
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
  Begin
    Label17.Visible := False;
    Label1.Visible := False;
    Label5.Visible := False;
    MeOperacao.Visible := False;
    BtOperacao.Visible := False;
    EdOperacao.Visible := False;
    MeNumero.Visible := False;
    MeSerie.Visible := False;
  End; 
end;

procedure TFNotaConsumidorNome.MECidadeExit(Sender: TObject);
begin
  if Trim(MECidade.Text) <> '' then
  begin
    edCidade.Text := dmoracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE','COD_CIDADE = ' + MECidade.Text);
    edEstado.Text := dmoracle.BuscaNome('SELECT COD_ESTADO FROM TB_CIDADE','COD_CIDADE = ' + MECidade.Text);
  end
  else
  begin
    edCidade.Text := '';
    edEstado.Text := '';
  end;
end;

procedure TFNotaConsumidorNome.BitBtn1Click(Sender: TObject);
begin
  If FCidadeCons = Nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  If FCidadeCons.ShowModal = mrOk then
  Begin
    MECidade.Text := DMCidade.QCidadeConsCod_Cidade.Text;
    MECidadeExit(Self);
  End;
end;

end.
