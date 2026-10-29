unit UFmClasse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmClasse = class(TFrame)
    Label1: TLabel;
    MeClasse: TMaskEdit;
    BtClasse: TBitBtn;
    EdClasse: TEdit;
    procedure BtClasseClick(Sender: TObject);
    procedure MeClasseExit(Sender: TObject);
    procedure MeClasseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    wNumClasse :String;
  public
    { Public declarations }
  end;

implementation

uses UClasseCons, UClasse_cl, UOracle_cl;

{$R *.dfm}

procedure TFmClasse.BtClasseClick(Sender: TObject);
begin
  if FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = MrOk then
  begin
    MeClasse.Text := DMClasse.QClasseConsCOD_CLASSE.Text;
    MeClasseExit(Self);
  end;
end;

procedure TFmClasse.MeClasseExit(Sender: TObject);
begin
  if Trim(MeClasse.Text) <> '' then
  begin
    wNumClasse := DMOracle.BuscaNome('SELECT NUM_CLASSE FROM TB_CLASSE',
      'COD_CLASSE = ' + MEClasse.Text);
    EdClasse.Text := 'Classe: '+ DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = ' +
        wNumClasse + ' AND NUM_SUBCLASSE = 0');
    EdClasse.Text := EdClasse.Text +
      ' - Subclasse: ' +
      DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','COD_CLASSE = ' + MEClasse.Text);
  end
  else
    EdClasse.Text := 'Todas';
end;

procedure TFmClasse.MeClasseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtClasse.Click;
end;

end.
