unit UEstoqueSeguranca_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMEstoqueSeguranca = class(TDataModule)
    QEstoqueSeguranca: TOracleDataSet1;
    QEstoqueSegurancaCOD_PRODUTO_SEGURANCA: TIntegerField;
    QEstoqueSegurancaCOD_FILIAL: TIntegerField;
    QEstoqueSegurancaVL_CUSTO_MEDIO: TFloatField;
    QEstoqueSegurancaVL_ULTIMO_CUSTO: TFloatField;
    QEstoqueSegurancaQT_QUANTIDADE: TFloatField;
    QEstoqueSegurancaCons: TOracleDataSet1;
    QBaixaEstoque: TOracleDataSet1;
    QBaixaEstoqueCOD_BAIXA_ESTOQUE: TIntegerField;
    QBaixaEstoqueCOD_FILIAL: TIntegerField;
    QBaixaEstoqueDT_BAIXA: TDateTimeField;
    QBaixaEstoqueCOD_PRODUTO_SEGURANCA: TIntegerField;
    QBaixaEstoqueQT_QUANTIDADE: TIntegerField;
    QBaixaEstoqueCOD_USUARIO: TIntegerField;
    QBaixaEstoqueDESC_MOTIVO: TStringField;
    QBaixaEstoquedesc_filial: TStringField;
    QBaixaEstoquedesc_produto_seguranca: TStringField;
    QBaixaEstoqueDESC_MOTIVO2: TStringField;
    QBaixaEstoqueCons: TOracleDataSet1;
    QEstoqueSegurancaCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QBaixaEstoqueCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QBaixaEstoquedesc_caracteristica_produto: TStringField;
    QBaixaEstoqueConsCOD_BAIXA_ESTOQUE: TIntegerField;
    QBaixaEstoqueConsDT_BAIXA: TDateTimeField;
    QBaixaEstoqueConsQT_QUANTIDADE: TIntegerField;
    QBaixaEstoqueConsCOD_PRODUTO_SEGURANCA: TIntegerField;
    QBaixaEstoqueConsDESC_PRODUTO_SEGURANCA: TStringField;
    QBaixaEstoqueConsCOD_FILIAL: TIntegerField;
    QBaixaEstoqueConsCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QBaixaEstoqueConsDESC_CARACTERISTICA_PRODUTO: TStringField;
    QBaixaEstoqueOBSERVACAO: TStringField;
    QTransfEstoque: TOracleDataSet1;
    QTransfEstoquedesc_filial_orig: TStringField;
    QTransfEstoquedesc_filial_dest: TStringField;
    QTransfEstoqueCons: TOracleDataSet1;
    QEstoqueImplantado: TOracleDataSet1;
    QEstoqueImplantadoCOD_ESTOQUE_IMPLANTADO: TIntegerField;
    QEstoqueImplantadoCOD_PRODUTO_SEGURANCA: TIntegerField;
    QEstoqueImplantadoCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QEstoqueImplantadoCOD_FILIAL: TIntegerField;
    QEstoqueImplantadoCOD_USUARIO: TIntegerField;
    QEstoqueImplantadoQT_QUANTIDADE: TFloatField;
    QEstoqueImplantadoDT_IMPLANTACAO: TDateTimeField;
    QEstoqueImplantadoVL_CUSTO: TFloatField;
    QEstoqueImplantadodesc_filial: TStringField;
    QEstoqueImplantadodesc_produto_seguranca: TStringField;
    QEstoqueImplantadodesc_caracteristica_produto: TStringField;
    QEstoqueImplantadoval_total: TFloatField;
    QEstoqueImplantadoCons: TOracleDataSet1;
    QEstoqueImplantadoConsCOD_ESTOQUE_IMPLANTADO: TIntegerField;
    QEstoqueImplantadoConsCOD_PRODUTO_SEGURANCA: TIntegerField;
    QEstoqueImplantadoConsCOD_FILIAL: TIntegerField;
    QEstoqueImplantadoConsDT_IMPLANTACAO: TDateTimeField;
    QEstoqueImplantadoConsCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QEstoqueImplantadoConsDESC_PRODUTO_SEGURANCA: TStringField;
    QEstoqueImplantadoConsDESC_CARACTERISTICA_PRODUTO: TStringField;
    QEstoqueSegurancaConsCOD_PRODUTO_SEGURANCA: TIntegerField;
    QEstoqueSegurancaConsDESC_PRODUTO_SEGURANCA: TStringField;
    QEstoqueSegurancaConsCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QEstoqueSegurancaConsDESC_CARACTERISTICA_PRODUTO: TStringField;
    QEstoqueSegurancaConsCOD_FILIAL: TIntegerField;
    QEstoqueSegurancaConsDESC_FILIAL: TStringField;
    QEstoqueSegurancaConsVL_CUSTO_MEDIO: TFloatField;
    QEstoqueSegurancaConsVL_ULTIMO_CUSTO: TFloatField;
    QEstoqueSegurancaConsQT_QUANTIDADE: TFloatField;
    QEstoqueAtual: TOracleDataSet1;
    QEstoqueAtualCOD_PRODUTO_SEGURANCA: TIntegerField;
    QEstoqueAtualCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QEstoqueAtualCOD_FILIAL: TIntegerField;
    QEstoqueAtualVL_CUSTO_MEDIO: TFloatField;
    QEstoqueAtualVL_ULTIMO_CUSTO: TFloatField;
    QEstoqueAtualQT_QUANTIDADE: TFloatField;
    QEstoqueAtualVAL_TOTAL_MEDIO: TFloatField;
    QEstoqueAtualVAL_TOTAL_ULTIMO: TFloatField;
    DSEstoqueAtual: TDataSource;
    QRBaixaEstoque: TOracleDataSet1;
    QRBaixaEstoqueCOD_BAIXA_ESTOQUE: TIntegerField;
    QRBaixaEstoqueCOD_FILIAL: TIntegerField;
    QRBaixaEstoqueDESC_FILIAL: TStringField;
    QRBaixaEstoqueCOD_PRODUTO_SEGURANCA: TIntegerField;
    QRBaixaEstoqueDESC_PRODUTO_SEGURANCA: TStringField;
    QRBaixaEstoqueCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QRBaixaEstoqueDESC_CARACTERISTICA_PRODUTO: TStringField;
    QRBaixaEstoqueQT_QUANTIDADE: TIntegerField;
    QRBaixaEstoqueDT_BAIXA: TDateTimeField;
    QTransfEstoqueCOD_TRANSF_ESTOQUE_CAB: TIntegerField;
    QTransfEstoqueCOD_FILIAL_ORIGEM: TIntegerField;
    QTransfEstoqueCOD_FILIAL_DESTINO: TIntegerField;
    QTransfEstoqueCOD_USUARIO: TIntegerField;
    QTransfEstoqueDT_TRANSFERENCIA: TDateTimeField;
    QTransfEstoqueIND_SITUACAO: TStringField;
    QTransfEstoqueItem: TOracleDataSet1;
    QTransfEstoqueItemCOD_TRANSF_ESTOQUE_ITEM: TIntegerField;
    QTransfEstoqueItemCOD_TRANSF_ESTOQUE_CAB: TIntegerField;
    QTransfEstoqueItemCOD_PRODUTO_SEGURANCA: TIntegerField;
    QTransfEstoqueItemCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QTransfEstoqueItemQT_QUANTIDADE: TFloatField;
    QTransfEstoqueItemVL_CUSTO: TFloatField;
    QTransfEstoqueItemdesc_produto_seguranca: TStringField;
    QTransfEstoqueItemdesc_caracteristica_produto: TStringField;
    QTransfEstoqueItemvl_total: TFloatField;
    QTransfEstoqueConsCOD_TRANSF_ESTOQUE_CAB: TIntegerField;
    QTransfEstoqueConsCOD_FILIAL_ORIGEM: TIntegerField;
    QTransfEstoqueConsCOD_FILIAL_DESTINO: TIntegerField;
    QTransfEstoqueConsDT_TRANSFERENCIA: TDateTimeField;
    QTransfEstoqueConsIND_SITUACAO: TStringField;
    QRImpTransf: TOracleDataSet1;
    QRImpTransfCOD_TRANSF_ESTOQUE_CAB: TIntegerField;
    QRImpTransfDT_TRANSFERENCIA: TDateTimeField;
    QRImpTransfCOD_FILIAL_DESTINO: TIntegerField;
    QRImpTransfDESC_FILIAL: TStringField;
    QRImpTransfDESC_TECNICO_SEGURANCA: TStringField;
    QRImpTransfQT_QUANTIDADE: TFloatField;
    QRImpTransfCOD_PRODUTO_SEGURANCA: TIntegerField;
    QRImpTransfDESC_PRODUTO_SEGURANCA: TStringField;
    QRImpTransfCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QRImpTransfDESC_CARACTERISTICA_PRODUTO: TStringField;
    QREstoqueSeguranca: TOracleDataSet1;
    QREstoqueSegurancaCOD_FILIAL: TIntegerField;
    QREstoqueSegurancaDESC_FILIAL: TStringField;
    QREstoqueSegurancaCOD_PRODUTO_SEGURANCA: TIntegerField;
    QREstoqueSegurancaDESC_PRODUTO_SEGURANCA: TStringField;
    QREstoqueSegurancaCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QREstoqueSegurancaDESC_CARACTERISTICA_PRODUTO: TStringField;
    QREstoqueSegurancaQT_ESTOQUE: TFloatField;
    QREstoqueSegurancaVL_CUSTO_MEDIO: TFloatField;
    QREstoqueSegurancaQT_EMPRESTADO: TFloatField;
    QRPosEstoque: TOracleDataSet1;
    QRPosEstoqueCOD_FILIAL: TIntegerField;
    QRPosEstoqueDESC_FILIAL: TStringField;
    QRPosEstoqueCOD_PRODUTO_SEGURANCA: TIntegerField;
    QRPosEstoqueDESC_PRODUTO_SEGURANCA: TStringField;
    QRPosEstoqueQT_EMPRESTADO: TFloatField;
    QRPosEstoqueQT_ESTOQUE: TFloatField;
    QRPosEstoqueVL_TOTAL: TFloatField;
    QRTransfEstoque: TOracleDataSet1;
    QRTransfEstoqueCOD_TRANSF_ESTOQUE_CAB: TFloatField;
    QRTransfEstoqueCOD_FILIAL_ORIGEM: TFloatField;
    QRTransfEstoqueCOD_FILIAL_DESTINO: TFloatField;
    QRTransfEstoqueDESC_FILIAL: TStringField;
    QRTransfEstoqueDT_TRANSFERENCIA: TDateTimeField;
    QRTransfEstoqueCOD_PRODUTO_SEGURANCA: TFloatField;
    QRTransfEstoqueDESC_PRODUTO_SEGURANCA: TStringField;
    QRTransfEstoqueIND_RETORNAVEL: TStringField;
    QRTransfEstoqueCOD_CARACTERISTICA_PRODUTO: TFloatField;
    QRTransfEstoqueDESC_CARACTERISTICA_PRODUTO: TStringField;
    QRTransfEstoqueQT_QUANTIDADE: TFloatField;
    QRTransfEstoqueVL_CUSTO: TFloatField;
    QREstoqueImplantado: TOracleDataSet1;
    QREstoqueImplantadoCOD_ESTOQUE_IMPLANTADO: TIntegerField;
    QREstoqueImplantadoCOD_FILIAL: TIntegerField;
    QREstoqueImplantadoDESC_FILIAL: TStringField;
    QREstoqueImplantadoCOD_PRODUTO_SEGURANCA: TIntegerField;
    QREstoqueImplantadoDESC_PRODUTO_SEGURANCA: TStringField;
    QREstoqueImplantadoCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QREstoqueImplantadoDESC_CARACTERISTICA_PRODUTO: TStringField;
    QREstoqueImplantadoQT_QUANTIDADE: TFloatField;
    QREstoqueImplantadoDT_IMPLANTACAO: TDateTimeField;
    QREstoqueImplantadoVL_CUSTO: TFloatField;
    QRTransfEstoqueIND_TIPO: TStringField;
    QRBaixaEstoqueMOTIVO: TStringField;
    QRTransfEstoqueCOD_FILIAL: TFloatField;
    procedure QBaixaEstoqueCalcFields(DataSet: TDataSet);
    procedure QBaixaEstoqueAfterInsert(DataSet: TDataSet);
    procedure QBaixaEstoqueAfterEdit(DataSet: TDataSet);
    procedure QBaixaEstoqueBeforePost(DataSet: TDataSet);
    procedure QBaixaEstoqueBeforeDelete(DataSet: TDataSet);
    procedure QTransfEstoqueAfterInsert(DataSet: TDataSet);
    procedure QBaixaEstoqueBeforeCancel(DataSet: TDataSet);
    procedure QTransfEstoqueBeforeDelete(DataSet: TDataSet);
    procedure QTransfEstoqueBeforeEdit(DataSet: TDataSet);
    procedure QTransfEstoqueCalcFields(DataSet: TDataSet);
    procedure QEstoqueImplantadoAfterInsert(DataSet: TDataSet);
    procedure QEstoqueImplantadoBeforeCancel(DataSet: TDataSet);
    procedure QEstoqueImplantadoBeforeDelete(DataSet: TDataSet);
    procedure QEstoqueImplantadoBeforeEdit(DataSet: TDataSet);
    procedure QEstoqueImplantadoBeforePost(DataSet: TDataSet);
    procedure QEstoqueImplantadoCalcFields(DataSet: TDataSet);
    procedure QTransfEstoqueAfterDelete(DataSet: TDataSet);
    procedure QTransfEstoqueItemAfterInsert(DataSet: TDataSet);
    procedure QTransfEstoqueItemBeforeDelete(DataSet: TDataSet);
    procedure QTransfEstoqueItemBeforeInsert(DataSet: TDataSet);
    procedure QTransfEstoqueItemBeforePost(DataSet: TDataSet);
    procedure QTransfEstoqueItemCalcFields(DataSet: TDataSet);
    procedure QTransfEstoqueAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaEstoqueSeguranca(wCodFilial,wCodProduto,wCaracProduto:Integer;wQtdade,wValUnitario:Real;wOperacao:Char);
  end;

