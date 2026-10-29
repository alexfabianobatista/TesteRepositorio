unit UAtualizaListaPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFAtualizaListapreco = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    RG_Operacao: TRadioGroup;
    Edt_Percentual: TEdit;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    procedure Edt_PercentualKeyPress(Sender: TObject; var Key: Char);
    procedure BtOkClick(Sender: TObject);
    procedure Edt_PercentualChange(Sender: TObject);
  private
    { Private declarations }
    procedure pAtualizaPrecos(wDesTipoTabela : string);
    procedure pAtualizaLista(wNumOpcao : integer);
    function  fgetTipoTabela : string;
  public
    { Public declarations }
  end;

var
  FAtualizaListapreco: TFAtualizaListapreco;

implementation

uses UOracle_cl, OracleData, UPrecoPocket1_cl, OraTeste, DB, UBiblioteca;

{$R *.dfm}

procedure TFAtualizaListapreco.Edt_PercentualKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (not (key in ['0'..'9',#8,','])) or 
     ((key = ',') and (pos(',', Edt_Percentual.Text) > 0)) then
    key := #0;
end;                               

procedure TFAtualizaListapreco.BtOkClick(Sender: TObject);
var
  wDesTipoTabela : string;
begin
  if StrToFloat(Edt_Percentual.Text) <= 0 then
    ShowMessage('O percentual deve ser maior que 0(zero)!')
  else
  begin
    wDesTipoTabela := fgetTipoTabela;
    pAtualizaPrecos(wDesTipoTabela);
    Close;
  end;
end;

procedure TFAtualizaListapreco.Edt_PercentualChange(Sender: TObject);
begin
  if Edt_Percentual.Text = '' then
    Edt_Percentual.Text := '0';
end;

(* procedure pAtualizaPrecos
   Atualiza os valores da Lista de preços selecionada.
   Se a Lista for PAI atualiza também as listas FILHAS
*)
procedure TFAtualizaListapreco.pAtualizaPrecos(wDesTipoTabela: string);
begin
  DMPrecoPocket1.QPrecoPocket_Item.Close;
  if wDesTipoTabela = 'F' then
    if MessageDlg('Alterações nesta lista de preços não refletirão em outras listas. Continuar?',
                   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      pAtualizaLista(1);
  if wDesTipoTabela = 'S' then
    pAtualizaLista(1);
  if wDesTipoTabela = 'P' then
    if MessageDlg('Alterações nesta lista de preços refletirão em todas listas relacionadas. Continuar?',
                   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      pAtualizaLista(2);
  DMPrecoPocket1.QPrecoPocket_Item.open;
end;

(* função fGetTipoTabela
   retorno - 'P' = tabela de preços Pai
             'F' = tabela de preços Filha
             'S' = tabela de preços Sem relacionamento
*)
function TFAtualizaListapreco.fgetTipoTabela: string;
begin
  if DMPrecoPocket1.QPrecoPocket_CadNUM_COD_TBL_PAI.AsString <> '' then
    result := 'F'
  else
  begin
    with DMOracle.QExecSQL do
    begin
      if Active then
        DMOracle.QExecSQL.Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) '+
              'FROM TB_TABELA_POCKET '+
              'WHERE Num_Cod_Tbl_Pai = '+DMPrecoPocket1.QPrecoPocket_CadCOD_TABELA_POCKET.AsString);
      DMOracle.QExecSQL.open;
      if Fields[0].AsInteger > 0 then
        result := 'P'
      else
        result := 'S';
      DMOracle.QExecSQL.Close;
    end;
  end;
end;

(* procedure pAtualizaLista
   efetua as atualizações de preços na(s) lista(s)
   parâmetros: 1 = altera apeans a lista selecionada
               2 = altera a lista relacionada e todas as listas filhas
*)
procedure TFAtualizaListapreco.pAtualizaLista(wNumOpcao: integer);
var
  wDesOperador : string;
begin
  case RG_Operacao.ItemIndex of
    0 : wDesOperador := '+';
    1 : wDesOperador := '-';
  end;
  with DMOracle.QExecSQL do
  begin
    try
      if Active then
        DMOracle.QExecSQL.Close;
      SQL.Clear;
      SQL.Add('UPDATE Tb_Tabela_Pocket_Item SET Val_Preco_AVista = '+
                     'Round((Val_Preco_AVista ' + wDesOperador +
                     ' (Val_Preco_AVista*'+ bib.TrocaVirgulaPorPonto(Edt_Percentual.Text)+'/100))/0.05)*0.05, '+
                     'Val_Preco_APrazo = '+
                     'Round((Val_Preco_APrazo ' + wDesOperador +
                     ' (Val_Preco_APrazo*'+ bib.TrocaVirgulaPorPonto(Edt_Percentual.Text)+'/100))/0.05)*0.05 '+
                     'WHERE Cod_Tabela_Pocket = '+DMPrecoPocket1.QPrecoPocket_CadCOD_TABELA_POCKET.AsString);
      ExecSQL;
      if wNumOpcao = 2 then
      begin
        if Active then
          DMOracle.QExecSQL.Close;
        SQL.Clear;
        SQL.Add('UPDATE Tb_Tabela_Pocket_Item SET Val_Preco_AVista = '+
                       'Round((Val_Preco_AVista ' + wDesOperador +
                       ' (Val_Preco_AVista*'+ bib.TrocaVirgulaPorPonto(Edt_Percentual.Text)+'/100))/0.05)*0.05, '+
                       'Val_Preco_APrazo = '+
                       'Round((Val_Preco_APrazo ' + wDesOperador +
                       ' (Val_Preco_APrazo*'+ bib.TrocaVirgulaPorPonto(Edt_Percentual.Text)+'/100))/0.05)*0.05 '+
                       'WHERE Cod_Tabela_Pocket IN '+
                       ' (SELECT tp.Cod_Tabela_Pocket '+
                       '  FROM TB_TABELA_POCKET TP, TB_TABELA_POCKET_ITEM TPI '+
                       '  WHERE TP.Cod_Tabela_Pocket = TPI.Cod_Tabela_Pocket '+
                       '    AND TP.Num_Cod_Tbl_Pai = '+DMPrecoPocket1.QPrecoPocket_CadCOD_TABELA_POCKET.AsString+')');
        ExecSQL;

      end;
      if DMOracle.DBCemapa.inTransaction then
         DMOracle.DBCemapa.Commit;
      ShowMessage('Recálculo realizado com êxito!')
    except
      ShowMessage('Um Erro ocorreu durante o processo!');
    end;
  end;
end;

end.
