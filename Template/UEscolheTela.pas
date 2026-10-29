unit UEscolheTela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Buttons, ComCtrls, ImgList;

type
  TFEscolheTela = class(TForm)
    MM1: TMainMenu;
    ImageList1: TImageList;
    ComboBoxEx1: TComboBoxEx;
    BtnOK: TBitBtn;
    procedure FormActivate(Sender: TObject);
  private
    procedure carregaMenu;
    procedure clica(Sender: TObject);
    function carregaItem(origem, destino: TMenuItem): Integer;
    { Private declarations }
  public
    { Public declarations }
    wMenuBase: TMainMenu;
    wItemEscolhido: TMenuItem;
  end;

var
  FEscolheTela: TFEscolheTela;

implementation

uses UTMenuPrincipal;

{$R *.dfm}

procedure TFEscolheTela.carregaMenu;
var i: Integer;
item: TMenuItem;
begin
//  MM1.Merge(wMenuBase);
  MM1.Items.Clear;

  for i := 0 to wMenuBase.Items.Count-1 do
  begin
    item := TMenuItem.Create(Self);
    item.Caption := wMenuBase.Items[i].Caption;
    MM1.Items.Add(item);
    if carregaItem(wMenuBase.Items[i], item) = 0 then
      item.OnClick := clica;
  end;
end;

function TFEscolheTela.carregaItem(origem, destino: TMenuItem): Integer;
var i: Integer;
item: TMenuItem;
begin
  Result := origem.Count;
  for i := 0 to origem.Count-1 do
  begin
    item := TMenuItem.Create(Self);
    item.Caption := origem.Items[i].Caption;
    item.Name := origem.Items[i].Name;
    destino.Add(item);

    if carregaItem(origem[i], item) = 0 then
      item.OnClick := clica;
  end;
end;

procedure TFEscolheTela.clica(Sender: TObject);
begin
//  ShowMessage(TMenuItem(Sender).Name + ' - ' + TMenuItem(Sender).Caption);
  wItemEscolhido := TMenuItem(Sender);
end;

procedure TFEscolheTela.FormActivate(Sender: TObject);
begin
  carregaMenu;
end;

end.