var
  DMEstoqueSeguranca: TDMEstoqueSeguranca;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.DFM}

{*------------------------------------------------------------------------------
Desenvolvido por Pedro Moacir de Carvalho - 20/01/2004
Rotina para atualizar o Estoque de Produtos de Segurança
------------------------------------------------------------------------------*}
procedure TDMEstoqueSeguranca.AtualizaEstoqueSeguranca(wCodFilial,wCodProduto,wCaracProduto:Integer;wQtdade,wValUnitario:Real;wOperacao:Char);
var
  wAux: Real;
begin
  QEstoqueSeguranca.Close;
  QEstoqueSeguranca.SetVariable('COD_PRODUTO_SEGURANCA',wCodProduto);
  QEStoqueSeguranca.SetVariable('COD_FILIAL',wCodFilial);
  QEStoqueSeguranca.SetVariable('COD_CARACTERISTICA_PRODUTO',wCaracProduto);
  QEstoqueSeguranca.Open;
  //efetua atualização pelo custo médio
  if wValUnitario = 0.0 then
    wValUnitario := QEstoqueSegurancaVL_CUSTO_MEDIO.Value;
  if wOperacao = '+' then //Adicionar No estoque
  begin
    if QEstoqueSeguranca.RecordCount = 0 then //produto nao cadastrado no estoque
    begin
      QEstoqueSeguranca.Insert;
      QEstoqueSegurancaCOD_PRODUTO_SEGURANCA.Value:=wCodProduto;
      QEstoqueSegurancaCOD_FILIAL.Value:=wCodFilial;
      QEstoqueSegurancaCOD_CARACTERISTICA_PRODUTO.Value:=wCaracProduto;
      QEstoqueSegurancaQT_QUANTIDADE.Value:=wQtdade;
      wAux:=wValUnitario;
    end
    else //produto ja cadastrado no estoque - atualiza estoque
    begin
      //calcula novo custo medio
      wAux:=(QEstoqueSegurancaVL_CUSTO_MEDIO.Value*QEstoqueSegurancaQT_QUANTIDADE.Value)+(wValUnitario*wQtdade);
      if (QEstoqueSegurancaQT_QUANTIDADE.Value+wQtdade)<>0 then
        wAux:=wAux/(QEstoqueSegurancaQT_QUANTIDADE.Value+wQtdade)
      else
        wAux:=0.0;//estoque zerado
      //fim calculo custo medio
      QEstoqueSeguranca.Edit;
      QEstoqueSegurancaQT_QUANTIDADE.Value:=QEstoqueSegurancaQT_QUANTIDADE.Value+wQtdade;
    end;
    QEstoqueSegurancaVL_ULTIMO_CUSTO.Value:=wValUnitario;//atualiza o ultimo custo de compra
  end
  else if wOperacao = '-' then //Baixa Estoque
  begin
    if QEstoqueSeguranca.RecordCount = 0 then //produto nao cadastrado no estoque
      Raise Exception.Create('Produto não Cadastrado no Estoque - Impossível Realizar Baixa');
    //calcula novo custo medio
    if QEstoqueSegurancaQT_QUANTIDADE.Value < wQtdade then
      Raise Exception.Create('Quantidade insuficiente em estoque para a Baixa');
    wAux:=(QEstoqueSegurancaVL_CUSTO_MEDIO.Value*QEstoqueSegurancaQT_QUANTIDADE.Value)-(wValUnitario*wQtdade);
    if (QEstoqueSegurancaQT_QUANTIDADE.Value-wQtdade)<>0 then
      wAux:=wAux/(QEstoqueSegurancaQT_QUANTIDADE.Value-wQtdade)
    else //estoque zerado
      wAux:=0;
    //fim calculo custo medio
    QEstoqueSeguranca.Edit;
    QEstoqueSegurancaQT_QUANTIDADE.Value:=QEstoqueSegurancaQT_QUANTIDADE.Value-wQtdade;
  end
  else //operacao nao suportada
    Raise Exception.Create('Operação Inválida');
  if wAux <> 0.0 then  // mantém o último custo médio
    QEstoqueSegurancaVL_CUSTO_MEDIO.Value:=wAux;
  QEstoqueSeguranca.Post;
