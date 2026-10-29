unit UFmFinalidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmFinalidade = class(TFrame)
    Label1: TLabel;
    MeFinalidade: TMaskEdit;
    BtFinalidade: TBitBtn;
    EdFinalidade: TEdit;
    procedure BtFinalidadeClick(Sender: TObject);
    procedure MeFinalidadeExit(Sender: TObject);
    procedure MeFinalidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UFinalidadeCons, UFinalidade_cl, UOracle_cl;

{$R *.dfm}

procedure TFmFinalidade.BtFinalidadeClick(Sender: TObject);
begin
  if FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = MrOk then
  begin
    MeFinalidade.Text := DMFinalidade.QFinalidadeConsCOD_FINALIDADE.Text;
    MeFinalidadeExit(Self);
  end;
end;

procedure TFmFinalidade.MeFinalidadeExit(Sender: TObject);
begin
  if Trim(MeFinalidade.Text) <> '' then
    EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = ' + MeFinalidade.Text, true)
  else
    EdFinalidade.Text := 'Todos';
end;

procedure TFmFinalidade.MeFinalidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtFinalidade.Click;
end;

end.
