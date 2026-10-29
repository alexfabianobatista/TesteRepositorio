unit UApontamentoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Buttons, StdCtrls, Db, Grids, DBGrids, Mask, VARIANTS;

type
  TFApontamentoCons = class(TFTConsulta)
    EDFuncionario: TEdit;
    SpeedButton1: TSpeedButton;
    EDOS: TEdit;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    procedure BtProcurarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FApontamentoCons: TFApontamentoCons;

implementation

uses UApontamento_cl, UCadastroCons, UOSPatrimonioCons, UCadastro_cl,
  UOSPatrimonio_cl, UFFuncionarioCons, UFuncionario_cl;

{$R *.DFM}

procedure TFApontamentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMApontamento do
  begin
    QApontamentoCons.Close;
    if Trim(FApontamentoCons.EDOS.Text) <> '' then
      QApontamentoCons.SetVariable('NUM_OS',Trim(FApontamentoCons.EDOS.Text))
    else
      QApontamentoCons.SetVariable('NUM_OS', NULL);
    if Trim(FApontamentoCons.EDFuncionario.Text) <> '' then
      QApontamentoCons.SetVariable('COD_FUNCIONARIO',Trim(FApontamentoCons.EDFuncionario.Text))
    else
      QApontamentoCons.SetVariable('COD_FUNCIONARIO', NULL);
    QApontamentoCons.Open;
  end;
end;

procedure TFApontamentoCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FFuncionarioCons = Nil then
    FFuncionarioCons := TFFuncionarioCons.Create(Application);
  If FFuncionarioCons.ShowModal = mrOk then
    FApontamentoCons.EDFuncionario.Text:=IntToStr(DMFuncionario.QFuncionarioConsCod_Funcionario.Value);
end;

procedure TFApontamentoCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If FOSPatrimonioCons = Nil then
    FOSPatrimonioCons := TFOSPatrimonioCons.Create(Application);
  If FOSPatrimonioCons.ShowModal = mrOk then
    FApontamentoCons.EDOS.Text:=IntToStr(DMOSPatrimonio.QOSPatrimonioConsNum_os_cab.Value);
end;
end.
