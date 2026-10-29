unit UFmRamo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmRamo = class(TFrame)
    Label1: TLabel;
    MeRamo: TMaskEdit;
    BtRamo: TBitBtn;
    EdRamo: TEdit;
    procedure MeRamoExit(Sender: TObject);
    procedure BtRamoClick(Sender: TObject);
    procedure MeRamoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, URamoCons, URamo_cl;

{$R *.dfm}

procedure TFmRamo.MeRamoExit(Sender: TObject);
begin
  if Trim(MeRamo.Text) <> '' then
    EdRamo.Text := DMOracle.BuscaNome('SELECT DESC_RAMO FROM TB_RAMO','COD_RAMO = ' + MeRamo.Text, true)
  else
    EdRamo.Text := 'Todos';
end;

procedure TFmRamo.BtRamoClick(Sender: TObject);
begin
  if FRamoCons = Nil then
    FRamoCons := TFRamoCons.Create(Application);
  if FRamoCons.ShowModal = MrOk then
  begin
    MeRamo.Text := DMRamo.QRamoConsCOD_RAMO.Text;
    MeRamoExit(Self);
  end;
end;

procedure TFmRamo.MeRamoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtRamo.Click;
end;

end.