end;


procedure TDMEstoqueSeguranca.QBaixaEstoqueCalcFields(DataSet: TDataSet);
begin
  if Trim(QBaixaEstoqueCod_Produto_Seguranca.text) <> '' then
    QBaixaEstoquedesc_produto_seguranca.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO_SEGURANCA FROM TB_PRODUTO_SEGURANCA',
        'COD_PRODUTO_SEGURANCA = '+Trim(QBaixaEstoqueCod_Produto_Seguranca.text));
  if Trim(QBaixaEstoqueCod_Filial.text) <> '' then
    QBaixaEstoqueDesc_Filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
        'COD_FILIAL = '+Trim(QBaixaEstoqueCod_Filial.text));
  if Trim(QBaixaEstoqueCOD_CARACTERISTICA_PRODUTO.text) <> '' then
    QBaixaEstoquedesc_caracteristica_produto.Value := DMOracle.BuscaNome('SELECT DESC_CARACTERISTICA_PRODUTO FROM TB_CARACTERISTICA_PRODUTO',
                                                                         'COD_CARACTERISTICA_PRODUTO = '+Trim(QBaixaEstoqueCOD_CARACTERISTICA_PRODUTO.text));
end;

procedure TDMEstoqueSeguranca.QBaixaEstoqueAfterInsert(DataSet: TDataSet);
begin
   QBaixaEstoqueDt_Baixa.Value:=DMOracle.DataServ;
   QBaixaEstoqueCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMEstoqueSeguranca.QBaixaEstoqueAfterEdit(DataSet: TDataSet);
