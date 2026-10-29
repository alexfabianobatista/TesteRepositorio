unit UFmEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmEstado = class(TFrame)
    Label1: TLabel;
    MeEstado: TMaskEdit;
    BtEstado: TBitBtn;
    EdEstado: TEdit;
    procedure BtEstadoClick(Sender: TObject);
    procedure MeEstadoExit(Sender: TObject);
    procedure MeEstadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UEstadoCons, UEstado_cl, UOracle_cl;

{$R *.dfm}

procedure TFmEstado.BtEstadoClick(Sender: TObject);
begin
  if FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = MrOk then
  begin
    MeEstado.Text := DMEstado.QEstadoConsCOD_ESTADO.Text;
    MeEstadoExit(Self);
  end;
end;

procedure TFmEstado.MeEstadoExit(Sender: TObject);
begin
  If Trim(MeEstado.Text) <> '' Then
    EdEstado.text:=DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO',
                    'COD_ESTADO = ' + Chr(39) + MeEstado.text + Chr(39), true)
  Else
    EdEstado.Text := 'Todos';
end;

procedure TFmEstado.MeEstadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtEstado.Click;
end;

end.
