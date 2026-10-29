unit UFmMedico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmMedico = class(TFrame)
    LblMedico: TLabel;
    MeMedico: TMaskEdit;
    BtMedico: TBitBtn;
    EdMedico: TEdit;
    procedure MeMedicoExit(Sender: TObject);
    procedure MeMedicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtMedicoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UMedicoCons, UMedico_cl;

{$R *.dfm}

procedure TFmMedico.MeMedicoExit(Sender: TObject);
begin
  if Trim(MeMedico.text)<>'' then
    EdMedico.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_MEDICO','COD_MEDICO = '+ MeMedico.text)
  else
    EdMedico.Text := 'Todos';
end;

procedure TFmMedico.MeMedicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
    BtMedico.Click;
end;

procedure TFmMedico.BtMedicoClick(Sender: TObject);
begin
  if FMedicoCons = Nil then
    FMedicoCons:=TFMedicoCons.Create(Application);
  if FMedicoCons.ShowModal = mrOk then
  begin
    MeMedico.text:=DMMedico.QMedicoConsCOD_MEDICO.text;
    MeMedicoExit(Self);
  end;
end;

end.