begin
  QBaixaEstoqueCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  //volta quantidade para o estoque
  AtualizaEstoqueSeguranca(QBaixaEstoqueCOD_FILIAL.Value,QBaixaEstoqueCOD_PRODUTO_SEGURANCA.Value,
                           QBaixaEstoqueCOD_CARACTERISTICA_PRODUTO.Value,QBaixaEstoqueQT_QUANTIDADE.Value,0.0,'+');
end;

procedure TDMEstoqueSeguranca.QBaixaEstoqueBeforePost(DataSet: TDataSet);
begin
  //efetua baixa no estoque
  AtualizaEstoqueSeguranca(QBaixaEstoqueCOD_FILIAL.Value,QBaixaEstoqueCOD_PRODUTO_SEGURANCA.Value,
                           QBaixaEstoqueCOD_CARACTERISTICA_PRODUTO.Value,QBaixaEstoqueQT_QUANTIDADE.Value,0.0,'-');
end;

procedure TDMEstoqueSeguranca.QBaixaEstoqueBeforeDelete(DataSet: TDataSet);
begin
  //volta a quantidade para o estoque
  AtualizaEstoqueSeguranca(QBaixaEstoqueCOD_FILIAL.Value,QBaixaEstoqueCOD_PRODUTO_SEGURANCA.Value,
                           QBaixaEstoqueCOD_CARACTERISTICA_PRODUTO.Value,QBaixaEstoqueQT_QUANTIDADE.Value,0.0,'+');
