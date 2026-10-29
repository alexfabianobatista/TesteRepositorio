unit UControleCargaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFControleCargaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    GroupBox5: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    ME0Data_I: TMaskEdit;
    ME0Data_F: TMaskEdit;
    ME0Motorista: TMaskEdit;
    Label1: TLabel;
    SB0Motorista: TSpeedButton;
    ED0Motorista: TEdit;
    ME0Destino: TMaskEdit;
    Label2: TLabel;
    procedure ME0MotoristaExit(Sender: TObject);
    procedure SB0MotoristaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FControleCargaParam: TFControleCargaParam;

implementation

uses UOracle_cl, UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFControleCargaParam.ME0MotoristaExit(Sender: TObject);
begin
  inherited;
  if trim(ME0Motorista.text) <> '' then
    ED0Motorista.Text := DMOracle.buscaNome('SELECT NOME FROM TB_CADASTRO',' COD_CADASTRO = ' + ME0Motorista.Text)
  else
    ED0Motorista.Text := 'Todos';
end;

procedure TFControleCargaParam.SB0MotoristaClick(Sender: TObject);
begin
  inherited;
   if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
   if FCadastroCons.showmodal = mrOk then
   begin
     ME0Motorista.Text := inttostr(DMCadastro.QCadastroConsCOD_CADASTRO.value);
     ME0MotoristaExit(self);
   end;
end;

end.
