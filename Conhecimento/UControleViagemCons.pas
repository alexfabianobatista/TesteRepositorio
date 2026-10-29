unit UControleViagemCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFControleViagemCons = class(TFTConsulta)
    EdVeiculoCons: TEdit;
    SBVeiculoCons: TSpeedButton;
    MeMotoristaCons: TMaskEdit;
    SBMotoristaCons: TSpeedButton;
    EdMotoristaCons: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    MeDtInicial: TMaskEdit;
    Label4: TLabel;
    MeDtFinal: TMaskEdit;
    procedure SBVeiculoConsClick(Sender: TObject);
    procedure SBMotoristaConsClick(Sender: TObject);
    procedure MeMotoristaConsExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FControleViagemCons: TFControleViagemCons;

implementation

uses UConhecimento_cl, UVeiculoConhecimentoCons, UCadastroCons, UOracle_cl,
  UVeiculoConhecimento_cl, UCadastro_cl;

{$R *.dfm}

procedure TFControleViagemCons.SBVeiculoConsClick(Sender: TObject);
begin
  inherited;
  if FVeiculoConhecimentoCons = nil then
     FVeiculoConhecimentoCons:= TFVeiculoConhecimentoCons.Create(Application);
  if FVeiculoConhecimentoCons.ShowModal = mrOk then
    EdVeiculoCons.Text := DMVeiculoConhecimento.QVeiculoConsDESC_PLACA.Value;  

end;

procedure TFControleViagemCons.SBMotoristaConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
     MeMotoristaCons.Text :=DMCadastro.QCadastroConsCod_Cadastro.Text;
     MeMotoristaConsExit(self);

end;

procedure TFControleViagemCons.MeMotoristaConsExit(Sender: TObject);
begin
  inherited;
   if Trim(MeMotoristaCons.text)<>'' then
    EDMotoristaCons.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MeMotoristaCons.text)
  else
    EdMotoristaCons.Text:='Todos';

end;

procedure TFControleViagemCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMConhecimento.QControleViagemCons.close;
  with DMConhecimento do
  Begin
    if Trim(EdVeiculoCons.Text) = '' then
      QControleViagemCons.SetVariable('VEICULO',Null)
    else
      QControleViagemCons.SetVariable('VEICULO',Trim(EdVeiculoCons.Text));

    if Trim(MeMotoristaCons.Text) = '' then
      QControleViagemCons.SetVariable('MOTORISTA',Null)
    else
      QControleViagemCons.SetVariable('MOTORISTA',Trim(MeMotoristaCons.text));

    if Trim(MeDtInicial.Text) = '' then
      QControleViagemCons.SetVariable('DT_INICIO',Null)
    else
      QControleViagemCons.SetVariable('DT_INICIO',Trim(MeDtInicial.Text));

    if Trim(MeDtFinal.Text) = '' then
      QControleViagemCons.SetVariable('DT_FINAL',Null)
    else
      QControleViagemCons.SetVariable('DT_FINAL',Trim(MeDtFinal.Text));
  End;
  DMConhecimento.QControleViagemCons.open;
  
end;

end.