end;

procedure TDMEstoqueSeguranca.QTransfEstoqueAfterInsert(DataSet: TDataSet);
begin
  QTransfEstoqueItem.Close;
  QTransfEstoqueItem.SetVariable('COD_TRANSF_ESTOQUE_CAB',QTransfEstoqueCOD_TRANSF_ESTOQUE_CAB.Value);
  QTransfEstoqueItem.Open;
  QTransfEstoqueDT_TRANSFERENCIA.Value := DMOracle.DataServ;
  //QTransfEstoqueInd_Situacao.Value := 'DIGITADA';
  QTransfEstoqueCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMEstoqueSeguranca.QBaixaEstoqueBeforeCancel(DataSet: TDataSet);
begin
  //da baixa novamente no estoque
  if QBaixaEstoque.State in [DSEdit] then
    AtualizaEstoqueSeguranca(QBaixaEstoqueCOD_FILIAL.Value,QBaixaEstoqueCOD_PRODUTO_SEGURANCA.Value,
                             QBaixaEstoqueCOD_CARACTERISTICA_PRODUTO.Value,QBaixaEstoqueQT_QUANTIDADE.Value,0.0,'-');
end;

procedure TDMEstoqueSeguranca.QTransfEstoqueBeforeDelete(
  DataSet: TDataSet);
