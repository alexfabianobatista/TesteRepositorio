unit UFmNcm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmNcm = class(TFrame)
    Label1: TLabel;
    MeNcm: TMaskEdit;
    BtNcm: TBitBtn;
    EdNcm: TEdit;
    procedure BtNcmClick(Sender: TObject);
    procedure MeNcmExit(Sender: TObject);
    procedure MeNcmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UNcmCons, UNcm_cl, UOracle_cl;

{$R *.dfm}

procedure TFmNcm.BtNcmClick(Sender: TObject);
begin
  if FNcmCons = Nil then
    FNcmCons := TFNcmCons.Create(Application);
  if FNcmCons.ShowModal = MrOk then
  begin
    MeNcm.Text := DMNcm.QNcmConsCOD_NCM.Text;
    MeNcmExit(Self);
  end;
end;

procedure TFmNcm.MeNcmExit(Sender: TObject);
begin
  if Trim(MeNcm.Text) <> '' then
    EdNcm.Text := DMOracle.BuscaNome('SELECT DESC_NCM FROM TB_NCM','COD_NCM = ' +
                           MeNcm.Text, true)
  else
    EdNcm.Text := 'Todos';
end;

procedure TFmNcm.MeNcmKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtNcm.Click;
end;

end.
