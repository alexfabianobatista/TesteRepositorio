unit UListaServicoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, ExtCtrls;

type
  TFListaServicoCons = class(TFTConsulta)
    RGOrdem: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListaServicoCons: TFListaServicoCons;

implementation

uses UProduto_cl;

{$R *.DFM}

procedure TFListaServicoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMProduto do
  Begin
    QListaServicoCons.Close;
    QListaServicoCons.SQL[QListaServicoCons.SQL.Count-1]:='';  // elimina a última Linha da SQL
    if Trim(METexto.Text) = '' then
      QListaServicoCons.SetVariable('DESC_LISTA_SERVICO', 'A')
    else
      QListaServicoCons.SetVariable('DESC_LISTA_SERVICO',Trim(METexto.Text));
    Case RGOrdem.ItemIndex of
      0: QListaServicoCons.SQL.Add('ORDER BY TB_LISTA_SERVICO.DESC_LISTA_SERVICO');
      1: QListaServicoCons.SQL.Add('ORDER BY TB_LISTA_SERVICO.COD_LISTA_SERVICO');
    End;
    QListaServicoCons.Open;
  End;
end;

end.
