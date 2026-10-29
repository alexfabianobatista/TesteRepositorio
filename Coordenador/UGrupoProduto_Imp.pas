unit UGrupoProduto_Imp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin, ExtCtrls;

type
  TFGrupoProduto_Imp = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    se_MesOrigem: TSpinEdit;
    se_AnoOrigem: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    se_MesDestino: TSpinEdit;
    Label4: TLabel;
    se_AnoDestino: TSpinEdit;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure GroupBox1Exit(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure getMesAnoOrigem;
    procedure setMesAnoDestino;
  public
    { Public declarations }
  end;

var
  FGrupoProduto_Imp: TFGrupoProduto_Imp;

implementation

uses UGrupoProduto_cl, UOracle_cl, DateUtils, DB, Math;

{$R *.dfm}

{ TFGrupoProduto_Imp }

procedure TFGrupoProduto_Imp.getMesAnoOrigem;
begin
  if DMGrupoProduto.QGrupoProduto_CadNUM_MES.AsString <> '' then
   begin
     se_MesOrigem.Value := DMGrupoProduto.QGrupoProduto_CadNUM_MES.AsInteger;
     se_AnoOrigem.Value := DMGrupoProduto.QGrupoProduto_CadNUM_ANO.AsInteger;
   end
   else
   begin
     se_MesOrigem.Value := MonthOf(Date);
     se_AnoOrigem.Value := YearOf(Date);
   end;
end;

procedure TFGrupoProduto_Imp.setMesAnoDestino;
var
  wIncAno : integer;
begin
  wIncAno := 0;
  if se_MesOrigem.Value >= 12 then
   begin
     se_MesDestino.Value := 1;
     wIncAno := 1;
   end
   else
     se_MesDestino.Value := se_MesOrigem.Value + 1;
  se_AnoDestino.Value := se_AnoOrigem.Value + wIncAno;
end;

procedure TFGrupoProduto_Imp.FormShow(Sender: TObject);
begin
  getMesAnoOrigem;
  setMesAnoDestino;
end;

procedure TFGrupoProduto_Imp.GroupBox1Exit(Sender: TObject);
begin
  setMesAnoDestino;
end;

procedure TFGrupoProduto_Imp.BtOkClick(Sender: TObject);
var
  wSql : string;
begin
  with DMGrupoProduto do
   begin
     QGrupoProduto_Origem.Close;
     QGrupoProduto_Origem.SetVariable('Mes', se_MesOrigem.Value);
     QGrupoProduto_Origem.SetVariable('Ano', se_AnoOrigem.Value);
     QGrupoProduto_Origem.open;

     if QGrupoProduto_Origem.Eof then
       raise Exception.create('Nenhum grupo encontrado para este Mês/Ano!');

     QGrupoProduto_Origem.First;

     try
       while not QGrupoProduto_Origem.Eof do
        begin
          wSql := 'DECLARE '+
                  '  WCod_Grupo_Produto TB_GRUPO_PRODUTO.Cod_Grupo_Produto%TYPE; '+
                  'BEGIN '+
                  '  INSERT INTO TB_GRUPO_PRODUTO '+
                  '   (Cod_Grupo_Produto, Desc_Grupo_Produto, Cod_Grupo, Num_Ano, Num_Mes) '+
                  '  VALUES '+
                  '   (SQ_GRUPO_PRODUTO.NextVal, '+
                       QuotedStr(QGrupoProduto_OrigemDesc_Grupo_Produto.asString)+', '+
                       QGrupoProduto_OrigemCOD_GRUPO.AsString+', '+
                       IntToStr(se_AnoDestino.Value)+', '+
                       IntToStr(se_MesDestino.Value)+') '+
                  '  RETURNING Cod_Grupo_Produto INTO WCod_Grupo_Produto; '+

                  '  INSERT INTO TB_GRUPO_PRODUTO_ITEM '+
                  '   (Cod_Grupo_Produto_Item, Cod_Grupo_Produto, Qt_Meta_Kg, Val_Meta_Preco_Medio, '+
                  '    Val_Faixa_De1, Val_Faixa_Ate1, Val_Faixa_De2, Val_Faixa_Ate2, '+
                  '    Val_Faixa_De3, Val_Faixa_Ate3, Val_Faixa_De4, Val_Faixa_Ate4, '+
                  '    Nota_Faixa_Kg1, Nota_Faixa_Kg2, Nota_Faixa_Kg3, Nota_Faixa_Kg4, '+
                  '    Nota_Faixa_Preco1, Nota_Faixa_Preco2, Nota_Faixa_Preco3, Nota_Faixa_Preco4, '+
                  '    Cod_Classe, Cod_Vendedor) '+
                  '  SELECT SQ_GRUPO_PRODUTO_ITEM.NextVal, WCod_Grupo_Produto, '+
                  '    Qt_Meta_Kg, Val_Meta_Preco_Medio, '+
                  '    Val_Faixa_De1, Val_Faixa_Ate1, Val_Faixa_De2, Val_Faixa_Ate2, '+
                  '    Val_Faixa_De3, Val_Faixa_Ate3, Val_Faixa_De4, Val_Faixa_Ate4, '+
                  '    Nota_Faixa_Kg1, Nota_Faixa_Kg2, Nota_Faixa_Kg3, Nota_Faixa_Kg4, '+
                  '    Nota_Faixa_Preco1, Nota_Faixa_Preco2, Nota_Faixa_Preco3, Nota_Faixa_Preco4, '+
                  '    Cod_Classe, Cod_Vendedor '+
                  '  FROM TB_GRUPO_PRODUTO_ITEM '+
                  '  WHERE Cod_Grupo_Produto = '+QGrupoProduto_OrigemCOD_GRUPO_PRODUTO.AsString+'; '+
                  'END; ';

          DMOracle.ExecutaSql(wSql);

          {QGrupoProduto_Cad.Insert;
          QGrupoProduto_CadDESC_GRUPO_PRODUTO.AsString := QGrupoProduto_OrigemDESC_GRUPO_PRODUTO.AsString;
          QGrupoProduto_CadCOD_GRUPO.AsInteger         := QGrupoProduto_OrigemCOD_GRUPO.AsInteger;
          QGrupoProduto_CadNUM_ANO.AsInteger           := se_AnoDestino.Value;
          QGrupoProduto_CadNUM_MES.AsInteger           := se_MesDestino.Value;
          QGrupoProduto_Cad.Post;

          QGrupoProdutoItem_Origem.Close;
          QGrupoProdutoItem_Origem.SetVariable('Cod_Grupo_Produto', QGrupoProduto_OrigemCOD_GRUPO_PRODUTO.Value);
          QGrupoProdutoItem_Origem.open;
          QGrupoProdutoItem_Origem.First;

          while not QGrupoProdutoItem_Origem.Eof do
           begin
             QGrupoProdutoItem_Cad.Insert;
             QGrupoProdutoItem_CadCOD_GRUPO_PRODUTO.AsInteger  := QGrupoProduto_CadCOD_GRUPO_PRODUTO.AsInteger;
             QGrupoProdutoItem_CadQT_META_KG.AsInteger         := QGrupoProdutoItem_OrigemQT_META_KG.AsInteger;
             QGrupoProdutoItem_CadVAL_META_PRECO_MEDIO.AsFloat := QGrupoProdutoItem_OrigemVAL_META_PRECO_MEDIO.AsFloat;
             QGrupoProdutoItem_CadVAL_FAIXA_DE1.AsFloat        := QGrupoProdutoItem_OrigemVAL_FAIXA_DE1.AsFloat;
             QGrupoProdutoItem_CadVAL_FAIXA_ATE1.AsFloat       := QGrupoProdutoItem_OrigemVAL_FAIXA_ATE1.AsFloat;
             QGrupoProdutoItem_CadVAL_FAIXA_DE2.AsFloat        := QGrupoProdutoItem_OrigemVAL_FAIXA_DE2.AsFloat;
             QGrupoProdutoItem_CadVAL_FAIXA_ATE2.AsFloat       := QGrupoProdutoItem_OrigemVAL_FAIXA_ATE2.AsFloat;
             QGrupoProdutoItem_CadVAL_FAIXA_DE3.AsFloat        := QGrupoProdutoItem_OrigemVAL_FAIXA_DE3.AsFloat;
             QGrupoProdutoItem_CadVAL_FAIXA_ATE3.AsFloat       := QGrupoProdutoItem_OrigemVAL_FAIXA_ATE3.AsFloat;
             QGrupoProdutoItem_CadVAL_FAIXA_DE4.AsFloat        := QGrupoProdutoItem_OrigemVAL_FAIXA_DE4.AsFloat;
             QGrupoProdutoItem_CadVAL_FAIXA_ATE4.AsFloat       := QGrupoProdutoItem_OrigemVAL_FAIXA_ATE4.AsFloat;
             QGrupoProdutoItem_CadNOTA_FAIXA_KG1.AsFloat       := QGrupoProdutoItem_OrigemNOTA_FAIXA_KG1.AsFloat;
             QGrupoProdutoItem_CadNOTA_FAIXA_KG2.AsFloat       := QGrupoProdutoItem_OrigemNOTA_FAIXA_KG2.AsFloat;
             QGrupoProdutoItem_CadNOTA_FAIXA_KG3.AsFloat       := QGrupoProdutoItem_OrigemNOTA_FAIXA_KG3.AsFloat;
             QGrupoProdutoItem_CadNOTA_FAIXA_KG4.AsFloat       := QGrupoProdutoItem_OrigemNOTA_FAIXA_KG4.AsFloat;
             QGrupoProdutoItem_CadNOTA_FAIXA_PRECO1.AsFloat    := QGrupoProdutoItem_OrigemNOTA_FAIXA_PRECO1.AsFloat;
             QGrupoProdutoItem_CadNOTA_FAIXA_PRECO2.AsFloat    := QGrupoProdutoItem_OrigemNOTA_FAIXA_PRECO2.AsFloat;
             QGrupoProdutoItem_CadNOTA_FAIXA_PRECO3.AsFloat    := QGrupoProdutoItem_OrigemNOTA_FAIXA_PRECO3.AsFloat;
             QGrupoProdutoItem_CadNOTA_FAIXA_PRECO4.AsFloat    := QGrupoProdutoItem_OrigemNOTA_FAIXA_PRECO4.AsFloat;
             QGrupoProdutoItem_CadCOD_CLASSE.AsInteger         := QGrupoProdutoItem_OrigemCOD_CLASSE.AsInteger;
             QGrupoProdutoItem_CadCOD_VENDEDOR.AsInteger       := QGrupoProdutoItem_OrigemCOD_VENDEDOR.AsInteger;
             QGrupoProdutoItem_Cad.Post;

             QGrupoProdutoItem_Origem.Next;
           end; }
          if DMOracle.DBCemapa.InTransaction then
            DMOracle.DBCemapa.Commit;
          QGrupoProduto_Origem.Next;
       end;
       QGrupoProduto_Origem.Close;
       ShowMessage('Operação finalizada com êxito!');
     except
       ShowMessage('Ocorreu um erro durante a operação!');
     end;


   end;
end;

end.
