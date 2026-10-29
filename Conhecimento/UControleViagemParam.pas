unit UControleViagemParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask,
  DBCtrls, DBPanel;

type
  TFControleViagemParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Me0Filial: TMaskEdit;
    Bt0Filial: TBitBtn;
    Ed0Filial: TEdit;
    Label3: TLabel;
    ME0Motorista: TMaskEdit;
    Btn0Motorista: TBitBtn;
    ED0Motorista: TEdit;
    Label4: TLabel;
    ME0Veiculo: TMaskEdit;
    Btn0Veiculo: TBitBtn;
    ED0Veiculo: TEdit;
    ED0Destino: TEdit;
    Label5: TLabel;
    Me0DtInicial: TMaskEdit;
    Label6: TLabel;
    Me0DtFinal: TMaskEdit;
    RG0Ordem: TRadioGroup;
    procedure DBP0FilialDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP0VeiculoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP0MotoristaDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure Me0FilialExit(Sender: TObject);
    procedure Bt0FilialClick(Sender: TObject);
    procedure ME0MotoristaExit(Sender: TObject);
    procedure Btn0MotoristaClick(Sender: TObject);
    procedure ME0VeiculoExit(Sender: TObject);
    procedure Btn0VeiculoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FControleViagemParam: TFControleViagemParam;

implementation

uses UFilialCons, UVeiculoConhecimentoCons, UCadastroCons, UOracle_cl,
  UFilial_cl, UCadastro_cl, UConhecimento_cl, UVeiculoConhecimento_cl;

{$R *.dfm}

procedure TFControleViagemParam.DBP0FilialDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFControleViagemParam.DBP0VeiculoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVeiculoConhecimentoCons;
  Classe := TFVeiculoConhecimentoCons;
end;

procedure TFControleViagemParam.DBP0MotoristaDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFControleViagemParam.Me0FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me0Filial.text) <> '' then
    Ed0Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(Me0Filial.text))
  else
    Ed0Filial.Text:='Todas';
end;

procedure TFControleViagemParam.Bt0FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
   begin
     Me0Filial.text := DMFilial.QFilialConsCOD_FILIAL.Text;
     Me0FilialExit(self);
   end;
end;

procedure TFControleViagemParam.ME0MotoristaExit(Sender: TObject);
begin
  inherited;
  if Trim(Me0Motorista.Text) <> '' then
    Ed0Motorista.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(Me0Motorista.text))
  else
    Ed0Motorista.Text:='Todos';
end;

procedure TFControleViagemParam.Btn0MotoristaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
   if FCadastroCons.showmodal = mrOk then
   begin
     Me0Motorista.text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
     Me0MotoristaExit(self);
   end;
end;

procedure TFControleViagemParam.ME0VeiculoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me0Veiculo.Text) <> '' then
    Ed0Veiculo.Text:=DMOracle.BuscaNome('SELECT DESC_VEICULO FROM TB_VEICULO_CONHECIMENTO','DESC_PLACA = '+Trim(QuotedStr(Me0Veiculo.text)))
  else
    Ed0Veiculo.Text:='Todos';
end;

procedure TFControleViagemParam.Btn0VeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoConhecimentoCons = nil then
     FVeiculoConhecimentoCons:=TFVeiculoConhecimentoCons.create(application);
   if FVeiculoConhecimentoCons.showmodal = mrOk then
   begin
     Me0Veiculo.text := DMVeiculoConhecimento.QVeiculoConsDESC_PLACA.Text;
     Me0VeiculoExit(self);
   end;
end;

end.
