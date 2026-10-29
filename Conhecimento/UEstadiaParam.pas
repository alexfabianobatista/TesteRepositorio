unit UEstadiaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFEstadiaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    ME1Estadia: TMaskEdit;
    BT1Estadia: TSpeedButton;
    ME1Filial: TMaskEdit;
    BT1Filial: TSpeedButton;
    ME1Cadastro: TMaskEdit;
    BT1Cadastro: TSpeedButton;
    ED1Filial: TEdit;
    ED1Cadastro: TEdit;
    GroupBox1: TGroupBox;
    ME1DtInicio: TMaskEdit;
    ME1DtFim: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Cadastro: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RG1Situacao: TRadioGroup;
    procedure BT1FilialClick(Sender: TObject);
    procedure BT1CadastroClick(Sender: TObject);
    procedure BT1EstadiaClick(Sender: TObject);
    procedure ME1FilialExit(Sender: TObject);
    procedure ME1CadastroExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstadiaParam: TFEstadiaParam;

implementation

uses UFilialCons, UCadastroCons, UEstadiaCons, UConhecimento_cl, UOracle_cl,
  UFilial_cl, UCadastro_cl;

{$R *.DFM}

procedure TFEstadiaParam.BT1FilialClick(Sender: TObject);
begin
  inherited;
   if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
     ME1Filial.Text:=IntToStr(DMFilial.QFilialConsCod_Filial.value);
  ME1FilialExit(Self);
end;

procedure TFEstadiaParam.BT1CadastroClick(Sender: TObject);
begin
  inherited;
   if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
   if FCadastroCons.showmodal = mrOk then
     ME1Cadastro.Text:=IntToStr(DMCadastro.QCadastroConsCod_Cadastro.value);
  ME1CadastroExit(Self);
end;

procedure TFEstadiaParam.BT1EstadiaClick(Sender: TObject);
begin
  inherited;
  if FEstadiaCons = nil then
    FEstadiaCons := TFEstadiaCons.Create(application);
  if FEstadiaCons.ShowModal = mrOk then
  begin
    ME1Estadia.Text := IntToStr(DMConhecimento.QEstadiaConsCOD_ESTADIA.Value);
    DMConhecimento.QEstadiaCons.Close;
  end;
end;

procedure TFEstadiaParam.ME1FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Filial.text) <> '' then
    ED1Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME1Filial.text)
  else
    ED1Filial.Text:='Todas';
end;

procedure TFEstadiaParam.ME1CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Cadastro.text) <> '' then
    ED1Cadastro.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME1Cadastro.text)
  else
    ED1Cadastro.Text:='Todos';
end;

end.
