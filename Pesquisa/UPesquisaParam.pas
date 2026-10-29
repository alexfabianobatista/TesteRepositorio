unit UPesquisaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFPesquisaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    ME1Dt_inicial: TMaskEdit;
    ME1DT_final: TMaskEdit;
    Inicio: TLabel;
    Fim: TLabel;
    SB1Cadastro: TSpeedButton;
    ME1Cadastro: TMaskEdit;
    Ed1Cadastro: TEdit;
    Label1: TLabel;
    procedure SB1CadastroClick(Sender: TObject);
    procedure ME1CadastroExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPesquisaParam: TFPesquisaParam;

implementation

uses UCadastroCons, UOracle_cl, UCadastro_cl;

{$R *.DFM}

procedure TFPesquisaParam.SB1CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME1Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME1CadastroExit(self);  
end;

procedure TFPesquisaParam.ME1CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Cadastro.Text) <> '' Then 
    Ed1Cadastro.text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(ME1Cadastro.Text))

  Else
    Ed1Cadastro.Text := 'Todos';

end;

end.
