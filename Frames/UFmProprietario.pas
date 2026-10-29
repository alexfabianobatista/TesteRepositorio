unit UFmProprietario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmProprietario = class(TFrame)
    Label1: TLabel;
    MeProprietario: TMaskEdit;
    BtProprietario: TBitBtn;
    EdProprietario: TEdit;
    procedure MeProprietarioExit(Sender: TObject);
    procedure BtProprietarioClick(Sender: TObject);
    procedure MeProprietarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UProprietarioCons, UProprietario_cl;

{$R *.dfm}

procedure TFmProprietario.MeProprietarioExit(Sender: TObject);
begin
  if Trim(MeProprietario.text)<>'' then
    EdProprietario.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_PROPRIETARIO','COD_PROPRIETARIO = '+MeProprietario.text)
  else
    EdProprietario.Text := 'Todos';
end;

procedure TFmProprietario.BtProprietarioClick(Sender: TObject);
begin
  if FProprietarioCons = Nil then
    FProprietarioCons:=TFProprietarioCons.Create(Application);
  if FProprietarioCons.ShowModal = mrOk then
    begin
      MeProprietario.text:=DMProprietario.QProprietarioConsCOD_PROPRIETARIO.text;
      MeProprietarioExit(Self);
    end;
end;

procedure TFmProprietario.MeProprietarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtProprietario.Click;
end;

end.
