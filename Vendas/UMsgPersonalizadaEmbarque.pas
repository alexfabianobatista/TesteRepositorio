unit UMsgPersonalizadaEmbarque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFMsgPersonalizadaEmbarque = class(TForm)
    lbMensagem: TLabel;
    Panel1: TPanel;
    BtOk: TBitBtn;
    procedure BtOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FExibido: Boolean;
  public
    property Exibido: Boolean read FExibido write FExibido default False;
  end;

var
  FMsgPersonalizadaEmbarque: TFMsgPersonalizadaEmbarque;

implementation

{$R *.dfm}

procedure TFMsgPersonalizadaEmbarque.BtOkClick(Sender: TObject);
begin
  self.Close;
end;

procedure TFMsgPersonalizadaEmbarque.FormActivate(Sender: TObject);
begin
  Exibido := True;
  BtOk.SetFocus;
end;

end.
