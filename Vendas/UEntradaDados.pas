unit UEntradaDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask;

type
  TFEntradaDados = class(TForm)
    MeDados: TMaskEdit;
    MeNome: TMaskEdit;
    LbNome: TLabel;
    Label2: TLabel;
    procedure MeDadosChange(Sender: TObject);
    procedure MeDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEntradaDados: TFEntradaDados;

implementation
uses UParamSistema_cl;

{$R *.dfm}

procedure TFEntradaDados.MeDadosChange(Sender: TObject);
begin
  if Length(Trim(MeDados.Text)) = MeDados.MaxLength then
    ModalResult := mrOk;
end;

procedure TFEntradaDados.MeDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    ModalResult := mrCancel;
end;

procedure TFEntradaDados.FormActivate(Sender: TObject);
begin
  {if (DMParamSistema.CodEmpresa = 'QUERENCIA') then
  begin
    LbNome.Visible := True;
    MeNome.Visible := True;
    if MeNome.CanFocus then
      MeNome.SetFocus;
  end;}
end;

end.
