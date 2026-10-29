unit UFmEmbarque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmEmbarque = class(TFrame)
    Label1: TLabel;
    MeEmbarque: TMaskEdit;
    BtEmbarque: TBitBtn;
    EdEmbarque: TEdit;
    procedure BtEmbarqueClick(Sender: TObject);
    procedure MeEmbarqueExit(Sender: TObject);
    procedure MeEmbarqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UEmbarqueCons, UEmbarque_cl, UOracle_cl;

{$R *.dfm}

procedure TFmEmbarque.BtEmbarqueClick(Sender: TObject);
begin
  if FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  if FEmbarqueCons.ShowModal = MrOk then
  begin
    MeEmbarque.Text := DMEmbarque.QEmbarqueConsCOD_EMBARQUE.Text;
    MeEmbarqueExit(Self);
  end;
end;

procedure TFmEmbarque.MeEmbarqueExit(Sender: TObject);
begin
  if Trim(MeEmbarque.Text) <> '' then
    EdEmbarque.Text := DMOracle.FastSelect('DT_EMBARQUE', 'TB_EMBARQUE',
      'COD_EMBARQUE = ' + MeEmbarque.Text, true)
  else
    EdEmbarque.Text := 'Todos';
end;

procedure TFmEmbarque.MeEmbarqueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtEmbarque.Click;
end;

end.
