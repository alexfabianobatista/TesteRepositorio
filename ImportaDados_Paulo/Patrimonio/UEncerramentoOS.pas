unit UEncerramentoOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls;

type
  TFEncerramentoOS = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EDNumOS: TEdit;
    SpeedButton1: TSpeedButton;
    EDDescOS: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    MEDTEncerramento: TMaskEdit;
    BtCancela: TBitBtn;
    BtOk: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EDNumOSChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEncerramentoOS: TFEncerramentoOS;

implementation

uses UOSPatrimonio_cl, UOSPatrimonioCons, UEncerramentoDescAtividade;

{$R *.DFM}

procedure TFEncerramentoOS.SpeedButton1Click(Sender: TObject);
begin
  If FOSPatrimonioCons = Nil then
    FOSPatrimonioCons := TFOSPatrimonioCons.Create(Application);
  If FOSPatrimonioCons.ShowModal = mrOk then
  Begin
    FEncerramentoOS.EDNumOS.text:=IntToStr(DMOSPatrimonio.QOSPatrimonioConsNum_OS_Cab.value);
  end;
end;

procedure TFEncerramentoOS.FormActivate(Sender: TObject);
begin
  MEDTEncerramento.text:=DateToStr(Date);
end;

procedure TFEncerramentoOS.EDNumOSChange(Sender: TObject);
begin
  if EDNumOS.text <> '' then
  Begin
    with DMOSPatrimonio do
    Begin
      QOSPatrimonio.Close;
      QOSPatrimonio.SetVariable('PK',EDNumOS.text);
      QOSPatrimonio.Open;
      EDDescOS.text:= DMOSPatrimonio.QOSPatrimonioDesc_OS_Patrimonio.value;
    end;
  end;
end;

end.
