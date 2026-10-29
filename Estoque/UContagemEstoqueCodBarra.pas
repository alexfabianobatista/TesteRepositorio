unit UContagemEstoqueCodBarra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, Grids, DBGrids;

type
  TFContagemEstoqueCodBarra = class(TFTCadSimples)
    DBGrid1: TDBGrid;
    MECodBarra: TMaskEdit;
    Label1: TLabel;
    MERetira: TMaskEdit;
    Label2: TLabel;
    Opes1: TMenuItem;
    ImplantarContagem1: TMenuItem;
    ZerarContagem1: TMenuItem;
    ImplantarContagemParcial1: TMenuItem;
    ContagemdeEstoqueporCdigodeBarras1: TMenuItem;
    procedure MECodBarraExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MERetiraExit(Sender: TObject);
    procedure ImplantarContagem1Click(Sender: TObject);
    procedure ZerarContagem1Click(Sender: TObject);
    procedure ImplantarContagemParcial1Click(Sender: TObject);
    procedure ContagemdeEstoqueporCdigodeBarras1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContagemEstoqueCodBarra: TFContagemEstoqueCodBarra;

implementation

uses UEstoque_cl, UOracle_cl, UParamSistema_cl, UUsuario_cl, URContagemEstoqueCodBarra,UTela_cl;

{$R *.dfm}

procedure TFContagemEstoqueCodBarra.MECodBarraExit(Sender: TObject);
var wCodProduto, wLote :String;
    wAchou: boolean;
    wPeso: integer;
    wQtde: String;
