unit UCategoriaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFCategoriaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelatriodeCategorias1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatriodeCategorias1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCategoriaCad: TFCategoriaCad;

implementation

uses UCategoriaProfissional_cl, UCategoriaCons, UrCategoria;

{$R *.DFM}

procedure TFCategoriaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMCategoriaProfissional.QCategoria.Open;
end;

procedure TFCategoriaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMCategoriaProfissional.QCategoria.Close;
  DMCategoriaProfissional.QCategoriaCons.Close;
  Action := CaFree;
  FCategoriaCad := Nil;
end;

procedure TFCategoriaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FCategoriaCons = Nil then
    FCategoriaCons := TFCategoriaCons.Create(Application);
  If FCategoriaCons.ShowModal = mrOk then
  With DMCategoriaProfissional do
  Begin
    QCategoria.Close;
    QCategoria.SetVariable('PK',QCategoriaConsCod_Categoria.Value);
    QCategoria.Open;
  End;

end;

procedure TFCategoriaCad.RelatriodeCategorias1Click(Sender: TObject);
begin
  inherited;
  with DMCategoriaProfissional do
  begin
    QRCategoria.Close;
    QRCategoria.Open;

    if FRCategoria = Nil then
      FRCategoria := TFRCategoria.Create(Application);
    FRCategoria.QRPrimario.Preview;
    QRCategoria.Close;
  End;

end;

end.
