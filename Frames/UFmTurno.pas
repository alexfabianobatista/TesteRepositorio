unit UFmTurno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmTurno = class(TFrame)
    Label1: TLabel;
    MeTurno: TMaskEdit;
    BtTurno: TBitBtn;
    EdTurno: TEdit;
    procedure BtTurnoClick(Sender: TObject);
    procedure MeTurnoExit(Sender: TObject);
    procedure MeTurnoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UTurnoCons, UTurno_cl, UOracle_cl;

{$R *.dfm}

procedure TFmTurno.BtTurnoClick(Sender: TObject);
begin
  if FTurnoCons = Nil then
    FTurnoCons := TFTurnoCons.Create(Application);
  if FTurnoCons.ShowModal = MrOk then
  begin
    MeTurno.Text := DMTurno.QTurnoAllCOD_TURNO.Text;
    MeTurnoExit(Self);
  end;
end;

procedure TFmTurno.MeTurnoExit(Sender: TObject);
begin
  if Trim(MeTurno.Text) <> '' then
    EdTurno.Text := DMOracle.BuscaNome('SELECT DESC_TURNO FROM TB_TURNO','COD_TURNO = ' + MeTurno.Text, true)
  else
    EdTurno.Text := 'Todos';
end;

procedure TFmTurno.MeTurnoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtTurno.Click;
end;

end.
