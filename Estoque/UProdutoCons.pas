unit UProdutoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, variants, Menus,
  DBCtrls, ExtCtrls, jpeg, ActnList;

type
  TFProdutoCons = class(TFTConsulta)
    MENrClasse: TMaskEdit;
    LblClasse: TLabel;
    MENumFabricante: TMaskEdit;
    LblNrFabricante: TLabel;
    MEnrSubClasse: TMaskEdit;
    LblSubClasse: TLabel;
    Cb1Situacao: TComboBox;
    LblSituacao: TLabel;
    DBGrid2: TDBGrid;
    Label31: TLabel;
    CBTipoProduto: TComboBox;
    LblCodigo: TLabel;
    MeCodigo: TMaskEdit;
    LblTipo: TLabel;
    BTConsultaEstoque: TBitBtn;
    LblFabricante: TLabel;
    MeCodFabricante: TMaskEdit;
    BtFabricante: TSpeedButton;
    CbOrdem: TComboBox;
    LblOrdem: TLabel;
    LblLocalizacao: TLabel;
    MeLocalizacao: TMaskEdit;
    DBGProdutoRelacionado: TDBGrid;
    DsProdutoRelacionadoCons: TDataSource;
    MeComplemento: TMaskEdit;
    LblComplemento: TLabel;
    LblProdutoRelacionado: TLabel;
    BtConsUltCompra: TBitBtn;
    LblObservacao: TLabel;
    MeCodigoBarras: TMaskEdit;
    DBEdit1: TDBEdit;
    SBClasse: TSpeedButton;
    DSImagem: TDataSource;
    imgProduto: TImage;
    lblImagemNaoCadastrada: TLabel;
    Label2: TLabel;
    MeNCM: TMaskEdit;
    BtConsUltVenda: TBitBtn;
    ActionList1: TActionList;
    Action1: TAction;
    RgConsultaEstoque: TRadioGroup;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    CBUnidade: TComboBox;
    Label4: TLabel;
    RgEnviaBalanca: TRadioGroup;
    Label5: TLabel;
    MeMarca: TMaskEdit;
    BtMarca: TSpeedButton;
    BtnAltValor: TBitBtn;
    MeVal_Varejo: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DSConsultaDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure BtFabricanteClick(Sender: TObject);
    procedure METextoChange(Sender: TObject);
    procedure MeComplementoChange(Sender: TObject);
    procedure MeLocalizacaoChange(Sender: TObject);
    procedure MENumFabricanteChange(Sender: TObject);
    procedure BtConsUltCompraClick(Sender: TObject);
    procedure BTConsultaEstoqueClick(Sender: TObject);
    procedure MeCodigoChange(Sender: TObject);
    procedure MENrClasseChange(Sender: TObject);
    procedure MEnrSubClasseChange(Sender: TObject);
    procedure MeCodFabricanteChange(Sender: TObject);
    procedure MeCodigoBarrasChange(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure SBClasseClick(Sender: TObject);
    procedure AtualizarImagemProduto;
    procedure MeNCMChange(Sender: TObject);
    procedure BtConsUltVendaClick(Sender: TObject);
    procedure METextoExit(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure MeCodigoBarrasExit(Sender: TObject);
    procedure METextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure METextoEnter(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure MeCodigoBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MeCodigoBarrasEnter(Sender: TObject);
    procedure imgProdutoClick(Sender: TObject);
    procedure DBEdit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBUnidadeChange(Sender: TObject);
    procedure BtMarcaClick(Sender: TObject);
    procedure BtnAltValorClick(Sender: TObject);
  private
    wRetornaConsulta :Boolean;
    { Private declarations }
  public
    property RetornaConsulta :Boolean read wRetornaConsulta write wRetornaConsulta;
    procedure HabilitaColunasPaf;
    { Public declarations }
  end;

var
  FProdutoCons: TFProdutoCons;

implementation

uses UProduto_cl, UEstoque_cl, UParamSistema_cl, UCadastroCons,
  UCadastro_cl, UUsuario_cl, UVendaPerdidaCad, UProdutos_UltimasCompras,
  UClasseCons, UClasse_cl, UProdutos_UltimasVendas, UImpressoraFiscal,
  UOracle_cl, UVisualizaAmplia, UObservacao_Cons, UMarca_cl ,UMarcaCons;

{$R *.DFM}

procedure TFProdutoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
 { with DMProduto do
  begin
    QProdutoCons.Close;
    QProdutoCons.Sql.Clear;
    QProdutoCons.Sql.Add('SELECT DISTINCT(TB_PRODUTO.COD_PRODUTO),TB_PRODUTO.NUM_FABRICANTE,TB_PRODUTO.VAL_VAREJO,');
    QProdutoCons.Sql.Add('TB_PRODUTO.VAL_ATACADO,TB_PRODUTO.DESC_PRODUTO,TB_PRODUTO.PRECO_PROMOCAO,TB_PRODUTO.DT_PRECO_PRO_INI,');
    QProdutoCons.Sql.Add('TB_PRODUTO.DT_PRECO_PRO_FIN,TB_PRODUTO.DESC_COMPLEMENTO_PROMOCAO,TB_PRODUTO.DESC_COMPLEMENTO,TB_PRODUTO.NUM_EMBALAGEM,');
    QProdutoCons.Sql.Add('TB_PRODUTO.DESC_UNIDADE,TB_PRODUTO.COD_TRIBUTACAO,TB_PRODUTO.DT_VENCTO_PRECO,TB_PRODUTO.DESC_LOCALIZACAO,');
    QProdutoCons.Sql.Add('TB_PRODUTO.COD_MARCA,TB_CLASSE.NUM_CLASSE,TB_CLASSE.DESC_CLASSE,TB_PRODUTO.COD_CLASSE,TB_PRODUTO.DT_ALTERACAO_PRECO,');
    QProdutoCons.Sql.Add('TB_MARCA.DESC_MARCA,TB_PRODUTO.NUM_GENERO_NCM,TB_PRODUTO.DESC_OBSERVACAO,TB_PRODUTO.PERC_MARGEM_VAREJO,TB_PRODUTO.DESC_COMPLEMENTO_2,');
    QProdutoCons.Sql.Add('TB_PRODUTO.IND_ARREDONDAMENTO_TRUNCAMENTO, CASE WHEN TB_TRIBUTACAO.COD_TRIB_IMP_FISCAL = '+QuotedStr('I')+' THEN TB_TRIBUTACAO.COD_TRIB_IMP_FISCAL WHEN TB_TRIBUTACAO.COD_TRIB_IMP_FISCAL = '+QuotedStr('N')+' THEN TB_TRIBUTACAO.COD_TRIB_IMP_FISCAL WHEN TB_TRIBUTACAO.COD_TRIB_IMP_FISCAL = '+QuotedStr('F')+' THEN TB_TRIBUTACAO.COD_TRIB_IMP_FISCAL ELSE TRIM(TB_TRIBUTACAO.COD_TRIB_IMP_FISCAL) || TRIM(TB_TRIBUTACAO.PERC_ALIQUOTA)||'+QuotedStr('%')+' END AS COD_TRIB_IMP_FISCAL, TB_PRODUTO.IND_PROD_PROPRIA_TERCEIRO,TB_PRODUTO.DESC_BOQUETA,');
    QProdutoCons.Sql.Add('TB_TRIBUTACAO.DESC_CSOSN, TB_TRIBUTACAO.DESC_SITUACAO_TRIB, TB_PRODUTO.DESC_COD_BARRA, TB_PRODUTO.PERC_COMISSAO , TB_PRODUTO.COD_CEST,TB_PRODUTO.IND_SINC_MAX_ROTEIRIZADOR,TB_PRODUTO.NUM_VOLUMES, TB_PRODUTO.IND_ENVIA_BALANCA');
    if (DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'DONABENTA') or (DMParamSistema.CodEmpresa = 'SCALA') then
      QProdutoCons.Sql.Add(',(select sum(nvl(qt_quantidade,0)) from tb_estoque where tb_produto.cod_produto = cod_produto) AS QT_ESTOQUE')
    else
      QProdutoCons.Sql.Add(',0 QT_ESTOQUE');
    QProdutoCons.Sql.Add('FROM TB_PRODUTO,TB_CLASSE,TB_MARCA, TB_TRIBUTACAO, TB_ESTOQUE WHERE (TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE) AND ');
    QProdutoCons.Sql.Add('(TB_PRODUTO.COD_MARCA = TB_MARCA.COD_MARCA(+)) AND (TB_PRODUTO.COD_TRIBUTACAO = TB_TRIBUTACAO.COD_TRIBUTACAO) AND (TB_PRODUTO.COD_PRODUTO = TB_ESTOQUE.COD_PRODUTO(+))');
    if Trim(MENrClasse.Text) <> '' then
       QProdutoCons.Sql.Add(' And TB_CLASSE.NUM_CLASSE = ' + MeNrClasse.Text);
    if Trim(MENrSubClasse.Text) <> '' then
       QProdutoCons.Sql.Add(' And TB_CLASSE.NUM_SUBCLASSE = ' + MeNrSubClasse.Text);
    if Trim(MeCodigo.Text) <> '' then
       QProdutoCons.Sql.Add(' And TB_PRODUTO.COD_PRODUTO = ' + MeCodigo.Text);
    if Trim(CBUnidade.Text) <> '' then                                                //ADICIONADO POR ANDRE 14/03/24 COMBOBOX DE CONSULTA POR UN DE MEDIDA
       QProdutoCons.Sql.Add(' And TB_PRODUTO.DESC_UNIDADE = ' +   QuotedStr(CBUnidade.Text));
    if Trim(MeNumFabricante.Text) <> '' then
    begin
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZITO') Or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ') then
         QProdutoCons.Sql.Add(' And TB_PRODUTO.NUM_FABRICANTE LIKE ' + QuotedStr(MeNumFabricante.Text + '%'))
      else
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'KREUZ' THEN           //SOLICITADO BUSCAR NUMERO EXATO POR RUBENS EM 20/11/2019 - CLEBER
           QProdutoCons.Sql.Add(' And TB_PRODUTO.NUM_FABRICANTE LIKE ' + QuotedStr(MeNumFabricante.Text))
        else
           QProdutoCons.Sql.Add(' And TB_PRODUTO.NUM_FABRICANTE LIKE ' + QuotedStr('%' + MeNumFabricante.Text + '%'));
    end;
    case Cb1Situacao.ItemIndex of
      0: QProdutoCons.Sql.Add(' And TB_PRODUTO.IND_SITUACAO = ' + QuotedStr('ATIVO'));
      1: QProdutoCons.Sql.Add(' And TB_PRODUTO.IND_SITUACAO = ' + QuotedStr('DESATIVADO'));
      2: QProdutoCons.Sql.Add(' And TB_PRODUTO.IND_SITUACAO = ' + QuotedStr('FORA DE LINHA'));
    end;
    if Trim(METexto.Text) <> '' then
      if Copy(MeTexto.TExt, 1, 1) = ' ' then
        QProdutoCons.Sql.Add(' And UPPER(TB_PRODUTO.DESC_PRODUTO) LIKE ' + QuotedStr('%' + UpperCase(Trim(MeTexto.Text)) + '%'))
      else
        QProdutoCons.Sql.Add(' And UPPER(TB_PRODUTO.DESC_PRODUTO) LIKE ' +  QuotedStr(UpperCase(Trim(MeTexto.Text)) + '%'));

    if Trim(CBTipoProduto.Text) <> '' then
      QProdutoCons.Sql.Add(' And TB_PRODUTO.IND_TIPO_PRODUTO = ' + QuotedStr(CBTipoProduto.Text));

    if Trim(MeCodFabricante.Text) <> '' then
       QProdutoCons.Sql.Add(' And TB_PRODUTO.COD_CADASTRO = ' + Trim(MeCodFabricante.Text));

    if Trim(MeLocalizacao.Text) <> '' then
       QProdutoCons.Sql.Add(' And TB_PRODUTO.DESC_LOCALIZACAO LIKE ' + QuotedStr('%' + Trim(MeLocalizacao.Text) + '%'));

    if Trim(MeComplemento.Text) <> '' then
    begin
      if (DMParamSistema.CodEmpresa = 'CEIFAGRIL') or (DMParamSistema.CodEmpresa = 'SCALA') or
         (DMParamSistema.CodEmpresa = 'GERALPECAS') then  //JR MULTIPECAS UTILIZA COD_EMPRESA CEIFAGRIL
        QProdutoCons.Sql.Add(' And TB_PRODUTO.DESC_OBSERVACAO LIKE ' + QuotedStr('%' + Trim(MeComplemento.Text) + '%'))
      else
       QProdutoCons.Sql.Add(' And TB_PRODUTO.DESC_COMPLEMENTO LIKE ' + QuotedStr('%' + Trim(MeComplemento.Text) + '%'));
    end;
    if Trim(MeNCM.Text) <> '' then
      QProdutoCons.SQL.Add(' AND TB_PRODUTO.NUM_GENERO_NCM LIKE ' + QuotedStr(Trim(MeNCM.Text) + '%'));
    if Trim(MeMarca.Text) <> '' then
      QProdutoCons.SQL.Add(' AND TB_PRODUTO.COD_MARCA = ' + Trim(MeMarca.Text));
    //Inside utiliza a "Observacao do produto" para consulta(por colocar desc. de carro no cadastro do produto
    //Junior - 02-10-2012  - cesar colocou para diniz em 13/10/2022
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE')  Or
       (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DISPART') Or
       (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ')   then
     begin
       if Trim(MeCodigoBarras.Text) <> '' then
          QProdutoCons.Sql.Add(' And TB_PRODUTO.DESC_OBSERVACAO LIKE ' + QuotedStr('%' + Trim(MeCodigoBarras.Text) + '%'));
     end
    else
     begin
       if Trim(MeCodigoBarras.Text) <> '' then
         //QProdutoCons.Sql.Add(' And TB_PRODUTO.DESC_COD_BARRA = ' + QuotedStr(Trim(MeCodigoBarras.Text)));
         //Like para consulta de produto por código de barras Casa Dona Benta. Junior - 03/07/2018.
         QProdutoCons.Sql.Add(' And TB_PRODUTO.DESC_COD_BARRA LIKE ' + QuotedStr(Trim(MeCodigoBarras.Text) + '%'));
     end;

    //Trazendo excessivos registros quando filtra por numero do fabricante, causando extrema lentidão. Autorizado por Cesar
    //Gian 18/05/2019

    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'DINIZ') then
      QProdutoCons.Sql.Add(' And ROWNUM <= 1000 ');

    //Produtos com/sem estoque a pedido do Marcos. Vanessa 02/03/2015
    case RGConsultaEstoque.ItemIndex of
      0: QProdutoCons.Sql.Add('and (select sum(nvl(qt_quantidade,0)) from tb_estoque where tb_produto.cod_produto = cod_produto and qt_quantidade > 0) > 0');
//      0: QProdutoCons.Sql.Add('and (select sum(nvl(qt_quantidade,0)) from tb_estoque where tb_produto.cod_produto = cod_produto) > 0');
//      1: QProdutoCons.Sql.Add('and (select sum(nvl(qt_quantidade,0)) from tb_estoque where tb_produto.cod_produto = cod_produto < 0) <= 0');
      1: QProdutoCons.Sql.Add('and (select sum(nvl(qt_quantidade,0)) from tb_estoque where tb_produto.cod_produto = cod_produto and qt_quantidade <= 0) <= 0');
      2: QProdutoCons.Sql.Add('');
    end;
{Produtos que são da balança. Alex 01/04/2025}
  {  case RgEnviaBalanca.ItemIndex of
      0: QProdutoCons.Sql.Add('and tb_produto.ind_envia_balanca = ' + QuotedStr ('SIM'));
      1: QProdutoCons.Sql.Add('and tb_produto.ind_envia_balanca = ' + QuotedStr ('NAO'));
    end;


    case CbOrdem.ItemIndex of
      0: QProdutoCons.Sql.Add(' Order by TB_PRODUTO.COD_PRODUTO');
      1: QProdutoCons.Sql.Add(' Order by TB_PRODUTO.DESC_PRODUTO');
      2: QProdutoCons.Sql.Add(' Order by TB_PRODUTO.COD_CLASSE');
      3: QProdutoCons.Sql.Add(' Order by TB_PRODUTO.DESC_LOCALIZACAO');
      4: QProdutoCons.Sql.Add(' Order by TB_PRODUTO.COD_MARCA');
      5: QProdutoCons.Sql.Add(' Order by TB_PRODUTO.COD_CADASTRO');
      6: QProdutoCons.Sql.Add(' Order by TB_PRODUTO.NUM_FABRICANTE');
    end;                
    QProdutoCons.Open;
    QProdutoEstoque.Open; }

 with DMProduto do
  begin
    QProdutoCons.Close;
    QProdutoCons.Sql.Clear;
    
    // CORREÇÃO: Mudamos a estrutura para calcular o estoque agrupado antes de filtrar, acelerando a busca.
    QProdutoCons.Sql.Add('SELECT DISTINCT(TB_PRODUTO.COD_PRODUTO),TB_PRODUTO.NUM_FABRICANTE,TB_PRODUTO.VAL_VAREJO,');
    QProdutoCons.Sql.Add('TB_PRODUTO.VAL_ATACADO,TB_PRODUTO.DESC_PRODUTO,TB_PRODUTO.PRECO_PROMOCAO,TB_PRODUTO.DT_PRECO_PRO_INI,');
    QProdutoCons.Sql.Add('TB_PRODUTO.DT_PRECO_PRO_FIN,TB_PRODUTO.DESC_COMPLEMENTO_PROMOCAO,TB_PRODUTO.DESC_COMPLEMENTO,TB_PRODUTO.NUM_EMBALAGEM,');
    QProdutoCons.Sql.Add('TB_PRODUTO.DESC_UNIDADE,TB_PRODUTO.COD_TRIBUTACAO,TB_PRODUTO.DT_VENCTO_PRECO,TB_PRODUTO.DESC_LOCALIZACAO,');
    QProdutoCons.Sql.Add('TB_PRODUTO.COD_MARCA,TB_CLASSE.NUM_CLASSE,TB_CLASSE.DESC_CLASSE,TB_PRODUTO.COD_CLASSE,TB_PRODUTO.DT_ALTERACAO_PRECO,');
    QProdutoCons.Sql.Add('TB_MARCA.DESC_MARCA,TB_PRODUTO.NUM_GENERO_NCM,TB_PRODUTO.DESC_OBSERVACAO,TB_PRODUTO.PERC_MARGEM_VAREJO,TB_PRODUTO.DESC_COMPLEMENTO_2,');
    QProdutoCons.Sql.Add('TB_PRODUTO.IND_ARREDONDAMENTO_TRUNCAMENTO, CASE WHEN TB_TRIBUTACAO.COD_TRIB_IMP_FISCAL = '+QuotedStr('I')+' THEN TB_TRIBUTACAO.COD_TRIB_IMP_FISCAL WHEN TB_TRIBUTACAO.COD_TRIB_IMP_FISCAL = '+QuotedStr('N')+' THEN TB_TRIBUTACAO.COD_TRIB_IMP_FISCAL WHEN TB_TRIBUTACAO.COD_TRIB_IMP_FISCAL = '+QuotedStr('F')+' THEN TB_TRIBUTACAO.COD_TRIB_IMP_FISCAL ELSE TRIM(TB_TRIBUTACAO.COD_TRIB_IMP_FISCAL) || TRIM(TB_TRIBUTACAO.PERC_ALIQUOTA)||'+QuotedStr('%')+' END AS COD_TRIB_IMP_FISCAL, TB_PRODUTO.IND_PROD_PROPRIA_TERCEIRO,TB_PRODUTO.DESC_BOQUETA,');
    QProdutoCons.Sql.Add('TB_TRIBUTACAO.DESC_CSOSN, TB_TRIBUTACAO.DESC_SITUACAO_TRIB, TB_PRODUTO.DESC_COD_BARRA, TB_PRODUTO.PERC_COMISSAO , TB_PRODUTO.COD_CEST,TB_PRODUTO.IND_SINC_MAX_ROTEIRIZADOR,TB_PRODUTO.NUM_VOLUMES, TB_PRODUTO.IND_ENVIA_BALANCA,');
    
    // Mantém a lógica de exibição de estoque na tela intacta por empresa, mas usando a nossa tabela unificada (E) externa
    if (DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'DONABENTA') or (DMParamSistema.CodEmpresa = 'SCALA') then
      QProdutoCons.Sql.Add(' E.QT_TOTAL_ESTOQUE AS QT_ESTOQUE ')
    else
      QProdutoCons.Sql.Add(' 0 QT_ESTOQUE ');

    // OTIMIZAÇÃO: Substituímos a tabela TB_ESTOQUE crua por uma visão agrupada (E) que já soma o estoque por produto de forma leve
    QProdutoCons.Sql.Add('FROM TB_PRODUTO, TB_CLASSE, TB_MARCA, TB_TRIBUTACAO, ');
    QProdutoCons.Sql.Add('     (SELECT COD_PRODUTO, SUM(NVL(QT_QUANTIDADE, 0)) AS QT_TOTAL_ESTOQUE FROM TB_ESTOQUE GROUP BY COD_PRODUTO) E ');
    QProdutoCons.Sql.Add('WHERE (TB_PRODUTO.COD_CLASSE = TB_CLASSE.COD_CLASSE) AND ');
    QProdutoCons.Sql.Add('      (TB_PRODUTO.COD_MARCA = TB_MARCA.COD_MARCA(+)) AND ');
    QProdutoCons.Sql.Add('      (TB_PRODUTO.COD_TRIBUTACAO = TB_TRIBUTACAO.COD_TRIBUTACAO) AND ');
    QProdutoCons.Sql.Add('      (TB_PRODUTO.COD_PRODUTO = E.COD_PRODUTO(+))');

    // Manutenção dos filtros originais do seu sistema
    if Trim(MENrClasse.Text) <> '' then
       QProdutoCons.Sql.Add(' And TB_CLASSE.NUM_CLASSE = ' + MeNrClasse.Text);
       
    if Trim(MENrSubClasse.Text) <> '' then
       QProdutoCons.Sql.Add(' And TB_CLASSE.NUM_SUBCLASSE = ' + MeNrSubClasse.Text);
       
    if Trim(MeCodigo.Text) <> '' then
       QProdutoCons.Sql.Add(' And TB_PRODUTO.COD_PRODUTO = ' + MeCodigo.Text);
       
    if Trim(CBUnidade.Text) <> '' then                                                
       QProdutoCons.Sql.Add(' And TB_PRODUTO.DESC_UNIDADE = ' + QuotedStr(CBUnidade.Text));
       
    if Trim(MeNumFabricante.Text) <> '' then
    begin
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZITO') Or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ') then
         QProdutoCons.Sql.Add(' And TB_PRODUTO.NUM_FABRICANTE LIKE ' + QuotedStr(MeNumFabricante.Text + '%'))
      else
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'KREUZ' THEN           
           QProdutoCons.Sql.Add(' And TB_PRODUTO.NUM_FABRICANTE LIKE ' + QuotedStr(MeNumFabricante.Text))
        else
           QProdutoCons.Sql.Add(' And TB_PRODUTO.NUM_FABRICANTE LIKE ' + QuotedStr('%' + MeNumFabricante.Text + '%'));
    end;
    
    case Cb1Situacao.ItemIndex of
      0: QProdutoCons.Sql.Add(' And TB_PRODUTO.IND_SITUACAO = ' + QuotedStr('ATIVO'));
      1: QProdutoCons.Sql.Add(' And TB_PRODUTO.IND_SITUACAO = ' + QuotedStr('DESATIVADO'));
      2: QProdutoCons.Sql.Add(' And TB_PRODUTO.IND_SITUACAO = ' + QuotedStr('FORA DE LINHA'));
    end;
    
    if Trim(METexto.Text) <> '' then
      if Copy(MeTexto.TExt, 1, 1) = ' ' then
        QProdutoCons.Sql.Add(' And UPPER(TB_PRODUTO.DESC_PRODUTO) LIKE ' + QuotedStr('%' + UpperCase(Trim(MeTexto.Text)) + '%'))
      else
        // IMPORTANTE: Mantido o UPPER padrão para compatibilidade de busca, mas a lentidão cairá pela remoção das outras subqueries
        QProdutoCons.Sql.Add(' And UPPER(TB_PRODUTO.DESC_PRODUTO) LIKE ' + QuotedStr(UpperCase(Trim(MeTexto.Text)) + '%'));

    if Trim(CBTipoProduto.Text) <> '' then
      QProdutoCons.Sql.Add(' And TB_PRODUTO.IND_TIPO_PRODUTO = ' + QuotedStr(CBTipoProduto.Text));

    if Trim(MeCodFabricante.Text) <> '' then
       QProdutoCons.Sql.Add(' And TB_PRODUTO.COD_CADASTRO = ' + Trim(MeCodFabricante.Text));

    if Trim(MeLocalizacao.Text) <> '' then
       QProdutoCons.Sql.Add(' And TB_PRODUTO.DESC_LOCALIZACAO LIKE ' + QuotedStr('%' + Trim(MeLocalizacao.Text) + '%'));

    if Trim(MeComplemento.Text) <> '' then
    begin
      if (DMParamSistema.CodEmpresa = 'CEIFAGRIL') or (DMParamSistema.CodEmpresa = 'SCALA') or
         (DMParamSistema.CodEmpresa = 'GERALPECAS') then  
        QProdutoCons.Sql.Add(' And TB_PRODUTO.DESC_OBSERVACAO LIKE ' + QuotedStr('%' + Trim(MeComplemento.Text) + '%'))
      else
        QProdutoCons.Sql.Add(' And TB_PRODUTO.DESC_COMPLEMENTO LIKE ' + QuotedStr('%' + Trim(MeComplemento.Text) + '%'));
    end;
    
    if Trim(MeNCM.Text) <> '' then
      QProdutoCons.SQL.Add(' AND TB_PRODUTO.NUM_GENERO_NCM LIKE ' + QuotedStr(Trim(MeNCM.Text) + '%'));
      
    if Trim(MeMarca.Text) <> '' then
      QProdutoCons.SQL.Add(' AND TB_PRODUTO.COD_MARCA = ' + Trim(MeMarca.Text));

    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE')  Or
       (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DISPART') Or
       (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ')   then
     begin
       if Trim(MeCodigoBarras.Text) <> '' then
          QProdutoCons.Sql.Add(' And TB_PRODUTO.DESC_OBSERVACAO LIKE ' + QuotedStr('%' + Trim(MeCodigoBarras.Text) + '%'));
     end
    else
     begin
       if Trim(MeCodigoBarras.Text) <> '' then
         QProdutoCons.Sql.Add(' And TB_PRODUTO.DESC_COD_BARRA LIKE ' + QuotedStr(Trim(MeCodigoBarras.Text) + '%'));
     end;

    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'DINIZ') then
      QProdutoCons.Sql.Add(' And ROWNUM <= 1000 ');

    // OTIMIZAÇÃO: Filtramos diretamente sobre a nossa tabela em memória "E" sem disparar novos SELECTs para cada registro
    case RGConsultaEstoque.ItemIndex of
      0: QProdutoCons.Sql.Add(' AND NVL(E.QT_TOTAL_ESTOQUE, 0) > 0 ');
      1: QProdutoCons.Sql.Add(' AND NVL(E.QT_TOTAL_ESTOQUE, 0) <= 0 ');
      2: QProdutoCons.Sql.Add(''); // Não filtra estoque
    end;

    case RgEnviaBalanca.ItemIndex of
      0: QProdutoCons.Sql.Add(' and tb_produto.ind_envia_balanca = ' + QuotedStr ('SIM'));
      1: QProdutoCons.Sql.Add(' and tb_produto.ind_envia_balanca = ' + QuotedStr ('NAO'));
    end;
    case CbOrdem.ItemIndex of
      0: QProdutoCons.Sql.Add(' Order by TB_PRODUTO.COD_PRODUTO');
      1: QProdutoCons.Sql.Add(' Order by TB_PRODUTO.DESC_PRODUTO');
      2: QProdutoCons.Sql.Add(' Order by TB_PRODUTO.COD_CLASSE');
      3: QProdutoCons.Sql.Add(' Order by TB_PRODUTO.DESC_LOCALIZACAO');
      4: QProdutoCons.Sql.Add(' Order by TB_PRODUTO.COD_MARCA');
      5: QProdutoCons.Sql.Add(' Order by TB_PRODUTO.COD_CADASTRO');
      6: QProdutoCons.Sql.Add(' Order by TB_PRODUTO.NUM_FABRICANTE');
    end;
    // Adicione esta linha caso o código original precise abrir a consulta logo em seguida:
    QProdutoCons.Open;
    QProdutoEstoque.Open;
  end;
end;

procedure TFProdutoCons.FormActivate(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  Tag := 0;
  Cb1Situacao.ItemIndex := 0;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RADIO' then
  begin
    DBGProdutoRelacionado.Visible := False;
    LblProdutoRelacionado.Visible := False;
  end;
  if RetornaConsulta = true then
  begin
    BtOk.Enabled := true;
    DBGrid1.OnDblClick := DBGrid1DblClick;
  end
  else
  begin
    BtOk.Enabled := false;
    DBGrid1.OnDblClick := Nil;
  end;
  If (DMParamSistema.CodEmpresa <> 'NIR')then
     DBGrid1.Columns.Items[3].Visible := DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'N';

  if (DMParamSistema.CodEmpresa = 'KREUZ')   or (DMParamSistema.CodEmpresa = 'DINGLIS')  or
     (DMParamSistema.CodEmpresa = 'OTICA')   or (DMParamSistema.CodEmpresa = 'GGIRARDI') or
     (DMParamSistema.CodEmpresa = 'ACOESTE') or (DMParamSistema.CodEmpresa = 'AGROVALE') or
     (DMParamSistema.CodEmpresa = 'BERLIZ')  then
  begin
      DBGrid2.Columns.Items[13].Visible := DMUsuario.Privilegiado;
      DBGrid2.Columns.Items[10].Visible := DMUsuario.Privilegiado;
      BtConsUltCompra.Visible := (DMUsuario.Privilegiado);
  end;
  if (DMParamSistema.CodEmpresa = 'QUERENCIA') or (DMParamSistema.CodEmpresa = 'AGROCAMPO') or (DMParamSistema.CodEmpresa = 'NUTRIR') then
  begin
    DBGrid2.Columns.Items[13].Visible := DMUsuario.Privilegiado;
    DBGrid2.Columns.Items[10].Visible := DMUsuario.Privilegiado;
    BtConsUltCompra.Visible := (DMUsuario.Privilegiado) or (DMUsuario.pTipoFuncionario = 'GERENTE');
  end;
  if (DMParamSistema.CodEmpresa = 'NUTRIPET')then
  begin
    if DMUsuario.Privilegiado = false then //Vanessa 19-03/2015
    begin
      DBGrid1.Columns.Items[9].Visible := false; //val atacado
      DBGrid1.Columns.Items[21].Visible := false; // margem
    end;

    DBGrid2.Columns.Items[10].Visible := DMUsuario.Privilegiado;
    DBGrid2.Columns.Items[15].Visible := False;
    BtConsUltCompra.Visible := (DMUsuario.Privilegiado) or (DMUsuario.pTipoFuncionario = 'GERENTE');
  end;
  if (DMParamSistema.CodEmpresa = 'CONCREFER') then
  begin
    DbGrid1.Columns.Items[10].Index := 3;
    MENumFabricante.SetFocus;
  end;
  if (DMParamSistema.CodEmpresa = 'NFCE-DOCES') then
    MeCodigoBarras.SetFocus;
  if (DMParamSistema.CodEmpresa = 'MAVENIDA') then
  begin
    FProdutoCons.WindowState := wsMaximized;
    MeCodigo.Clear;
    METexto.Clear;
    MeCodigoBarras.Clear;
  end;
  if (DMParamSistema.CodEmpresa = 'NFCE-DOGAO') then
  begin
    FProdutoCons.WindowState := wsMaximized;
    MeCodigo.Clear;
    METexto.Clear;
    MeCodigoBarras.Clear;
    CbOrdem.ItemIndex := 0;
    BtProcurarClick(Sender);
  end;
  if (DMParamSistema.CodEmpresa = 'SCALA') then
  begin
    FProdutoCons.WindowState := wsMaximized; 
    MENumFabricante.SetFocus;
  end;
  if (DMParamSistema.CodEmpresa = 'CEIFAGRIL') or (DMParamSistema.CodEmpresa = 'RENATOAUTO') or (DMParamSistema.CodEmpresa = 'JPFERRAGEM') then
  begin
    MENumFabricante.SetFocus;
  end;

  if (DMParamSistema.CodEmpresa = 'DIVINO') then
    imgProduto.Proportional := True;

  if (Trim(METexto.Text) <> '') and //Para não fazer a consulta Full no banco. Dependendo da qtde de produtos demora para carregar as informações. Junior - 22/11/2018
  ((DMParamSistema.CodEmpresa <> 'KREUZ')       and (DMParamSistema.CodEmpresa <> 'CONKRETA')  and (DMParamSistema.CodEmpresa <> 'NUTRIPET') and
   (DMParamSistema.CodEmpresa <> 'INSIDE')      and (DMParamSistema.CodEmpresa <> 'GRAZAPEL')  and (DMParamSistema.CodEmpresa <> 'BRASIL' )  and
   (DMParamSistema.CodEmpresa <> 'FURGOESMED')  and (DMParamSistema.CodEmpresa <> 'FERRAGENS') and (DMParamSistema.CodEmpresa <> 'RETIFOZ')  and
   (DMParamSistema.CodEmpresa <> 'VILCAR')      and (DMParamSistema.CodEmpresa <> 'NFCE-DOGAO') ) then
    BtProcurar.Click; //Clientes reclamavam que quando alteravam algo no produto e voltavam para a consulta, não tinha alterado. Vanessa 23/11/2018

  if (DMParamSistema.CodEmpresa = 'DINIZ') then
   BtConsUltCompra.Visible := (DMUsuario.Privilegiado) or (DMUsuario.pTipoFuncionario = 'VENDEDOR');

  if (DMParamSistema.CodEmpresa = 'FINESTRA') then
    FProdutoCons.MeCodigoBarras.SetFocus;
  if (DMParamSistema.CodEmpresa = 'BRINDES') then
  begin
    FProdutoCons.WindowState := wsMaximized;
    LblLocalizacao.Visible := false;
    Label2.Visible := false;
    LblOrdem.Visible := false;
    LblTipo.Visible := false;
    CBTipoProduto.Visible := false;
    CbOrdem.Visible := false;
    MeNCM.Visible := false;
    MeLocalizacao.Visible := false;
    Label4.Visible := false;
    LblFabricante.Visible := false;
    LblClasse.Visible := false;
    LblSubClasse.Visible := false;
    SBClasse.Visible := false;
    MEnrSubClasse.Visible := false;
    MENrClasse.Visible := false;
    BtFabricante.Visible := false;
    MeCodFabricante.Visible := false;
    CBUnidade.Visible := false;
  end;

end;

procedure TFProdutoCons.DSConsultaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Text <> 'ENCOPEL' then
  begin
    // DMEstoque.QEstoqueCons.Close;
    with DMEstoque do
    begin
      QEstoqueCons.Close;
      QEstoqueCons.SetVariable('Filial', Null);
      QEstoqueCons.SetVariable('Produto', Null);
      QEstoqueCons.SetVariable('Tipo_Lote', Null);
      QEstoqueCons.SetVariable('Cod_Produto', DMProduto.QProdutoConsCod_Produto.Value);
      QEstoqueCons.Open;
    end;
    with DMProduto do
    begin
      QImagem_Consulta.Close;
      QImagem_Consulta.SetVariable('COD_PRODUTO', DMProduto.QProdutoConsCOD_PRODUTO.Value);
      QImagem_Consulta.Open;
      AtualizarImagemProduto;
    end;
  end;
end;

procedure TFProdutoCons.FormCreate(Sender: TObject);
procedure addColumn(grid: TDBGrid; field, title: String; index: Integer = -1; width: Integer = 0);
var
  col: TColumn;
begin
  col := grid.Columns.Add;
  col.FieldName := field;
  col.Title.Caption := title;
  if index > -1 then
    col.Index := index;
  if width > 0 then
    col.Width := width;
end;
begin
  inherited;
  RetornaConsulta := true;
  if DSConsulta.DataSet = nil then
     DSConsulta.DataSet := DMProduto.QProdutoCons;


  // Aparecer a descrição dos preços conforme no Parâmetros do sistema no GRID de Consulta. Junior-15/05/2013
  DbGrid1.Columns.Items[9].Title.Caption := 'Preço ' + copy(DMParamSistema.QParamSistemaIND_PRECO.Value,1,1) +
                      LowerCase(copy(DMParamSistema.QParamSistemaIND_PRECO.Value,2, Length(DMParamSistema.QParamSistemaIND_PRECO.Value))); //atacado
  DbGrid1.Columns.Items[6].Title.Caption := 'Preço ' + copy(DMParamSistema.QParamSistemaIND_PRECO2.Value,1,1)+
                      LowerCase(copy(DMParamSistema.QParamSistemaIND_PRECO2.Value,2,Length(DMParamSistema.QParamSistemaIND_PRECO2.Value))); //varejo
  // ---------------------
  if (DMParamSistema.CodEmpresa = 'KREUZ') Or   //Kreuz estava aparecendo o NUM_CLASSE, e o Rubens quer o COD_CLASSE.
     (DMParamSistema.CodEmpresa = 'ARZ') or (DMParamSistema.CodEmpresa = 'CONKRETA')   then
   Begin
     DbGrid1.Columns.Items[8].FieldName := 'Cod_Classe';
     DMEstoque.QEstoqueConsQT_QUANTIDADE.DisplayFormat := '#,##0.00';
   End;

  if (DMParamSistema.CodEmpresa = 'BORGES')     or (DMParamSistema.CodEmpresa = 'CONTINTAS') or
     (DMParamSistema.CodEmpresa = 'BORGES2') then //Contitnas - Junior 26/05/2017
  begin
    DBGrid1.Columns.Items[2].Index := 1; // descricao //Junior 10/10/2014. Solic. Borges. Seq da consulta(cod_produto, desc_produto, preco_varejo).
    DBGrid1.Columns.Items[6].Index := 2; //preco
    DbGrid1.Columns.Items[13].Index := 6;
    DBGrid2.Columns.Items[10].Visible := False;
    DBGrid1.Columns[1].Width := 300;    //tamanho do desc_produto
  end;
  if (DMParamSistema.CodEmpresa = 'CASAFILTRO') or (DMParamSistema.CodEmpresa = 'PERTUTTI') or //Adicionado Pepita e Pertuti. Alex 27/03/2025
     (DMParamSistema.CodEmpresa = 'PEPITA')  then // Suporte (863) Junior 09/09/2020
  begin
    DBGrid1.Columns.Items[2].Index := 1; // descricao //Junior 10/10/2014. Solic. Borges. Seq da consulta(cod_produto, desc_produto, preco_varejo).
    DBGrid1.Columns.Items[6].Index := 2; //preco varejo
    DBGrid1.Columns.Items[9].Index := 3; //preco atacado
    DbGrid1.Columns.Items[13].Index := 6;
    DBGrid1.Columns[1].Width := 300;    //tamanho do desc_produto
  end;
  if (DMParamSistema.CodEmpresa = 'KREUZ') or (DMParamSistema.CodEmpresa = 'CONKRETA') then
  begin
    DbGrid1.Columns.Items[1].Index := 20;
    DbGrid1.Columns.Items[30].Index := 9;  //perc_comissao antes marca
  end;
  if (DMParamSistema.CodEmpresa = 'INSIDE') Then
  begin
    DbGrid1.Columns.Items[5].Index  := 3;
    DbGrid1.Columns.Items[11].Index := 4;
    DbGrid1.Columns.Items[7].Index  := 5;
    DbGrid1.Columns.Items[12].Index := 6;
    DbGrid1.Columns.Items[12].Index := 7;
    DbGrid1.Columns.Items[13].Index := 8;
    DbGrid1.Columns.Items[21].Index := 6;
    DbGrid1.Columns.Items[6].Visible := False;
    DBGrid2.Columns.Items[10].Visible := False;
//    DbGrid1.Columns.Items[21].Visible := DMUsuario.Privilegiado; //somente aparecer custo para usuario privilegiado -
//    DbGrid2.Columns.Items[11].Visible := DMUsuario.Privilegiado; //somente aparecer custo para usuario privilegiado -
    CbOrdem.ItemIndex := 1;
  end;
  if (DMParamSistema.CodEmpresa = 'NFCE-DOGAO') then
  begin
    DbGrid1.Columns.Items[0].Index := 0;
    DbGrid1.Columns.Items[2].Index := 1;
    DBGrid1.Columns[1].Width := 400;
    DbGrid1.Columns.Items[5].Index := 2;
    DbGrid1.Columns.Items[6].Index := 3;
  end;
  //NUTRIVET PEDIU PARA AUMENTAR O CAMPO DA DESCRIÇÃO DO PRODUTO. 13/06/2013 - JUNIOR.
  if (DMParamSistema.CodEmpresa = 'NUTRIVET') or (DMParamSistema.CodEmpresa = 'NUTRIPET') then
  begin
    DBGrid1.Columns[2].Width := 280;
    DbGrid1.Columns.Items[6].Index := 3;
  end;
  if (DMParamSistema.CodEmpresa = 'ENERMED') or (DMParamSistema.CodEmpresa = 'JASOL') then //Leucir. Junior 04/05/2020.
  begin
    DBGrid1.Columns[2].Width := 310;
    DbGrid1.Columns.Items[6].Index := 3;
  end;
  if DMParamSistema.CodEmpresa = 'BEGNINI' Then
  begin
    DbGrid1.Columns.Items[6].Index := 3;
    DbGrid1.Columns.Items[9].Index := 4;
  end;
  if (DMParamSistema.CodEmpresa = 'GGIRARDI') or (DMParamSistema.CodEmpresa = 'FURGOESMED') then
  begin
    DBGrid1.Columns[1].Width := 100;
    DBGrid1.Columns[2].Width := 280;
    DbGrid1.Columns.Items[6].Index := 3;
  end;

  if (DMParamSistema.CodEmpresa = 'INSIDE') Or (DMParamSistema.CodEmpresa = 'DINIZ') Then
     LblObservacao.Caption := 'Observação';

  if (DMParamSistema.CodEmpresa = 'RAELETRO') then
  begin
     DBGrid1.Columns.Items[1].Visible := False;
     DBGrid1.Columns.Items[6].Index := 3; //preco
     DBGrid1.Columns.Items[10].Index := 2; //marca
  end;
  //Solicitação Alice. Vanessa 29/05/2014.
  if (DMParamSistema.CodEmpresa = 'ARZ')Then
  begin
    DBGrid1.Columns[2].Width := 280;
    DBGrid1.Columns.items[3].Index := 30;  //DESC_BOQUETA PARA O FINAL DO GRID
    DbGrid1.Columns.Items[3].Index := 5;  //UNIDADE
    DbGrid1.Columns.Items[3].Index := 4;  //VAL_VAREJO
  end;
  if (DMParamSistema.CodEmpresa = 'ZITO') or (DMParamSistema.CodEmpresa = 'MODASUL') or
     (DMParamSistema.CodEmpresa = 'LEURIA') then
  begin
    DbGrid1.Columns.Items[10].Index := 3; //desc_cod_barra
    DbGrid1.Columns.Items[7].Index := 4; // val_varejo
    DbGrid1.Columns.Items[11].Index := 7;  //val_atacado
  end;
  if(DMParamSistema.CodEmpresa = 'FERRAGMED')  or (DMParamSistema.CodEmpresa = 'PILILICOS')  or
    (DMParamSistema.CodEmpresa = 'MAVENIDA')   or (DMParamSistema.CodEmpresa = 'FERRAGMED2') or
    (DMParamSistema.CodEmpresa = 'SMIMOVEIS')  or (DMParamSistema.CodEmpresa = 'AGROVALE')   or
    (DMParamSistema.CodEmpresa = 'AGROCAMPO')  or (DMParamSistema.CodEmpresa = 'KAISER')     or
    (DMParamSistema.CodEmpresa = 'EMBGARCIA')  or (DMParamSistema.CodEmpresa = 'EMBVAL')     or
    (DMParamSistema.CodEmpresa = 'EMBFOZ')     or (DMParamSistema.CodEmpresa = 'LUCILUCI')   or
    (DMParamSistema.CodEmpresa = 'NUTRIR')     or (DMParamSistema.CodEmpresa = 'DONNA')      or
    (DMParamSistema.CodEmpresa = 'BORRIFAR')   or (DMParamSistema.CodEmpresa = 'LRMARMORE')  or
    (DMParamSistema.CodEmpresa = 'CONSTRUMED') or (DMParamSistema.CodEmpresa = 'FRACTA')     then   //EMBFOZ adicionado por Andre 04-04-2023
  begin
//    DBGrid1.Columns.Items[1].Visible := False; //NUM_FABRICANTE
    DBGrid1.Columns.Items[1].Title.Caption := 'Cod. Barras';
    DBGrid1.Columns.Items[1].FieldName := 'DESC_COD_BARRA';
    DBGrid1.Columns.Items[3].Index := 20;      //DESC_COD_BARRAS PARA O FINAL
    DBGrid1.Columns.Items[8].Index := 6;       //PRECO ATACADO FICAR DO LADO DO PRECO VAREJO

    //solicitado por Dani da Ferragem para o Junior da Cemapa - 03-06-2020
    if DMUsuario.pTipoFuncionario <> 'DIRETOR' then
      DBGrid1.Columns.Items[10].Visible := DMUsuario.Privilegiado;
  end;
  if (DMParamSistema.CodEmpresa = 'QUERENCIA') then //Solicitado por Marcos da Querencia. 19/12/2025
  begin
    DBGrid1.Columns.Items[1].Title.Caption := 'Cod. Barras';
    DBGrid1.Columns.Items[1].FieldName := 'DESC_COD_BARRA';
    DBGrid1.Columns.Items[3].Index := 20;      //DESC_COD_BARRAS PARA O FINAL
    DBGrid1.Columns.Items[8].Visible := false;// Index := 6;       //PRECO ATACADO FICAR DO LADO DO PRECO VAREJO

    if DMUsuario.pTipoFuncionario <> 'DIRETOR' then
      DBGrid1.Columns.Items[10].Visible := DMUsuario.Privilegiado;
  end;

  if (DMParamSistema.CodEmpresa = 'DONABENTA') or (DMParamSistema.CodEmpresa = 'SOLDAR') or
      (DMParamSistema.CodEmpresa = 'MEUPET') then
  begin
    DbGrid1.Columns.Items[10].Index := 3; //desc_cod_barra
    DbGrid1.Columns.Items[7].Index := 4; // val_varejo
    DbGrid1.Columns.Items[8].Index := 6; // val_atacado
  end;
    //Não aparecer o valor de custo para usuários não privilegiados. Pedido: Marcos. Junior 18/03/2015
  if (DMParamSistema.CodEmpresa = 'RADIO') then
  begin
    DBGrid1.Columns.Items[1].Visible := False; //NUM_FABRICANTE
    DBGrid1.Columns.Items[3].Index := 20;      //DESC_COD_BARRAS PARA O FINAL
    DBGrid1.Columns.Items[8].Index := 6;       //PRECO ATACADO FICAR DO LADO DO PRECO VAREJO
    DBGrid2.Columns.Items[10].Visible := DMUsuario.Privilegiado;
  end;
  if (DMParamSistema.CodEmpresa = 'ITATIBA') then
  begin
    DBGrid1.Columns.Items[6].Index := 3; //preco
    DBGrid1.Columns.Items[4].Visible := False; //desc_cod_barras
    DBGrid2.Columns.Items[10].Visible := DMUsuario.Privilegiado;
  end;
  if (DMParamSistema.CodEmpresa = 'NFCE-LOCKS') or (DMParamSistema.CodEmpresa = 'LACARNES') or (DMParamSistema.CodEmpresa = 'CASAPEIXE')  or (DMParamSistema.CodEmpresa = 'NFCE-EMPOR') then
  begin
    DbGrid1.Columns.Items[3].FieldName := 'DESC_COD_BARRA';
    DBGrid1.Columns.Items[1].Visible := False; //NUM_FABRICANTE
  end;
  if (DMParamSistema.CodEmpresa = 'DONABENTA') or (DMParamSistema.CodEmpresa = 'MEUPET') or
     (DMParamSistema.CodEmpresa = 'PATELI') or (DMParamSistema.CodEmpresa = 'ACIME')  then
//Adicionado a Pateli por solicitação da Crislaine. 20/06/2022 - cod_suporte: 5141. Alex
  begin
    DbGrid1.Columns.Items[3].FieldName := 'DESC_COD_BARRA';
    DBGrid1.Columns.Items[3].Title.Caption := 'Cód. Barras';
//    DBGrid1.Columns.Items[1].Visible := False; //NUM_FABRICANTE
  end;
  if (DMParamSistema.CodEmpresa = 'MEDSYSTEM') or (DMParamSistema.CodEmpresa = 'JOFER') or (DMParamSistema.CodEmpresa = 'RRPECAS')
  or (DMParamSistema.CodEmpresa = 'RSMECANICA') then
  begin
    DbGrid1.Columns.Items[2].Index := 1;  //des_prod
    DbGrid1.Columns.Items[13].Index := 2; //comple
    DbGrid1.Columns.Items[7].Index := 3;  //val varej
  end;

  if (DMParamSistema.CodEmpresa = 'DINIZ') then
  begin
    DbGrid1.Columns.Items[12].Index := 0;  //LOCALIZAÇÃO
    DBGrid1.Columns.Items[2].Index := 1; //NUM_FABRICANTE
    DBGrid1.Columns.Items[3].Index := 2; // descricao
    DbGrid1.Columns.Items[11].Index := 3;  //MARCA
    DbGrid1.Columns.Items[8].Index := 4;  //PREÇO
    DbGrid1.Columns.Items[7].Index := 5;  //EMBALAGEM
    DbGrid1.Columns.Items[8].Index := 6;  //UNIDADE
  end;
  if (DMParamSistema.CodEmpresa = 'CEIFAGRIL') then // solicitado por Cristiano - 10/09/2021 - Alex. JR MULTIPECAS UTILIZA COD_EMPRESA CEIFAGRIL
  begin
    DbGrid1.Columns.Items[10].Index := 3;  //MARCA
    DbGrid1.Columns.Items[12].Index := 7;  //LOCALIZAÇÃO
  end;

  if (DMParamSistema.CodEmpresa = 'NEOALI') then
  begin
    LblNrFabricante.Caption := 'Cód. Obra';
    DBGrid1.Columns.Items[1].Title.Caption := 'Cód. Obra';
    DbGrid1.Columns.Items[6].Index := 3;  //PREÇO
  end;
   if (DMParamSistema.CodEmpresa = 'CONSTRUIR') or (DMParamSistema.CodEmpresa = 'PROPE') then //Junior 27/04/2023
  begin
    DBGrid1.Columns.Items[2].Index := 1; // descricao
    DBGrid1.Columns.Items[6].Index := 2; //preco
    DBGrid1.Columns.Items[21].Index := 3; //margem
    DBGrid1.Columns.Items[4].Visible := False;
    DBGrid1.Columns.Items[11].Index := 8; //marca
  end;
  if (DMParamSistema.CodEmpresa = 'FERRAGMED')  or (DMParamSistema.CodEmpresa = 'PATELI') or (DMParamSistema.CodEmpresa = 'DONABENTA') or (DMParamSistema.CodEmpresa = 'SOLDAR') or
     (DMParamSistema.CodEmpresa = 'FERRAGMED2') or (DMParamSistema.CodEmpresa = 'GGIRARDI') then
    DBGrid2.Columns.Items[10].Visible := DMUsuario.Privilegiado;

  if (DMParamSistema.CodEmpresa = 'NUTRIR') then
    DBGrid1.Columns.Items[4].Visible := false;

  if (DMParamSistema.CodEmpresa = 'GRAZAPEL') then //Contitnas - Junior 26/05/2017 - NETWORKING - Alex 14/04/2022
  begin
    DBGrid1.Columns.Items[2].Index := 1; // descricao //Junior 10/10/2014. Solic. Borges. Seq da consulta(cod_produto, desc_produto, preco_varejo).
    DBGrid1.Columns.Items[6].Index := 2; //preco
    DbGrid1.Columns.Items[13].Index := 6;
    DBGrid2.Columns.Items[10].Visible := False;
    DBGrid1.Columns[1].Width := 550;    //tamanho do desc_produto
  end;

  if (DMParamSistema.CodEmpresa = 'DISMAVEL') then
  begin
    DBGrid1.Columns.Items[1].Visible := False; //NUM_FABRICANTE
    DBGrid1.Columns.Items[18].Index := 1;
    DBGrid1.Columns.Items[2].Index := 2;
    DBGrid1.Columns.Items[7].Index := 4;
  end;
  if (DMParamSistema.CodEmpresa = 'NFCE-DOCES') then
  begin
    DbGrid1.Columns.Items[3].FieldName := 'DESC_COD_BARRA';
    DBGrid1.Columns.Items[1].Visible := False; //NUM_FABRICANTE
    DBGrid1.Columns.Items[9].Visible := False; //VAL_ATACADO
  end;
  if (DMParamSistema.CodEmpresa = 'SCALA') or (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
  begin
    DBGrid1.Columns.Items[5].Index := 3; //Unidade
    DBGrid1.Columns.Items[6].Index := 4; //Val Varejo
    DBGrid1.Columns.Items[10].Index := 5; //marca
    DBGrid1.Columns.Items[11].Index := 6; //Classe
    DBGrid1.Columns.Items[24].Index := 7; //Observação
    DBGrid1.Columns.Items[13].Index := 8; //Localização
    DBGrid1.Columns.Items[18].Index := 10;
    DBGrid1.Columns.Items[7].Width := 100;
    DbGrid1.Columns.Items[10].Index := 3; //desc_cod_barra
    DbGrid1.Columns.Items[7].Index := 4; // val_varejo
    DbGrid1.Columns.Items[8].Index := 6; // val_atacado
    DbGrid1.Columns.Items[3].Free;
    DBGrid2.Columns.Items[16].Index := 7; 
    if DMUsuario.Privilegiado = True then
    begin
      MeVal_Varejo.Visible := True;
      BtnAltValor.Visible := True;
    end;
    LblComplemento.Caption := 'Observação';
  end;
  if (DMParamSistema.CodEmpresa = 'JBATACADO') then
  begin
    DBGrid1.Columns.Items[5].Index := 3; //Unidade
    DBGrid1.Columns.Items[6].Index := 4; //Val Varejo
    DBGrid1.Columns.Items[10].Index := 5; //marca
  end;
  if (DMParamSistema.CodEmpresa = 'GERALPECAS') then
  begin
    LblComplemento.Caption := 'Observação';
  end;
end;

procedure TFProdutoCons.BtFabricanteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    MeCodFabricante.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFProdutoCons.METextoChange(Sender: TObject);
begin
  inherited;
  CbOrdem.ItemIndex := 1;
  If Length(METexto.Text) >= 3 Then
     BtProcurarClick(Self);

end;

procedure TFProdutoCons.MeComplementoChange(Sender: TObject);
begin
  inherited;
  If Trim(MeComplemento.Text) <> '' Then
     BtProcurarClick(Self);

end;

procedure TFProdutoCons.MeLocalizacaoChange(Sender: TObject);
begin
  inherited;
  If Trim(MeLocalizacao.Text) <> '' Then
     BtProcurarClick(Self);
end;

procedure TFProdutoCons.MENumFabricanteChange(Sender: TObject);
begin
  inherited;
  CbOrdem.ItemIndex := 6;
  //If Trim(MENumFabricante.Text) <> '' Then
  if Length(MENumFabricante.Text) >= 3 then // não demorar na consulta quando tem muitos produtos no BD. Junior 18/09/2020
    BtProcurarClick(Self);
end;

procedure TFProdutoCons.BtConsUltCompraClick(Sender: TObject);
begin
  inherited;
  with DMProduto do
    if not QProdutoConsCOD_PRODUTO.IsNull then
    begin
      QProdutoConsUltCompras.Close;
      QProdutoConsUltCompras.SetVariable('COD_PRODUTO', QProdutoConsCOD_PRODUTO.Value);
      QProdutoConsUltCompras.SetVariable('DT_INICIO', Date - DMParamSistema.QParamSistemaNum_dias_ult_compras.Value);
      QProdutoConsUltCompras.Open;
    end;
  If FProdutos_UltimasCompras = Nil Then
     FProdutos_UltimasCompras := TFProdutos_UltimasCompras.Create(Application);
  FProdutos_UltimasCompras.LbDiasUltimasCompras.Caption := 'Consulta referente aos últimos ' +
                          DMParamSistema.QParamSistemaNUM_DIAS_ULT_COMPRAS.Text + ' dias';
  FProdutos_UltimasCompras.ShowModal;
end;

procedure TFProdutoCons.BTConsultaEstoqueClick(Sender: TObject);
begin
  inherited;
  If FVendaPerdidaCad = Nil Then
     FVendaPerdidaCad := TFVendaPerdidaCad.Create(Application);
  FVendaPerdidaCad.ShowModal;
end;

procedure TFProdutoCons.MeCodigoChange(Sender: TObject);
begin
  inherited;
  If Trim(MeCodigo.Text) <> '' Then
     BtProcurarClick(Self);

end;

procedure TFProdutoCons.MENrClasseChange(Sender: TObject);
begin
  inherited;
  If Trim(MENrClasse.Text) <> '' Then
     BtProcurarClick(Self);

end;

procedure TFProdutoCons.MEnrSubClasseChange(Sender: TObject);
begin
  inherited;
  If Trim(MEnrSubClasse.Text) <> '' Then
     BtProcurarClick(Self);

end;

procedure TFProdutoCons.MeCodFabricanteChange(Sender: TObject);
begin
  inherited;
  If Trim(MeCodFabricante.Text) <> '' Then
     BtProcurarClick(Self);

end;

procedure TFProdutoCons.MeCodigoBarrasChange(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa <> 'FINESTRA') then
  begin
    If Length(MeCodigoBarras.Text) >= 4 Then
      BtProcurarClick(Self);
  end
  else
  begin
    If Length(MeCodigoBarras.Text) >= 2 Then
      BtProcurarClick(Self);
  end;

end;

procedure TFProdutoCons.FormDeactivate(Sender: TObject);
begin
  inherited;
  RetornaConsulta := true;
end;

procedure TFProdutoCons.SBClasseClick(Sender: TObject);
begin
  inherited;                    
  if FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = MrOk then
  begin
    with DMClasse do
    begin
      MENrClasse.Text := QClasseConsNUM_CLASSE.Text;
      MENrSubClasse.Text := QClasseConsNUM_SUBCLASSE.Text;
    end;
  end;
end;

procedure TFProdutoCons.AtualizarImagemProduto;
var
  b: TStream;
  Jpg: TJpegImage;
begin
  Jpg := nil;

  // transferindo a fotografia para o objeto TStream
  b := DMProduto.QImagem_Consulta.CreateBlobStream(DMProduto.QImagem_ConsultaIMG_IMAGEM, bmRead);

  // se o registro não possui fotografia então apagaremos a imagem
  // atual dentro do TImage, senão vai parecer que a fotografia seguinte
  // será igual a anterior
  if b.Size > 0 then
  begin
    // aqui ta o problema, como recuperar o jpeg do banco
    // perceba que a variavel 'Jpg' é do tipo TJpegImage que por sua vez é uma classe TGraphic
    // e que portanto poderá ser assinalada a propriedade Image1.Picure[.Graphic]
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      imgProduto.Picture.Assign(Jpg);
      imgProduto.visible := true;
    except
    end;
  end
  else
  begin
    // Essa seria a maneira natural de eliminar um desenho dentro do
    // TImage, pois se fizessemos um Image1.Picture.Graphic:=nil como
    // sugerem alguns exemplos na internet, provocariamos um 'access violation',
    // pois um nulo não pode ser tratado como bitmap ou jpeg.
    imgProduto.Picture.Assign(nil);
    imgProduto.Visible := false;
  end;

  lblImagemNaoCadastrada.Visible := not imgProduto.Visible; //se a imagem está visível esconde o label, se nao mostra o label

  // Vamos liberar um pouco de memória
  jpg.Free;
  b.Destroy;
end;


procedure TFProdutoCons.MeNCMChange(Sender: TObject);
begin
  inherited;
  If Trim(MeNCM.Text) <> '' Then
     BtProcurarClick(Self);
end;

procedure TFProdutoCons.HabilitaColunasPaf;
var
  i: Integer;
begin
  for i:= 0 to DBGrid1.Columns.Count-1 do
  begin
    DBGrid1.Columns[i].Visible := (DBGrid1.Columns[i].FieldName = 'DESC_COD_BARRA')
      or (DBGrid1.Columns[i].FieldName = 'DESC_PRODUTO')
      or (DBGrid1.Columns[i].FieldName = 'DESC_UNIDADE')
      or (DBGrid1.Columns[i].FieldName = 'VAL_VAREJO')
      or (DBGrid1.Columns[i].FieldName = 'NUM_GENERO_NCM')
      or (DBGrid1.Columns[i].FieldName = 'IND_ARREDONDAMENTO_TRUNCAMENTO')
      or (DBGrid1.Columns[i].FieldName = 'COD_TRIB_IMP_FISCAL')
      or (DBGrid1.Columns[i].FieldName = 'IND_PROD_PROPRIA_TERCEIRO');
  end;
  Label31.Enabled := false;
  label31.Visible := false;
  DBGrid2.Enabled := false;
  DBGrid2.Visible := false;
  BTConsultaEstoque.Enabled := false;
  BTConsultaEstoque.Visible := false;
  BtConsUltCompra.Enabled := false;
  BtConsUltCompra.Visible := false;
  BtConsUltVenda.Enabled := false;
  BtConsUltVenda.Visible := false;
end;

procedure TFProdutoCons.BtConsUltVendaClick(Sender: TObject);
var
  wValor_Total, wQtde_Total : Real;
begin
  inherited;
  with DMProduto do
    if not QProdutoConsCOD_PRODUTO.IsNull then
    begin
      QProdutoConsUltVendas.Close;
      QProdutoConsUltVendas.SetVariable('COD_PRODUTO', QProdutoConsCOD_PRODUTO.Value);
      QProdutoConsUltVendas.SetVariable('DT_INICIO', Date - DMParamSistema.QParamSistemaNUM_DIAS_ULT_VENDAS.Value);
      QProdutoConsUltVendas.Open;

      wValor_Total := 0;
      wQtde_Total := 0;
      DMProduto.QProdutoConsUltVendas.First;
      while Not DMProduto.QProdutoConsUltVendas.Eof Do
      begin
        wQtde_Total := wQtde_Total + DMProduto.QProdutoConsUltVendasQT_QUANTIDADE.Value;
        wValor_Total := wValor_Total + (DMProduto.QProdutoConsUltVendasVAL_UNITARIO.Value * DMProduto.QProdutoConsUltVendasQT_QUANTIDADE.Value);
        DMProduto.QProdutoConsUltVendas.next;
      end;
      QProdutoConsUltVendas.First;//para o cursor ficar na última venda. Junior 08/03/2018
    end;

  If FProdutos_UltimasVendas = Nil Then
     FProdutos_UltimasVendas := TFProdutos_UltimasVendas.Create(Application);
  FProdutos_UltimasVendas.LbDiasUltimasVendas.Caption := 'Consulta referente aos últimos ' +
                      DMParamSistema.QParamSistemaNUM_DIAS_ULT_VENDAS.Text + ' dias';
  FProdutos_UltimasVendas.LBValorTotal.Caption := FormatFloat('#,##0.00',wValor_Total);
  FProdutos_UltimasVendas.LBQtdeTodal.Caption := FormatFloat('#,##0.00',wQtde_Total);
  FProdutos_UltimasVendas.ShowModal;
end;

procedure TFProdutoCons.METextoExit(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ITATIBA') or (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VILCAR') then
  begin
    if DBGrid1.CanFocus then
      DBGrid1.SetFocus;
  end;
  Tag := 0; //desabilita a possibilidade de mudar o ModalResult por código.
end;

procedure TFProdutoCons.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFProdutoCons.MeCodigoBarrasExit(Sender: TObject);
 var
  wcodBarras, wCodProduto, wNumFabricante : String;
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'MEDIBENS' then
  begin
  if trim(MeCodigoBarras.Text) <> '' then
  begin
    wCodBarras := trim(MeCodigoBarras.Text);
    MeCodigoBarras.Clear;
    wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(wCodBarras));
    MeCodigoBarras.Clear;
    if wCodProduto = '' then
    begin
      MeCodigoBarras.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end
    else
    begin
      wNumFabricante := DMOracle.FastSelect('NUM_FABRICANTE', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
      if wNumFabricante = '' then
      begin
        MeCodigoBarras.SetFocus;
        raise Exception.Create('O produto ' + wCodProduto + ' está cadastrado, porém não possui o número do fabricante informado, verifique.');
      end
      else
      begin
        MENumFabricante.Text := wNumFabricante;
        MeCodigoBarras.Text := wcodBarras;
      end;
    end;
  end;
  end;
 // Tag := 0; //desabilita a possibilidade de mudar o ModalResult por código. //AO BIPAR COD_BARRAS FECHA A TELA DE CONSULTA. NÃO SEI QUEM PEDIU, ENTÃO COMENTEI PARA MANTER A TELA ABERTA (CONSULTA QT_ESTOQUE, CUSTO).JUNIOR 21/07/2021
end;

procedure TFProdutoCons.METextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  with DMProduto do
  begin
    if Key = vk_down then
      if QProdutoCons.Active and (QProdutoCons.RecordCount > 1) and
        (QProdutoCons.RecNo < QProdutoCons.RecordCount) then
        QProdutoCons.Next;
    if Key = vk_up then
      if QProdutoCons.Active and (QProdutoCons.RecordCount > 1) and
         (QProdutoCons.RecNo > 1) then
        QProdutoCons.Prior;
    if Key = vk_return then
      ModalResult := MrOk;
  end;
end;

procedure TFProdutoCons.METextoEnter(Sender: TObject);
begin
  inherited;
  Tag := 777; //Habilitar a possibilidade de mudar o ModalResult por código;
end;

procedure TFProdutoCons.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (DMProduto.QProdutoConsQT_ESTOQUE.Value <= 0) and
     ((DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'DONABENTA') or (DMParamSistema.CodEmpresa = 'SCALA') ) then
    DBGrid1.Canvas.Brush.Color := clRed;

  if ((DMParamSistema.CodEmpresa = 'KREUZ') or (DMParamSistema.CodEmpresa = 'CONKRETA')) then
  begin
    if (DMProduto.QProdutoConsPERC_COMISSAO.Value = 1.5) then
    begin
      DBGrid1.Canvas.Font.Color := clPurple;
      if gdSelected in State then
      begin
        DBGrid1.Canvas.Brush.Color := clPurple;
        DBGrid1.Canvas.Font.Color := clWhite;
      end;
    end;

    if (DMProduto.QProdutoConsPERC_COMISSAO.Value = 3) then
    begin
      DBGrid1.Canvas.Font.Color := clOlive;
      if gdSelected in State then
      begin
        DBGrid1.Canvas.Brush.Color := clOlive;
        DBGrid1.Canvas.Font.Color := clWhite;
      end;
    end;

    if (DMProduto.QProdutoConsPERC_COMISSAO.Value = 5) then
    begin
      DBGrid1.Canvas.Font.Color := clGreen;
      if gdSelected in State then
      begin
        DBGrid1.Canvas.Brush.Color := clGreen;
        DBGrid1.Canvas.Font.Color := clWhite;
      end;
    end;
  end;


  {
  if ((DMProduto.QProdutoConsPERC_COMISSAO.Value <> 0.25) and (DMProduto.QProdutoConsPERC_COMISSAO.Value <> null) AND
          (DMProduto.QProdutoConsPERC_COMISSAO.Value <> 0)) and
     ((DMParamSistema.CodEmpresa = 'KREUZ') or (DMParamSistema.CodEmpresa = 'CONKRETA')) then
  begin
    DBGrid1.Canvas.Font.Color := clGreen;
    if gdSelected in State then
      DBGrid1.Canvas.Brush.Color := clMoneyGreen;
  end;

  }

  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFProdutoCons.MeCodigoBarrasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;      //AO BIPAR COD_BARRAS FECHA A TELA DE CONSULTA. NÃO SEI QUEM PEDIU, ENTÃO COMENTEI PARA MANTER A TELA ABERTA (CONSULTA QT_ESTOQUE, CUSTO).
{  with DMProduto do                                  //JUNIOR 21/07/2021
  begin
    if Key = vk_down then
      if QProdutoCons.Active and (QProdutoCons.RecordCount > 1) and
        (QProdutoCons.RecNo < QProdutoCons.RecordCount) then
        QProdutoCons.Next;
    if Key = vk_up then
      if QProdutoCons.Active and (QProdutoCons.RecordCount > 1) and
         (QProdutoCons.RecNo > 1) then
        QProdutoCons.Prior;
    if Key = vk_return then
      ModalResult := MrOk;
  end;}
end;

procedure TFProdutoCons.MeCodigoBarrasEnter(Sender: TObject);
begin
  inherited; //AO BIPAR COD_BARRAS FECHA A TELA DE CONSULTA. NÃO SEI QUEM PEDIU, ENTÃO COMENTEI PARA MANTER A TELA ABERTA (CONSULTA QT_ESTOQUE, CUSTO).JUNIOR 21/07/2021
//  Tag := 777; //Habilitar a possibilidade de mudar o ModalResult por código;
end;

procedure TFProdutoCons.imgProdutoClick(Sender: TObject);
begin
  inherited;
  if FVisualizaAmplia = nil then
    FVisualizaAmplia := TFVisualizaAmplia.Create(Self);

  FVisualizaAmplia.ShowModal;
end;

procedure TFProdutoCons.DBEdit1Click(Sender: TObject);
begin
  inherited;
  if FObservacao_Cons = nil then
     FObservacao_Cons := TFObservacao_Cons.Create(Application);
  FObservacao_Cons.ShowModal;

end;

procedure TFProdutoCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DmProduto.QProdutoEstoque.Close;
end;

procedure TFProdutoCons.CBUnidadeChange(Sender: TObject);
begin
  inherited;
  CBUnidade.Text := AnsiUpperCase(CBUnidade.Text);
end;

procedure TFProdutoCons.BtMarcaClick(Sender: TObject);
begin
  inherited;
  if FMarca_Cons = nil then
    FMarca_Cons := TFMarca_Cons.Create(Application);
  if FMarca_Cons.ShowModal = mrOk then
    MeMarca.Text := DMMarca.QMarcaConsCOD_MARCA.Text; //DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFProdutoCons.BtnAltValorClick(Sender: TObject);
var
  wCodProduto: String;
begin
  inherited;
  try  //SCALA AUTO PEÇAS. De tanto encherem o saco precisei criar essa opção. Junior 08/05/2026.
    with DMProduto do
    begin
      wCodProduto := QProdutoConsCOD_PRODUTO.Text;
      
      if MessageDlg('ATENÇÃO: Você está prestes a alterar o valor do produto ' + QProdutoConsCOD_PRODUTO.Text + ' - '
                                     + QProdutoConsDESC_PRODUTO.Text + Chr(10) + 'Tem Certeza?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DMOracle.QExecSQL.close;
        DMOracle.QExecSQL.SQL;
        DMOracle.QExecSQL.sql.Clear;
        DMOracle.QExecSQL.sql.Add('UPDATE TB_PRODUTO SET VAL_VAREJO = ' +
               StringReplace(FloatToStr(StrToFloat(MeVal_Varejo.Text)), ',', '.', [rfReplaceAll]) +
               ' , DT_ALTERACAO_PRECO = TRUNC(SYSDATE) WHERE COD_PRODUTO = ' + QProdutoConsCOD_PRODUTO.Text);
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
        MeVal_Varejo.Clear;
        BtProcurarClick(Sender);
        QProdutoCons.Locate('COD_PRODUTO', wCodProduto, []);
        DBGrid1.SetFocus;
      end
      else
        MeVal_Varejo.Clear;
    end;
  except
    DMOracle.DBCemapa.Rollback;
    MeVal_Varejo.Clear;
    raise Exception.Create('Não foi possível atualizar o valor');
  end;
end;

end.
