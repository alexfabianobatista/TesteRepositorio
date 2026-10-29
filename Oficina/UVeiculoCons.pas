unit UVeiculoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFVeiculoCons = class(TFTConsulta)
    MEChassi: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    MEPlaca: TMaskEdit;
    Label4: TLabel;
    MECadastroCod: TMaskEdit;
    MECadastroNome: TMaskEdit;
    SBCadastroCons: TSpeedButton;
    Label5: TLabel;
    MESerie: TMaskEdit;
    procedure SBCadastroConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure MECadastroCodChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVeiculoCons: TFVeiculoCons;

implementation

uses UOficina_cl, UCadastroCons, UCadastro_cl, UOracle_cl;

{$R *.DFM}

procedure TFVeiculoCons.SBCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:= TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    MECadastroCod.Text:= IntToStr(DMCadastro.QCadastroConsCOD_CADASTRO.Value);
    MECadastroNome.Text:= DMCadastro.QCadastroConsNOME.Value;
  end;
end;

procedure TFVeiculoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QVeiculoCons.Close;
    if Trim(METexto.Text) = '' then
       QVeiculoCons.SetVariable('DESC_COR',Null)
    else
       QVeiculoCons.SetVariable('DESC_COR','%'+METexto.Text);

    if Trim(MEChassi.Text) = '' then
       QVeiculoCons.SetVariable('NUM_CHASSI',Null)
    else
       QVeiculoCons.SetVariable('NUM_CHASSI','%'+MEChassi.Text);

    if Trim(MEPlaca.Text) = '' then
       QVeiculoCons.SetVariable('NUM_PLACA',Null)
    else
       QVeiculoCons.SetVariable('NUM_PLACA','%'+MEPlaca.Text);

    if Trim(MECadastroCod.Text) = '' then
       QVeiculoCons.SetVariable('COD_CADASTRO',Null)
    else
       QVeiculoCons.SetVariable('COD_CADASTRO',MECadastroCod.Text);

    if Trim(MESerie.Text) = '' then
       QVeiculoCons.SetVariable('NUM_SERIE',Null)
    else
       QVeiculoCons.SetVariable('NUM_SERIE',MESerie.Text);

    QVeiculoCons.Open;
  end;

end;

procedure TFVeiculoCons.MECadastroCodChange(Sender: TObject);
begin
  inherited;
  if Trim(MECadastroCod.Text) <> '' then
     MECadastroNome.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECadastroCod.Text);
end;

end.
