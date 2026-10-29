unit UFmMotivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmMotivo = class(TFrame)
    MeMotivo: TMaskEdit;
    Label1: TLabel;
    BtMotivo: TBitBtn;
    EdMotivo: TEdit;
    procedure BtMotivoClick(Sender: TObject);
    procedure MeMotivoExit(Sender: TObject);
    procedure MeMotivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UMotivoCons, UMotivo_cl, UOracle_cl;

{$R *.dfm}

procedure TFmMotivo.BtMotivoClick(Sender: TObject);
begin
  if FMotivoCons = Nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  if FMotivoCons.ShowModal = MrOk then
  begin
    MeMotivo.Text := DMMotivo.QMotivoConsCOD_MOTIVO.Text;
    MeMotivoExit(Self);
  end;
end;

procedure TFmMotivo.MeMotivoExit(Sender: TObject);
begin
  if Trim(MeMotivo.Text) <> '' then
    EdMotivo.Text := DMOracle.BuscaNome('SELECT DESC_MOTIVO FROM TB_MOTIVO','COD_MOTIVO = ' +
                           MeMotivo.Text, true)
  else
    EdMotivo.Text := 'Todos';
end;

procedure TFmMotivo.MeMotivoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtMotivo.Click;
end;

end.
