unit UFmTitulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmTitulo = class(TFrame)
    Label1: TLabel;
    MeContasReceber: TMaskEdit;
    BtContasReceber: TBitBtn;
    procedure BtContasReceberClick(Sender: TObject);
    procedure MeContasReceberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  UContasReceberCons, UContasReceber_cl;

{$R *.dfm}

procedure TFmTitulo.BtContasReceberClick(Sender: TObject);
begin
  if FContasReceberCons = Nil then
    FContasReceberCons := TFContasReceberCons.Create(Application);
  if FContasReceberCons.ShowModal = MrOk then
  begin
    MeContasReceber.Text := DMContasReceber.QContasReceber_CabConsNUM_TITULO.Text;
  end;
end;

procedure TFmTitulo.MeContasReceberKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtContasReceber.Click;
end;

end.