begin
  inherited;
  wCodProduto := '';
  if trim(MECodBarra.Text) <> '' then
  begin
    if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'OSARE') or
        (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PIXIXE')) then
    Begin
      wCodProduto := copy(QuotedStr(trim(MERetira.Text)),1,6);
      wLote := copy(QuotedStr(trim(MERetira.Text)),7,2);
    end
    else
    Begin
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarra.Text)));
      if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
        wCodProduto := DMOracle.FastSelect('COD_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + QuotedStr(Trim(MECodBarra.Text)));
      wLote := '1';
    end;
    if Trim(wCodProduto) = '' then
    begin
      MECodBarra.Clear;
      MECodBarra.SetFocus;
      raise Exception.Create('O código de barras ou código do produto informado não corresponde a nenhum produto cadastrado.');
    end;


    MECodBarra.Clear;
    {if wCodProduto = '' then
    begin
      MECodBarra.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;}
    with DMEstoque do
    begin
      QContagemEstoque.First;
      wAchou := false;
      while (not QContagemEstoque.Eof) and (not wAchou) do
      begin
        if ((QContagemEstoqueCOD_PRODUTO.Value = StrToInt(wCodProduto)) and (QContagemEstoqueCOD_LOTE_TIPO.Value = StrToInt(wLote)))then
        begin
          QContagemEstoque.Edit;
          //if wPeso > 0 then
          //  QContagemEstoqueQT_QUANTIDADE.Value := QContagemEstoqueQT_QUANTIDADE.Value + wPeso
         // else
            QContagemEstoqueQT_QUANTIDADE.Value := QContagemEstoqueQT_QUANTIDADE.Value + 1;
          QContagemEstoqueCOD_FILIAL.Value := 1;
          QContagemEstoque.Post;
          wAchou := true;
        end
        else
          QContagemEstoque.Next;
      end;
      if not wAchou then
      begin
       // if DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto) = '' then
       //   MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        QContagemEstoque.Insert;
        QContagemEstoqueCOD_PRODUTO.Value := StrToInt(wCodProduto);
        //if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'OSARE') then
        //  QItemNFCOD_LOTE_TIPO.Value := StrToInt(wLote);
       // if wPeso > 0 then
          {if (DMParamSistema.CodEmpresa = 'JASOL') then
          begin
            wQtde := InputBox('Quantidade', 'Informe a quantidade do item:', '1');
            if Trim(wQtde) = '' then
               QContagemEstoqueQT_QUANTIDADE.Value := 1
            else
              QContagemEstoqueQT_QUANTIDADE.Value := StrToInt(wQtde);
          end
          else} 
          QContagemEstoqueQT_QUANTIDADE.Value := 1;
          QContagemEstoqueCOD_LOTE_TIPO.Value := StrToInt(wLote);
          QContagemEstoqueDESC_PRODUTO.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
          QContagemEstoqueCOD_FILIAL.Value := 1;
          QContagemEstoqueQT_ESTOQUE_ATUAL.Value := 0 + StrToInt(DMOracle.FastSelect('QT_QUANTIDADE', 'TB_ESTOQUE',
                                                    'COD_PRODUTO = ' + wCodProduto +' and COD_LOTE_TIPO ='+ wLote));

        QContagemEstoque.Post;
      end;
    end;
    MECodBarra.SetFocus;
  end;
end;

procedure TFContagemEstoqueCodBarra.FormActivate(Sender: TObject);
begin
  inherited;
  if (((DMParamSistema.CodEmpresa = 'SOLDAR') or (DMParamSistema.CodEmpresa = 'PIXIXE') or (DMParamSistema.CodEmpresa = 'NUTRIPET')or
      (DMParamSistema.CodEmpresa = 'BORGES') or (DMParamSistema.CodEmpresa = 'LUCILUCI') or (DMParamSistema.CodEmpresa = 'FERRAGMED') or
      (DMParamSistema.CodEmpresa = 'DONABENTA') or (DMParamSistema.CodEmpresa = 'NIR') or (DMParamSistema.CodEmpresa = 'BORGES2') or
      (DMParamSistema.CodEmpresa = 'PROPE') or (DMParamSistema.CodEmpresa = 'JASOL') ) and
      (DMUsuario.pTipoFuncionario = 'DIRETOR')) then
  begin
    Opes1.Enabled := True;
  end;
  DMEstoque.QContagemEstoque.Open;
  MECodBarra.SetFocus;
end;

procedure TFContagemEstoqueCodBarra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMEstoque.QContagemEstoque.Close;
  Action := CaFree;
  FContagemEstoqueCodBarra := Nil;
end;

procedure TFContagemEstoqueCodBarra.MERetiraExit(Sender: TObject);
var
wCodProduto, wLote : String;
wQuantidade : integer;
begin
  inherited;
  if trim(MERetira.Text) <> '' then
  begin
    if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'OSARE') or
        (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PIXIXE')) then
    Begin
      wCodProduto := copy(QuotedStr(trim(MERetira.Text)),1,6);
      wLote := copy(QuotedStr(trim(MERetira.Text)),7,2);
    end
    else
    Begin
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MERetira.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
       wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MERetira.Text)));
    wLote := '1';
    end;

    wQuantidade := StrToInt(DMOracle.FastSelect('QT_QUANTIDADE','TB_CONTAGEM_ESTOQUE_CODBARRA','COD_PRODUTO =' + wCodProduto
                                               +' AND COD_LOTE_TIPO =' + wLote));
    MERetira.Clear;
    if wCodProduto = '' then
    begin
      MERetira.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    DMOracle.DBCemapa.StartTransaction;
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('UPDATE TB_CONTAGEM_ESTOQUE_CODBARRA SET QT_QUANTIDADE = ' + IntToStr(wQuantidade -1));
    DMOracle.QExecSQL.SQL.Add('WHERE COD_PRODUTO = ' + wCodProduto);
    DMOracle.QExecSQL.SQL.Add(' AND COD_LOTE_TIPO = ' + wLote);
    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
    DMEstoque.QContagemEstoque.Close;
    DMEstoque.QContagemEstoque.Open;
    MERetira.SetFocus;
  end;
end;

procedure TFContagemEstoqueCodBarra.ImplantarContagem1Click(
  Sender: TObject);
