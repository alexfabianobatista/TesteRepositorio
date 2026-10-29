unit UComprovanteEntrega;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFComprovanteEntrega = class(TForm)
    procedure BitBtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FComprovanteEntrega: TFComprovanteEntrega;

implementation

{$R *.DFM}
procedure TFComprovanteEntrega.BitBtnOkClick(Sender: TObject);
begin
  With DMOracle do
  Begin
    try
      DBCemapa.StartTransaction;
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_NOTA_ITEM SET QT_CHEGADA = '+Trim(MEQtChegada.Text));
      QExecSQL.SQL.Add(' WHERE COD_NOTA_ITEM = ');
      if wNota = 'S' then
        QExecSQL.SQL.Add(Trim(DMNotaSaida.QItemNFCod_Nota_Item.Text))
      else if wNota = 'E' then
        QExecSQL.SQL.Add(Trim(DMNotaEntrada.QItemNFCod_Nota_Item.Text));
      QExecSQL.ExecSQL;
      if wNota = 'S' then
        DMNotaSaida.QItemNF.RefreshRecord
      else if wNota = 'E' then
        DMNotaEntrada.QItemNF.RefreshRecord;
      DBCemapa.Commit;
    except
      DBCemapa.Rollback;
    end;
  end;
  MEQtChegada.SetFocus;
end;

procedure TFQtChegada.DBEdit3Change(Sender: TObject);
begin
  if Trim(DBEdit3.Text) <> '' then
  begin
    if wNota = 'S' then
      MEQtChegada.Text := DMNotaSaida.QItemNFQT_CHEGADA.Text
    else if wNota = 'E'then
      MEQtChegada.Text := DMNotaEntrada.QItemNFQT_CHEGADA.Text;
  end
  else
    MEQtChegada.Text := '';
end;

procedure TFQtChegada.FormActivate(Sender: TObject);
begin
  if wNota = 'S' then
  begin
    DBNavigator1.DataSource := DMNotaSaida.DSItemNF;
    DBEdit2.DataSource := DMNotaSaida.DSItemNF;
    DBEdit3.DataSource := DMNotaSaida.DSItemNF;
  end
  else if wNota = 'E' then
  begin
    DBNavigator1.DataSource := DMNotaEntrada.DSItemNF;
    DBEdit2.DataSource := DMNotaEntrada.DSItemNF;
    DBEdit3.DataSource := DMNotaEntrada.DSItemNF;
  end;

  DBEdit3Change(Self);
  MEQtChegada.SetFocus;
end;


end.
