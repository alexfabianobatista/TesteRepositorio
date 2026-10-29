unit UListaServicoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFListaServicoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListaServicoCad: TFListaServicoCad;

implementation

uses UProduto_cl, UListaServicoCons;

{$R *.dfm}

procedure TFListaServicoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FListaServicoCons = nil then
    FListaServicoCons := TFListaServicoCons.Create(Application);
  if FListaServicoCons.ShowModal = MrOk then
  begin
    DMProduto.QListaServico.Close;
    DMProduto.QListaServico.SetVariable('PK', DMProduto.QListaServicoConsCOD_LISTA_SERVICO.Value);
    DMProduto.QListaServico.open;
  end
end;

procedure TFListaServicoCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMProduto do
  begin
    QListaServico.Close;
    QListaServico.Open;
  end;
end;

procedure TFListaServicoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMProduto.QListaServico.Close;
  Action := CaFree;
  FListaServicoCad := Nil;
end;

end.