begin
  inherited;
  if (MessageDlg('ESSA OPERAÇÃO NÃO TEM VOLTA, ELA VAI ZERAR TODO O SEU ESTOQUE ATUAL E INSERIR AS QUANTIDADES DA CONTAGEM COM CÓDIGO DE BARRAS, VOCÊ CONFIRMA A OPERAÇÃO?', mtConfirmation, [mbYes, mbNo], 0) in [mrNo, mrNone]) then
    Abort
  Else
  Begin
    with DMEstoque do
    Begin
      DMOracle.DBCemapa.StartTransaction;
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('UPDATE TB_ESTOQUE SET QT_QUANTIDADE = ' + '0');
      //DMOracle.QExecSQL.SQL.Add('WHERE COD_PRODUTO = ' + wCodProduto);
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;


      QContagemEstoque.Close;
      QContagemEstoque.Open;
      QContagemEstoque.First;
      While not QContagemEstoque.Eof do
      Begin
        AtualizaEstoque(-2,QContagemEstoqueCOD_FILIAL.Value,QContagemEstoqueCOD_PRODUTO.Value,
                        QContagemEstoqueCOD_LOTE_TIPO.Value, QContagemEstoqueQT_QUANTIDADE.Value,0,0,0);

        QContagemEstoque.Next;
      end;
    end;
  end;
  DMOracle.DBCemapa.Commit;
  ShowMessage('Estoque atualizado com sucesso!');
end;

procedure TFContagemEstoqueCodBarra.ZerarContagem1Click(Sender: TObject);
begin
  inherited;
  if (MessageDlg('TEM CERTEZA QUE DESEJA ZERAR A CONTAGEM COM CÓDIGO DE BARRAS, VOCÊ CONFIRMA A OPERAÇÃO?', mtConfirmation, [mbYes, mbNo], 0) in [mrNo, mrNone]) then
    Abort
  Else
  Begin
    with DMEstoque do
    Begin
      DMOracle.DBCemapa.StartTransaction;
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_CONTAGEM_ESTOQUE_CODBARRA');
      //DMOracle.QExecSQL.SQL.Add('WHERE COD_PRODUTO = ' + wCodProduto);
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;

      QContagemEstoque.Close;
      QContagemEstoque.Open;
    end;
  end;
  DMOracle.DBCemapa.Commit;
  ShowMessage('Contagem zerada com sucesso!');
end;

procedure TFContagemEstoqueCodBarra.ImplantarContagemParcial1Click(
  Sender: TObject);
begin
  inherited;
  if (MessageDlg('ESSA OPERAÇÃO NÃO TEM VOLTA, ELA VAI ZERAR O ESTOQUE ATUAL DOS PRODUTOS DA '   +
                 'LISTA E INSERIR AS QUANTIDADES DA CONTAGEM COM CÓDIGO DE BARRAS, VOCÊ CONFIRMA'+
                 '  A OPERAÇÃO?', mtConfirmation, [mbYes, mbNo], 0) in [mrNo, mrNone]) then
    Abort
  Else
  Begin
    with DMEstoque do
    Begin
      QContagemEstoque.Close;
      QContagemEstoque.Open;
      QContagemEstoque.First;
      DMOracle.DBCemapa.StartTransaction;
      While not QContagemEstoque.Eof do
      Begin
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_ESTOQUE SET QT_QUANTIDADE = ' + '0');
        DMOracle.QExecSQL.SQL.Add('WHERE COD_PRODUTO = ' + QContagemEstoqueCOD_PRODUTO.Text);
        DMOracle.QExecSQL.ExecSQL;

        AtualizaEstoque(-2,QContagemEstoqueCOD_FILIAL.Value,QContagemEstoqueCOD_PRODUTO.Value,
                        QContagemEstoqueCOD_LOTE_TIPO.Value, QContagemEstoqueQT_QUANTIDADE.Value,0,0,0);

        QContagemEstoque.Next;
      end;
    end;
  end;
  DMOracle.DBCemapa.Commit;
  ShowMessage('Estoque atualizado com sucesso!');
end;

procedure TFContagemEstoqueCodBarra.ContagemdeEstoqueporCdigodeBarras1Click(
  Sender: TObject);
begin
  inherited;
  if FRContagemEstoqueCodBarra = nil then //criação do relatório suporte(12702). Junior 22/08/2019
    FRContagemEstoqueCodBarra := TFRContagemEstoqueCodBarra.Create(Application);
  with DMEstoque do
  begin
    QRContagemEstoque.Close;
    QRContagemEstoque.Open;
  end;
  FRContagemEstoqueCodBarra.QRPrimario.Preview;
end;

end.
