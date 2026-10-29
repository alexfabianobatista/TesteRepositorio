unit UFmObra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmObra = class(TFrame)
    MeObra: TMaskEdit;
    BtObra: TBitBtn;
    EdObra: TEdit;
    Label1: TLabel;
    procedure BtObraClick(Sender: TObject);
    procedure MeObraExit(Sender: TObject);
    procedure MeObraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses UObra_cl, UObraCons, UOracle_cl, DB;

{$R *.dfm}

procedure TFmObra.BtObraClick(Sender: TObject);
begin
  if FObraCons = Nil then
    FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal = MrOk then
  begin
    MeObra.Text := DMObra.QObra_ConsCOD_OBRA.Text;
    MeObraExit(Self);
  end;
end;

procedure TFmObra.MeObraExit(Sender: TObject);
begin
  if Trim(MeObra.Text) <> '' then
    EdObra.Text := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA','COD_OBRA = ' + MeObra.Text, true)
  else
    EdObra.Text := 'Todos';
end;

procedure TFmObra.MeObraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtObra.Click;
end;



end.