begin
  if Trim(QTransfEstoqueInd_Situacao.Value) = 'CONFIRMADA' then
    Raise Exception.Create('Não é possível Excluir uma Transferência Confirmada');
  if QTransfEstoqueItem.RecordCount <> 0 then
    Raise Exception.Create('Não é possível Excluir uma Transferência com Ítens');
end;

procedure TDMEstoqueSeguranca.QTransfEstoqueBeforeEdit(DataSet: TDataSet);
begin
  if Trim(QTransfEstoqueInd_Situacao.Value) = 'CONFIRMADA' then
    Raise Exception.Create('Não é possível Alterar uma Transferência Confirmada');
end;

procedure TDMEstoqueSeguranca.QTransfEstoqueCalcFields(DataSet: TDataSet);
begin
  if Trim(QTransfEstoqueCOD_FILIAL_ORIGEM.text) <> '' then
    QTransfEstoquedesc_filial_orig.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                                              'COD_FILIAL = '+QTransfEstoqueCOD_FILIAL_ORIGEM.text)
  else
    QTransfEstoquedesc_filial_orig.Text := '';

  if Trim(QTransfEstoqueCOD_FILIAL_DESTINO.text) <> '' then
    QTransfEstoquedesc_filial_dest.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                                              'COD_FILIAL = '+QTransfEstoqueCOD_FILIAL_DESTINO.text)
  else
    QTransfEstoquedesc_filial_dest.Text := '';
end;

procedure TDMEstoqueSeguranca.QEstoqueImplantadoAfterInsert(
  DataSet: TDataSet);
begin
  QEstoqueImplantadoDT_IMPLANTACAO.Value := DMOracle.DataServ;
  QEstoqueImplantadoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMEstoqueSeguranca.QEstoqueImplantadoBeforeCancel(
  DataSet: TDataSet);
begin
  //atualiza estoque {refaz o que foi desfeito no evento BeforeEdit}
  if QEstoqueImplantado.State in [DSEdit] then
  begin
    //volta quantidade implantado ao estoque
    AtualizaEstoqueSeguranca(QEstoqueImplantadoCOD_FILIAL.Value,QEstoqueImplantadoCOD_PRODUTO_SEGURANCA.Value,
                             QEstoqueImplantadoCOD_CARACTERISTICA_PRODUTO.Value,QEstoqueImplantadoQT_QUANTIDADE.Value,
                             QEstoqueImplantadoVL_CUSTO.Value,'+');
  end;
end;

procedure TDMEstoqueSeguranca.QEstoqueImplantadoBeforeDelete(
  DataSet: TDataSet);
begin
  //desfaz implantação
  AtualizaEstoqueSeguranca(QEstoqueImplantadoCOD_FILIAL.Value,QEstoqueImplantadoCOD_PRODUTO_SEGURANCA.Value,
                           QEstoqueImplantadoCOD_CARACTERISTICA_PRODUTO.Value,QEstoqueImplantadoQT_QUANTIDADE.Value,
                           QEstoqueImplantadoVL_CUSTO.Value,'-');
end;

procedure TDMEstoqueSeguranca.QEstoqueImplantadoBeforeEdit(
  DataSet: TDataSet);
begin
  //desfaz implantação sendo a mesma implantada novamente com as alterações efetuadas
  AtualizaEstoqueSeguranca(QEstoqueImplantadoCOD_FILIAL.Value,QEstoqueImplantadoCOD_PRODUTO_SEGURANCA.Value,
                           QEstoqueImplantadoCOD_CARACTERISTICA_PRODUTO.Value,QEstoqueImplantadoQT_QUANTIDADE.Value,
                           QEstoqueImplantadoVL_CUSTO.Value,'-');
