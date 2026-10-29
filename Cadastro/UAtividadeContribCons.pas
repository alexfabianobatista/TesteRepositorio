unit UAtividadeContribCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  DBCtrls;

type
  TFAtividadeContribCons = class(TFTConsulta)
    DBMemo1: TDBMemo;
    MENCM: TMaskEdit;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtividadeContribCons: TFAtividadeContribCons;

implementation

uses UProduto_cl;

{$R *.dfm}

procedure TFAtividadeContribCons.FormActivate(Sender: TObject);
begin
  inherited;
  with DMProduto do
  begin
    QAtividadeContribCons.Close;
    QAtividadeContribCons.Open;
  end;
end;

procedure TFAtividadeContribCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMProduto do
  begin
    QAtividadeContribCons.Close;
    if Trim(METexto.Text) <> '' then
      QAtividadeContribCons.SetVariable('DESCRICAO', '%'+Trim(METexto.Text)+'%')
    else
      QAtividadeContribCons.SetVariable('DESCRICAO', NULL);
    if Trim(MENCM.Text) <> '' then
      QAtividadeContribCons.SetVariable('NCM', MENCM.Text)
    else
      QAtividadeContribCons.SetVariable('NCM', NULL);
    QAtividadeContribCons.Open;
  end;
end;

end.
