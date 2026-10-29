unit UPremioExportacaoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFPremioExportacaoCons = class(TFTConsulta)
    MeFatura: TMaskEdit;
    Label2: TLabel;
    MeComprador: TMaskEdit;
    SbComprador: TSpeedButton;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    MeData_I: TMaskEdit;
    Label4: TLabel;
    MEData_F: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure SbCompradorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPremioExportacaoCons: TFPremioExportacaoCons;

implementation

uses UCadastroCons, UCadastro_cl, UContaCorrenteCons, UBancoAgencia_cl,
  UOracle_cl, UPremioExportacao_cl, UPremioExportacao;

{$R *.dfm}

procedure TFPremioExportacaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMPremioExportacao do
  begin
    QPremioExportacaoCons.Close;
    if Trim(MeTexto.Text) <> '' then
      QPremioExportacaoCons.SetVariable('CONTRATO', Trim(MeTexto.Text))
    else
      QPremioExportacaoCons.SetVariable('CONTRATO', null);

    if Trim(MeFatura.Text) <> '' then
      QPremioExportacaoCons.SetVariable('FATURA', Trim(MeFatura.Text))
    else
      QPremioExportacaoCons.SetVariable('FATURA', null);

    if Trim(MeComprador.Text) <> '' then
      QPremioExportacaoCons.SetVariable('COMPRADOR', Trim(MeComprador.Text))
    else
      QPremioExportacaoCons.SetVariable('COMPRADOR', null);

    if Trim(MeData_I.Text) <> '' then
      QPremioExportacaoCons.SetVariable('DATA_I', Trim(MeData_I.Text))
    else
      Raise Exception.Create('A data inicial deve ser informada');

    if Trim(MeData_F.Text) <> '' then
      QPremioExportacaoCons.SetVariable('DATA_F', Trim(MeData_F.Text))
    else
      QPremioExportacaoCons.SetVariable('DATA_F', DateToStr(Date));

    QPremioExportacaoCons.Open;
  end;
end;

procedure TFPremioExportacaoCons.SbCompradorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
  begin
    MeComprador.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
  end;
end;

end.
