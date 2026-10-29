unit UClasseParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls;

type
  TFClasseParam = class(TFTParametro)
    TS0Classe: TTabSheet;
    ME0NrClasseInicial: TMaskEdit;
    SB1ClasseInicial: TSpeedButton;
    ME0DescClasseInicial: TMaskEdit;
    ME0DescClasseFinal: TMaskEdit;
    SB1ClasseFinal: TSpeedButton;
    ME0NrClasseFinal: TMaskEdit;
    Label7: TLabel;
    Label6: TLabel;
    ME0NrSubClasseInicial: TMaskEdit;
    ME0NrSubClasseFinal: TMaskEdit;
    CBTodosInicial: TCheckBox;
    CBTodosFinal: TCheckBox;
    Rg0Campos: TRadioGroup;
    RgSituacao: TRadioGroup;
    procedure SB1ClasseInicialClick(Sender: TObject);
    procedure SB1ClasseFinalClick(Sender: TObject);
    procedure CBTodosInicialClick(Sender: TObject);
    procedure ME0NrClasseInicialChange(Sender: TObject);
    procedure CBTodosFinalClick(Sender: TObject);
    procedure ME0NrClasseFinalChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClasseParam: TFClasseParam;

implementation

uses UClasseCons, UClasse_cl;

{$R *.DFM}


procedure TFClasseParam.SB1ClasseInicialClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME0NrClasseInicial.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
      ME0NrSubClasseInicial.Text:= FloatToStr(DMClasse.QClasseConsNum_SubClasse.Value);
      ME0DescClasseInicial.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;
end;

procedure TFClasseParam.SB1ClasseFinalClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME0NrClasseFinal.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
      ME0NrSubClasseFinal.Text:= FloatToStr(DMClasse.QClasseConsNum_SubClasse.Value);
      ME0DescClasseFinal.Text:= DMClasse.QClasseConsDesc_Classe.value;
    End;
end;

procedure TFClasseParam.CBTodosInicialClick(Sender: TObject);
begin
  inherited;
  If CBTodosInicial.Checked then
    begin
      ME0NrClasseInicial.Clear;
      ME0NrSubClasseInicial.Clear;
      ME0DescClasseInicial.Clear;
    end;
end;

procedure TFClasseParam.ME0NrClasseInicialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0NrClasseInicial.Text)<>'' then     CBTodosInicial.Checked:=False;
end;

procedure TFClasseParam.CBTodosFinalClick(Sender: TObject);
begin
  inherited;
    If CBTodosFinal.Checked then
    begin
      ME0NrClasseFinal.Clear;
      ME0NrSubClasseFinal.Clear;
      ME0DescClasseFinal.Clear;
    end;
end;

procedure TFClasseParam.ME0NrClasseFinalChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0NrClasseFinal.Text)<>'' then
    CBTodosFinal.Checked:=False;
end;

end.
