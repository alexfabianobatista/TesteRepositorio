unit UFmFilial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmFilial = class(TFrame)
    MeFilial: TMaskEdit;
    BtFilial: TBitBtn;
    EdFilial: TEdit;
    Label1: TLabel;
    procedure BtFilialClick(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
    procedure MeFilialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UFilialCons, UFilial_cl, UOracle_cl;

{$R *.dfm}

procedure TFmFilial.BtFilialClick(Sender: TObject);
begin
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
  begin
    MeFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
    MeFilialExit(Self);
  end;
end;

procedure TFmFilial.MeFilialExit(Sender: TObject);
begin
  if Trim(MeFilial.Text) <> '' then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + MeFilial.Text, true)
  else
    EdFilial.Text := 'Todas';
end;

procedure TFmFilial.MeFilialKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 123 then //123 = F12
    BtFilial.Click;
end;

end.

