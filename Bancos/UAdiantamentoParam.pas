unit UAdiantamentoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, UFmHistorico;

type
  TFAdiantamentoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    ME0DtInicial: TMaskEdit;
    ME0DtFinal: TMaskEdit;
    ME0Cadastro: TMaskEdit;
    SB0Cadastro: TSpeedButton;
    ED0Cadastro: TEdit;
    Label1: TLabel;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Me1Cadastro: TMaskEdit;
    SB1Cadastro: TSpeedButton;
    ED1Cadastro: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ME1DtInicial: TMaskEdit;
    ME1DtFinal: TMaskEdit;
    Label5: TLabel;
    ME0DtBase: TMaskEdit;
    Rg0Situacao: TRadioGroup;
    Label19: TLabel;
    SpeedButton1: TSpeedButton;
    Me0Filial: TMaskEdit;
    Ed0Filial: TEdit;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    Me1Filial: TMaskEdit;
    Ed1Filial: TEdit;
    FmHistorico0: TFmHistorico;
    FmHistorico1: TFmHistorico;
    procedure ME0CadastroExit(Sender: TObject);
    procedure SB0CadastroClick(Sender: TObject);
    procedure Me1CadastroExit(Sender: TObject);
    procedure SB1CadastroClick(Sender: TObject);
    procedure Me0FilialExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Me1FilialExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAdiantamentoParam: TFAdiantamentoParam;

implementation

uses UOracle_cl, UCadastroCons, UCadastro_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFAdiantamentoParam.ME0CadastroExit(Sender: TObject);
begin
  inherited;
  if trim(ME0Cadastro.text) <> '' then
    ED0Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + trim(ME0Cadastro.Text))
  else
    ED0Cadastro.Text := 'Todos';
end;

procedure TFAdiantamentoParam.SB0CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);
  If FCadastroCons.showmodal = mrok then
  begin
    ME0Cadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    ME0CadastroExit(Self);
  end;
end;

procedure TFAdiantamentoParam.Me1CadastroExit(Sender: TObject);
begin
  inherited;
  if trim(ME1Cadastro.text) <> '' then
    ED1Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + trim(ME1Cadastro.Text))
  else
    ED1Cadastro.Text := 'Todos';
end;

procedure TFAdiantamentoParam.SB1CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);
  if FCadastroCons.showmodal = Mrok then
  begin
    ME1Cadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    ME1CadastroExit(Self);
  end;
end;

procedure TFAdiantamentoParam.Me0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me0Filial.Text) <> '' Then
    Ed0Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                           'COD_FILIAL = '+Trim(Me0Filial.Text))
  Else
    Ed0Filial.Text := 'Todos';


end;

procedure TFAdiantamentoParam.SpeedButton1Click(Sender: TObject);
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

procedure TFAdiantamentoParam.Me1FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me1Filial.Text) <> '' Then
    Ed1Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                           'COD_FILIAL = '+Trim(Me1Filial.Text))
  Else
    Ed1Filial.Text := 'Todos';

end;

procedure TFAdiantamentoParam.SpeedButton2Click(Sender: TObject);
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

end.
