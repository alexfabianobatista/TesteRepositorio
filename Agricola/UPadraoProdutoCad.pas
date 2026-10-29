unit UPadraoProdutoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFPadraoProdutoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPadraoProdutoCad: TFPadraoProdutoCad;

implementation

uses UPadraoProduto_cl, UPadraoProdutoCons;

{$R *.dfm}

procedure TFPadraoProdutoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPadraoProduto.QPadraoProduto.open;
end;

procedure TFPadraoProdutoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPadraoProduto.QPadraoProduto.close;
end;

procedure TFPadraoProdutoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FPadraoProdutoCons = Nil then
    FPadraoProdutoCons := TFPadraoProdutoCons.Create(Application);
  if FPadraoProdutoCons.ShowModal = MrOk then
  begin
    with DMPadraoProduto do
    begin
      QPadraoProduto.close;
      QPadraoProduto.SetVariable('PK', QPadraoProdutoConsCOD_PADRAO_PRODUTO.Value);
      QPadraoProduto.open;
    end;
  end;
end;

end.
