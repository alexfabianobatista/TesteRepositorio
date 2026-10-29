unit UViagemCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  ExtCtrls, DBPanel;

type
  TFViagemCons = class(TFTConsulta)
    Label3: TLabel;
    MEDTini: TMaskEdit;
    Label11: TLabel;
    MeDtFim: TMaskEdit;
    EdPlaca: TEdit;
    Label2: TLabel;
    BtPlaca: TBitBtn;
    Label4: TLabel;
    EDFilial: TEdit;
    BtFilial: TBitBtn;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure BtPlacaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FViagemCons: TFViagemCons;


implementation

uses UViagem_cl, UVeiculoCad, UVeiculo_cl, UVeiculoConhecimentoCons, UFilialCad,
     UFilialCons, UFilial_cl, UVeiculoConhecimento_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFViagemCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMViagem do
  Begin
    DMViagem.QViagemCons.close;
    DMViagem.QViagemCons.ClearVariables;

    if Trim(METexto.Text) = '' then
      QViagemCons.SetVariable('DESC_VIAGEM', Null)
    else
      QViagemCons.SetVariable('DESC_VIAGEM', Trim(METexto.Text));
    if Trim(EdPlaca.Text) = '' then
      QViagemCons.SetVariable('PLACA', Null)
    else
      QViagemCons.SetVariable('PLACA', Trim(EdPlaca.Text));
    if Trim(MEDTini.Text) = '' then
      QViagemCons.SetVariable('DT_VIAGEM_INI', Null)
    else
      QViagemCons.SetVariable('DT_VIAGEM_INI', Trim(MEDTini.Text));
    if Trim(MeDtFim.Text) = '' then
      QViagemCons.SetVariable('DT_VIAGEM_FIM', Null)
    else
      QViagemCons.SetVariable('DT_VIAGEM_FIM', Trim(MeDtFim.Text));
    QViagemCons.open;
  end;
end;

procedure TFViagemCons.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
  begin
    EdFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  end;
end;

procedure TFViagemCons.BtPlacaClick(Sender: TObject);
begin
  inherited;
  if FVeiculoConhecimentoCons = nil then
     FVeiculoConhecimentoCons:= TFVeiculoConhecimentoCons.Create(Application);
  if FVeiculoConhecimentoCons.ShowModal = mrOk then
  begin
    EdPlaca.Text := DMVeiculoConhecimento.QVeiculoConsDESC_PLACA.Text;
  end;
end;

procedure TFViagemCons.FormCreate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
  begin
    DBGrid1.Columns.Items[3].Visible := False;
    DBGrid1.Columns.Items[4].Visible := False;
  end
  else
  begin
    DBGrid1.Columns.Items[5].Visible  := False;
    DBGrid1.Columns.Items[6].Visible  := False;
    DBGrid1.Columns.Items[7].Visible  := False;
    DBGrid1.Columns.Items[8].Visible  := False;
    DBGrid1.Columns.Items[9].Visible  := False;
    DBGrid1.Columns.Items[10].Visible := False;
    DBGrid1.Columns.Items[11].Visible := False;
  end;
end;

end.