end;

procedure TDMEstoqueSeguranca.QEstoqueImplantadoBeforePost(
  DataSet: TDataSet);
begin
  //captura o usuário corrente
  QTransfEstoqueCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  //efetua implantação no estoque
  AtualizaEstoqueSeguranca(QEstoqueImplantadoCOD_FILIAL.Value,QEstoqueImplantadoCOD_PRODUTO_SEGURANCA.Value,
                           QEstoqueImplantadoCOD_CARACTERISTICA_PRODUTO.Value,QEstoqueImplantadoQT_QUANTIDADE.Value,
                           QEstoqueImplantadoVL_CUSTO.Value,'+');

end;

procedure TDMEstoqueSeguranca.QEstoqueImplantadoCalcFields(
  DataSet: TDataSet);
begin
  if Trim(QEstoqueImplantadoCOD_FILIAL.text) <> '' then
    QEstoqueImplantadodesc_filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                                             'COD_FILIAL = '+QEstoqueImplantadoCOD_FILIAL.text)
  else
    QEstoqueImplantadodesc_filial.Text := '';
  if Trim(QEstoqueImplantadoCOD_PRODUTO_SEGURANCA.text) <> '' then
    QEstoqueImplantadodesc_produto_seguranca.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO_SEGURANCA FROM TB_PRODUTO_SEGURANCA',
                                                                        'COD_PRODUTO_SEGURANCA = '+QEstoqueImplantadoCOD_PRODUTO_SEGURANCA.text)
  else
    QEstoqueImplantadodesc_produto_seguranca.Text := '';
  if Trim(QEstoqueImplantadoCOD_CARACTERISTICA_PRODUTO.text) <> '' then
    QEstoqueImplantadodesc_caracteristica_produto.text := DMOracle.BuscaNome('SELECT DESC_CARACTERISTICA_PRODUTO FROM TB_CARACTERISTICA_PRODUTO',
                                                                             'COD_CARACTERISTICA_PRODUTO = '+QEstoqueImplantadoCOD_CARACTERISTICA_PRODUTO.text)
  else
    QEstoqueImplantadodesc_caracteristica_produto.text := '';
  if (Trim(QEstoqueImplantadoQT_QUANTIDADE.Text)<>'') and (Trim(QEstoqueImplantadoVL_CUSTO.Text)<>'') then
    QEstoqueImplantadoval_total.Value := QEstoqueImplantadoQT_QUANTIDADE.Value * QEstoqueImplantadoVL_CUSTO.Value
  else
    QEstoqueImplantadoval_total.Text := '';
end;

procedure TDMEstoqueSeguranca.QTransfEstoqueAfterDelete(DataSet: TDataSet);
begin
  QTransfEstoqueItem.Close;
  QTransfEstoqueItem.Open;
end;

procedure TDMEstoqueSeguranca.QTransfEstoqueItemAfterInsert(
  DataSet: TDataSet);
begin
  QTransfEstoqueItemCod_Transf_Estoque_Cab.Value := QTransfEstoqueCod_Transf_Estoque_Cab.Value;
end;

procedure TDMEstoqueSeguranca.QTransfEstoqueItemBeforeDelete(
  DataSet: TDataSet);
begin
  //verifica se a transferência já esta confirmada
  if Trim(QTransfEstoqueInd_Situacao.Value) = 'CONFIRMADA' then
    Raise Exception.Create('Não é possível Excluir a Transferência - Transferência Confirmada');
  //verifica se transferência esta em modo de alteração
  if not (QTransfEstoque.State in [DSEdit]) then
    Raise Exception.Create('Transferência não esta em modo de Alteração');
  //desfaz transferência
  //da baixa na filial de destino
  AtualizaEstoqueSeguranca(QTransfEstoqueCOD_FILIAL_DESTINO.Value,QTransfEstoqueItemCOD_PRODUTO_SEGURANCA.Value,
                           QTransfEstoqueItemCOD_CARACTERISTICA_PRODUTO.Value,QTransfEstoqueItemQT_QUANTIDADE.Value,
                           QTransfEstoqueItemVL_CUSTO.Value,'-');
  //volta para o estoque de origem
  AtualizaEstoqueSeguranca(QTransfEstoqueCOD_FILIAL_ORIGEM.Value,QTransfEstoqueItemCOD_PRODUTO_SEGURANCA.Value,
                           QTransfEstoqueItemCOD_CARACTERISTICA_PRODUTO.Value,QTransfEstoqueItemQT_QUANTIDADE.Value,
                           QTransfEstoqueItemVL_CUSTO.Value,'+');
