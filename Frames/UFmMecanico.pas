unit UFmMecanico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmMecanico = class(TFrame)
    MeMecanico: TMaskEdit;
    BtMecanico: TBitBtn;
    EdMecanico: TEdit;
    Label1: TLabel;
    procedure BtMecanicoClick(Sender: TObject);
    procedure MeMecanicoExit(Sender: TObject);
    procedure MeMecanicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UOficina_cl, UMecanicoCons;

{$R *.dfm}

procedure TFmMecanico.BtMecanicoClick(Sender: TObject);
begin
  if FMecanicoCons = nil then
    FMecanicoCons := FMecanicoCons.Create(Application);
  if FMecanicoCons.ShowModal = MrOk then
  begin
    MeMecanico.Text := DMOficina.QMecanicoConsCOD_MECANICO.Text;
    MeMecanicoExit(Self);
  end;
end;

procedure TFmMecanico.MeMecanicoExit(Sender: TObject);
begin
  if Trim(MeMecanico.Text) <> '' then
    EdMecanico.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_MECANICO', 'COD_MECANICO = ' + MeMecanico.Text, true)
  else
    EdMecanico.Text := 'Todos';
end;

procedure TFmMecanico.MeMecanicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 123 then //123 = F12
    BtMecanico.Click;
end;

end.

