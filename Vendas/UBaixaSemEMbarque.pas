unit UBaixaSemEMbarque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFBaixaSemEmbarque = class(TForm)
    EdCodBarra: TEdit;
    EdProduto: TEdit;
    EdPeso: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure EdCodBarraChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaixaSemEmbarque: TFBaixaSemEmbarque;

implementation

uses UOracle_cl, UEstoque_cl;

{$R *.dfm}

procedure TFBaixaSemEmbarque.EdCodBarraChange(Sender: TObject);
var
wPesagem, wProduto : string;
begin
  if Length(EdCodBarra.Text) = 14 then
  Begin
    wPesagem := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PESAGEM_PRODUCAO','COD_PESAGEM='+Copy(EdCodBarra.Text,1,7));
    wProduto := copy(EdCodBarra.Text,8,3);
    if wPesagem = 'CANCELADA' THEN
      Raise Exception.Create('Etiqueta Cancelada!');
    if wPesagem = 'EMBARCADO' THEN
      Raise Exception.Create('Etiqueta Embarcada!');
    if wPesagem = 'CONFIRMADO' Then
    Begin
      EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO ','COD_PRODUTO='+ copy(EdCodBarra.Text,8,3));
      EdPeso.Text := copy(EdCodBarra.Text,11,2) + ','+ copy(EdCodBarra.Text,13,2);
      DMEstoque.AtualizaEstoque(-2,2,StrTOInt(wProduto),0,StrTOFloat(EdPeso.Text),0,0,0);
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('UPDATE TB_PESAGEM_PRODUCAO SET IND_SITUACAO =''EMBARCADO'' WHERE COD_PESAGEM='+Copy(EdCodBarra.Text,1,7));
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
      //SHOWMESSAGE('OK! Produto Embarcado!');

    end;
  end;
end;

end.
