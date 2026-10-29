unit UQtChegada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, Buttons, ExtCtrls;

type
  TFQtChegada = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBNavigator1: TDBNavigator;
    BtConfirmar: TBitBtn;
    MEQtChegada: TMaskEdit;
    procedure BtConfirmarClick(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wNota: String;
  end;

var
  FQtChegada: TFQtChegada;

implementation

uses UNotaSaida_cl, UOracle_cl, UNotaEntrada_cl, UParamSistema_cl;


{$R *.DFM}

procedure TFQtChegada.BtConfirmarClick(Sender: TObject);
Var wConhecimento,wCodNota : String;
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
       Begin
         QExecSQL.SQL.Add(Trim(DMNotaSaida.QItemNFCod_Nota_Item.Text));
         wCodNota :=DMNotaSaida.QItemNFCod_Nota_Cab.Text;
       End;
      if wNota = 'E' then
       Begin
         QExecSQL.SQL.Add(Trim(DMNotaEntrada.QItemNFCod_Nota_Item.Text));
         wCodNota :=DMNotaEntrada.QItemNFCod_Nota_Cab.Text;
       End;
      QExecSQL.ExecSQL;
      if wNota = 'S' then
        DMNotaSaida.QItemNF.RefreshRecord
      else if wNota = 'E' then
        DMNotaEntrada.QItemNF.RefreshRecord;
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       Begin
         wConhecimento := DMOracle.BuscaNome('SELECT COD_CONHECIMENTO_FRETE FROM TB_CONHECIMENTO_FRETE','COD_NOTA_CAB = '+wCodNota);
         If wConhecimento <> '' Then
          Begin
             QExecSQL.Close;
             QExecSQL.SQL.Clear;
             QExecSQL.SQL.Add('UPDATE TB_CONHECIMENTO_FRETE SET QT_PESO_CHEGADA = '+Trim(MEQtChegada.Text));
             QExecSQL.SQL.Add(' WHERE COD_CONHECIMENTO_FRETE = '+wConhecimento);
             QExecSQL.ExecSQL;
          End;
       End
      Else
       Begin
         wConhecimento := DMOracle.BuscaNome('SELECT COD_CONHECIMENTO FROM TB_CONHECIMENTO','COD_NOTA_CAB = '+wCodNota);
         If wConhecimento <> '' Then
          Begin
             QExecSQL.Close;
             QExecSQL.SQL.Clear;
             QExecSQL.SQL.Add('UPDATE TB_CONHECIMENTO SET QT_PESO_CHEGADA = '+Trim(MEQtChegada.Text));
             QExecSQL.SQL.Add(' WHERE COD_CONHECIMENTO = '+wConhecimento);
             QExecSQL.ExecSQL;
          End;
       End;
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
