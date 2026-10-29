unit UFmCor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmCor = class(TFrame)
    Label1: TLabel;
    MeCor: TMaskEdit;
    BtCor: TBitBtn;
    EdCor: TEdit;
    procedure BtCorClick(Sender: TObject);
    procedure MeCorExit(Sender: TObject);
    procedure MeCorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UOracle_cl, UMaterial_cl, UCoresCons;

{$R *.dfm}

procedure TFmCor.BtCorClick(Sender: TObject);
begin
  if FCoresCons = Nil then
    FCoresCons := TFCoresCons.Create(Application);
  if FCoresCons.ShowModal = MrOk then
  begin
    MeCor.Text := DMMaterial.QCorConsCOD_COR.Text;
    MeCorExit(Self);
  end;
end;

procedure TFmCor.MeCorExit(Sender: TObject);
begin
  if Trim(MeCor.Text) <> '' then
    EdCor.Text := DMOracle.BuscaNome('SELECT DESC_COR FROM TB_COR','COD_COR = ' + Mecor.Text, true)
  else
    EdCor.Text := 'Todos';
end;

procedure TFmCor.MeCorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     Btcor.Click;
end;

end.
