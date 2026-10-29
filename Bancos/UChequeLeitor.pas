unit UChequeLeitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFChequeLeitor = class(TForm)
    MeChequeLeitor: TMaskEdit;
    Label1: TLabel;
    BtConfirmar: TBitBtn;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FChequeLeitor: TFChequeLeitor;

implementation

{$R *.dfm}

procedure TFChequeLeitor.FormActivate(Sender: TObject);
begin
  MeChequeLeitor.SetFocus;
end;

end.
