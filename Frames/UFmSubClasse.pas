unit UFmSubClasse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmSubClasse = class(TFrame)
    Label1: TLabel;
    MeClasse: TMaskEdit;
    BtClasse: TBitBtn;
    EdClasse: TEdit;
    MeSubClasse: TMaskEdit;
    Label2: TLabel;
    procedure BtClasseClick(Sender: TObject);
    procedure MeClasseExit(Sender: TObject);
    procedure MeClasseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UClasseCons, UClasse_cl, UOracle_cl;

{$R *.dfm}

procedure TFmSubClasse.BtClasseClick(Sender: TObject);
begin
  if FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = MrOk then
  begin
    MeClasse.Text := DMClasse.QClasseConsNUM_CLASSE.Text;
    MeSubClasse.Text := DMClasse.QClasseConsNUM_SUBCLASSE.Text;
    MeClasseExit(Self);
  end;
end;

procedure TFmSubClasse.MeClasseExit(Sender: TObject);
var
  where: String;
begin
  where := '';
  if (Trim(MeClasse.Text) <> '') then
  begin
    where := 'NUM_CLASSE = ' + MeClasse.Text + ' AND NUM_SUBCLASSE = ';
    if Trim(MeSubClasse.Text) <> '' then
      where := where + MeSubClasse.Text
    else
      where := where + '0';
    EdClasse.Text := DMOracle.FastSelect('DESC_CLASSE','TB_CLASSE', where)
  end
  else
    EdClasse.Text := 'Todas';
end;

procedure TFmSubClasse.MeClasseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtClasse.Click;
end;

end.
