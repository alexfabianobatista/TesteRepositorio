unit UGeneroProdutoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFGeneroProdutoCad = class(TFTCadSimples)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGeneroProdutoCad: TFGeneroProdutoCad;

implementation

uses UGeneroProdutoCons, UProduto_cl;

{$R *.dfm}

procedure TFGeneroProdutoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FGeneroProdutoCons = nil then
     FGeneroProdutoCons := TFGeneroProdutoCons.Create(Application);
  if FGeneroProdutoCons.ShowModal = mrOk then
     with DMProduto do
     begin
       QGeneroProduto.Close;
       QGeneroProduto.SetVariable('PK', QGeneroProdutoConsCOD_GENERO_PRODUTO.Value);
       QGeneroProduto.Open;
     end;
end;

procedure TFGeneroProdutoCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMProduto do
  begin
    QGeneroProduto.Close;
    QGeneroProduto.Open;
  end;
end;

procedure TFGeneroProdutoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMProduto.QGeneroProduto.Close;
  Action := CaFree;
  FGeneroProdutoCad := Nil;
end;

procedure TFGeneroProdutoCad.SBConfirmarClick(Sender: TObject);
Var
  wCodigo:real;
begin
  inherited;
//  wCodigo := DMProduto.QGeneroProdutoCOD_GENERO_PRODUTO.Value;
//  DMProduto.QGeneroProduto.Close;
//  DMProduto.QGeneroProduto.SetVariable('PK', wCodigo);
//  DMProduto.QGeneroProduto.Open;
end;

end.
