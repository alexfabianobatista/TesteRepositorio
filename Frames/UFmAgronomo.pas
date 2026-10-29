unit UFmAgronomo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmAgronomo = class(TFrame)
    Label1: TLabel;
    MeAgronomo: TMaskEdit;
    BtAgronomo: TBitBtn;
    EdAgronomo: TEdit;
    procedure MeAgronomoExit(Sender: TObject);
    procedure MeAgronomoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtAgronomoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UAgronomoCons, UAgronomo_cl;

{$R *.dfm}

procedure TFmAgronomo.MeAgronomoExit(Sender: TObject);
begin
  if Trim(MeAgronomo.Text) <> '' then
    EdAgronomo.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_AGRONOMO','COD_AGRONOMO = ' + MeAgronomo.Text, true)
  else
    EdAgronomo.Text := 'Todos';
end;

procedure TFmAgronomo.MeAgronomoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  If Key = 123 Then  //123 = F12
     BtAgronomo.Click;
     
end;

procedure TFmAgronomo.BtAgronomoClick(Sender: TObject);
begin

  if FAgronomoCons = Nil then
    FAgronomoCons := TFAgronomoCons.Create(Application);
  if FAgronomoCons.ShowModal = MrOk then
  begin
    MeAgronomo.Text := DMAgronomo.QAgronomoConsCOD_AGRONOMO.Text;
    MeAgronomoExit(Self);
  end;
  
end;

end.