end;

procedure TDMEstoqueSeguranca.QTransfEstoqueItemBeforeInsert(
  DataSet: TDataSet);
begin
  //verifica se a transfência esta em modo de inserção ou alterção
  if not (QTransfEstoque.State in [DSInsert,DSEdit]) then
    Raise Exception.Create('Transferência não está em modo de Inserção ou Alteração');
  //verifica se a transfência já foi confirmada
  if Trim(QTransfEstoqueInd_Situacao.Text) = 'CONFIRMADA' then
    Raise Exception.Create('Não é possível inserir ítens em uma Transferência Confirmada');
  //se transferência estiver me modo de inserção - confirma e entra em modo de alteração
  //para ter o codigo do cabeçalho na hora de inserir o ítem
  if QTransfEstoque.State in [DSInsert] then
  begin
    QTransfEstoque.post;
    QTransfEstoque.RefreshRecord;
    QTransfEstoque.Edit;
  end;
end;

procedure TDMEstoqueSeguranca.QTransfEstoqueItemBeforePost(
  DataSet: TDataSet);
begin
  //verifica se a transfência esta em modo de inserção
  if QTransfEstoque.state in [DSInsert] then
    QTransfEstoque.Post;
  //da baixa na filial de origem
  AtualizaEstoqueSeguranca(QTransfEstoqueCOD_FILIAL_ORIGEM.Value,QTransfEstoqueItemCOD_PRODUTO_SEGURANCA.Value,
                           QTransfEstoqueItemCOD_CARACTERISTICA_PRODUTO.Value,QTransfEstoqueItemQT_QUANTIDADE.Value,
                           QTransfEstoqueItemVL_CUSTO.Value,'-');
  //atualiza estoque da filial de destino
  AtualizaEstoqueSeguranca(QTransfEstoqueCOD_FILIAL_DESTINO.Value,QTransfEstoqueItemCOD_PRODUTO_SEGURANCA.Value,
                           QTransfEstoqueItemCOD_CARACTERISTICA_PRODUTO.Value,QTransfEstoqueItemQT_QUANTIDADE.Value,
                           QTransfEstoqueItemVL_CUSTO.Value,'+');
end;

procedure TDMEstoqueSeguranca.QTransfEstoqueItemCalcFields(
  DataSet: TDataSet);
begin
  if Trim(QTransfEstoqueItemCOD_PRODUTO_SEGURANCA.text) <> '' then
    QTransfEstoqueItemdesc_produto_seguranca.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO_SEGURANCA FROM TB_PRODUTO_SEGURANCA',
                                                                        'COD_PRODUTO_SEGURANCA = '+QTransfEstoqueItemCOD_PRODUTO_SEGURANCA.text)
  else
    QTransfEstoqueItemdesc_produto_seguranca.Text := '';

  if Trim(QTransfEstoqueItemCOD_CARACTERISTICA_PRODUTO.text) <> '' then
    QTransfEstoqueItemdesc_caracteristica_produto.text := DMOracle.BuscaNome('SELECT DESC_CARACTERISTICA_PRODUTO FROM TB_CARACTERISTICA_PRODUTO',
                                                                             'COD_CARACTERISTICA_PRODUTO = '+QTransfEstoqueItemCOD_CARACTERISTICA_PRODUTO.text)
  else
    QTransfEstoqueItemdesc_caracteristica_produto.text := '';

  if (Trim(QTransfEstoqueItemQT_QUANTIDADE.Text)<>'') and (Trim(QTransfEstoqueItemVL_CUSTO.Text)<>'') then
    QTransfEstoqueItemvl_total.Value := QTransfEstoqueItemQT_QUANTIDADE.Value *
                                        QTransfEstoqueItemVL_CUSTO.Value
  else
    QTransfEstoqueItemvl_total.Value := 0.0;
end;

procedure TDMEstoqueSeguranca.QTransfEstoqueAfterOpen(DataSet: TDataSet);
begin
  QTransfEstoqueItem.Close;
  QTransfEstoqueItem.setVariable('COD_TRANSF_ESTOQUE_CAB',QTransfEstoqueCod_Transf_Estoque_Cab.Value);
  QTransfEstoqueItem.Open;
end;

end.
