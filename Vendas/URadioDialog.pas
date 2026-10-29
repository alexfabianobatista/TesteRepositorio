unit URadioDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFRadioDialog = class(TForm)
    rgOpcoes: TRadioGroup;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    btVoltar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure configura(pCaption:String; pMsg:String; pItens: TStrings; pHabilitarVoltar: boolean);
  end;

var
  FRadioDialog: TFRadioDialog;

implementation

{$R *.dfm}

procedure TFRadioDialog.FormActivate(Sender: TObject);
begin
  Height := (rgOpcoes.Items.Count * 16) + 117;
  rgOpcoes.SetFocus;
  rgOpcoes.Buttons[0].SetFocus;
end;

procedure TFRadioDialog.configura(pCaption:String; pMsg:String; pItens: TStrings; pHabilitarVoltar: boolean);
var
  i: Integer;
  btn: TBitBtn;
begin
  Caption := pCaption;
  rgOpcoes.Caption := pMsg;
  rgOpcoes.Items.Clear;
  rgOpcoes.Items.AddStrings(pItens);
  btVoltar.Enabled := pHabilitarVoltar;
  rgOpcoes.ItemIndex := 0;
end;

procedure TFRadioDialog.BtOkClick(Sender: TObject);
begin
  if (rgOpcoes.ItemIndex = -1) then
  begin
    raise Exception.Create('Atenção - Uma opção deve ser selecionada!');
  end;
  ModalResult := mrOk;
end;

procedure TFRadioDialog.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    BtOk.Click;
  end;
end;

end.
