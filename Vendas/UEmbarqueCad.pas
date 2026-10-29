unit UEmbarqueCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, clipbrd, variants, ActnList, DBDirceu,
  DBPanel, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, OracleNavigator;

type
  TFEmbarqueCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Carga1: TMenuItem;
    Acerto1: TMenuItem;
    EmbarqueNotaFiscal1: TMenuItem;
    EmbarquesCondioPagto1: TMenuItem;
    RotadeEntrega1: TMenuItem;
    SubstituioTributaria1: TMenuItem;
    Opes1: TMenuItem;
    EmissoNotas1: TMenuItem;
    LBParcela: TListBox;
    ConsultaEmbarquePelaNota1: TMenuItem;
    ExcluiProdutodoPedidodeUmEmbarque1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    RelaodeCargas1: TMenuItem;
    BaixaEstoquePeloEmbarque1: TMenuItem;
    DataSource2: TDataSource;
    RelaoTotalPorPedidos1: TMenuItem;
    VoltaEstoquepeloEmbarque1: TMenuItem;
    RelaoBaixadoporData1: TMenuItem;
    RelProdutosEmbarcados1: TMenuItem;
    EmbarqueNotaFiscaltxt1: TMenuItem;
    EmbarqueporCliente1: TMenuItem;
    PosioEstoqueEmbarque1: TMenuItem;
    BloquearEmbarque1: TMenuItem;
    DesbloquearPedido1: TMenuItem;
    TabSheet3: TTabSheet;
    Label16: TLabel;
    DBEdit17: TDBEdit;
    Label17: TLabel;
    DBEdit18: TDBEdit;
    Label20: TLabel;
    DBEdit21: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    N2: TMenuItem;
    GeraContasaPagar1: TMenuItem;
    ExcluiContasaPagar1: TMenuItem;
    Label22: TLabel;
    DBEdit16: TDBEdit;
    Label15: TLabel;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    Label21: TLabel;
    DBEdit25: TDBEdit;
    Label24: TLabel;
    DBEdit26: TDBEdit;
    Label25: TLabel;
    LBPercentual: TLabel;
    Label26: TLabel;
    DBRadioGroup3: TDBRadioGroup;
    N3: TMenuItem;
    RelFretes1: TMenuItem;
    Label27: TLabel;
    DBEdit27: TDBEdit;
    Label28: TLabel;
    DBEdit28: TDBEdit;
    Label29: TLabel;
    DBEdit29: TDBEdit;
    EtiqCodBarraProduoEmbarque1: TMenuItem;
    N4: TMenuItem;
    SituaoAcerto1: TMenuItem;
    N5: TMenuItem;
    BaixaEstoque1: TMenuItem;
    N6: TMenuItem;
    GeraContasPagarAdiantamento1: TMenuItem;
    VoltaAdiantamentoContasPagar1: TMenuItem;
    Label31: TLabel;
    DBEdit31: TDBEdit;
    ControleAcertoCargas1: TMenuItem;
    DBEdit20: TDBEdit;
    Label19: TLabel;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    Label18: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    DBEdit19: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit32: TDBEdit;
    SbReciboAdto: TSpeedButton;
    DBEdit33: TDBEdit;
    N7: TMenuItem;
    VoltaEtiquetaEmbarque1: TMenuItem;
    PedidoEmbarcado1: TMenuItem;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPOs: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel9: TDBPanel;
    DBPanel5: TDBPanel;
    DBPPedido: TDBPanel;
    DBPQtPes: TDBPanel;
    DBPQtVidros: TDBPanel;
    DBPSequencia: TDBPanel;
    DBPanel14: TDBPanel;
    DBRadioGroup4: TDBRadioGroup;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBPanel8: TDBPanel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    RelaoCargaProduto1: TMenuItem;
    BtPlaca: TBitBtn;
    EtiqCdBarrasEmbarque1: TMenuItem;
    N8: TMenuItem;
    RelatriodeProduo1: TMenuItem;
    TabSheet4: TTabSheet;
    DBPanel10: TDBPanel;
    DSCaixaEmbarque: TDataSource;
    DBPanel11: TDBPanel;
    DBPanel12: TDBPanel;
    DBGrid2: TDBGrid;
    DBPanel13: TDBPanel;
    OracleNavigator1: TOracleNavigator;
    FecharEmbarqueMxima1: TMenuItem;
    procedure SBConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Carga1Click(Sender: TObject);
    procedure Acerto1Click(Sender: TObject);
    procedure EmbarqueNotaFiscal1Click(Sender: TObject);
    procedure EmbarquesCondioPagto1Click(Sender: TObject);
    procedure RotadeEntrega1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SBHelpClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SubstituioTributaria1Click(Sender: TObject);
    procedure EmissoNotas1Click(Sender: TObject);
    procedure ConsultaEmbarquePelaNota1Click(Sender: TObject);
    procedure ExcluiProdutodoPedidodeUmEmbarque1Click(Sender: TObject);
    procedure RelaodeCargas1Click(Sender: TObject);
    procedure BaixaEstoquePeloEmbarque1Click(Sender: TObject);
    procedure RelaoTotalPorPedidos1Click(Sender: TObject);
    procedure VoltaEstoquepeloEmbarque1Click(Sender: TObject);
    procedure RelaoBaixadoporData1Click(Sender: TObject);
    procedure RelProdutosEmbarcados1Click(Sender: TObject);
    procedure EmbarqueNotaFiscaltxt1Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure EmbarqueporCliente1Click(Sender: TObject);
    procedure PosioEstoqueEmbarque1Click(Sender: TObject);
    procedure BloquearEmbarque1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DesbloquearPedido1Click(Sender: TObject);
    procedure GeraContasaPagar1Click(Sender: TObject);
    procedure ExcluiContasaPagar1Click(Sender: TObject);
    procedure SbReciboAdtoClick(Sender: TObject);
    procedure DBEdit25Exit(Sender: TObject);
    procedure DBEdit19Exit(Sender: TObject);
    procedure DBEdit20Exit(Sender: TObject);
    procedure DBEdit22Change(Sender: TObject);
    procedure RelFretes1Click(Sender: TObject);
    procedure EtiqCodBarraProduoEmbarque1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SituaoAcerto1Click(Sender: TObject);
    procedure BaixaEstoque1Click(Sender: TObject);
    procedure GeraContasPagarAdiantamento1Click(Sender: TObject);
    procedure VoltaAdiantamentoContasPagar1Click(Sender: TObject);
    procedure DBEdit30Exit(Sender: TObject);
    procedure ControleAcertoCargas1Click(Sender: TObject);
    procedure VoltaEtiquetaEmbarque1Click(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure PedidoEmbarcado1Click(Sender: TObject);
    procedure DBPanel1CodigoChange(Sender: TObject);
    procedure DBPOsCodigoChange(Sender: TObject);
    procedure DBPOsExit(Sender: TObject);
    procedure DBPanel9CodigoExit(Sender: TObject);
    procedure DBPanel9DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPPedidoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPPedidoValidate(Sender: TObject; Value: Variant;
      var isValid: Boolean; var Msg: string);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    function DBPSequenciaRenderizar(Sender: TObject): Boolean;
    function DBPQtPesRenderizar(Sender: TObject): Boolean;
    function DBPQtVidrosRenderizar(Sender: TObject): Boolean;
    procedure RelaoCargaProduto1Click(Sender: TObject);
    procedure BtPlacaClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure EtiqCdBarrasEmbarque1Click(Sender: TObject);
    procedure RelatriodeProduo1Click(Sender: TObject);
    procedure DBPanel10DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel11DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBAlterarClick(Sender: TObject);
    procedure FecharEmbarqueMxima1Click(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure ExcluiMovimentos(wCodigo: Integer);
    procedure GeraContasPagar(wValor: Real; wTipo: string; wFinalidade, wNumero: Integer);
    procedure InsereNf(wFilial, wCadastro, wOperacao, wVendedor, wNr_Dias_Cheque, wNr_Dias_Cheque1, wNr_Dias_Cheque2, wNr_Dias_Cheque3, wNr_Dias_Cheque4,
      wTransportador, wCodMensagem, wDepartamento, wNum_Pedido, wCod_Prazo: Integer;
      wPerc_Comissao_Nota, wVal_Desconto: Real;
      wTipo_Pagamento, wTipo_Frete, wComplemento_Obs, wObservacao, wConsumidorFinal: string);
    procedure InsereItensNf(wProduto, wTributacao, wCod_Lote_Tipo, wCod_Cultura, wCod_Cfop: Integer;
      wQuant, wUnitario, wPerc_Desconto_Item, wPerc_Comissao_Itens, wPerc_Sub: Real;
      wPerc_Desconto1, wPerc_Desconto2, wPerc_Acrescimo, wInfAdicional: string);
    procedure Emite_Recibo_Frete(wValor: Real; wComplemento: string);
    procedure Emite_Conhecimento_Frete(wVal_Frete, wVal_Icms, wVal_Ajuda, wVal_Pedagio, wAdiantamento: Real; wComplemento: string);

  public
    { Public declarations }

  end;

var
  FEmbarqueCad: TFEmbarqueCad;
  wTbValor: array[1..50] of Real;
  wTbProduto: array[1..50] of Integer;
  wtbComissao: array[1..50] of Real;
  wTbCodPedido_Item: array[1..50] of Integer;
  wInd_Tb: Integer; // serve para controlar o indice das tabelas acima


implementation

uses UEmbarque_cl, UOracle_cl, UCadastroCons, UCadastro_cl, UTela_cl,
  UEmbarqueCons, UPedidoCons, UPedido_cl, UEmbarqueParam, URPedido_Produto,
  UREmbarque, UREmbarque2, UREmbarque3, UREmbarque_Acerto, UREmbarquePedNf,
  UREmbarque1, UREmbarquePagto, UrEmbarquePedNf1, UREmbarque_Rota,
  UParamSistema_cl, UREmbarqueImposto, UNotaSaida_cl, USerie_cl,
  uNotaImpressao, UPrazoVencimento_cl, UBiblioteca, UEmbarqueNota,
  UUsuario_cl, UREmbarqueCarga, UEstoque_cl, UrEmbarquePedido,
  UREmbarqueBaixado, URProdutoEmbarcado, UBaixaEstoqueEmbarque,
  UREmbarqueCliente, URPosicaoEstoqueEmbarque, UContasPagar_cl,
  UConhecimento_CP, UContasReceber_cl, UEmiteRecibo, UFilial_cl, URRecibo,
  URReciboFrete, URFretes, UREtiqCodBarra_Producao, USituacaoAcerto,
  UBaixaEstoqueLeitor, UREtiqCodBarra_Embarque, USequencia_cl,
  URControleAcertoCargas, UVoltaEtiquetaEmbarque, URPACad, Urembarques2,
  UNfeImpressao, UTipoNota, UREmbarqueTemperatura, URPedidoEmbarcado,
  UFmCadastro, UBaixaEstoqueLeitor2, UREmbarqueProducao, UREmbarqueRES,
  UREmbarquePrazoVcto, uREmbarqueProduto, UVeiculoCons, UVeiculo_cl,
  UBibVenda, UBaixaEstoqueLeitorGeral, URPromissorias, UPromissoria,
  URContasReceber_Duplicatas, URContasReceber_Duplicatas_MEDIBENS,
  UContasReceberParam, URContasReceber_Duplicatas_CGS, URRelacaoProducao,
  Math, URRelacaoProducaoQtdePedido, UPagamentosNFe4, UHistoricoCons,
  UDepartamentoCons, USenha, UREmbarquePesoPorCidade;

{$R *.DFM}

procedure TFEmbarqueCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFEmbarqueCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMEmbarque do
  begin
    QEmbarque.Open;
    QEmbarqueItem.Open;
    QCalculaValorCarga.Open;
    QCaixaEmbarque.Open;
  end;
  DMTela.VerificaTela('VENDA', FEmbarqueCad.Caption, FEmbarqueCad.Name);
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MARTICAR' then
  begin
    DBPanel2.LCaption := 'Data Entrada';
    DBPanel3.LCaption := 'Nome Cliente';
    DBPanel9.Visible := False;
    DBRadioGroup1.Visible := False;
    DBRadioGroup4.Visible := False;
    DBPanel7.Visible := False;
    DBPanel4.Visible := False;
  end;
end;

procedure TFEmbarqueCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FEmbarqueCons = nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  if FEmbarqueCons.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QEmbarque.Close;
      QEmbarque.SetVariable('PK', QEmbarqueConsCod_Embarque.Value);
      QEmbarque.Open;
    end;
end;

procedure TFEmbarqueCad.Carga1Click(Sender: TObject);
var
wObs : string;
begin
  inherited;
  If FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.MEEmbarque.Text := DMEmbarque.QEmbarqueCOD_EMBARQUE.Text;
  FEmbarqueParam.PGRelatorio.Pages[0].TabVisible := True;
  FEmbarqueParam.GroupBox10.Visible := False;
  if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
  begin
    FEmbarqueParam.ME0Vendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
    FEmbarqueParam.ME0Vendedor.Enabled := False;
    FEmbarqueParam.Bt0ConsVendedor.Enabled := False;
  end;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FEmbarqueParam.MeFilial.Text), 'VENDA');
      QREmbarque.Close;
      QREmbarque2.Close;
      QREmbarqueTemperatura.Close;
      QRQtdeEntregas.Close;
      QREmbarquePesoCidade.Close;
      if Trim(FEmbarqueParam.MEEmbarque.Text) = '' then
      begin
        QREmbarque.SetVariable('EMBARQUE', Null);
        QREmbarque2.SetVariable('EMBARQUE', Null);
        QREmbarqueTemperatura.SetVariable('EMBARQUE', Null);
        //----------Junior -------
        QRQtdeEntregas.SetVariable('EMBARQUE', Null);
        QREmbarqueRes.SetVariable('EMBARQUE', Null);
        QREmbarquePrazVcto.SetVariable('EMBARQUE', Null);
        QREmbarquePesoCidade.SetVariable('EMBARQUE', Null);
      end
      else
      begin
        QREmbarque.SetVariable('EMBARQUE', FEmbarqueParam.MEEmbarque.Text);
        QREmbarque2.SetVariable('EMBARQUE', FEmbarqueParam.MEEmbarque.Text);
        QREmbarqueTemperatura.SetVariable('EMBARQUE', FEmbarqueParam.MEEmbarque.Text);
        //---------Junior------------
        QRQtdeEntregas.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text); //Serve para Pegar a Quantidade de entregas(agrupado por Cliente). Junior 16/09
        QREmbarqueRes.SetVariable('EMBARQUE', FEmbarqueParam.MEEmbarque.Text);
        QREmbarquePrazVcto.SetVariable('EMBARQUE', FEmbarqueParam.MEEmbarque.Text);
        QREmbarquePesoCidade.SetVariable('EMBARQUE',FEmbarqueParam.MEEmbarque.Text);
      end;
      case FEmbarqueParam.Rg0Operacao.ItemIndex of
        0:
          begin
            QREmbarque.SetVariable('IND_LIVRO_FISCAL', 'S');
            QREmbarque2.SetVariable('IND_LIVRO_FISCAL', 'S');
            QREmbarqueTemperatura.SetVariable('IND_LIVRO_FISCAL', 'S');
          end;
        1:
          begin
            QREmbarque.SetVariable('IND_LIVRO_FISCAL', 'N');
            QREmbarque2.SetVariable('IND_LIVRO_FISCAL', 'N');
            QREmbarqueTemperatura.SetVariable('IND_LIVRO_FISCAL', 'N');
          end;
        2:
          begin
            QREmbarque.SetVariable('IND_LIVRO_FISCAL', Null);
            QREmbarque2.SetVariable('IND_LIVRO_FISCAL', Null);
            QREmbarqueTemperatura.SetVariable('IND_LIVRO_FISCAL', Null);
          end;
      end;
      case FEmbarqueParam.Rg0Pintura.ItemIndex of
        0:
          begin
            QREmbarque.SetVariable('IND_PINTURA', 'SIM');
            QREmbarque2.SetVariable('IND_PINTURA', 'SIM');
            QREmbarqueTemperatura.SetVariable('IND_PINTURA', 'SIM');
          end;
        1:
          begin
            QREmbarque.SetVariable('IND_PINTURA', Null);
            QREmbarque2.SetVariable('IND_PINTURA', Null);
            QREmbarqueTemperatura.SetVariable('IND_PINTURA', Null);
          end;
      end;
      case FEmbarqueParam.Rg0Estofaria.ItemIndex of
        0:
          begin
            QREmbarque.SetVariable('IND_ESTOFARIA', 'SIM');
            QREmbarque2.SetVariable('IND_ESTOFARIA', 'SIM');
            QREmbarqueTemperatura.SetVariable('IND_ESTOFARIA', 'SIM');
          end;
        1:
          begin
            QREmbarque.SetVariable('IND_ESTOFARIA', Null);
            QREmbarque2.SetVariable('IND_ESTOFARIA', Null);
            QREmbarqueTemperatura.SetVariable('IND_ESTOFARIA', Null);
          end;
      end;
      QREmbarque.SQL.Strings[QREmbarque.SQL.Count - 1] := '';
      case FEmbarqueParam.RG0Ordem.ItemIndex of
        0:
        begin
          QREmbarque.SQL.Add('ORDER BY Tb_Embarque_Item.Num_Sequencial, TB_PEDIDO_CAB.COD_PEDIDO_CAB, TB_PRODUTO.COD_PRODUTO');
          QREmbarqueRes.SetVariable('ORDEM','COD_EMBARQUE');
        end;
        1:
        begin
          QREmbarque.SQL.Add('ORDER BY DESC_CIDADE, COD_PEDIDO_CAB');
          QREmbarqueRes.SetVariable('ORDEM','DESC_CIDADE');
        end;
        2:
        begin
          QREmbarque.SQL.Add('ORDER BY NOME, COD_PEDIDO_CAB');
          QREmbarqueRes.SetVariable('ORDEM','NOME');
        end;
        3:
        begin
          QREmbarque.SQL.Add('ORDER BY COD_PEDIDO_CAB');
          QREmbarqueRes.SetVariable('ORDEM','NUM_PEDIDO_NOTA');
        end;
        4: //ordenar pela descricao do produto
        begin
          QREmbarque.SQL.Add('ORDER BY COD_PEDIDO_CAB, DESC_PRODUTO, DESC_CIDADE');
          QREmbarqueRes.SetVariable('ORDEM','COD_EMBARQUE'); //Passei cod_embarque porque não é necessário ordenação no relatório resumido. Vanessa 04/04/2019
        end;
      end;
      if Trim(FEmbarqueParam.ME0Operacao1.Text) = '' then
      begin
        QREmbarque.SetVariable('COD_OPERACAO1', Null);
        QREmbarque2.SetVariable('COD_OPERACAO1', Null);
        QREmbarqueTemperatura.SetVariable('COD_OPERACAO1', Null);
      end
      else
      begin
        QREmbarque.SetVariable('COD_OPERACAO1', FEmbarqueParam.ME0Operacao1.Text);
        QREmbarque2.SetVariable('COD_OPERACAO1', FEmbarqueParam.ME0Operacao1.Text);
        QREmbarqueTemperatura.SetVariable('COD_OPERACAO1', FEmbarqueParam.ME0Operacao1.Text);
      end;
      if Trim(FEmbarqueParam.ME0Operacao2.Text) = '' then
      begin
        QREmbarque.SetVariable('COD_OPERACAO2', Null);
        QREmbarque2.SetVariable('COD_OPERACAO2', Null);
        QREmbarqueTemperatura.SetVariable('COD_OPERACAO2', Null);
      end
      else
      begin
        QREmbarque.SetVariable('COD_OPERACAO2', FEmbarqueParam.ME0Operacao2.Text);
        QREmbarque2.SetVariable('COD_OPERACAO2', FEmbarqueParam.ME0Operacao2.Text);
        QREmbarqueTemperatura.SetVariable('COD_OPERACAO2', FEmbarqueParam.ME0Operacao2.Text);
      end;
      if Trim(FEmbarqueParam.ME0Operacao3.Text) = '' then
      begin
        QREmbarque.SetVariable('COD_OPERACAO3', Null);
        QREmbarque2.SetVariable('COD_OPERACAO3', Null);
        QREmbarqueTemperatura.SetVariable('COD_OPERACAO3', Null);
      end
      else
      begin
        QREmbarque.SetVariable('COD_OPERACAO3', FEmbarqueParam.ME0Operacao3.Text);
        QREmbarque2.SetVariable('COD_OPERACAO3', FEmbarqueParam.ME0Operacao3.Text);
        QREmbarqueTemperatura.SetVariable('COD_OPERACAO3', FEmbarqueParam.ME0Operacao3.Text);
      end;
      if Trim(FEmbarqueParam.ME0Operacao4.Text) = '' then
      begin
        QREmbarque.SetVariable('COD_OPERACAO4', Null);
        QREmbarque2.SetVariable('COD_OPERACAO4', Null);
        QREmbarqueTemperatura.SetVariable('COD_OPERACAO4', Null);
      end
      else
      begin
        QREmbarque.SetVariable('COD_OPERACAO4', FEmbarqueParam.ME0Operacao4.Text);
        QREmbarque2.SetVariable('COD_OPERACAO4', FEmbarqueParam.ME0Operacao4.Text);
        QREmbarqueTemperatura.SetVariable('COD_OPERACAO4', FEmbarqueParam.ME0Operacao4.Text);
      end;

      if Trim(FEmbarqueParam.ME0Classe.Text) = '' then //alterado Marcos 09/11/06 só aparece o parametro p/ CGS
      begin
        QREmbarque2.SetVariable('CLASSE', Null);
        QREmbarqueTemperatura.SetVariable('CLASSE', Null);
      end
      else
      begin
        QREmbarque2.SetVariable('CLASSE', FEmbarqueParam.ME0Classe.Text);
        QREmbarqueTemperatura.SetVariable('CLASSE', FEmbarqueParam.ME0Classe.Text);
      end;

      if Trim(FEmbarqueParam.ME0Operacao1.Text) + Trim(FEmbarqueParam.ME0Operacao2.Text) + Trim(FEmbarqueParam.ME0Operacao3.Text) + Trim(FEmbarqueParam.ME0Operacao4.Text) = '' then
      begin
        QREmbarque.SetVariable('COD_OPERACAO_NULLO', Null);
        QREmbarque2.SetVariable('COD_OPERACAO_NULLO', Null);
        QREmbarqueTemperatura.SetVariable('COD_OPERACAO_NULLO', Null);
      end
      else
      begin
        QREmbarque.SetVariable('COD_OPERACAO_NULLO', '');
        QREmbarque2.SetVariable('COD_OPERACAO_NULLO', '');
        QREmbarqueTemperatura.SetVariable('COD_OPERACAO_NULLO', '');
      end;

      QREmbarque2.SQL[QREmbarque2.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
        QREmbarque2.SQL.ADD(' DESC_UNIDADE, DESC_CLASSE, COD_PRODUTO, DESC_LOTE')
      else if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS') then
        QREmbarque2.SQL.ADD(' DESC_PRODUTO')
      else if (DMParamSistema.CodEmpresa = 'POLLYANA') then //Pollyana pediu ordenção por codigo do produto - Junior 17/05/2019
        QREmbarque2.SQL.ADD(' COD_PRODUTO')
      else
        QREmbarque2.SQL.ADD(' DESC_CLASSE, DESC_UNIDADE, DESC_PRODUTO, DESC_LOTE');
{
      Trecho comentado por Gian 10/10/2017, foi criado Radio Group para ordenar.

      QREmbarque.SQL[QREmbarque.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' then
        QREmbarque.SQL.ADD(' TB_CADASTRO.NOME')
      else
         if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MARTICAR' then
           QREmbarque.SQL.ADD(' Tb_Pedido_Item.COD_PEDIDO_ITEM')
         Else
           QREmbarque.SQL.ADD(' Tb_Embarque_Item.Num_Sequencial, TB_PEDIDO_CAB.COD_PEDIDO_CAB, TB_PRODUTO.COD_PRODUTO');
}
      QREmbarque.Open;
      QREmbarque2.Open;
      QREmbarqueTemperatura.Open;
      //------Junior---
      QRQtdeEntregas.Open;
      QREmbarqueRes.Open;
      QREmbarquePrazVcto.Open;
      QREmbarquePesoCidade.Open;
       //--------------

      If DmParamSistema.QParamSistemaCod_Empresa.Value = 'MARTICAR' then
      begin
        //if FREmbarqueProducao = nil then
          FREmbarqueProducao := TFREmbarqueProducao.Create(Application);
        FREmbarqueProducao.QRLTitulo.Caption := 'Relação Pedido Confirmado Nr. ' + FEmbarqueParam.MEEmbarque.text;
        if FEmbarqueParam.RGPreview.ItemIndex = 0 then
          FREmbarqueProducao.QRPrimario.Preview
        else
          FREmbarqueProducao.QRPrimario.Print;
      end
      else
      begin
        //------
        //if FREmbarqueRes = nil then
          FREmbarqueRes := TFREmbarqueRes.Create(Application);
        //if FREmbarquePrazoVcto = nil then
          FREmbarquePrazoVcto := TFREmbarquePrazoVcto.Create(Application);
          //
          FREmbarquePesoPorCidade := TFREmbarquePesoPorCidade.Create(Application);
         //------
        //if FREmbarque = nil then
          FREmbarque := TFREmbarque.Create(Application);
        //if FREmbarque2 = nil then
          FREmbarque2 := TFREmbarque2.Create(Application);

        //if FREmbarqueTemperatura = nil then
          FREmbarqueTemperatura := TFREmbarqueTemperatura.Create(Application);
        if DmParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' then
          FREmbarque.QRGroup1.ForceNewPage := True;
        if (DmParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') then
        begin
          FREmbarque.QRLabel18.Font.Color := clWindowText;
          FREmbarque.QRExpr1.Font.Color := clWindowText;
          FREmbarque2.QRLabel14.Font.Color := ClWhite;
          FREmbarque2.QRDbText12.Font.Color := ClWhite;
          FREmbarque2.QRExpr7.Font.Color := ClWhite;
          FREmbarque2.QRExpr4.Font.Color := ClWhite;
        end;
        if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZAPOLI') then
        begin
          FREmbarque.QRLabel18.Font.Color := clWindowText;
          FREmbarque.QRExpr1.Font.Color := clWindowText;
          //FREmbarque2.QRLabel14.Font.Color := ClWhite;
          //FREmbarque2.QRDbText12.Font.Color := ClWhite;   A pedido do Junior da Zapoli Rafael 01/07/2014
          //FREmbarque2.QRExpr7.Font.Color := ClWhite;
          //FREmbarque2.QRExpr4.Font.Color := ClWhite;
        end;

        if FEmbarqueParam.CB0ProdutoEmbarque.Checked = False then
        begin
          FREmbarque.QRBand3.Enabled       := False;
          FREmbarque.QRBRodPedido.Enabled  := False;
          FREmbarque.QRLProduto.Enabled    := False;
          FREmbarque.QRLQuantidade.Enabled := False;
        end
        else
        begin
          FREmbarque.QRBand3.Enabled       := true;
          FREmbarque.QRBRodPedido.Enabled  := True;
          FREmbarque.QRLProduto.Enabled    := true;
          FREmbarque.QRLQuantidade.Enabled := true;
        end;
        if FEmbarqueParam.CB0ValorTotal.Checked = False then
        begin
          FREmbarque.QRDBTValUn.Enabled       := False;
          FREmbarque.QRDBText21.Enabled       := False;
          //FREmbarque.QRLSubstituicao.Enabled  := False;
          FREmbarque.QRLabel18.Enabled        := False;
          //FREmbarque.QRLabel6.Enabled         := False;
          //FREmbarque.QRSubstituicao.Enabled   := False;
          FREmbarque.QRExpr1.Enabled          := False;
          //FREmbarque.QRExpr3.Enabled          := False;
          FREmbarque.QRCodTributacao.Enabled  := False;
          FREmbarque.QRLabel23.Enabled        := False;

          FREmbarque2.QRDBText11.Enabled      := False;
          FREmbarque2.QRExpr8.Enabled         := False;
          FREmbarque2.QRExpr16.Enabled        := False;
          FREmbarque2.QRLabel12.Enabled       := False;
        end
        else
        begin
          FREmbarque.QRDBTValUn.Enabled       := True;
          FREmbarque.QRDBText21.Enabled       := True;
          //FREmbarque.QRLSubstituicao.Enabled  := True;
          FREmbarque.QRLabel18.Enabled        := True;
          //FREmbarque.QRLabel6.Enabled         := True;
          //FREmbarque.QRSubstituicao.Enabled   := True;
          FREmbarque.QRExpr1.Enabled          := True;
          //FREmbarque.QRExpr3.Enabled          := True;
          FREmbarque.QRCodTributacao.Enabled  := True;
          FREmbarque.QRLabel23.Enabled        := True; 
          FREmbarque2.QRLabel12.Enabled       := True;
        end;

        FREmbarque.CodigoBarra := FEmbarqueParam.CB0CodigoBarra.Checked;
        if DMParamSistema.CodEmpresa = 'DEION' then //Adicionar Obs no Título do relat. como é feito no FREmbarque2. Solicitado Douglas. Junior/Cleber - 07/05/2019
        begin
         wObs := DMOracle.FastSelect('DESC_OBS','TB_EMBARQUE','COD_EMBARQUE =' + Trim(FEmbarqueParam.MEEmbarque.text));
         FREmbarque.QRLTitulo.Caption  := 'Relacao Para Carga Caminhao Nr. '+FEmbarqueParam.MEEmbarque.text + ' Rota '+ wObs;
        end
        else
          FREmbarque.QRLTitulo.Caption := 'Relacao Para Carga Caminhao Nr. ' + FEmbarqueParam.MEEmbarque.text;
        FREmbarque.QRLEmpresa.Caption := 'Empresa:' + FEmbarqueParam.EdFilial.Text;
        FREmbarque2.QRLEmpresa.Caption := 'Empresa:' + FEmbarqueParam.EdFilial.Text;
        FREmbarqueTemperatura.QRLEmpresa.Caption := 'Empresa:' + FEmbarqueParam.EdFilial.Text;
        //Esta linha de baixo traz a quantidade de entregas(Na Query está agrupado por cod_cadastro, pois pode haver
        //mais de 1 pedido para o mesmo cliente, mas a quantidade de entrega é somente 1 por cliente).
        FREmbarqueRes.QRLEmpresa.Caption := 'Empresa:' + FEmbarqueParam.EdFilial.Text;
        FREmbarqueRes.QRLTitulo.Caption  := 'Relacao de Carga Embarque: ' + Trim(FEmbarqueParam.MEEmbarque.Text);
        FREmbarqueRes.QrlQtdeEntrega.Caption := 'Total de Entregas: ' + IntToStr(DMEmbarque.QRQtdeEntregas.recordCount);

        if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        begin
          if FEmbarqueParam.RG0TipoEmbarque.ItemIndex = 0 then
            FREmbarqueRes.QRCompositeReport1.Preview
          else
          FREmbarque.QRCompositeReport1.Preview
        end
        else
          if FEmbarqueParam.RGPreview.ItemIndex = 1 then
            FREmbarqueRes.QRCompositeReport1.Print
          else
          FREmbarque.QRCompositeReport1.Print;
      end;
      if ((DMParamSistema.CodEmpresa = 'DEION') and (FEmbarqueParam.CB0RomCego.Checked = true)) then
      Begin //Bruno Deion pediu para ordenar por desc_prodto. Vanessa 20/03/2019
         FREmbarque2.QRBRodPedido.Enabled := False;
         FREmbarque2.QRGroup1.Enabled := False;
         FREmbarque2.QRBand5.Enabled := False;
         FREmbarque2.QRLabel11.Enabled := False;
         FREmbarque2.QRLabel12.Enabled := False;
         FREmbarque2.QRLabel6.Enabled := False;
         FREmbarque2.QRLabel14.Enabled := False;
         FREmbarque2.QRLabel33.Enabled := False;
         FREmbarque2.QRLabel24.Enabled := False;
         FREmbarque2.QRDBText6.Enabled := False;
         FREmbarque2.QRDBText15.Enabled := False;
         FREmbarque2.QRDBText5.Enabled := False;
         FREmbarque2.QRDBText11.Enabled := False;
         FREmbarque2.QRDBText12.Enabled := False;
         FREmbarque2.QRDBText14.Enabled := False;
         FREmbarque2.QRBand3.Frame.DrawBottom := True;
         wObs := DMOracle.FastSelect('DESC_OBS','TB_EMBARQUE','COD_EMBARQUE =' + Trim(FEmbarqueParam.MEEmbarque.text));
         FREmbarque2.QRLTitulo.Caption := 'Relacao Para Carga Caminhao Nr. '+FEmbarqueParam.MEEmbarque.text + ' Rota '+ wObs;

         FREmbarque2.QRPrimario.Preview;
      end;
      QREmbarque.Close;
      QREmbarque2.Close;
      QREmbarqueTemperatura.Close;
      //-----------
      QRQtdeEntregas.Close;
      QREmbarqueRes.Close;
      QREmbarquePrazVcto.Close;
      QREmbarquePesoCidade.Close;

      FEmbarqueParam.GroupBox10.Visible := True;
    end;
end;

procedure TFEmbarqueCad.Acerto1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.MEEmbarque.Text := DMEmbarque.QEmbarqueCOD_EMBARQUE.Text;
  FEmbarqueParam.PGRelatorio.Pages[0].TabVisible := True;
  if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
  begin
    FEmbarqueParam.ME0Vendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
    FEmbarqueParam.ME0Vendedor.Enabled := False;
    FEmbarqueParam.Bt0ConsVendedor.Enabled := False;
  end;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FEmbarqueParam.MeFilial.Text), 'VENDA');
      QEmbarque.Close;
      QREmbarque3.Close;
      QRNFs.Close;
      QSomaNF.Close;
      QSomaNF2.Close;
      QSomaImposto.Close;
      if Trim(FEmbarqueParam.MEEmbarque.Text) = '' then
      begin
        QEmbarque.SetVariable('PK', Null);
        QREmbarque3.SetVariable('EMBARQUE', Null);
        QSomaNF.SetVariable('EMBARQUE', Null);
      end
      else
      begin
        QEmbarque.SetVariable('PK', FEmbarqueParam.MEEmbarque.Text);
        QREmbarque3.SetVariable('EMBARQUE', FEmbarqueParam.MEEmbarque.Text);
        QRNFs.SetVariable('EMBARQUE', FEmbarqueParam.MEEmbarque.Text);
        QSomaNF.SetVariable('EMBARQUE', FEmbarqueParam.MEEmbarque.Text);
        QSomaNF2.SetVariable('EMBARQUE', FEmbarqueParam.MEEmbarque.Text);
        QSomaImposto.SetVariable('COD_EMBARQUE', FEmbarqueParam.MEEmbarque.Text);
      end;
      case FEmbarqueParam.Rg0Operacao.ItemIndex of
        0:
          begin
            QREmbarque3.SetVariable('IND_LIVRO_FISCAL', 'S');
            QSomaNF.SetVariable('IND_LIVRO_FISCAL', 'S');
            QSomaNF2.SetVariable('IND_LIVRO_FISCAL', 'S');
            QRNFs.SetVariable('IND_LIVRO_FISCAL', 'S');
            QSomaImposto.SetVariable('IND_LIVRO_FISCAL', 'S');
          end;
        1:
          begin
            QREmbarque3.SetVariable('IND_LIVRO_FISCAL', 'N');
            QSomaNF.SetVariable('IND_LIVRO_FISCAL', 'N');
            QSomaNF2.SetVariable('IND_LIVRO_FISCAL', 'N');
            QRNFs.SetVariable('IND_LIVRO_FISCAL', 'N');
            QSomaImposto.SetVariable('IND_LIVRO_FISCAL', 'N');
          end;
        2:
          begin
            QREmbarque3.SetVariable('IND_LIVRO_FISCAL', Null);
            QSomaNF.SetVariable('IND_LIVRO_FISCAL', Null);
            QSomaNF2.SetVariable('IND_LIVRO_FISCAL', Null);
            QRNFs.SetVariable('IND_LIVRO_FISCAL', Null);
            QSomaImposto.SetVariable('IND_LIVRO_FISCAL', Null);
          end;
      end;
      QEmbarque.Open;
      QREmbarque3.Open;
      QSomaNF.Open;
      QSomaImposto.Open;
      QSomaNF2.Open;
      QRNFs.Open;
      if FREmbarque_Acerto = nil then
        FREmbarque_Acerto := TFREmbarque_Acerto.Create(Application);
      FREmbarque_Acerto.QRLNota.Caption := '';
      while not QRNFs.Eof do
      begin
        FREmbarque_Acerto.QRLNota.Caption := FREmbarque_Acerto.QRLNota.Caption
          + QRNFsNum_Nota.Text + ' ';
        QRNFs.Next;
      end;

      if FREmbarque3 = nil then
        FREmbarque3 := TFREmbarque3.Create(Application);
      FREmbarque_Acerto.QRLTitulo.Caption := 'Controle de Cargas ' + FEmbarqueParam.MEEmbarque.text;
      FREmbarque_Acerto.QRLNumero.Caption := FEmbarqueParam.MEEmbarque.text;
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FREmbarque_Acerto.QRCompositeReport1.Preview
      else
        FREmbarque_Acerto.QRCompositeReport1.Print;
    end;
end;

procedure TFEmbarqueCad.EmbarqueNotaFiscal1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.MEEmbarque.Text := DMEmbarque.QEmbarqueCOD_EMBARQUE.Text;
  if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
  begin
    FEmbarqueParam.ME0Vendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
    FEmbarqueParam.ME0Vendedor.Enabled := False;
    FEmbarqueParam.Bt0ConsVendedor.Enabled := False;
  end;
  FEmbarqueParam.PGRelatorio.Pages[0].TabVisible := True;
  FEmbarqueParam.Rg0Pintura.Visible := False;
  FEmbarqueParam.Rg0Estofaria.Visible := False;
  FEmbarqueParam.Me0Operacao1.Visible := False;
  FEmbarqueParam.Me0Operacao2.Visible := False;
  FEmbarqueParam.Me0Operacao3.Visible := False;
  FEmbarqueParam.Me0Operacao4.Visible := False;
  FEmbarqueParam.Label26.Visible := False;
  FEmbarqueParam.Label27.Visible := False;
  FEmbarqueParam.Label28.Visible := False;
  FEmbarqueParam.Label29.Visible := False;
  FEmbarqueParam.BitBtn15.Visible := False;
  FEmbarqueParam.BitBtn16.Visible := False;
  FEmbarqueParam.BitBtn17.Visible := False;
  FEmbarqueParam.BitBtn18.Visible := False;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FEmbarqueParam.MeFilial.Text), 'VENDA');
      QREmbarque_Ped_Nf.Close;
      if Trim(FEmbarqueParam.MEEmbarque.Text) = '' then
        QREmbarque_Ped_Nf.SetVariable('EMBARQUE', Null)
      else
        QREmbarque_Ped_Nf.SetVariable('EMBARQUE', Trim(FEmbarqueParam.MEEmbarque.Text));
      if Trim(FEmbarqueParam.MEFilial.Text) = '' then
        QREmbarque_Ped_Nf.SetVariable('COD_FILIAL', Null)
      else
        QREmbarque_Ped_Nf.SetVariable('COD_FILIAL', Trim(FEmbarqueParam.MEFilial.Text));
      if Trim(FEmbarqueParam.ME0Vendedor.Text) = '' then
        QREmbarque_Ped_Nf.SetVariable('COD_VENDEDOR', Null)
      else
        QREmbarque_Ped_Nf.SetVariable('COD_VENDEDOR', Trim(FEmbarqueParam.ME0Vendedor.Text));
      case FEmbarqueParam.Rg0Operacao.ItemIndex of
        0: QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL', 'S');
        1: QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL', 'N');
        2: QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL', Null);
      end;
      QREmbarque_Ped_Nf.SetVariable('DT_INICIAL', Trim(FEmbarqueParam.ME0DtInicial.Text));
      QREmbarque_Ped_Nf.SetVariable('DT_FINAL', Trim(FEmbarqueParam.ME0DtFinal.Text));
      QREmbarque_Ped_Nf.Open;
      if FrEmbarque_Ped_Nf = nil then
        FrEmbarque_Ped_Nf := TFrEmbarque_Ped_Nf.Create(Application);
      FREmbarque_Ped_Nf.QRLTitulo.Caption := 'Relacao Notas Para Embarque Nr. ' + FEmbarqueParam.MEEmbarque.text;
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FREmbarque_Ped_Nf.QRPrimario.Preview
      else
        FREmbarque_Ped_Nf.QRPrimario.Print;
      QREmbarque_Ped_Nf.Close;
    end;
  FEmbarqueParam.Rg0Pintura.Visible := True;
  FEmbarqueParam.Rg0Estofaria.Visible := True;
  FEmbarqueParam.Me0Operacao1.Visible := True;
  FEmbarqueParam.Me0Operacao2.Visible := True;
  FEmbarqueParam.Me0Operacao3.Visible := True;
  FEmbarqueParam.Me0Operacao4.Visible := True;
  FEmbarqueParam.Label26.Visible := True;
  FEmbarqueParam.Label27.Visible := True;
  FEmbarqueParam.Label28.Visible := True;
  FEmbarqueParam.Label29.Visible := True;
  FEmbarqueParam.BitBtn15.Visible := True;
  FEmbarqueParam.BitBtn16.Visible := True;
  FEmbarqueParam.BitBtn17.Visible := True;
  FEmbarqueParam.BitBtn18.Visible := True;
end;

procedure TFEmbarqueCad.EmbarquesCondioPagto1Click(Sender: TObject);
var
  wTipoPagto: string;
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[1].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QRAcertoCondPagto.Close;
      QRAcertoCondPagto.Sql.Clear;
      if FEmbarqueParam.Rg1Tipo.ItemIndex = 0 then
      begin
        QRAcertoCondPagto.Sql.Add('SELECT Tb_nota_cab.COD_CADASTRO,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_NOTA_CAB,Tb_embarque.COD_EMBARQUE,TB_EMBARQUE.NUM_EMBARQUE,');
        QRAcertoCondPagto.Sql.Add('Tb_embarque.NOME_MOTORISTA,Tb_embarque.DT_EMBARQUE,Tb_Cadastro.Nome,SUM(Tb_nota_item.VAL_TOTAL - Tb_nota_item.Val_Desconto) AS SVAL_TOTAL,');
        QRAcertoCondPagto.Sql.Add('SUM(Tb_nota_item.QT_QUANTIDADE) AS SQT_QUANTIDADE FROM TB_BAIXA_PEDIDO,TB_PEDIDO_CAB,TB_PEDIDO_ITEM,TB_EMBARQUE,');
        QRAcertoCondPagto.Sql.Add('TB_EMBARQUE_ITEM,TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO WHERE (Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB)');
        QRAcertoCondPagto.Sql.Add(' AND (Tb_baixa_pedido.COD_NOTA_ITEM = Tb_nota_item.COD_NOTA_ITEM) AND (Tb_pedido_item.COD_PEDIDO_ITEM = Tb_baixa_pedido.COD_PEDIDO_ITEM) ');
        QRAcertoCondPagto.Sql.Add(' AND (Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB) AND (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE) ');
        QRAcertoCondPagto.Sql.Add(' AND (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB) AND (Tb_nota_Cab.COD_CADASTRO = Tb_CADASTRO.COD_CADASTRO) ');
        QRAcertoCondPagto.Sql.Add(' AND (TB_NOTA_CAB.IND_SITUACAO = ' + chr(39) + '2' + chr(39) + ')');
        QRAcertoCondPagto.Sql.Add(' AND (TB_EMBARQUE.COD_EMBARQUE = ' + Trim(FEmbarqueParam.ME1Embarque.Text) + ')');
        case FEmbarqueParam.RGTipoPagto.ItemIndex of
          0:
            begin
              QRAcertoCondPagto.Sql.Add(' AND (TB_NOTA_CAB.IND_CONDICAO_PAGTO = ' + chr(39) + '1' + chr(39) + ')');
              wTipoPagto := ' A Vista';
            end;
          1:
            begin
              QRAcertoCondPagto.Sql.Add(' AND (TB_NOTA_CAB.IND_CONDICAO_PAGTO = ' + chr(39) + '2' + chr(39) + ')');
              wTipoPagto := ' A Prazo';
            end;
          2:
            begin
              QRAcertoCondPagto.Sql.Add(' AND (TB_NOTA_CAB.IND_CONDICAO_PAGTO = ' + chr(39) + '3' + chr(39) + ')');
              wTipoPagto := ' Com Cheque';
            end;
        end;
        QRAcertoCondPagto.Sql.Add(' GROUP BY Tb_nota_cab.COD_CADASTRO,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_NOTA_CAB,Tb_embarque.COD_EMBARQUE,TB_EMBARQUE.NUM_EMBARQUE,');
        QRAcertoCondPagto.Sql.Add(' Tb_embarque.DT_EMBARQUE,Tb_embarque.NOME_MOTORISTA,Tb_cadastro.NOME ORDER BY Tb_nota_cab.NUM_NOTA');
      end
      else
      begin
        QRAcertoCondPagto.Sql.Add('SELECT Tb_pedido_cab.COD_CADASTRO,Tb_pedido_cab.num_pedido as NUM_NOTA,Tb_pedido_cab.cod_pedido_cab as COD_NOTA_CAB,Tb_embarque.COD_EMBARQUE,TB_EMBARQUE.NUM_EMBARQUE,');
        QRAcertoCondPagto.Sql.Add('Tb_embarque.NOME_MOTORISTA,Tb_embarque.DT_EMBARQUE,Tb_Cadastro.Nome,SUM((Tb_pedido_item.VAL_UNITARIO - Tb_pedido_item.Val_Desconto) * Tb_Pedido_Item.Qt_Pedido) AS SVAL_TOTAL,');
        QRAcertoCondPagto.Sql.Add('SUM(Tb_pedido_item.QT_PEDIDO) AS SQT_QUANTIDADE FROM TB_PEDIDO_CAB,TB_PEDIDO_ITEM,TB_EMBARQUE,');
        QRAcertoCondPagto.Sql.Add('TB_EMBARQUE_ITEM,TB_CADASTRO WHERE (Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB)');
        QRAcertoCondPagto.Sql.Add(' AND (Tb_embarque.COD_EMBARQUE = Tb_embarque_item.COD_EMBARQUE) ');
        QRAcertoCondPagto.Sql.Add(' AND (Tb_embarque_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB) AND (Tb_pedido_Cab.COD_CADASTRO = Tb_CADASTRO.COD_CADASTRO) ');
        QRAcertoCondPagto.Sql.Add(' AND (TB_EMBARQUE.COD_EMBARQUE = ' + Trim(FEmbarqueParam.ME1Embarque.Text) + ')');
        case FEmbarqueParam.RGTipoPagto.ItemIndex of
          0:
            begin
              QRAcertoCondPagto.Sql.Add(' AND (Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + chr(39) + 'A VISTA' + chr(39) + ')');
              wTipoPagto := ' A Vista';
            end;
          1:
            begin
              QRAcertoCondPagto.Sql.Add(' AND (Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + chr(39) + 'A PRAZO' + chr(39) + ')');
              wTipoPagto := ' A Prazo';
            end;
          2:
            begin
              QRAcertoCondPagto.Sql.Add(' AND (Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + chr(39) + 'OUTROS' + chr(39) + ')');
              wTipoPagto := ' Com Cheque';
            end;
        end;
        QRAcertoCondPagto.Sql.Add(' GROUP BY Tb_pedido_cab.COD_CADASTRO,Tb_pedido_cab.NUM_PEDIDO,Tb_pedido_cab.cod_pedido_cab,Tb_embarque.COD_EMBARQUE,TB_EMBARQUE.NUM_EMBARQUE,');
        QRAcertoCondPagto.Sql.Add(' Tb_embarque.DT_EMBARQUE,Tb_embarque.NOME_MOTORISTA,Tb_cadastro.NOME ORDER BY Tb_pedido_cab.NUM_PEDIDO');
      end;
      QRAcertoCondPagto.Open;
      if FrEmbarquePagto = nil then
        FrEmbarquePagto := TFrEmbarquePagto.Create(Application);
      FrEmbarquePagto.QRLTitulo.Caption := 'Relacao Cargas Por Condicao Pagto ' + wTipoPagto;
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FrEmbarquePagto.QRPrimario.Preview
      else
        FrEmbarquePagto.QRPrimario.Print;
      QRAcertoCondPagto.Close;
    end;

end;

procedure TFEmbarqueCad.RotadeEntrega1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[2].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QREmbarque_Rota.Close;
      if Trim(FEmbarqueParam.ME2Embarque1.Text) <> '' then
        QREmbarque_Rota.SetVariable('COD_EMBARQUE1', FEmbarqueParam.ME2Embarque1.Text);

      if Trim(FEmbarqueParam.ME2Embarque2.Text) <> '' then
        QREmbarque_Rota.SetVariable('COD_EMBARQUE2', FEmbarqueParam.ME2Embarque2.Text);

      if Trim(FEmbarqueParam.ME2Embarque3.Text) <> '' then
        QREmbarque_Rota.SetVariable('COD_EMBARQUE3', FEmbarqueParam.ME2Embarque3.Text);

      if Trim(FEmbarqueParam.ME2Embarque4.Text) <> '' then
        QREmbarque_Rota.SetVariable('COD_EMBARQUE4', FEmbarqueParam.ME2Embarque4.Text);
      if FrEmbarque_Rota = nil then
        FrEmbarque_Rota := TFrEmbarque_Rota.Create(Application);
      FrEmbarque_Rota.QRDBText5.Font.Color := clWindowText;
      FrEmbarque_Rota.QRLabel7.Font.Color := clWindowText;
      FrEmbarque_Rota.SummaryBand1.Enabled := True;
      case FEmbarqueParam.Rg2Operacao.ItemIndex of
        0:
          begin
            QREmbarque_Rota.SetVariable('IND_LIVRO_FISCAL', 'S');
            FrEmbarque_Rota.QRDBText5.Font.Color := ClWhite;
            FrEmbarque_Rota.QRLabel7.Font.Color := ClWhite;
            FrEmbarque_Rota.SummaryBand1.Enabled := False;
            if DMParamSistema.QParamSistemaCod_Empresa.Text = 'FAVILLE' then
            begin
              FrEmbarque_Rota.QRDBText6.enabled := false;
              FrEmbarque_Rota.QRLabel10.enabled := false;
            end;
          end;
        1: QREmbarque_Rota.SetVariable('IND_LIVRO_FISCAL', 'N');
        2: QREmbarque_Rota.SetVariable('IND_LIVRO_FISCAL', Null);
      end;
      QREmbarque_Rota.Open;
      FrEmbarque_Rota.QRLTitulo.Caption := 'Relatório de Entrega Rota(s) Nr ' + FEmbarqueParam.ME2Embarque1.Text + ' - ' + FEmbarqueParam.ME2Embarque2.Text + ' - ' + FEmbarqueParam.ME2Embarque3.Text + ' - ' + FEmbarqueParam.ME2Embarque4.Text;
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FrEmbarque_Rota.QRPrimario.Preview
      else
        FrEmbarque_Rota.QRPrimario.Print;
      FrEmbarque_Rota.QRDBText6.enabled := true;
      FrEmbarque_Rota.QRLabel10.enabled := true;
      QREmbarque_Rota.Close;
    end;
end;

procedure TFEmbarqueCad.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'ZADIMEL') and
    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'FAVILLE') then
  begin
    if Key = Chr(43) then
    begin
      DbNavigator1.BtnClick(TNavigateBtn(NbInsert));
      DBPPedido.SetFocus;
    end;
    if Key = Chr(45) then
    begin
      DbNavigator1.BtnClick(TNavigateBtn(NbDelete));
      DBPPedido.SetFocus;
    end;
  end;
end;

procedure TFEmbarqueCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(10);
end;

procedure TFEmbarqueCad.SBExcluirClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFEmbarqueCad.SubstituioTributaria1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[3].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FEmbarqueParam.ME2Filial.Text), 'VENDA');
      QREmbarqueImposto.Close;
      if Trim(FEmbarqueParam.ME2Embarque.Text) <> '' then
        QREmbarqueImposto.SetVariable('COD_EMBARQUE', Trim(FEmbarqueParam.ME2Embarque.Text))
      else
        QREmbarqueImposto.SetVariable('COD_EMBARQUE', null);
      if Trim(FEmbarqueParam.ME2Filial.Text) = '' then
        QREmbarqueImposto.SetVariable('COD_FILIAL', Null)
      else
        QREmbarqueImposto.SetVariable('COD_FILIAL', Trim(FEmbarqueParam.ME2Filial.Text));
      QREmbarqueImposto.SetVariable('COD_ESTADO', Trim(FEmbarqueParam.ME2Estado.Text));
      QREmbarqueImposto.Open;
      if FrEmbarqueImposto = nil then
        FrEmbarqueImposto := TFrEmbarqueImposto.Create(Application);
      FrEmbarqueImposto.QRLCarga.Caption := 'Embarque Número: ' + FEmbarqueParam.ME2Embarque.Text;
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FrEmbarqueImposto.QRPrimario.Preview
      else
        FrEmbarqueImposto.QRPrimario.Print;
      QREmbarqueImposto.Close;
    end;
end;

procedure TFEmbarqueCad.EmissoNotas1Click(Sender: TObject);
var
  wCadastro_Anterior, wOperacao_Anterior, wCod_Pedido_Anterior, wNum_Pedido_Anterior, wCont, wOperNota: Integer;
  wDias1, wDias2, wDias3, wDias4, wDias5: Integer;
  wValor_Parcelas, wTotal, wTotal_Nota, wCentavoFinal, wSomaCentavos, wDiferenca: Real;
  wLinha, wAux, wNumParcelas, wCodigo_Prazo, wBanco, wDep, wContaCorrente, wPagto, wTipoNota, wBloqueto, wDuplicata,wSubst_Parc: string;
  wRecNo: integer;
  wLibera_Bloqueto, wLibera_Duplicata: string;
const
  wBranco: string = '                                      ';
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.Me3DtSaida.Text := DateToStr(Date);
  FEmbarqueParam.PGRelatorio.Pages[4].TabVisible := True;
  FEmbarqueParam.Rg4OpcaoQtd.ItemIndex := 1;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QEmbarque_EmiteNota.Close;
      if Trim(FEmbarqueParam.Me3Embarque.Text) <> '' then
        QEmbarque_EmiteNota.SetVariable('EMBARQUE', FEmbarqueParam.ME3Embarque.Text)
      else
        raise Exception.Create('Informar Número do Embarque');
      if Trim(FEmbarqueParam.Me3Operacao.Text) <> '' then
        QEmbarque_EmiteNota.SetVariable('COD_OPERACAO', FEmbarqueParam.Me3Operacao.Text)
      else
        QEmbarque_EmiteNota.SetVariable('COD_OPERACAO', Null);
      case FEmbarqueParam.Rg4Operacao.ItemIndex of
        0: QEmbarque_EmiteNota.SetVariable('IND_LIVRO_FISCAL', 'S');
        1: QEmbarque_EmiteNota.SetVariable('IND_LIVRO_FISCAL', 'N');
        2: QEmbarque_EmiteNota.SetVariable('IND_LIVRO_FISCAL', Null);
      end;
      case FEmbarqueParam.Rg4OpcaoQtd.ItemIndex of
        0: QEmbarque_EmiteNota.SetVariable('QT_ZEROS', Null);
        1: QEmbarque_EmiteNota.SetVariable('QT_ZEROS', 'NAO');
      end;
      if Trim(FEmbarqueParam.Me3Finalidade.Text) = '' then
        raise Exception.Create('Informar Código Finalidade');   

      QEmbarque_EmiteNota.Open;
      DMNotaSaida.QNotaSaida.Open;
      DMNotaSaida.QItemNf.Open;
      DMNotaSaida.QAtuBaixaPed.Open;
      DMNotaSaida.pConfirmando := True;
      wCadastro_Anterior := 0;
      wOperacao_Anterior := 0;
      wNum_Pedido_Anterior := 0;
      DMNotaSaida.pTrazPedido := True;
      //PARA EMITIR VARIAS NOTAS SEM PEDIR O TIPO DA NOTA
//      wTipoNota := DMOracle.BuscaNome('SELECT IND_TIPO_NOTA FROM TB_FILIAL', 'COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.Text);
//      if wTipoNota = 'AMBAS' then
//      begin
//        if FTipoNota = Nil then
//          FTipoNota := TFTipoNota.Create(Application);
//        FTipoNota.ShowModal;
//        wTipoNota := FTipoNota.TipoNota;
//      end;
      if FEmbarqueParam.RG3TipoNota.ItemIndex = 0 then
        wTipoNota := 'NORMAL'
      else
        wTipoNota := 'ELETRONICA';
      //--
      try
        while not QEmbarque_EmiteNota.Eof do
        begin
          with DMNotaSaida do
          begin
            if (wCadastro_Anterior = QEmbarque_EmiteNotaCod_Cadastro.Value) and
              (wCod_Pedido_Anterior = QEmbarque_EmiteNotaCod_Pedido_Cab.Value) and
  //             (wNum_Pedido_Anterior = QEmbarque_EmiteNotaNum_Pedido.Value) And  estava esta linha tirado pelo César para o moinho 2 pedidos com mesmo numro emite 2 notas
            (wOperacao_Anterior = QEmbarque_EmiteNotaCod_Operacao.Value) then
              QNotaSaida.Edit
            else
            begin
              pCC := True;
              // procedure que vai inserir a nota fiscal
              InsereNf(QEmbarque_EmiteNotaCod_Filial.Value, QEmbarque_EmiteNotaCod_Cadastro.Value, QEmbarque_EmiteNotaCod_Operacao.Value,
                QEmbarque_EmiteNotaCod_Vendedor.Value, QEmbarque_EmiteNotaNr_Dias_Cheque.Value,
                QEmbarque_EmiteNotaNr_Dias_Cheque1.Value, QEmbarque_EmiteNotaNr_Dias_Cheque2.Value, QEmbarque_EmiteNotaNr_Dias_Cheque3.Value,
                QEmbarque_EmiteNotaNr_Dias_Cheque4.Value, QEmbarque_EmiteNotaCod_Transportador.Value,
                QEmbarque_EmiteNotaCod_Mensagem.Value, QEmbarque_EmiteNotaCod_Departamento.Value,
                QEmbarque_EmiteNotaNum_Pedido.Value, QEmbarque_EmiteNotaCod_Prazo_Vencimento.Value,
                QEmbarque_EmiteNotaPerc_Comissao_Nota.Value, QEmbarque_EmiteNotaVal_Desconto.Value,
                QEmbarque_EmiteNotaInd_Tipo_Pagamento.Value, QEmbarque_EmiteNotaInd_Tipo_Frete.Value,
                QEmbarque_EmiteNotaDesc_Complemento_Obs.Text, QEmbarque_EmiteNotaDesc_Observacao.Text,
                QEmbarque_EmiteNotaIND_CONSUMIDOR_FINAL.Value);
              for wind_tb := 1 to 50 do
              begin
                wTbValor[wind_tb] := 0;
                wTbProduto[wind_tb] := 0;
                wTbComissao[wind_tb] := 0;
                wTbCodPedido_Item[wind_tb] := 0;
              end;
              wind_tb := 0;
            end;
            // procedure para inserir os itens da nota fiscal
            InsereItensNf(Trunc(QEmbarque_EmiteNotaCod_Produto.Value), QEmbarque_EmiteNotaCod_Tributacao.Value,
              QEmbarque_EmiteNotaCod_Lote_Tipo.Value, QEmbarque_EmiteNotaCod_Cultura.Value, QEmbarque_EmiteNotaCod_CFOP.Value,
              QEmbarque_EmiteNotaQt_Pedido.Value, QEmbarque_EmiteNotaVal_Unitario.Value, QEmbarque_EmiteNotaPerc_Desconto_Item.Value,
              QEmbarque_EmiteNotaPerc_Comissao_Itens.Value, QEmbarque_EmiteNotaPerc_Sub.Value, QEmbarque_EmiteNotaPerc_Desconto1.Text,
              QEmbarque_EmiteNotaPerc_Desconto2.Text, QEmbarque_EmiteNotaPerc_Acrescimo.Text, QEmbarque_EmiteNotaQT_EMBALAGEM.Text);

            QAtuBaixaPed.Insert;
            QAtuBaixaPedCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
            QAtuBaixaPedCod_Pedido_Item.Value := QEmbarque_EmiteNotaCod_Pedido_Item.Value;
            QAtuBaixaPedQt_Baixa.Value := QEmbarque_EmiteNotaQt_Pedido.Value;
            QAtuBaixaPed.Post;
            wTbCodPedido_Item[wind_tb] := QEmbarque_EmiteNotaCod_Pedido_Item.Value; // para conseguir relacionar as subfaturadas
            DMNotaSaida.QAtzItemPedido.Close;
            DMNotaSaida.QAtzItemPedido.SetVariable('COD_PEDIDO_ITEM', QAtuBaixaPedCod_Pedido_item.Value);
            DMNotaSaida.QAtzItemPedido.SetVariable('QT_ACRESCENTAR', (QAtuBaixaPedQt_Baixa.Value));
            DMNotaSaida.QAtzItemPedido.ExecSQL;
            wCadastro_Anterior := QEmbarque_EmiteNotaCod_Cadastro.Value;
            wOperacao_Anterior := QEmbarque_EmiteNotaCod_Operacao.Value;
  //          wNum_Pedido_Anterior := QEmbarque_EmiteNotaNum_Pedido.Value;
            wCodigo_Prazo := QEmbarque_EmiteNotaCod_Prazo_Vencimento.Text; // guarda para fazer parcelas
            wCod_Pedido_Anterior := QEmbarque_EmiteNotaCod_Pedido_Cab.Value; // guarda para atualizar data de faturamento do pedido
            wBanco := QEmbarque_EmiteNotaCod_Banco_Agencia.Text; //para quando preenche o codigo do banco no pedido
            wContaCorrente := QEmbarque_EmiteNotaCod_Conta_Corrente.Text; //para quando preenche a Conta Corrente no pedido
            wDep := IntToStr(QEmbarque_EmiteNotaCod_Departamento.Value);
            QEmbarque_EmiteNota.Next;
            if DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERMED' then // tempermed é por cadastro varios pedidos na mesma nota
               wCod_Pedido_Anterior := QEmbarque_EmiteNotaCod_Pedido_Cab.Value;
            if (wCadastro_Anterior <> QEmbarque_EmiteNotaCod_Cadastro.Value) or
               (wOperacao_Anterior <> QEmbarque_EmiteNotaCod_Operacao.Value) or
               (wCod_Pedido_Anterior <> QEmbarque_EmiteNotaCod_Pedido_Cab.Value) or
               (QEmbarque_EmiteNota.Eof) then
            begin
              if QNotaSaidaNum_Nota.Value = 0 then
                QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value, QNotaSaidaCod_Serie.Value, QNotaSaidaCOD_SERIE_MODELO.Value);
              QSomaItemNota.Close;
              QSomaItemNota.Open;

              try
                wRecNo := DMNotaSaida.QItemNF.RecNo;
                DMNotaSaida.GerenciaItensPorLote;
                DMNotaSaida.AtualizaEstoque(-1);
                DMNotaSaida.QItemNF.RecNo := wRecNo;
              except
                raise;
              end;

              QNotaSaidaInd_Situacao.Value := '2'; // Confirmada
              if DMParamSistema.QparamSistemaInd_Contabiliza.Value = 'S' then
                Contabiliza;
              if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
                DesdobramentoClaspar;
              QNotaSaida.Post;
              if QNotaSaidaInd_Condicao_Pagto.Value = '2' then
              begin
                if wCodigo_Prazo = '' then
                  raise exception.Create('Código Prazo de vencimento não informado');
                wNumParcelas := DMOracle.BuscaNome('SELECT NUM_PARCELAS FROM TB_PRAZO_VENCIMENTO', 'COD_PRAZO_VENCIMENTO = ' + wCodigo_Prazo);
                wSubst_Parc := DMOracle.BuscaNome('SELECT IND_SUBST_PRIMEIRA_PARC FROM TB_PRAZO_VENCIMENTO','COD_PRAZO_VENCIMENTO = ' + wCodigo_Prazo);

                wTotal_Nota := QSomaItemNotaSVal_Total_Nota.Value;
                If wSubst_Parc = 'SIM' Then
                   //wValor_Parcelas := (wTotal_Nota - QSomaItemNotaSVal_Icms_Subst.Value) / StrToInt(wNumParcelas) // Deixar Arrendondamento igual da Nota de Saída. 16/09/2020
                  wValor_Parcelas := Trunc((wTotal_Nota - QSomaItemNotaSVal_Icms_Subst.Value) / StrToInt(wNumParcelas)*100)/100 //JUNIOR 16/09/2020.
                Else
                   //wValor_Parcelas := wTotal_Nota / StrToInt(wNumParcelas); // Deixar Arrendondamento igual da Nota de Saída. 16/09/2020
                   wValor_Parcelas := Trunc(wTotal_Nota / StrToInt(wNumParcelas)*100)/100; //JUNIOR 16/09/2020. suporte(866)

                DMPrazoVencimento.QPrazoVencimentoDias.Close;
                DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO', wCodigo_Prazo);
                DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('NUM_DIAS', Null);
                DMPrazoVencimento.QPrazoVencimentoDias.Open;
                LBParcela.Items.Clear;
                wCont := 1;
                wTotal := 0;
                //Deixar Arrendondamento igual da Nota de Saída. 16/09/2020.
                wCentavoFinal := wValor_Parcelas - Trunc(wValor_Parcelas*10)/10;//retornaSegundaCasaDecimal(wParcela);
                wSomaCentavos := StrToInt(wNumParcelas) * wCentavoFinal;//Junior 16/09/2020 suporte(866)

                while not DMPrazoVencimento.QPrazoVencimentoDias.Eof do
                begin
                  //Deixar Arrendondamento igual da Nota de Saída. 16/09/2020. Junior. Suporte(866)
                  if (wCont = 1) and (wSubst_Parc = 'SIM') then
                  begin
                    wDiferenca := wTotal_Nota - (wValor_Parcelas*StrToInt(wNumParcelas)) - DMNotaSaida.QSomaItemNotaSVAL_ICMS_SUBST.Value
                  end
                  else if wCont = 1 then
                  begin
                    wDiferenca := wTotal_Nota - (wValor_Parcelas*StrToInt(wNumParcelas));
                  end; //Junior. Suporte(866)

                  wLinha := DateToStr(Date + DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value);
                   // Bloco criado para deixar Arrendondamento igual da Nota de Saída. 16/09/2020. Junior. Suporte(866)
                  if (wCont = 1) and (wSubst_Parc = 'SIM') then
                    wAux := FormatFloat('###,###,##0.00', wValor_Parcelas + wDiferenca + (wSomaCentavos - wCentavoFinal) + QSomaItemNotaSVal_Icms_Subst.Value)
                  else if (wCont = 1) then
                    wAux := FormatFloat('###,###,##0.00', wValor_Parcelas + wDiferenca + (wSomaCentavos - wCentavoFinal))
                  else
                    wAux := FormatFloat('###,###,##0.00', wValor_Parcelas - wCentavoFinal); //Junior. Suporte(866)

                  {if wCont = StrToInt(wNumParcelas) then // serve para calcular o valor da ultima parcela devido a diferenca de centavos
                     wValor_Parcelas := wTotal_Nota - wTotal;
                  If (wCont = 1) and (wSubst_Parc = 'SIM') Then
                     wAux := FormatFloat('###,###,##0.00', wValor_Parcelas + QSomaItemNotaSVal_Icms_Subst.Value)
                  Else
                     wAux := FormatFloat('###,###,##0.00', wValor_Parcelas);}
                  wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
                  wLinha := wLinha + wAux;
                  Inc(wCont);
                  wTotal := wTotal + StrToFloat(Bib.LimpaString(Trim(wAux), '.'));
                  LBParcela.Items.Add(wLinha);
                  DMPrazoVencimento.QPrazoVencimentoDias.Next;
                end;
                if wBanco = '' then
                begin
                  wBanco := Trim(FembarqueParam.Me3Banco.Text);
                  wContaCorrente := Trim(FembarqueParam.Me3ContaCorrente.Text);
                end;
                if (wDep = '0') or (wDep = '') then
                  wDep := '1';
                wBloqueto := DMOracle.BuscaNome('SELECT IND_BLOQUETO FROM TB_OPERACAO', 'COD_OPERACAO = '
                  + DMNotaSaida.QNotaSaidaCOD_OPERACAO.AsString);
                if(wBloqueto = 'S') then
                begin
                  DMNotaSaida.GeraContaReceber(LBParcela.Items, StrToInt(Trim(FEmbarqueParam.Me3Finalidade.Text)), wBanco, wDep, wContaCorrente);

                  // Impressão do boleto
                  wLibera_Bloqueto := DMOracle.BuscaNome('SELECT IND_LIBERA_BLOQUETO FROM TB_CADASTRO',
                    'COD_CADASTRO = ' + IntToStr(QNotaSaidaCod_Cadastro.Value)); //somente emite bloqueto se estiver liberado no cadastro de clientes
                  if (wLibera_Bloqueto = 'SIM') then
                  begin
                    if (MessageDlg('Deseja emitir o(s) boleto(s)?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                    begin
                      with DMContasReceber do
                      begin
                        QRBloqueto.Close;
                        QRBloqueto.SetVariable('COD_NOTA_CAB_INICIAL', QNotaSaidaCod_Nota_Cab.Text);
                        QRBloqueto.SetVariable('COD_NOTA_CAB_FINAL', QNotaSaidaCod_Nota_Cab.Text);
                        QRBloqueto.SetVariable('COD_CONTA_CORRENTE', Trim(wContaCorrente));
                        QRBloqueto.SetVariable('NUMERO_TITULOS', '1 = 1');
                        Chama_Emissao_Bloqueto(2); //pDefineEmissaoBoleto: pImprime = 0, pEnviaEmail = 1, pImprimeEnviaEmail = 2
                      end;
                    end;
                  end;

                end
                else
                  DMNotaSaida.GeraContaReceber(LBParcela.Items, StrToInt(Trim(FEmbarqueParam.Me3Finalidade.Text)), '', wDep, '');

                // Alteração feita por Gian 19/09/2017, solicitado por Vanessa, pedir para emitir duplicata
                wDuplicata := DMOracle.BuscaNome('SELECT IND_DUPLICATA FROM TB_OPERACAO','COD_OPERACAO = ' + DMNotaSaida.QNotaSaidaCOD_OPERACAO.AsString);
                if(wDuplicata = 'S') then
                begin
                  if (MessageDlg('Deseja emitir duplicata para nota ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
                  begin
                    with DMContasReceber do
                    begin
                      QRContasReceber_Duplicatas.Close;
                      QRContasReceber_Duplicatas.SetVariable('COD_NOTA_CAB', DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
                      QRContasReceber_Duplicatas.SetVariable('COD_FILIAL', DMNotaSaida.QNotaSaidaCod_Filial.Value);
                      QRContasReceber_Duplicatas.SetVariable('COD_DEPARTAMENTO', Null);
                      QRContasReceber_Duplicatas.SetVariable('COD_CONTA_RECEBER_CAB', Null);
                      QRContasReceber_Duplicatas.SetVariable('NUM_PARCELA', Null);
                      QRContasReceber_Duplicatas.SetVariable('COD_CADASTRO', Null);
                      QRContasReceber_Duplicatas.SetVariable('COD_VENDEDOR', Null);
                      QRContasReceber_Duplicatas.Open;
                      if QRContasReceber_Duplicatas.RecordCount = 0 then
                      begin
                        MessageDlg('Não existem parcelas para gerar duplicatas',
                          mtError, [MbOk], 0);
                        Abort;
                      end;
                    end;
                    if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'CGS' then
                     begin
                       if FRContasReceberDuplicatas_CGS = nil then
                         FRContasReceberDuplicatas_CGS := TFRContasReceberDuplicatas_CGS.Create(Application);
                       if FContasReceberParam.RGPreview.ItemIndex = 0 then
                         FRContasReceberDuplicatas_CGS.QRPrimario.Preview
                       else
                         FRContasReceberDuplicatas_CGS.QRPrimario.Print;
                     end
                    else
                     if (DMParamSistema.QParamSistemaInd_Formulario_Duplicata.value = 'B') Then
                      begin
                        if FRContasReceberDuplicatas_MEDIBENS = Nil then
                          FRContasReceberDuplicatas_MEDIBENS := TFRContasReceberDuplicatas_MEDIBENS.Create(Application);
                        FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa.caption :=
                          DMContasReceber.QRContasReceber_DuplicatasDesc_Filial.Value;
                        FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa2.caption :=
                          DMContasReceber.QRContasReceber_DuplicatasDesc_Filial.Value;
                        FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa3.caption :=
                          DMContasReceber.QRContasReceber_DuplicatasDesc_Filial.Value;
                        FRContasReceberDuplicatas_MEDIBENS.QRLE_mail.caption :=
                          DMContasReceber.QRContasReceber_DuplicatasDesc_E_Mail.Value;
                        FRContasReceberDuplicatas_MEDIBENS.QRLEndereco.caption :=
                          DMContasReceber.QRContasReceber_DuplicatasDesc_Endereco_Filial.Value;
                        FRContasReceberDuplicatas_MEDIBENS.QRLCidade.caption :=
                          DMContasReceber.QRContasReceber_DuplicatasDESC_CIDADE_FILIAL.Value;
                        FRContasReceberDuplicatas_MEDIBENS.QRLPracaPgto.Caption :=
                          DMContasReceber.QRContasReceber_DuplicatasDESC_CIDADE_FILIAL.Value;
                        FRContasReceberDuplicatas_MEDIBENS.QRLPracaPgto.Enabled := True;
                        FRContasReceberDuplicatas_MEDIBENS.QRLCGC.caption :=
                          DMContasReceber.QRContasReceber_DuplicatasNum_Cgc_Filial.Value;
                        FRContasReceberDuplicatas_MEDIBENS.QRLInscricao.caption :=
                          DMContasReceber.QRContasReceber_DuplicatasDesc_Inscricao_Filial.Value;
                        FRContasReceberDuplicatas_MEDIBENS.QRLEstado.caption :=
                          DMContasReceber.QRContasReceber_DuplicatasCod_Estado_Filial.Value;
                        FRContasReceberDuplicatas_MEDIBENS.QRLCEP.caption :=
                          DMContasReceber.QRContasReceber_DuplicatasDesc_Cep_Filial.Value;
                        FRContasReceberDuplicatas_MEDIBENS.QRLfone.caption :=
                          DMContasReceber.QRContasReceber_DuplicatasDesc_Fone_Filial.Value;

                        if (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'MOINHO') or
                           (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'GRASEL') then
                          FRContasReceberDuplicatas_MEDIBENS.QRLDt_Aceite.Caption := ''
                        else
                          FRContasReceberDuplicatas_MEDIBENS.QRLDt_Aceite.Caption := DateToStr(Date);

                        if FEmbarqueParam.RGPreview.ItemIndex = 0 then
                           FRContasReceberDuplicatas_MEDIBENS.QRCompositeReport1.Preview
                        else
                           FRContasReceberDuplicatas_MEDIBENS.QRCompositeReport1.Print;
                      end
                     else
                       if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'AB' then
                        begin
                          FPromissoria.Duplicata_ab;
                        end
                       else
                        begin
                          if FRContasReceber_Duplicatas = nil then
                             FRContasReceber_Duplicatas := TFRContasReceber_Duplicatas.Create(Application);
                             if FEmbarqueParam.RGPreview.ItemIndex = 0 then
                                FRContasReceber_Duplicatas.QRPrimario.Preview
                             else
                                FRContasReceber_Duplicatas.QRPrimario.Print;
                        end;
                  end;
                end;
              end;

              PagamentosNFe4.GeraPagamentos('S');

              //---EMISSAO DA NOTA
              if wTipoNota = 'ELETRONICA' then
                FNotaImpressao.setFlagAgricola(true);
              FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value, wTipoNota);

              DMOracle.ExecutaSql('UPDATE TB_PEDIDO_CAB SET IND_SITUACAO = ' + QuotedStr('4') +
              ', STEP_PEDIDO_WEB = 4, LOCAL_ULTIMA_ALTERACAO = ' + QuotedStr('CEMAPA') +
              ' WHERE COD_PEDIDO_CAB IN '+
                '(SELECT PI.COD_PEDIDO_CAB FROM TB_PEDIDO_ITEM PI '+
              'INNER JOIN TB_BAIXA_PEDIDO BP ON BP.COD_PEDIDO_ITEM = PI.COD_PEDIDO_ITEM '+
              'INNER JOIN TB_NOTA_ITEM NI ON NI.COD_NOTA_ITEM = BP.COD_NOTA_ITEM '+
              'INNER JOIN TB_PEDIDO_CAB P ON P.COD_PEDIDO_CAB = PI.COD_PEDIDO_CAB '+
              'WHERE NI.COD_NOTA_CAB = ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text +
              ' GROUP BY PI.COD_PEDIDO_CAB)', False);

              QAtuDtFatura_Ped.Close; // rotina para atualizar dt faturamento do pedido
              QAtuDtFatura_Ped.SetVariable('COD_PEDIDO_CAB', wCod_Pedido_Anterior);
              QAtuDtFatura_Ped.Open;
              QAtuDtFatura_Ped.Edit;
              QAtuDtFatura_PedDt_Faturamento.Value := DMOracle.DataServ;
              QAtuDtFatura_Ped.Post;
              QAtuDtFatura_Ped.Close;
              if wTbProduto[1] <> 0 then // vai fazer nota do percentual das sub faturadas
              begin
                wOperNota := 591;
                wPagto := QNotaSaidaInd_Condicao_Pagto.Value;
                if QNotaSaidaInd_Condicao_Pagto.Value = '2' then
                begin // para zadimel e faville quando a nota fiscal for a prazo o pedido deve ser cheque
                  wPagto := '3';
                  DMPrazoVencimento.QPrazoVencimentoDias.Close;
                  DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO', wCodigo_Prazo);
                  DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('NUM_DIAS', Null);
                  DMPrazoVencimento.QPrazoVencimentoDias.Open;
                  wCont := 1;
                  while not DMPrazoVencimento.QPrazoVencimentoDias.Eof do
                  begin
                    case wCont of
                      1: wDias1 := DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value;
                      2: wDias2 := DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value;
                      3: wDias3 := DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value;
                      4: wDias4 := DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value;
                      5: wDias5 := DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value;
                    end;
                    Inc(wCont);
                    DMPrazoVencimento.QPrazoVencimentoDias.Next;
                  end;
                end
                else
                begin
                  wDias1 := QNotaSaidaNr_Dias_Cheque.Value;
                  wDias2 := QNotaSaidaNr_Dias_Cheque1.Value;
                  wDias3 := QNotaSaidaNr_Dias_Cheque2.Value;
                  wDias4 := QNotaSaidaNr_Dias_Cheque3.Value;
                  wDias5 := QNotaSaidaNr_Dias_Cheque4.Value;
                end;
                InsereNf(QNotaSaidaCod_Filial.Value, QNotaSaidaCod_Cadastro.Value, wOperNota,
                  QNotaSaidaCod_Vendedor.Value, wDias1, wDias2, wDias3, wDias4, wDias5, QNotaSaidaCod_Transportador.Value,
                  QNotaSaidaCod_Mensagem.Value, QNotaSaidaCod_Departamento.Value,
                  QEmbarque_EmiteNotaNum_Pedido.Value, QNotaSaidaCod_Prazo_Vencimento.Value,
                  QNotaSaidaPerc_Comissao.Value, 0, wPagto,
                  QNotaSaidaInd_Tipo_Frete.Value, QNotaSaidaObs_Complemento.Text, QNotaSaidaObs.Text,
                  QNotaSaidaIND_CONSUMIDOR_FINAL.Value);
                for wInd_Tb := 1 to 50 do
                begin
                  if wTbProduto[wind_Tb] > 0 then
                  begin
                    InsereItensNf(wTbProduto[wind_Tb], 4, 1, 0, 0, 0, wtbValor[wind_Tb], 0, wtbComissao[wind_Tb], 0, '', '', '','');
                    QAtuBaixaPed.Insert;
                    QAtuBaixaPedCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
                    QAtuBaixaPedCod_Pedido_Item.Value := wTbCodPedido_Item[wind_tb];
                    QAtuBaixaPedQt_Baixa.Value := 0; // quantidade subfaturada é sempre zero
                    QAtuBaixaPed.Post;
                  end;
                end;
                QNotaSaida.Edit;
                if QNotaSaidaNum_Nota.Value = 0 then
                  QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value, QNotaSaidaCod_Serie.Value,
                    QNotaSaidaCOD_SERIE_MODELO.Value);
                QSomaItemNota.Close;
                QSomaItemNota.Open;
                QNotaSaidaInd_Situacao.Value := '2'; // Confirmada
                if DMParamSistema.QparamSistemaInd_Contabiliza.Value = 'S' then
                  Contabiliza;
                if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
                  DesdobramentoClaspar;
                QNotaSaida.Post;
                if QNotaSaidaInd_Condicao_Pagto.Value = '2' then
                begin
                  if wCodigo_Prazo = '' then
                    raise exception.Create('Código Prazo de vencimento não informado');
                  wNumParcelas := DMOracle.BuscaNome('SELECT NUM_PARCELAS FROM TB_PRAZO_VENCIMENTO', 'COD_PRAZO_VENCIMENTO = ' + wCodigo_Prazo);
                  wValor_Parcelas := QSomaItemNotaSVal_Total_Nota.Value / StrToInt(wNumParcelas);
                  DMPrazoVencimento.QPrazoVencimentoDias.Close;
                  DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO', wCodigo_Prazo);
                  DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('NUM_DIAS', Null);
                  DMPrazoVencimento.QPrazoVencimentoDias.Open;
                  LBParcela.Items.Clear;
                  wCont := 1;
                  wTotal := 0;
                  while not DMPrazoVencimento.QPrazoVencimentoDias.Eof do
                  begin
                    wLinha := DateToStr(Date + DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value);
                    if wCont = StrToInt(wNumParcelas) then // serve para calcular o valor da ultima parcela devido a diferenca de centavos
                      wValor_Parcelas := QSomaItemNotaSVal_Total_Nota.Value - wTotal;
                    wAux := FormatFloat('###,###,##0.00', wValor_Parcelas);
                    wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
                    wLinha := wLinha + wAux;
                    Inc(wCont);
                    wTotal := wTotal + StrToFloat(Bib.LimpaString(Trim(wAux), '.'));
                    LBParcela.Items.Add(wLinha);
                    DMPrazoVencimento.QPrazoVencimentoDias.Next;
                  end;
                  if wBanco = '' then
                  begin
                    wBanco := Trim(FembarqueParam.Me3Banco.Text);
                    wContaCorrente := Trim(FembarqueParam.Me3ContaCorrente.Text);
                  end;
                  if (wDep = '0') or (wDep = '') then
                    wDep := '1';
                  wBloqueto := DMOracle.BuscaNome('SELECT IND_BLOQUETO FROM TB_OPERACAO', 'COD_OPERACAO = '
                    + DMNotaSaida.QNotaSaidaCOD_OPERACAO.AsString);
                  if(wBloqueto = 'S') then
                    DMNotaSaida.GeraContaReceber(LBParcela.Items, StrToInt(Trim(FEmbarqueParam.Me3Finalidade.Text)), wBanco, wDep, wContaCorrente)
                  else
                    DMNotaSaida.GeraContaReceber(LBParcela.Items, StrToInt(Trim(FEmbarqueParam.Me3Finalidade.Text)), '', wDep, '');
                end;
                if wTipoNota = 'ELETRONICA' then
                  FNotaImpressao.setFlagAgricola(true);
                FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value, wTipoNota);
                DMOracle.ExecutaSql('UPDATE TB_PEDIDO_CAB SET IND_SITUACAO = ' + QuotedStr('4') +
                ', STEP_PEDIDO_WEB = 4, LOCAL_ULTIMA_ALTERACAO = ' + QuotedStr('CEMAPA') +
                ' WHERE COD_PEDIDO_CAB IN '+
                  '(SELECT PI.COD_PEDIDO_CAB FROM TB_PEDIDO_ITEM PI '+
                'INNER JOIN TB_BAIXA_PEDIDO BP ON BP.COD_PEDIDO_ITEM = PI.COD_PEDIDO_ITEM '+
                'INNER JOIN TB_NOTA_ITEM NI ON NI.COD_NOTA_ITEM = BP.COD_NOTA_ITEM '+
                'INNER JOIN TB_PEDIDO_CAB P ON P.COD_PEDIDO_CAB = PI.COD_PEDIDO_CAB '+
                'WHERE NI.COD_NOTA_CAB = ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text +
                ' GROUP BY PI.COD_PEDIDO_CAB)', False);
              end;
              DMOracle.DBCemapa.Commit;
            end;
          end;
        end;
      except
        if DMNotaSaida.QNotaSaida.State in [dsEdit, dsInsert] then
        begin
          DMNotaSaida.QNotaSaida.Cancel;
          DMNotaSaida.QItemNF.Cancel;
          DMNotaSaida.QAtuBaixaPed.Cancel;
        end;
        if DMOracle.DBCemapa.InTransaction then
          DMOracle.DBCemapa.RollBack;
        raise;
      end;
      // atualiza a data do embarque pela data do faturamento
      with DMOracle do
      begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wAux := 'UPDATE TB_EMBARQUE SET DT_EMBARQUE=' + Chr(39) + DateToStr(DataServ) + Chr(39);
        wAux := wAux + ' WHERE COD_EMBARQUE = ' + Trim(FEmbarqueParam.Me3Embarque.Text);
        QExecSQL.SQL.Add(wAux);
        QExecSQL.ExecSQL;
        if DMOracle.DBCemapa.InTransaction then
          DMOracle.DBCemapa.Commit;
      end;

      //Modificado para não aparecer a tela FRpaCad para a empresa ZAPOLI. Por Vanessa 27/07/2013
      if(DMParamSistema.CodEmpresa <> 'ZAPOLI') and
        (DMParamSistema.CodEmpresa <> 'MARICOTA') and
        (DMParamSistema.CodEmpresa <> 'GRAZAPEL') and
        (DMParamSistema.CodEmpresa <> 'BIGMETAL') then
        begin
         if FRpaCad = nil then
         FRpaCad := TFRpaCad.Create(Application);
         FRpaCad.ShowModal;
        end;
      end;
      //fim

   DMEmbarque.QEmbarque_EmiteNota.Close;
   DMNotaSaida.QNotaSaida.Close;
   DMNotaSaida.QItemNf.Close;
   DMNotaSaida.QAtuBaixaPed.Close;
   DMNotaSaida.pConfirmando := False;
   DMNotaSaida.pTrazPedido := False;

end;

procedure TFEmbarqueCad.ConsultaEmbarquePelaNota1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueNota = nil then
    FEmbarqueNota := TFEmbarqueNota.Create(Application);
  FEmbarqueNota.ShowModal;
  DMEmbarque.QNotaEmbarque.Close;
end;

procedure TFEmbarqueCad.ExcluiProdutodoPedidodeUmEmbarque1Click(
  Sender: TObject);
var
  wComando: string;
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[5].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QEmbarqueItensPed.Close;
      QEmbarqueItensPed.ClearVariables;
      if Trim(FEmbarqueParam.Me4Embarque.Text) <> '' then
        QEmbarqueItensPed.SetVariable('COD_EMBARQUE', FEmbarqueParam.ME4Embarque.Text)
      else
        raise Exception.Create('Informar Número do Embarque');
      if Trim(FEmbarqueParam.Me4Produto.Text) <> '' then
        QEmbarqueItensPed.SetVariable('COD_PRODUTO', FEmbarqueParam.Me4Produto.Text)
      else
        raise Exception.Create('Informar Código Produto');
      QEmbarqueItensPed.SetVariable('COD_LOTE_TIPO', Null);
      QEmbarqueItensPed.Open;
      if QEmbarqueItensPedQt_Atendido.Value > 0 then
        raise Exception.Create('Pedido Já Faturado - Emitido Notas');
      while not QEmbarqueItensPed.Eof do
      begin
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'DELETE FROM TB_PEDIDO_ITEM WHERE COD_PEDIDO_ITEM =' + QEmbarqueItensPedCod_Pedido_Item.Text;
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
          if DMOracle.DBCemapa.InTransaction then
            DMOracle.DBCemapa.Commit;
          QEmbarqueItensPed.Next;
        end;
      end;
      QEmbarqueItensPed.Close;
    end;
end;

procedure TFEmbarqueCad.RelaodeCargas1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[6].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QREmbarqueCarga.Close;
      if (Trim(FEmbarqueParam.ME7DtInicio.Text) = '') or (Trim(FEmbarqueParam.ME7DtFim.Text) = '') then
        raise Exception.Create('Período deve ser Informado');
      QREmbarqueCarga.SetVariable('DT_INICIAL', StrToDate(Trim(FEmbarqueParam.ME7DtInicio.Text)));
      QREmbarqueCarga.SetVariable('DT_FINAL', StrToDate(Trim(FEmbarqueParam.ME7DtFim.Text)));
      case FEmbarqueParam.RG7Situacao.ItemIndex of
        0: QREmbarqueCarga.SetVariable('IND_SITUACAO', NULL);
        1: QREmbarqueCarga.SetVariable('IND_SITUACAO', 'ABERTO');
        2: QREmbarqueCarga.SetVariable('IND_SITUACAO', 'ACERTADO');
        3: QREmbarqueCarga.SetVariable('IND_SITUACAO', 'BAIXADO');
      end;
      QREmbarqueCarga.Open;
      if FREmbarqueCarga = nil then
        FREmbarqueCarga := TFREmbarqueCarga.Create(Application);
      FREmbarqueCarga.QRLTitulo.Caption := 'RELAÇÃO DE CARGAS NO PERÍODO DE ' + FEmbarqueParam.ME7DtInicio.Text + ' À ' + FEmbarqueParam.ME7DtFim.Text;
      case FEmbarqueParam.RG7Situacao.ItemIndex of
        0: FREmbarqueCarga.QRLTitulo.Caption := FREmbarqueCarga.QRLTitulo.Caption + ' TODOS';
        1: FREmbarqueCarga.QRLTitulo.Caption := FREmbarqueCarga.QRLTitulo.Caption + ' ABERTO';
        2: FREmbarqueCarga.QRLTitulo.Caption := FREmbarqueCarga.QRLTitulo.Caption + ' ACERTADO S/LANCTO CHEQUE';
        3: FREmbarqueCarga.QRLTitulo.Caption := FREmbarqueCarga.QRLTitulo.Caption + ' BAIXADO TOTAL';
      end;
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FREmbarqueCarga.QRPrimario.Preview
      else
        FREmbarqueCarga.QRPrimario.Print;
      QREmbarqueCarga.Close;
    end;
end;

procedure TFEmbarqueCad.BaixaEstoquePeloEmbarque1Click(Sender: TObject);
begin
  inherited;
  if FBaixaEstoquePeloEmbarque = nil then
    FBaixaEstoquePeloEmbarque := TFBaixaEstoquePeloEmbarque.Create(Application);
  FBaixaEstoquePeloEmbarque.ShowModal;
end;

procedure TFEmbarqueCad.RelaoTotalPorPedidos1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[8].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FEmbarqueParam.ME2Filial.Text), 'VENDA');
      QREmbarquePedido.Close;
      if Trim(FEmbarqueParam.Me8Embarque.Text) <> '' then
        QREmbarquePedido.SetVariable('EMBARQUE', Trim(FEmbarqueParam.Me8Embarque.Text))
      else
        QREmbarquePedido.SetVariable('EMBARQUE', null);
      if Trim(FEmbarqueParam.Me8Cadastro.Text) = '' then
        QREmbarquePedido.SetVariable('COD_CADASTRO', Null)
      else
        QREmbarquePedido.SetVariable('COD_CADASTRO', Trim(FEmbarqueParam.Me8Cadastro.Text));
      QREmbarquePedido.Open;
      if FrEmbarquePedido = nil then
        FrEmbarquePedido := TFrEmbarquePedido.Create(Application);
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FrEmbarquePedido.QRPrimario.Preview
      else
        FrEmbarquePedido.QRPrimario.Print;
      QREmbarquePedido.Close;
    end;

end;

procedure TFEmbarqueCad.VoltaEstoquepeloEmbarque1Click(Sender: TObject);
var
  wFilial: Integer;
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[7].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QEmbarqueItensNota.Close;
      if Trim(FEmbarqueParam.Me7Embarque.Text) <> '' then
        QEmbarqueItensNota.SetVariable('COD_EMBARQUE', Trim(FEmbarqueParam.Me7Embarque.Text))
      else
        raise Exception.Create('Informar Número do Embarque');
      QEmbarque.Close;
      QEmbarque.SetVariable('PK', StrToInt(Trim(FEmbarqueParam.Me7Embarque.Text)));
      QEmbarque.Open;
      if QEmbarqueInd_Atualiza_Estoque.Value = 'NAO' then
        raise Exception.Create('Não é possivel voltar estoque porque embarque nunca foi Atualizado');
      QEmbarqueItensNota.Open;
      QEmbarqueItensNota.First;
      if QEmbarqueItensNota.recordCount > 0 then
      begin
        try
          DMOracle.DBCemapa.StartTransaction;
          while not QEmbarqueItensNota.Eof do
          begin
            wFilial := QEmbarqueItensNotaCod_Filial.Value;
            if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL' then // para zadimel sempre filial 1
              wFilial := 1;
            DmEstoque.Atualiza_Estoque(-1, wFilial, QEmbarqueItensNotaCod_Produto.Value, 1,
              (QEmbarqueItensNotaQt_Quantidade.Value), 0, Date, Date);
            QEmbarqueItensNota.Next;
          end;
          QEmbarque.Edit;
          QEmbarqueInd_Atualiza_Estoque.Value := 'NAO';
          QEmbarqueDt_Atualiza_Estoque.Text := '';
          QEmbarque.Post;
          DmOracle.DBCemapa.Commit;
          QEmbarqueItensNota.Close;
        except
          DmOracle.DBCemapa.Rollback;
          QEmbarqueItensNota.Cancel;
          raise;
        end;
      end
      else
        raise exception.Create('Estoque não pode ser atualizado, verifique situação das notas');
    end;
end;

procedure TFEmbarqueCad.RelaoBaixadoporData1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[9].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QREmbarqueBaixado.Close;
      if Trim(FEmbarqueParam.Me9Embarque.Text) <> '' then
        QREmbarqueBaixado.SetVariable('EMBARQUE', Trim(FEmbarqueParam.Me9Embarque.Text))
      else
        QREmbarqueBaixado.SetVariable('EMBARQUE', null);
      if (FEmbarqueParam.Me9DtInicial.Text = '') or (FEmbarqueParam.Me9DtFinal.Text = '') then
        raise Exception.create('É Preciso informar a data')
      else
        QREmbarqueBaixado.SetVariable('DT_INICIAL', trim(FEmbarqueParam.ME9DtInicial.Text));
      QREmbarqueBaixado.SetVariable('DT_FINAL', trim(FEmbarqueParam.ME9DtFinal.Text));

      QREmbarqueBaixado.Open;
      if FrEmbarqueBaixado = nil then
        FrEmbarqueBaixado := TFrEmbarqueBaixado.Create(Application);
      FREmbarqueBaixado.QRLPeriodo.Caption := 'Período:' + FEmbarqueParam.ME9DtInicial.Text + ' até ' + FEmbarqueParam.ME9DtFinal.Text;
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FrEmbarqueBaixado.QRPrimario.Preview
      else
        FrEmbarqueBaixado.QRPrimario.Print;
      QREmbarqueBaixado.Close;
    end;

end;

procedure TFEmbarqueCad.RelProdutosEmbarcados1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[10].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QRProdutoEmbarcado.Close;
      if Trim(FEmbarqueParam.Me9Classe.Text) <> '' then
        QRProdutoEmbarcado.SetVariable('COD_CLASSE', Trim(FEmbarqueParam.Me9Classe.Text))
      else
        QRProdutoEmbarcado.SetVariable('COD_CLASSE', null);

      if (FEmbarqueParam.Me9Data_I.Text = '') or (FEmbarqueParam.Me9Data_F.Text = '') then
        raise Exception.create('É Preciso informar um período')
      else
        QRProdutoEmbarcado.SetVariable('DATA_I', trim(FEmbarqueParam.Me9Data_I.Text));
      QRProdutoEmbarcado.SetVariable('DATA_F', trim(FEmbarqueParam.Me9Data_F.Text));

      QRProdutoEmbarcado.SQL[QRProdutoEmbarcado.SQL.Count-1]:='';  // elimina a última Linha da SQL
      Case FEmbarqueParam.RG10Classe.ItemIndex of
        0 : QRProdutoEmbarcado.SQL.Add('ORDER BY TB_PRODUTO.COD_CLASSE, TB_PRODUTO.DESC_PRODUTO');
        1 : QRProdutoEmbarcado.SQL.Add('ORDER BY TB_PRODUTO.DESC_PRODUTO');
      End;

      QRProdutoEmbarcado.Open;  

      if FRProdutoEmbarcado = nil then
        FRProdutoEmbarcado := TFRProdutoEmbarcado.Create(Application);
      FRProdutoEmbarcado.QRLPeriodo.Caption := 'Período:' + trim(FEmbarqueParam.Me9Data_I.Text) + ' até ' + trim(FEmbarqueParam.Me9Data_F.Text);

      FRProdutoEmbarcado.QRGroup1.Enabled := true;
      FRProdutoEmbarcado.QRBand3.Enabled := true;
      if (FEmbarqueParam.RG10Classe.ItemIndex = 0) then
      begin
        FRProdutoEmbarcado.QRGroup1.Enabled := true;
        FRProdutoEmbarcado.QRBand3.Enabled := true;
      end
      else
      begin
        FRProdutoEmbarcado.QRGroup1.Enabled := false;
        FRProdutoEmbarcado.QRBand3.Enabled := false;
      end;
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FRProdutoEmbarcado.QRPrimario.Preview
      else
        FRProdutoEmbarcado.QRPrimario.Print;
      QRProdutoEmbarcado.Close;
    end;
end;

procedure TFEmbarqueCad.EmbarqueNotaFiscaltxt1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[0].TabVisible := True;
  if DMUsuario.pTipoFuncionario = 'VENDEDOR' then
  begin
    FEmbarqueParam.ME0Vendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
    FEmbarqueParam.ME0Vendedor.Enabled := False;
    FEmbarqueParam.Bt0ConsVendedor.Enabled := False;
  end;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FEmbarqueParam.MeFilial.Text), 'VENDA');
      QREmbarque_Ped_Nf.Close;

      if Trim(FEmbarqueParam.MEEmbarque.Text) = '' then
        QREmbarque_Ped_Nf.SetVariable('EMBARQUE', Null)
      else
        QREmbarque_Ped_Nf.SetVariable('EMBARQUE', FEmbarqueParam.MEEmbarque.Text);
      if Trim(FEmbarqueParam.ME0Vendedor.Text) = '' then
        QREmbarque_Ped_Nf.SetVariable('COD_VENDEDOR', Null)
      else
        QREmbarque_Ped_Nf.SetVariable('COD_VENDEDOR', FEmbarqueParam.ME0Vendedor.Text);

      if (FEmbarqueParam.Me0DtInicial.Text = '') or (FEmbarqueParam.Me0DtFinal.Text = '') then
        raise Exception.create('É Preciso informar um período');
      QREmbarque_Ped_Nf.SetVariable('DT_INICIAL', trim(FEmbarqueParam.Me0DtInicial.Text));
      QREmbarque_Ped_Nf.SetVariable('DT_FINAL', trim(FEmbarqueParam.Me0DtFinal.Text));

      case FEmbarqueParam.Rg0Operacao.ItemIndex of
        0: QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL', 'S');
        1: QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL', 'N');
        2: QREmbarque_Ped_Nf.SetVariable('IND_LIVRO_FISCAL', Null);
      end;
      QREmbarque_Ped_Nf.Open;
      if FrEmbarque_Ped_Nf = nil then
        FrEmbarque_Ped_Nf := TFrEmbarque_Ped_Nf.Create(Application);
      FREmbarque_Ped_Nf.QRLTitulo.Caption := 'Relacao Notas Para Embarque Nr. ' + FEmbarqueParam.MEEmbarque.text;
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FREmbarque_Ped_Nf.QRPrimario.Preview
      else
        FrEmbarque_Ped_Nf.QRPrimario.Print;
      QREmbarque_Ped_Nf.Close;
    end;
end;

procedure TFEmbarqueCad.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  DBPPedido.SetFocus;
end;

procedure TFEmbarqueCad.EmbarqueporCliente1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[13].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QREmbarqueCliente.close;
      if (FEmbarqueParam.Me14DtInicial.Text = '') or (FEmbarqueParam.Me14DtFinal.Text = '') then
        raise Exception.create('É Preciso informar um período');
      QREmbarqueCliente.SetVariable('DT_INICIAL', trim(FEmbarqueParam.Me14DtInicial.Text));
      QREmbarqueCliente.SetVariable('DT_FINAL', trim(FEmbarqueParam.Me14DtFinal.Text));
      QREmbarqueCliente.Open;
      if FrEmbarqueCliente = nil then
        FrEmbarqueCliente := TFrEmbarqueCliente.Create(Application);
      FrEmbarqueCliente.QRLPeriodo.Caption := 'Período: ' + FEmbarqueParam.ME14DtInicial.text + ' até ' + FEmbarqueParam.ME14DtFinal.Text;
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FrEmbarqueCliente.QRPrimario.Preview
      else
        FrEmbarqueCliente.QRPrimario.Print;
      QREmbarqueCliente.Close;
    end;
end;

procedure TFEmbarqueCad.PosioEstoqueEmbarque1Click(Sender: TObject);
var
  wVirgula, wAux: string;
  i: integer;
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[14].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QREstoqueEmbarque.close;
      if Trim(FEmbarqueParam.ME15Filial.Text) = '' then
      //raise exception.create('É necessário informar uma Filial.')
        QREstoqueEmbarque.SetVariable('FILIAL', Null)
      else
        QREstoqueEmbarque.SetVariable('FILIAL', Trim(FEmbarqueParam.ME15Filial.Text));
      QREstoqueEmbarque.SetVariable('DT_REFERENCIA', StrToDate(Trim(FEmbarqueParam.Me15DtReferencia.Text)));
      QREstoqueEmbarque.SetVariable('DT_REFERENCIA_FINAL', StrToDate(Trim(FEmbarqueParam.Me15DtReferenciaFinal.Text)));
      QREstoqueEmbarque.SetVariable('ROWNUM_EMBARQUE', StrToInt(FEmbarqueParam.MEEmbarqueInicial.text));

      if FEmbarqueParam.LB15Embarque.Items.Count = 0 then
        QREstoqueEmbarque.SetVariable('LISTA_EMBARQUE', '0')
      else
      begin
        wVirgula := '';
        wAux := '';
        for i := 0 to FEmbarqueParam.LB15Embarque.Items.Count - 1 do
        begin
          wAux := wAux + wVirgula + FEmbarqueParam.LB15Embarque.Items.Strings[i];
          wVirgula := ',';
        end;
        QREstoqueEmbarque.SetVariable('LISTA_EMBARQUE', wAux);
      end;

      QREstoqueEmbarque.Open;
      if FrPosicaoEstoqueEmbarque = nil then
        FrPosicaoEstoqueEmbarque := TFrPosicaoEstoqueEmbarque.Create(Application);
      FrPosicaoEstoqueEmbarque.QRLFilial.Caption := 'Filial: ' + FEmbarqueParam.ME15Filial.text + ' ' + FembarqueParam.Ed15Filial.Text;
      FrPosicaoEstoqueEmbarque.QRLPeriodo.Caption := 'Dt. Referência:' + Trim(FEmbarqueParam.Me15DtReferencia.Text);
      FrPosicaoEstoqueEmbarque.setRowNumEmbarque(StrToInt(FEmbarqueParam.MEEmbarqueInicial.text));


      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FrPosicaoEstoqueEmbarque.QRPrimario.Preview
      else
        FrPosicaoEstoqueEmbarque.QRPrimario.Print;
      QREstoqueEmbarque.Close;
    end;

end;

procedure TFEmbarqueCad.BloquearEmbarque1Click(Sender: TObject);
begin
  inherited;
  //--- altera situacao do embarque para bloqueado
  if trim(DMEmbarque.QEmbarqueCOD_EMBARQUE.Text) = '' then
    raise exception.create('É necessário escolher o embarque a ser Bloqueado');

  with DMOracle do
  begin
    try
      DBCemapa.StartTransaction;
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add('UPDATE TB_EMBARQUE SET IND_BLOQUEADO = ' + CHR(39) + 'S' + CHR(39));
      QExecSQL.SQL.Add(' WHERE COD_EMBARQUE = ' + trim(DMEmbarque.QEmbarqueCOD_EMBARQUE.Text));
      QExecSQL.ExecSQL;
      DBCemapa.Commit;
    except
      DBCemapa.Rollback;
      showmessage('Não foi possivel bloquear o Embarque');
    end;
  end;
  DMEmbarque.QEmbarque.Refresh;
end;

procedure TFEmbarqueCad.PageControl1Change(Sender: TObject);
begin
  inherited;
  if (trim(DMEmbarque.QEmbarqueCOD_EMBARQUE.Text) <> '') and (DMEmbarque.QEmbarqueIND_BLOQUEADO.Text = 'S') then
  begin
    FEmbarqueCad.PageControl1.Pages[1].Hide;
    showmessage('Embarque Bloqueado, procure a gerência');
  end;
end;

procedure TFEmbarqueCad.DesbloquearPedido1Click(Sender: TObject);
begin
  inherited;
  if trim(DMEmbarque.QEmbarqueCOD_EMBARQUE.Text) = '' then
    raise exception.create('É necessário escolher o embarque a ser Desbloqueado');

  if FSenha = nil then //Pedir senha para desbloquear embarque. Vanessa 25/06/2019
    FSenha := TFSenha.Create(Application);
  if FSenha.ShowModal = MrOk then

  if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
    raise Exception.Create('Senha Incorreta.')
  else
  begin
    with DMOracle do
    begin
      try
        DBCemapa.StartTransaction;
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        QExecSQL.SQL.Add('UPDATE TB_EMBARQUE SET IND_BLOQUEADO = ' + CHR(39) + 'N' + CHR(39));
        QExecSQL.SQL.Add(' WHERE COD_EMBARQUE = ' + trim(DMEmbarque.QEmbarqueCOD_EMBARQUE.Text));
        QExecSQL.ExecSQL;
        DBCemapa.Commit;
      except
        DBCemapa.Rollback;
        showmessage('Não foi possivel desbloquear o Embarque');
      end;
    end;
  end;
  DMEmbarque.QEmbarque.Refresh;
end;

procedure TFEmbarqueCad.GeraContasaPagar1Click(Sender: TObject);
begin
  inherited;
  if (DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value <= 0) or (DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Text = '') then
    raise exception.create('Valor inválido de Frete');
  DMOracle.DBCemapa.StartTransaction;
  try
    with DMEmbarque do
    begin
      if FConhecimento_CP = nil then
        FConhecimento_CP := TFConhecimento_CP.Create(Application);
      FConhecimento_CP.BitBtn1.Visible := False;
      FConhecimento_CP.Label1.Caption := 'Frete';
      FConhecimento_CP.LblPedagio.Visible := True;
      FConhecimento_CP.MeCodFinalidadePedagio.Visible := True;
      FConhecimento_CP.SbPedagio.Visible := True;
      FConhecimento_CP.MeFinalidadePedagio.Visible := True;
      FConhecimento_CP.Label5.Visible := True;
      FConhecimento_CP.MeFinalidadeIcms.Visible := True;
      FConhecimento_CP.EdFinalidadeIcms.Visible := True;
      FConhecimento_CP.SbFinalidadeIcms.Visible := True;
      FConhecimento_CP.MECodbanco.Text := '1';
      FConhecimento_CP.MECodDepartamento.Text := '1';
      FConhecimento_CP.MeCodFinalidadePedagio.Text := '606';
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' then
      begin
        FConhecimento_CP.MECodFinalidade.Text := '4';
        FConhecimento_CP.MeFinalidadeICMS.Text := '287';
      end
      else
      begin
        FConhecimento_CP.MECodFinalidade.Text := '68';
        FConhecimento_CP.MeFinalidadeICMS.Text := '635';
      end;
      if FConhecimento_CP.ShowModal = MrOk then
      begin
        QEmbarque.Edit;
        if (QEmbarqueVAL_TOTAL_FRETE.Value - QEmbarqueVAL_MANIFESTO.Value - QEmbarqueVAL_ADTO_FRETE.Value + QEmbarqueVAL_AJUDA_CUSTO.Value) > 0 then
        begin
          GeraContasPagar(QEmbarqueVAL_TOTAL_FRETE.Value - QEmbarqueVAL_MANIFESTO.Value - QEmbarqueVAL_ADTO_FRETE.Value + QEmbarqueVAL_AJUDA_CUSTO.Value, 'FRE', StrToInt(Trim(FConhecimento_CP.MECodFinalidade.Text)), QEmbarqueCod_Embarque.Value);
          QEmbarqueCod_Conta_Pagar_Cab.Value := DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value;
        end;
        if QEmbarqueVal_Pedagio.Value <> 0 then
        begin
          GeraContasPagar(QEmbarqueVal_Pedagio.Value, 'PDG', StrToInt(Trim(FConhecimento_CP.MeCodFinalidadePedagio.text)), QEmbarqueCod_Embarque.Value);
          QEmbarqueCod_Conta_Pagar_Cab_Pedagio.Value := DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value;
        end;
        if QEmbarqueVal_ICMS.Value <> 0 then
        begin
          GeraContasPagar(QEmbarqueVal_Icms.Value, 'ICM', StrToInt(Trim(FConhecimento_CP.MeFinalidadeICMS.text)), QEmbarqueCod_Embarque.Value);
          QEmbarqueCod_Conta_Pagar_Cab_Icms.Value := DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value;
        end;
        if (QEmbarqueVal_MANIFESTO.Text <> '') and (QEmbarqueNum_MANIFESTO.Text <> '') then
        begin
          GeraContasPagar(QEmbarqueVal_MANIFESTO.Value, 'MAN', StrToInt(Trim(FConhecimento_CP.MECodFinalidade.text)), QEmbarqueNum_MANIFESTO.Value);
          QEmbarqueCod_Conta_Pagar_Cab_Compl.Value := DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value;
        end;
        QEmbarqueIND_ACERTO_FRETE.Value := 'S'; //--muda situacao do frete para fechado(acertado com o motorista)
        QEmbarque.Post;
        Emite_Conhecimento_Frete(DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value,
          DMEmbarque.QEmbarqueVAL_ICMS.Value, //tava passando 0
          DMEmbarque.QEmbarqueVAL_AJUDA_CUSTO.Value, //tava passando 0
          DMEmbarque.QEmbarqueVAL_PEDAGIO.Value, //tava passando 0
          DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value, //tava passando 0
          'CONHECIMENTO DE FRETE');
        DMContasPagar.QContasPagar_Mov.Close;
        DMContasPagar.QContasPagar_cab.Close;
      end;
      DMOracle.DBCemapa.Commit;
    end;
  except
    DMEmbarque.QEmbarque.Cancel;
    DMContasPagar.QContasPagar_Cab.Cancel;
    DMContasPagar.QContasPagar_Mov.Cancel;
    DMOracle.DBCemapa.Rollback;
    raise;
  end;
end;

procedure TFEmbarqueCad.ExcluiContasaPagar1Click(Sender: TObject);
begin
  inherited;
  DMEmbarque.pApagando := true;
  if DMEmbarque.QEmbarqueCod_Embarque.Value <> 0 then
  begin
    if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMEmbarque.QEmbarqueDt_Embarque.Value then
      raise Exception.Create('Não é Permitido excluir este Frete - Fechamento Financeiro');
    DMOracle.DBCemapa.StartTransaction;
    try
      ExcluiMovimentos(DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab.Value); // volta contas a pagar do frete
      DMEmbarque.QEmbarque.Edit;
      DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab.Text := '';
      if DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Pedagio.Text <> '' then // volta contas a pagar do Pedagio
      begin
        ExcluiMovimentos(DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Pedagio.Value); // volta contas a pagar do Pedagio
        DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Pedagio.Text := '';
      end;
      if DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Icms.Text <> '' then
      begin
        ExcluiMovimentos(DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Icms.Value); // volta contas a pagar do ICMS
        DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Icms.Text := '';
      end;
      if DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Compl.Text <> '' then
      begin
        ExcluiMovimentos(DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Compl.Value); // volta contas a pagar do Complemento
        DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Compl.Text := '';
      end;
      DMEmbarque.QEmbarqueIND_ACERTO_FRETE.Value := 'N'; //--muda situacao do frete para Aberto(nao acertado com o motorista)
      DMEmbarque.QEmbarque.Post;
      DMOracle.DBCemapa.Commit;
      showmessage('Contas a Pagar foi excluido com sucesso.');
    except
      showmessage('Não foi possivel excluir o Contas a Pagar');
      DMOracle.DBCemapa.Rollback;
      DMContasPagar.QContasPagar_Cab.Close;
      DMContasPagar.QContasPagar_Mov.Close;
      DMEmbarque.QEmbarque.Close;
      DMEmbarque.QEmbarque.Open;
      raise;
    end;
  end;
  DMEmbarque.pApagando := false;
end;

procedure TFEmbarqueCad.SbReciboAdtoClick(Sender: TObject);
begin
  inherited;
  if (trim(DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Text) <> '') then
    Emite_Recibo_Frete(DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value, 'Adiantamento ')
  else
    showmessage('Impossível Emitir Recibo! Não exite valor de Adiantamento de Frete');
end;

procedure TFEmbarqueCad.DBEdit25Exit(Sender: TObject);
begin
  inherited;
  with DMEmbarque do
  begin
    if (QEmbarqueVal_Total_Frete.Text <> '') and (QCalculaValorCargaVal_Carga.Value > 0) then
    begin
      LBPercentual.Caption := FormatFloat('#,##0.00', (((DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value +
        DMEmbarque.QEmbarqueVAL_FRETE_COMPLEMENTO.Value +
// RODRIGO PEDIU PARA RETIRAR                                                       DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value +
        DMEmbarque.QEmbarqueVAL_AJUDA_CUSTO.Value +
        DMEmbarque.QEmbarqueVAL_PEDAGIO.Value) * 100) / (QCalculaValorCargaVal_Carga.Value)));
    end;
  end;

end;

procedure TFEmbarqueCad.DBEdit19Exit(Sender: TObject);
begin
  inherited;
  DBEdit25Exit(self);
end;

procedure TFEmbarqueCad.DBEdit20Exit(Sender: TObject);
begin
  inherited;
  DBEdit25Exit(self);
end;

procedure TFEmbarqueCad.DBEdit22Change(Sender: TObject);
begin
  inherited;
  DBEdit25Exit(self);
end;

procedure TFEmbarqueCad.RelFretes1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[15].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QRFretes.close;
      if (Trim(FEmbarqueParam.ME16Transportador.Text) = '') then
        QRFretes.SetVariable('TRANSPORTADOR', Null)
      else
        QRFretes.SetVariable('TRANSPORTADOR', FEmbarqueParam.ME16Transportador.Text);
      if (Trim(FEmbarqueParam.ME16Dt_Embarque_I.Text) = '') or (Trim(FEmbarqueParam.ME16Dt_Embarque_F.Text) = '') then
        raise exception.create('É necessário informar uma data inicial e final')
      else
      begin
        QRFretes.SetVariable('DATA_I', Trim(FEmbarqueParam.ME16Dt_Embarque_I.Text));
        QRFretes.SetVariable('DATA_F', Trim(FEmbarqueParam.ME16Dt_Embarque_F.Text));
      end;
      case FEmbarqueParam.RG16TipoVeiculo.ItemIndex of
        0: QRFretes.SetVariable('TIPO_VEICULO', '34');
        1: QRFretes.SetVariable('TIPO_VEICULO', 'TOCO');
        2: QRFretes.SetVariable('TIPO_VEICULO', 'TRUCK');
        3: QRFretes.SetVariable('TIPO_VEICULO', 'CARRETA');
        4: QRFretes.SetVariable('TIPO_VEICULO', Null);
      end;
      case FEmbarqueParam.Rg16Acertado.ItemIndex of
        0: QRFretes.SetVariable('IND_ACERTO_FRETE', 'S');
        1: QRFretes.SetVariable('IND_ACERTO_FRETE', 'N');
        2: QRFretes.SetVariable('IND_ACERTO_FRETE', Null);
      end;
      QRFretes.Open;
      if FRFretes = nil then
        FRFretes := TFRFretes.Create(Application);
      FRFretes.QRLPeriodo.Caption := 'Periodo:' + Trim(FEmbarqueParam.ME16Dt_Embarque_I.Text) + ' até ' +
        Trim(FEmbarqueParam.ME16Dt_Embarque_F.Text);
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FRFretes.QRPrimario.Preview
      else
        FRFretes.QRPrimario.Print;
      QRFretes.Close;
    end;
end;

procedure TFEmbarqueCad.EtiqCodBarraProduoEmbarque1Click(Sender: TObject);
var
  wcont, wCont1, wCont2, wCont3, wQtd, wQtd1, wVolume: integer;
  wNum_Controle, wProduto, wComando: string;
begin
  inherited;
  if DmParamSistema.QParamSistemaCod_Empresa.Text = 'CGS' then
  begin
    wcont := 1;
    wQtd1 := 0;
    wCont3 := 0;
    if FEmbarqueParam = nil then
      FEmbarqueParam := TFEmbarqueParam.Create(Application);
    FEmbarqueParam.PGRelatorio.Pages[16].TabVisible := True;
    if FEmbarqueParam.ShowModal = mrOk then
    begin
      if FEmbarqueParam.RG17Tipo.ItemIndex = 1 then
    //if FEmbarqueParam.RB17Embarque.checked = False then
      begin
        with DMEmbarque do
        begin
          QEtiqueta.Close;
          QEtiqueta.open;
          if QEtiqueta.RecordCount > 0 then
          begin
            QEtiqueta.First;
            while not QEtiqueta.Eof do
              QEtiqueta.Delete;
          end;
        end;
        with DMEmbarque do
        begin
          QREtiqCodBarraProducao.Close;
          if Trim(FEmbarqueParam.ME17Embarque.Text) <> '' then
            QREtiqCodBarraProducao.SetVariable('EMBARQUE', FEmbarqueParam.ME17Embarque.Text)
          else
            raise Exception.Create('É preciso informar o embarque!');
          if Trim(FEmbarqueParam.Me17Classe.Text) = '' then
            QREtiqCodBarraProducao.SetVariable('CLASSE', Null)
          else
            QREtiqCodBarraProducao.SetVariable('CLASSE', FEmbarqueParam.ME17Classe.Text);

          QREtiqCodBarraProducao.Open;
          QREtiqCodBarraProducao.First;
          try
            DMoracle.DBCemapa.StartTransaction;
            while not QREtiqCodBarraProducao.Eof do
            begin
              if QREtiqCodBarraProducaoNUM_VOLUMES.Value < 1 then
                QREtiqCodBarraProducaoNUM_VOLUMES.Text := '1';
              wProduto := QREtiqCodBarraProducaoCOD_PRODUTO.Text;
              wQtd := StrToInt(QREtiqCodBarraProducaoQT_PEDIDO.Text);

              if wQtd > 0 then
              begin

                if ((wQtd <> 1) and (wQtd1 < wQtd)) then
                begin
                  while ((wQtd <> 1) and (wQtd1 < wQtd)) do
                  begin
                    if wcont = 1 then
                    begin
                      if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                        QREtiqCodBarraProducaoNUM_VOLUMES.Text := '1';
                      QEtiqueta.Insert;
                      QEtiquetaETIQUETA1.Value := Bib.StrZero(IntToStr(DMSequencia.Sequencia(1, 'PRODUCAO-CGS')), 6) +
                        Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text, 6) +
                        QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                    end;

                    if wcont = 2 then
                    begin
                      if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                        QREtiqCodBarraProducaoNUM_VOLUMES.Text := '1';
                      QEtiquetaETIQUETA2.Value := Bib.StrZero(IntToStr(DMSequencia.Sequencia(1, 'PRODUCAO-CGS')), 6) +
                        Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text, 6) +
                        QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                    end;

                    if wcont = 3 then
                    begin
                      if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                        QREtiqCodBarraProducaoNUM_VOLUMES.Text := '1';
                      QEtiquetaETIQUETA3.Value := Bib.StrZero(IntToStr(DMSequencia.Sequencia(1, 'PRODUCAO-CGS')), 6) +
                        Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text, 6) +
                        QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                    end;

                    if wcont = 4 then
                    begin
                      if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                        QREtiqCodBarraProducaoNUM_VOLUMES.Text := '1';
                      QEtiquetaETIQUETA4.Value := Bib.StrZero(IntToStr(DMSequencia.Sequencia(1, 'PRODUCAO-CGS')), 6) +
                        Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text, 6) +
                        QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                    end;

                    if wcont = 5 then
                    begin
                      if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                        QREtiqCodBarraProducaoNUM_VOLUMES.Text := '1';
                      QEtiquetaETIQUETA5.Value := Bib.StrZero(IntToStr(DMSequencia.Sequencia(1, 'PRODUCAO-CGS')), 6) +
                        Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text, 6) +
                        QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                      QEtiqueta.Post;
                    end;

                    if wcont = 5 then
                    begin
                      wCont := 1;
                      inc(wQtd1);
                    end
                    else
                    begin
                      inc(wcont);
                      inc(wQtd1);
                    end;
                  end;
                  wQtd1 := 0;
                end
                else
                begin
                  if wcont = 1 then
                  begin
                    if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                      QREtiqCodBarraProducaoNUM_VOLUMES.Text := '1';
                    QEtiqueta.Insert;
                    QEtiquetaETIQUETA1.Value := Bib.StrZero(IntToStr(DMSequencia.Sequencia(1, 'PRODUCAO-CGS')), 6) +
                      Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text, 6) +
                      QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                  end;

                  if wcont = 2 then
                  begin
                    if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                      QREtiqCodBarraProducaoNUM_VOLUMES.Text := '1';
                    QEtiquetaETIQUETA2.Value := Bib.StrZero(IntToStr(DMSequencia.Sequencia(1, 'PRODUCAO-CGS')), 6) +
                      Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text, 6) +
                      QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                  end;

                  if wcont = 3 then
                  begin
                    if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                      QREtiqCodBarraProducaoNUM_VOLUMES.Text := '1';
                    QEtiquetaETIQUETA3.Value := Bib.StrZero(IntToStr(DMSequencia.Sequencia(1, 'PRODUCAO-CGS')), 6) +
                      Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text, 6) +
                      QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                  end;

                  if wcont = 4 then
                  begin
                    if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                      QREtiqCodBarraProducaoNUM_VOLUMES.Text := '1';
                    QEtiquetaETIQUETA4.Value := Bib.StrZero(IntToStr(DMSequencia.Sequencia(1, 'PRODUCAO-CGS')), 6) +
                      Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text, 6) +
                      QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                  end;

                  if wcont = 5 then
                  begin
                    if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                      QREtiqCodBarraProducaoNUM_VOLUMES.Text := '1';
                    QEtiquetaETIQUETA5.Value := Bib.StrZero(IntToStr(DMSequencia.Sequencia(1, 'PRODUCAO-CGS')), 6) +
                      Bib.StrZero(QREtiqCodBarraProducaoCOD_PRODUTO.Text, 6) +
                      QREtiqCodBarraProducaoNUM_VOLUMES.Text;
                    QEtiqueta.Post;
                  end;

                  if wcont = 5 then
                    wCont := 1
                  else
                    inc(wcont);
                end;
              end;
              QREtiqCodBarraProducao.Next;
            end;
            DMOracle.DBCemapa.Commit;
          except
            ShowMessage('Erro na Gravação do Lançamento da Produção');
            DMOracle.DBCemapa.Rollback;
            raise;
          end;
          if FREtiqCodBarra_Producao = nil then
            FREtiqCodBarra_Producao := TFREtiqCodBarra_Producao.Create(Application);
          FREtiqCodBarra_Producao.QuickRep1.Preview;
          QREtiqCodBarraProducao.Close;
        end;
      end

      else //aqui faz a impressao de etiquetas para o embarque da cgs

      begin
        with DMEmbarque do
        begin
          QEtiqueta.Close;
          QEtiqueta.open;
          if QEtiqueta.RecordCount > 0 then
          begin
            QEtiqueta.First;
            while not QEtiqueta.Eof do
              QEtiqueta.Delete;
          end;
        end;

        with DMEmbarque do
        begin
          QREtiqCodBarraEmbarque.Close;
          QREtiqCodBarraProducao.Close;
          if FEmbarqueParam.ME17Embarque.Text <> '      ' then
            QREtiqCodBarraProducao.SetVariable('EMBARQUE', FEmbarqueParam.ME17Embarque.Text)
          else
            raise Exception.Create('É preciso informar o embarque!');
          QREtiqCodBarraProducao.SetVariable('CLASSE', Null);

          QREtiqCodBarraProducao.Open;
          QREtiqCodBarraProducao.First;

          while not QREtiqCodBarraProducao.Eof do
          begin
            if StrToFloat(QREtiqCodBarraProducaoNUM_VOLUMES.Text) < 1 then
              QREtiqCodBarraProducaoNUM_VOLUMES.Text := '1';
            wProduto := QREtiqCodBarraProducaoCOD_PRODUTO.Text;
            wQtd := StrToInt(QREtiqCodBarraProducaoQT_PEDIDO.Text) * StrToInt(QREtiqCodBarraProducaoNUM_VOLUMES.Text);

            if ((wQtd <> 1) and (wQtd1 < wQtd)) then
            begin
              while ((wQtd <> 1) and (wQtd1 < wQtd)) do
              begin
                if QREtiqCodBarraEmbarqueCOD_PRODUTO.Text <> wProduto then
                begin
                  QREtiqCodBarraEmbarque.close;
                  QREtiqCodBarraEmbarque.SetVariable('PRODUTO', wProduto);
                  QREtiqCodBarraEmbarque.Open;
                  QREtiqCodBarraEmbarque.First;
                end;
                if QREtiqCodBarraEmbarqueNUM_VOLUMES.Value < 1 then
                  QREtiqCodBarraEmbarqueNUM_VOLUMES.Text := '1';
                if wcont = 1 then
                begin
                  if ((QREtiqCodBarraEmbarqueNUM_VOLUMES.Text <= '1') or (wCont3 = 0)
                    or (wCont3 > QREtiqCodBarraEmbarqueNUM_VOLUMES.Value)) then
                    wCont3 := 1;
                  QEtiqueta.Insert;
                  QEtiquetaETIQUETA1.Value := Bib.StrZero(QREtiqCodBarraEmbarqueNUM_CONTROLE.Text, 6) +
                    Bib.StrZero(QREtiqCodBarraEmbarqueCOD_PRODUTO.Text, 6) +
                    IntToStr(wCont3) + QREtiqCodBarraEmbarqueNUM_VOLUMES.Text;
                  inc(wCont3);
                end;

                if wcont = 2 then
                begin
                  if ((QREtiqCodBarraEmbarqueNUM_VOLUMES.Text <= '1') or (wCont3 = 0)
                    or (wCont3 > QREtiqCodBarraEmbarqueNUM_VOLUMES.Value)) then
                    wCont3 := 1;
                  QEtiquetaETIQUETA2.Value := Bib.StrZero(QREtiqCodBarraEmbarqueNUM_CONTROLE.Text, 6) +
                    Bib.StrZero(QREtiqCodBarraEmbarqueCOD_PRODUTO.Text, 6) +
                    IntToStr(wCont3) + QREtiqCodBarraEmbarqueNUM_VOLUMES.Text;
                  inc(wCont3);
                end;

                if wcont = 3 then
                begin
                  if ((QREtiqCodBarraEmbarqueNUM_VOLUMES.Text <= '1') or (wCont3 = 0)
                    or (wCont3 > QREtiqCodBarraEmbarqueNUM_VOLUMES.Value)) then
                    wCont3 := 1;
                  QEtiquetaETIQUETA3.Value := Bib.StrZero(QREtiqCodBarraEmbarqueNUM_CONTROLE.Text, 6) +
                    Bib.StrZero(QREtiqCodBarraEmbarqueCOD_PRODUTO.Text, 6) +
                    IntToStr(wCont3) + QREtiqCodBarraEmbarqueNUM_VOLUMES.Text;
                  QEtiqueta.Post;
                  inc(wCont3);
                end;
                QREtiqCodBarraEmbarque.Next;
                if wcont = 3 then
                begin
                  wCont := 1;
                  inc(wQtd1);
                end
                else
                begin
                  inc(wcont);
                  inc(wQtd1);
                end;
              end;
              QREtiqCodBarraProducao.Next;
              wQtd1 := 0;
            end
            else
            begin
              if QREtiqCodBarraEmbarqueCOD_PRODUTO.Text <> wProduto then
              begin
                QREtiqCodBarraEmbarque.close;
                QREtiqCodBarraEmbarque.SetVariable('PRODUTO', wProduto);
                QREtiqCodBarraEmbarque.Open;
                QREtiqCodBarraEmbarque.First;
              end;
              if wcont = 1 then
              begin
                if ((QREtiqCodBarraEmbarqueNUM_VOLUMES.Text <= '1') or (wCont3 = 0)
                  or (wCont3 > QREtiqCodBarraEmbarqueNUM_VOLUMES.Value)) then
                  wCont3 := 1;
                QEtiqueta.Insert;
                QEtiquetaETIQUETA1.Value := Bib.StrZero(QREtiqCodBarraEmbarqueNUM_CONTROLE.Text, 6) +
                  Bib.StrZero(QREtiqCodBarraEmbarqueCOD_PRODUTO.Text, 6) +
                  IntToStr(wCont3) + QREtiqCodBarraEmbarqueNUM_VOLUMES.Text;
                inc(wCont3);
              end;

              if wcont = 2 then
              begin
                if ((QREtiqCodBarraEmbarqueNUM_VOLUMES.Text <= '1') or (wCont3 = 0)
                  or (wCont3 > QREtiqCodBarraEmbarqueNUM_VOLUMES.Value)) then
                  wCont3 := 1;
                QEtiquetaETIQUETA2.Value := Bib.StrZero(QREtiqCodBarraEmbarqueNUM_CONTROLE.Text, 6) +
                  Bib.StrZero(QREtiqCodBarraEmbarqueCOD_PRODUTO.Text, 6) +
                  IntToStr(wCont3) + QREtiqCodBarraEmbarqueNUM_VOLUMES.Text;
                inc(wCont3);
              end;

              if wcont = 3 then
              begin
                if ((QREtiqCodBarraEmbarqueNUM_VOLUMES.Text <= '1') or (wCont3 = 0)
                  or (wCont3 > QREtiqCodBarraEmbarqueNUM_VOLUMES.Value)) then
                  wCont3 := 1;
                QEtiquetaETIQUETA3.Value := Bib.StrZero(QREtiqCodBarraEmbarqueNUM_CONTROLE.Text, 6) +
                  Bib.StrZero(QREtiqCodBarraEmbarqueCOD_PRODUTO.Text, 6) +
                  IntToStr(wCont3) + QREtiqCodBarraEmbarqueNUM_VOLUMES.Text;
                QEtiqueta.Post;
                inc(wCont3);
              end;
              QREtiqCodBarraEmbarque.Next;
              if wcont = 3 then
                wCont := 1
              else
                inc(wcont);
              QREtiqCodBarraProducao.Next;
            end;
          end;

          try
            DMOracle.DBCemapa.StartTransaction;
            with DMEmbarque do
            begin
              QREtiqCodBarraEmbarque.Close;
              QREtiqCodBarraProducao.Close;
              if FEmbarqueParam.ME17Embarque.Text <> '      ' then
                QREtiqCodBarraProducao.SetVariable('EMBARQUE', FEmbarqueParam.ME17Embarque.Text)
              else
                raise Exception.Create('É preciso informar o embarque!');

              QREtiqCodBarraProducao.Open;
              QREtiqCodBarraProducao.First;

              while not QREtiqCodBarraProducao.Eof do
              begin
                if ((wCont2 <> 0) and (wCont2 < wQtd)) then
                  raise Exception.Create('Produto ' + wProduto + ' Não disponível para Embarque');
                wCont1 := 0;
                wCont2 := 0;
                wProduto := QREtiqCodBarraProducaoCOD_PRODUTO.Text;
                if (QREtiqCodBarraProducaoNUM_VOLUMES.Text < '1') then
                  wVolume := 1
                else
                  wVolume := StrToInt(QREtiqCodBarraProducaoNUM_VOLUMES.Text);
                wQtd := StrToInt(QREtiqCodBarraProducaoQT_PEDIDO.Text) * wVolume;

                QREtiqCodBarraEmbarque.close;
                QREtiqCodBarraEmbarque.SetVariable('PRODUTO', wProduto);
                QREtiqCodBarraEmbarque.Open;
                QREtiqCodBarraEmbarque.First;

                if QREtiqCodBarraEmbarqueNUM_LINHA.Text <> '1' then
                  raise exception.create('Produto ' + wProduto + ' Não disponível para Embarque');
                while ((not QREtiqCodBarraEmbarque.Eof) and (wQtd > wCont2)) do
                begin
                  DMEstoque.QEstoqueProducao.Close;
                  DMEstoque.QEstoqueProducao.SetVariable('PK', QREtiqCodBarraEmbarqueCOD_ESTOQUE_PRODUCAO.Value);
                  DMEstoque.QEstoqueProducao.open;
                  DMEstoque.QEstoqueProducao.Edit;
                  DMEstoque.QEstoqueProducaoNUM_LINHA.Value := 2;
                  DMEstoque.QEstoqueProducaoCOD_EMBARQUE.Value := QREtiqCodBarraProducaoCOD_EMBARQUE.Value;
                  DMEstoque.QEstoqueProducao.Post;
                  inc(wCont2);
                  QREtiqCodBarraEmbarque.next
                end;
                QREtiqCodBarraProducao.next;
              end;
            end;
            if ((wCont2 <> 0) and (wCont2 < wQtd)) then
              raise Exception.Create('Produto ' + wProduto + ' Não disponível para Embarque');
            DmOracle.DBCemapa.Commit;
          except
            DmOracle.DBCemapa.Rollback;
            raise;
          end;
        end;
        if FREtiqCodBarra_Embarque = nil then
          FREtiqCodBarra_Embarque := TFREtiqCodBarra_Embarque.Create(Application);
        FREtiqCodBarra_Embarque.QuickRep1.Preview;
        DMEmbarque.QREtiqCodBarraProducao.Close;
      end;
    end;
    DMOracle.DBCemapa.Commit;
  end;
end;

procedure TFEmbarqueCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMEmbarque.QEmbarque;

  PageControl1.ActivePage := TabSheet1;
end;

procedure TFEmbarqueCad.SituaoAcerto1Click(Sender: TObject);
begin
  inherited;
  if FSituacaoAcerto = nil then
    FSituacaoAcerto := TFSituacaoAcerto.create(application);
  FSituacaoAcerto.showModal;
end;

procedure TFEmbarqueCad.BaixaEstoque1Click(Sender: TObject);
begin
  inherited;
  if DmParamSistema.CodEmpresa = 'ABATE' then
  begin
    if (GetKeyState(VK_CONTROL) < 0) and (GetKeyState(VK_SHIFT) < 0) then
    begin
      if FBaixaEstoqueLeitor = nil then
        FBaixaEstoqueLeitor := TFBaixaEstoqueLeitor.Create(Application);
      FBaixaEstoqueLeitor.ShowModal;
    end
    else
    begin
      if FBaixaEstoqueLeitor2 = nil then
        FBaixaEstoqueLeitor2 := TFBaixaEstoqueLeitor2.Create(Application);
      FBaixaEstoqueLeitor2.ShowModal;
      SBRefreshClick(Sender);
    end;
  end
  else
  begin
    if FBaixaEstoqueLeitorGeral = nil then
      FBaixaEstoqueLeitorGeral := TFBaixaEstoqueLeitorGeral.Create(Application);
    FBaixaEstoqueLeitorGeral.ShowModal;
  end;
end;

procedure TFEmbarqueCad.ExcluiMovimentos(wCodigo: Integer);
begin
  with DMContasPagar do
  begin
    QContasPagar_Cab.Close; // volta contas a pagar do frete
    QContasPagar_Mov.Close;
    QContasPagar_Cab.SetVariable('Pk', wCodigo);
    QContasPagar_Cab.Open;
    QContasPagar_Mov.Open;
    while not QContasPagar_Cab.Eof do
    begin
      if (QContasPagar_MovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
        raise Exception.Create('Conta a Pagar com baixas!')
      else
        QContasPagar_Mov.Delete;
      QContasPagar_Cab.Delete;
    end;
  end;
end;

procedure TFEmbarqueCad.GeraContasPagar(wValor: Real; wTipo: string; wFinalidade, wNumero: Integer);
begin
  with DMContasPagar do
  begin
    QContasPagar_Mov.Close;
    QContasPagar_cab.Close;
    QContasPagar_cab.Open;
    QContasPagar_Mov.Open;
    QContasPagar_Cab.Insert;
    QContasPagar_cabCod_Finalidade.Value := wFinalidade;
    if Trim(FConhecimento_CP.MECodBanco.Text) <> '' then
      QContasPagar_CabCOD_BANCO_AGENCIA.Value := StrToInt(Trim(FConhecimento_CP.MECodBanco.text));
    if Trim(FConhecimento_CP.MECodDepartamento.Text) <> '' then
      QContasPagar_CabCOD_Departamento.Value := StrToInt(Trim(FConhecimento_CP.MECodDepartamento.text));
    QContasPagar_CabCod_Cadastro.Value := DMEmbarque.QEmbarqueCod_Transportador.Value;
    QContasPagar_CabCod_Filial.Value := 1;
    QContasPagar_CabDesc_tipo_Documento.Value := wTipo;
    QContasPagar_CabDT_EMISSAO.Value := Date;
    QContasPagar_CabDT_VENCIMENTO.Value := DMEmbarque.QEmbarqueDT_Vencimento.value;
    QContasPagar_CabVAL_TITULO.Value := wValor;
    QContasPagar_CabNUM_TITULO.Value := wNumero;
    QContasPagar_CabIND_ACEITE.Value := 'NAO';
    QContasPagar_CabIND_SITUACAO.Value := 'ABERTO';
    QContasPagar_Cab.Post;
  end;
end;

procedure TFEmbarqueCad.GeraContasPagarAdiantamento1Click(Sender: TObject);
begin
  inherited;
  with DMEmbarque do
  begin
    if FConhecimento_CP = nil then
      FConhecimento_CP := TFConhecimento_CP.Create(Application);
    FConhecimento_CP.BitBtn1.Visible := False;
    FConhecimento_CP.Label1.Caption := 'Adiantamento';
    FConhecimento_CP.LblPedagio.Visible := False;
    FConhecimento_CP.MeCodFinalidadePedagio.Visible := False;
    FConhecimento_CP.SbPedagio.Visible := False;
    FConhecimento_CP.MeFinalidadePedagio.Visible := False;

    if FConhecimento_CP.ShowModal = MrOk then
    begin
      DMOracle.DBCemapa.StartTransaction;
      try
        if DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value > 0 then
          GeraContasPagar(DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value, 'ADT', StrToInt(Trim(FConhecimento_CP.MECodFinalidade.Text)), DMEmbarque.QEmbarqueCOD_EMBARQUE.Value);
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_EMBARQUE SET Cod_Conta_Pagar_Cab_Adto = ' + DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Text);
        DMOracle.QExecSQL.SQL.Add(' WHERE COD_EMBARQUE = ' + Trim(DMEmbarque.QEmbarqueCOD_EMBARQUE.Text));
        DMOracle.QExecSQL.ExecSQL;
        DMContasPagar.QContasPagar_Mov.Close;
        DMContasPagar.QContasPagar_cab.Close;
        DMOracle.DBCemapa.Commit;
        QEmbarque.Close;
        QEmbarque.Open;
      except
        DMEmbarque.QEmbarque.Cancel;
        DMContasPagar.QContasPagar_Cab.Cancel;
        DMContasPagar.QContasPagar_Mov.Cancel;
        DMOracle.DBCemapa.Rollback;
        raise Exception.Create('Não foi possivel gerar contas a pagar!');
      end;
    end;
  end;
end;

procedure TFEmbarqueCad.VoltaAdiantamentoContasPagar1Click(
  Sender: TObject);
begin
  inherited;
  DMEmbarque.pApagando := true;
  if DMEmbarque.QEmbarqueCod_Embarque.Value <> 0 then
  begin
    if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMEmbarque.QEmbarqueDt_Embarque.Value then
      raise Exception.Create('Não é Permitido excluir este Frete - Fechamento Financeiro');
    DMOracle.DBCemapa.StartTransaction;
    try
      if DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Adto.Text <> '' then // volta contas a pagar do adiantamento
        ExcluiMovimentos(DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Adto.Value); // volta contas a pagar do frete Adiantamento
      DMEmbarque.QEmbarque.Edit;
      DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Adto.Text := '';
      DMEmbarque.QEmbarque.Post;
      DMOracle.DBCemapa.Commit;
      showmessage('Contas a Pagar foi excluido com sucesso.');
    except
      showmessage('Não foi possivel excluir o Contas a Pagar');
      DMOracle.DBCemapa.Rollback;
      DMContasPagar.QContasPagar_Cab.Close;
      DMContasPagar.QContasPagar_Mov.Close;
      DMEmbarque.QEmbarque.Close;
      DMEmbarque.QEmbarque.Open;
      raise;
    end;
  end;
  DMEmbarque.pApagando := false;
end;

procedure TFEmbarqueCad.DBEdit30Exit(Sender: TObject);
begin
  inherited;
  DBEdit25Exit(self);
end;

procedure TFEmbarqueCad.InsereNf(wFilial, wCadastro, wOperacao, wVendedor, wNr_Dias_Cheque, wNr_Dias_Cheque1, wNr_Dias_Cheque2, wNr_Dias_Cheque3, wNr_Dias_Cheque4,
  wTransportador, wCodMensagem, wDepartamento, wNum_Pedido, wCod_Prazo: Integer;
  wPerc_Comissao_Nota, wVal_Desconto: Real;
  wTipo_Pagamento, wTipo_Frete, wComplemento_Obs, wObservacao, wConsumidorFinal: string);
var
  wTipoNota: string;
begin
  with DMNotaSaida do
  begin
    QNotaSaida.Insert;

    QNotaSaidaIND_CONSUMIDOR_FINAL.Value := wConsumidorFinal;
    QNotaSaidaCod_Filial.Value := wFilial;
    QNotaSaidaCod_Cadastro.Value := wCadastro;
    if (wTipo_Pagamento = 'A VISTA') or (wTipo_Pagamento = '1') then
      QNotaSaidaInd_Condicao_Pagto.Value := '1'
    else if (wTipo_Pagamento = 'A PRAZO') or (wTipo_Pagamento = '2') then
      QNotaSaidaInd_Condicao_Pagto.Value := '2'
    else
      QNotaSaidaInd_Condicao_Pagto.Value := '3';
    if FEmbarqueParam.RG4ImpressaoData.ItemIndex = 0 then
      QNotaSaidaInd_Imprime_Cab.Text := 'S'
    else
      QNotaSaidaInd_Imprime_Cab.Text := 'N';
    QNotaSaidaCod_Operacao.Value := wOperacao;
    QNotaSaidaInd_Tipo_Frete.Value := wTipo_Frete;
    wTipoNota := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO', 'COD_OPERACAO = ' + FloatToStr(wOperacao));

    /// Modificado por Djeison - 10/07/2013
    /// Puxar também o modelo não somente Série
   { if wTipoNota = 'F' then // Nota Fiscal //comentado marcos 17/07/2013 para sempre pegar da operação
    begin
      if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'MOINHO' then
      begin
        QNotaSaidaCod_Serie.Value := DMUsuario.CodSeriePadrao;
        QNotaSaidaCOD_SERIE_MODELO.Value := DMUsuario.CodSerieModeloPadrao;
      end else
      begin
        QNotaSaidaCod_Serie.Value := DMParamSistema.QParamSistemaCod_Serie_Nota.Value;
        QNotaSaidaCOD_SERIE_MODELO.Value := DMParamSistema.
          QParamSistemaCOD_SERIE_MODELO_NOTA.Value;
      end;
    end
    else
    begin }
      /// Djeison - 10/07/2013 - Trazer Série e Modelo da Operação
      QNotaSaidaCOD_SERIE_MODELO.Value :=
        DMOracle.BuscaNome('SELECT COD_SERIE_MODELO FROM TB_OPERACAO', 'COD_OPERACAO = ' + FloatToStr(wOperacao));
      QNotaSaidaCod_Serie.Value :=
        DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_OPERACAO', 'COD_OPERACAO = ' + FloatToStr(wOperacao));
    //end;
    QNotaSaidaPerc_Comissao.Value := wPerc_Comissao_Nota;
    QNotaSaidaCod_Vendedor.Value := wVendedor;
    QNotaSaidaVal_Desconto.Value := wVal_Desconto;
    QNotaSaidaNr_Dias_Cheque.Value := wNr_Dias_Cheque;
    QNotaSaidaNr_Dias_Cheque1.Value := wNr_Dias_Cheque1;
    QNotaSaidaNr_Dias_Cheque2.Value := wNr_Dias_Cheque2;
    QNotaSaidaNr_Dias_Cheque3.Value := wNr_Dias_Cheque3;
    QNotaSaidaNr_Dias_Cheque4.Value := wNr_Dias_Cheque4;
    QNotaSaidaDt_Recebimento.Value := StrToDate(Trim(FEmbarqueParam.Me3DtSaida.Text));
    QNotaSaidaObs_Complemento.Text := wComplemento_Obs;
    if DmParamSistema.QParamSistemaCod_Empresa.Value = 'POLLYANA' then
      QNotaSaidaObs.Text := wObservacao;
    QNotaSaidaCod_Transportador.Value := wTransportador;
    QNotaSaidaDesc_Placa.Value := Trim(FEmbarqueParam.Ed3Placa.Text);
    if wCodMensagem <> 0 then
      QNotaSaidaCod_Mensagem.Value := wCodMensagem;
    if wDepartamento <> 0 then
      QNotaSaidaCod_Departamento.Value := wDepartamento;
    QNotaSaidaNum_Pedido.Value := wNum_Pedido;
    QNotaSaidaCod_Prazo_Vencimento.Value := wCod_Prazo;
  end;
end;

procedure TFEmbarqueCad.InsereItensNf(wProduto, wTributacao, wCod_Lote_Tipo, wCod_Cultura, wCod_Cfop : Integer;
  wQuant, wUnitario, wPerc_Desconto_Item, wPerc_Comissao_Itens, wPerc_Sub: Real;
  wPerc_Desconto1, wPerc_Desconto2, wPerc_Acrescimo, wInfAdicional: string);
var
  wLoteTipo: string;
  cstPis, wCstPisOperacao: String;
  cstCofins, wCstCofinsOperacao: String;
  wTotal: Real;
begin
  with DMNotaSaida do
  begin
    QItemNF.Insert;
    QItemNFCod_Produto.Value := wProduto;
    QItemNFQt_Quantidade.Value := wQuant;
    if wPerc_Desconto_Item > 0 then
      QItemNFVal_Unitario.Value := wUnitario - (wUnitario * wPerc_Desconto_Item / 100)
    else
      QItemNFVal_Unitario.Value := wUnitario;
    if wPerc_Desconto1 <> '' then
      QItemNFVal_Unitario.Value := QItemNFVal_Unitario.Value - (QItemNFVal_Unitario.Value * StrToFloat(wPerc_Desconto1) / 100);
    if wPerc_Desconto2 <> '' then
      QItemNFVal_Unitario.Value := QItemNFVal_Unitario.Value - (QItemNFVal_Unitario.Value * StrToFloat(wPerc_Desconto2) / 100);
    if wPerc_Acrescimo <> '' then
      QItemNFVal_Unitario.Value := QItemNFVal_Unitario.Value + (QItemNFVal_Unitario.Value * StrToFloat(wPerc_Acrescimo) / 100);
    QItemNFCod_Tributacao.Value := wTributacao;
    if wCod_Cfop <> 0 then
      QItemNFCOD_CFOP.Value := wCod_Cfop;
    QItemNFCod_Lote_Tipo.Value := wCod_Lote_Tipo;
    QItemNFCod_Cultura.Value := wCod_Cultura;
    if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') and
      (wCod_Lote_Tipo = 1) then
    begin
      if DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCod_Operacao.Text) = 'F' then
      begin
        wLoteTipo := DMOracle.BuscaNome('SELECT COD_LOTE_TIPO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value));
        if wLoteTipo <> '' then
          QItemNFCod_Lote_Tipo.Value := StrToInt(wLoteTipo);
      end;
    end;
    // CST pis e Cofins da operacao
    wCstPisOperacao := DMOracle.BuscaNome('Select cod_cst_pis from tb_operacao', 'cod_operacao = ' + QNotaSaidaCod_Operacao.Text);
    wCstCofinsOperacao := DMOracle.BuscaNome('Select cod_cst_cofins from tb_operacao', 'cod_operacao = ' + QNotaSaidaCod_Operacao.Text);
    if wCstPisOperacao <> '' then
       QItemNFCOD_CST_PIS.Text := wCstPisOperacao;
    if wCstCofinsOperacao <> '' then
       QItemNFCOD_CST_COFINS.Text := wCstCofinsOperacao;

    // Quando não preenchido com dados da operacao busca no produto - César 16/08/2018
    cstPis := DMOracle.BuscaNome('SELECT COD_CST_PIS_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+ IntToStr(wProduto));
    if (CstPis <> '') And (wCstPisOperacao = '') then
    begin
      QItemNFCOD_CST_PIS.Value := cstPis;
    end;

    cstCofins := DMOracle.BuscaNome('SELECT COD_CST_COFINS_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+ IntToStr(wProduto));
    if (cstCofins <> '') And (wCstCofinsOperacao = '') then
    begin
      QItemNFCOD_CST_COFINS.Value := cstCofins;
    end;

    QItemNFPerc_Comissao.Value := wPerc_Comissao_Itens;
    if QItemNFPerc_Comissao.Value = 0 then
      QItemNFPerc_Comissao.Value := QNotaSaidaPerc_Comissao.Value;
    if QItemNFQt_Quantidade.Value = 0 then
      QItemNFVal_Total.Value := QItemNFVal_Unitario.Value
    else
      QItemNFVal_Total.Value := QItemNFQt_Quantidade.Value * QItemNFVal_Unitario.Value;
    if wPerc_Sub > 0 then
    begin
      Inc(wind_tb);
      wTbComissao[wind_tb] := QItemNFPerc_Comissao.Value;
      wTotal := QItemNFVal_Total.Value * wPerc_Sub / 100;
      wTbValor[wind_tb] := Trunc(wTotal * 100) / 100;
      wTbProduto[wind_tb] := wProduto;
      QItemNFVal_Total.Value := QItemNFVal_Total.Value - wTbValor[wind_tb];
      if QItemNFQt_Quantidade.Value = 0 then
        QItemNFVal_Unitario.Value := QItemNFVal_Total.Value
      else
        QItemNFVal_Unitario.Value := QItemNFVal_Total.Value / QItemNFQt_Quantidade.Value;
    end;
    //QT_Embalagem do item do pedido vai para as Inf. Adicionais do item na Nota Venda. Solicitação Marcos. Junior - 01/07/2015
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'POLLYANA' then
    begin
      QItemNFDESC_INF_ADICIONAL.Value := wInfAdicional;
    end;
    QItemNF.Post;
  end;

end;

procedure TFEmbarqueCad.Emite_Recibo_Frete(wValor: Real; wComplemento: string);
begin
  if FRRecibo = nil then
    FRRecibo := TFRRecibo.Create(Application);

  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK', 1);
  DMFilial.QFilial.Open;
  FRRecibo.QRLRecebido.Caption := DMFilial.QFilialDesc_Filial.Value;
  FRRecibo.QRLDataEmissao.Caption := DateToStr(DMEmbarque.QEmbarqueDt_Embarque.Value);
  FRRecibo.QRLValor.Caption := FormatFloat('#,##0.00', wValor);
  FRRecibo.QRLValor_Juros.Caption := '0,00';
  FRRecibo.QRLValor_Baixa.Caption := FormatFloat('#,##0.00', wValor);
  FRRecibo.QRLDesconto.Caption := '0.00';
  FRRecibo.QRLValorExtenso.Caption := Bib.Extenso(wValor, 'REAL');
  FRRecibo.QRLDescricao.Caption := 'Pagamento de ' + wComplemento + ' de Frete - DESTINO:' +
    DMEmbarque.QEmbarqueDESC_DESTINO_FRETE.Text;
  FRRecibo.QRLData.Caption := FormatDateTime(', dd "de" mmmm "de" yyyy', DMEmbarque.QEmbarqueDt_Embarque.Value);
  FRRecibo.QRLResponsavel.Caption := DMEmbarque.QEmbarqueCOD_TRANSPORTADOR.text + ' - ' + DMEmbarque.QEmbarquenome_transportador.text;
  FRRecibo.QRLResponsavel2.Caption := DMEmbarque.QEmbarquenome_motorista.Text;
  FRRecibo.QRDBTitulo.DataSet := DMEmbarque.QEmbarque;
  FRRecibo.QRDBTitulo.DataField := 'COD_EMBARQUE';
  FRRecibo.QRDBVenc.DataSet := DMEmbarque.QEmbarque;
  FRRecibo.QRDBVenc.DataField := 'DT_VENCIMENTO';
  FRRecibo.QRDBCod_Conta.DataSet := DMEmbarque.QEmbarque;
  FRRecibo.QRDBCod_Conta.DataField := 'COD_EMBARQUE';
  FRRecibo.QuickRep1.Preview;
end;

procedure TFEmbarqueCad.Emite_Conhecimento_Frete(wVal_Frete, wVal_Icms, wVal_Ajuda, wVal_Pedagio, wAdiantamento: Real; wComplemento: string);
begin
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK', 1);
  DMFilial.QFilial.Open;

  if FRReciboFrete = nil then
    FRReciboFrete := TFRReciboFrete.Create(Application);

  FRReciboFrete.QRLTitulo.Caption := wComplemento;
  FRReciboFrete.QRLFilial.Caption := DMFilial.QFilialDesc_Filial.Value;
  FRReciboFrete.QRLCarga.Caption := IntToStr(DMEmbarque.QEmbarqueCod_Embarque.Value);
  FRReciboFrete.QRLDtSaida.Caption := DateToStr(DMEmbarque.QEmbarqueDt_Embarque.Value);
  FRReciboFrete.QRLVencimento.Caption := DateToStr(DMEmbarque.QEmbarqueDt_Vencimento.Value);
  FRReciboFrete.QRLTransportador.Caption := DMEmbarque.QEmbarquenome_transportador.Text + ' - ' + DMEmbarque.QEmbarqueCod_Transportador.Text;
  FRReciboFrete.QRLMotorista.Caption := DMEmbarque.QEmbarqueNome_Motorista.Text;
  FRReciboFrete.QRLDestino.Caption := DMEmbarque.QEmbarqueDesc_Destino_Frete.Text;
  FRReciboFrete.QRLKMSaida.Caption := DMEmbarque.QEmbarqueNUM_KILOMETRAGEM.Text;
  FRReciboFrete.QRLKMChegada.Caption := DMEmbarque.QEmbarqueNUM_KILOMETRAGEM_CHEGADA.Text;
  if (DMEmbarque.QEmbarqueNUM_KILOMETRAGEM_CHEGADA.Text <> '') and (DMEmbarque.QEmbarqueNUM_KILOMETRAGEM.Text <> '') then
    FRReciboFrete.QRLKMTotal.Caption := FloatToStr(StrToFloat(DMEmbarque.QEmbarqueNUM_KILOMETRAGEM_CHEGADA.Value) - StrToFloat(DMEmbarque.QEmbarqueNUM_KILOMETRAGEM.Value));
  FRReciboFrete.QRLValorFrete.Caption := FormatFloat('#,##0.00', wVal_Frete);
  FRReciboFrete.QRLValorICMS.Caption := FormatFloat('#,##0.00', wVal_Icms);
  FRReciboFrete.QRLAjudaCusto.Caption := FormatFloat('#,##0.00', wVal_Ajuda);
  FRReciboFrete.QRLValorAdiantamento.Caption := FormatFloat('#,##0.00', DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value);
  FRReciboFrete.QRLValor_Pagamento.Caption := FormatFloat('#,##0.00', DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value - DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value);
  //FRReciboFrete.QRLValor_Pagamento.Caption   := FormatFloat('#,##0.00',wVal_Frete+wVal_Icms+wVal_Ajuda+wVal_Pedagio);
  FRReciboFrete.QRLVlrPedagio.Caption := FormatFloat('#,##0.00', wVal_Pedagio);
  FRReciboFrete.QRLVlrTotal.Caption := FormatFloat('#,##0.00', {wVal_Frete+} wVal_Icms + wVal_Ajuda + wVal_Pedagio + DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value - DMEmbarque.QEmbarqueVAL_MANIFESTO.Value);
  FRReciboFrete.QRLNumConhecimento.Caption := IntToStr(DMEmbarque.QEmbarqueCod_Embarque.Value);
  FRReciboFrete.QRLObs.Caption := DMEmbarque.QEmbarqueDesc_Obs.Value;
  FRReciboFrete.QRLValorCarga.Caption := FormatFloat('#,##0.00', DMEmbarque.QCalculaValorCargaVAL_CARGA.Value);
  if DMEmbarque.QCalculaValorCargaVAL_CARGA.Value > 0 then
    FRReciboFrete.QRLPerc.Caption := FormatFloat('#,##0.00', (DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value +
                                                         {DMEmbarque.QEmbarqueVAL_FRETE_COMPLEMENTO.Value +
                                                         DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value +}
      DMEmbarque.QEmbarqueVAL_AJUDA_CUSTO.Value +
      DMEmbarque.QEmbarqueVAL_PEDAGIO.Value) / DMEmbarque.QCalculaValorCargaVAL_CARGA.Value * 100)
  else
    FRReciboFrete.QRLPerc.Caption := '0,00';
  FRReciboFrete.qrlNumManifesto.Caption := DMEmbarque.QEmbarqueNUM_MANIFESTO.Text;
  FRReciboFrete.qrlValorManifesto.Caption := FormatFloat('#,##0.00', DMEmbarque.QEmbarqueVAL_MANIFESTO.Value);
  FRReciboFrete.qrlFreteComplemento.Caption := FormatFloat('#,##0.00', DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value - DMEmbarque.QEmbarqueVAL_MANIFESTO.Value - DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value);
  FRReciboFrete.QRLVlrTotal.Caption := FormatFloat('#,##0.00', wVal_Icms + wVal_Ajuda + wVal_Pedagio + DMEmbarque.QEmbarqueVAL_TOTAL_FRETE.Value - DMEmbarque.QEmbarqueVAL_ADTO_FRETE.Value);

  DMEmbarque.QRParamSistema.Open;

  FRReciboFrete.QuickRep1.Preview;
  DMEmbarque.QRParamSistema.Close;
end;

procedure TFEmbarqueCad.ControleAcertoCargas1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[17].TabVisible := True;

  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QRControleCargas.close;
      QRControleCargas.SetVariable('EMBARQUE', trim(FEmbarqueParam.ME18Embarque.Text));
      QRControleCargas.Open;
      if FRControleAcertoCargas = nil then
        FRControleAcertoCargas := TFRControleAcertoCargas.Create(Application);

      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FRControleAcertoCargas.QRPrimario.Preview
      else
        FRControleAcertoCargas.QRPrimario.Print;

      QRControleCargas.Close;
    end;
end;

procedure TFEmbarqueCad.VoltaEtiquetaEmbarque1Click(Sender: TObject);
begin
  inherited;
  if FVoltaEtiquetaEmbarque = nil then
    FVoltaEtiquetaEmbarque := TFVoltaEtiquetaEmbarque.Create(Application);
  FVoltaEtiquetaEmbarque.ShowModal;

end;

procedure TFEmbarqueCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Rollback;
end;

procedure TFEmbarqueCad.PedidoEmbarcado1Click(Sender: TObject);
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.AtivaPagina(20);
  if FEmbarqueParam.ShowModal = MrOk then
    with DMEmbarque do
    begin
      QRPedidoEmbarcado.Close;
      QRPedidoEmbarcado.ClearVariables;
      if Trim(FEmbarqueParam.Fm20Cadastro.MeCadastro.Text) <> '' then
        QRPedidoEmbarcado.SetVariable('CADASTRO', FEmbarqueParam.Fm20Cadastro.MeCadastro.Text);
      if Trim(FEmbarqueParam.Fm20Produto.MeProduto.Text) <> '' then
        QRPedidoEmbarcado.SetVariable('PRODUTO', FEmbarqueParam.Fm20Produto.MeProduto.Text);
      if Trim(FEmbarqueParam.Fm20Embarque.MeEmbarque.Text) <> '' then
        QRPedidoEmbarcado.SetVariable('EMBARQUE', FEmbarqueParam.Fm20Embarque.MeEmbarque.Text);
      if Trim(FEmbarqueParam.Fm20DataEmbarque.MeDtInicial.Text) <> '' then
        QRPedidoEmbarcado.SetVariable('DT_INICIO', FEmbarqueParam.Fm20DataEmbarque.MeDtInicial.Text);
      if Trim(FEmbarqueParam.Fm20DataEmbarque.MeDtFinal.Text) <> '' then
        QRPedidoEmbarcado.SetVariable('DT_FIM', FEmbarqueParam.Fm20DataEmbarque.MeDtFinal.Text);
      if Trim(FEmbarqueParam.Fm20DataPedido.MeDtInicial.Text) <> '' then
        QRPedidoEmbarcado.SetVariable('DT_PED_INICIO', FEmbarqueParam.Fm20DataPedido.MeDtInicial.Text);
      if Trim(FEmbarqueParam.Fm20DataPedido.MeDtFinal.Text) <> '' then
        QRPedidoEmbarcado.SetVariable('DT_PED_FIM', FEmbarqueParam.Fm20DataPedido.MeDtFinal.Text);
      QRPedidoEmbarcado.Open;

      if FRPedidoEmbarcado = nil then
        FRPedidoEmbarcado := TFRPedidoEmbarcado.Create(Application);
      FRPedidoEmbarcado.QRLCliente.Caption := FEmbarqueParam.Fm20Cadastro.EdCadastro.Text;
      FRPedidoEmbarcado.QRLProduto.Caption := FEmbarqueParam.Fm20Produto.EdProduto.Text;
      FRPedidoEmbarcado.QRLPeriodoEmbarque.Caption := Bib.DatasParaLabel(
        FEmbarqueParam.Fm20DataEmbarque.MeDtInicial.Text, FEmbarqueParam.Fm20DataEmbarque.MeDtFinal.Text);
      FRPedidoEmbarcado.QRLPeriodoPedido.Caption := Bib.DatasParaLabel(
        FEmbarqueParam.Fm20DataPedido.MeDtInicial.Text, FEmbarqueParam.Fm20DataPedido.MeDtFinal.Text);

      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FRPedidoEmbarcado.QRPrimario.Preview
      else
        FRPedidoEmbarcado.QRPrimario.Print;

      QRPedidoEmbarcado.Close;
    end;
end;

procedure TFEmbarqueCad.DBPanel1CodigoChange(Sender: TObject);
begin
  inherited;
  MMCadSimples.Items[2].Items[7].Enabled := DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab.isNull;
  MMCadSimples.Items[2].Items[8].Enabled := DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab.Text <> '';
  MMCadSimples.Items[2].Items[14].Enabled := DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Adto.isNull;
  MMCadSimples.Items[2].Items[15].Enabled := DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Adto.Text <> '';
//  MMCadSimples.Items[2].Items[17].Enabled := DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Compl.isNull;
//  MMCadSimples.Items[2].Items[18].Enabled := DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Compl.Text <> '';
  SbReciboAdto.Enabled := not (DMEmbarque.QEmbarqueCod_Conta_Pagar_Cab_Adto.isNull);
end;

procedure TFEmbarqueCad.DBPOsCodigoChange(Sender: TObject);
begin
  inherited;
  DBPOsExit(Self);
end;

procedure TFEmbarqueCad.DBPOsExit(Sender: TObject);
begin
  inherited;
  with DMEmbarque do
    QEmbarqueDESC_DESTINO_FRETE.Value := QEmbarqueDESC_OBS.Value;
end;

procedure TFEmbarqueCad.DBPanel9CodigoExit(Sender: TObject);
begin
  inherited;
  if DMEmbarque.QEmbarqueDESC_PLACA.Text = '' then
  begin
    if ((not (DMEmbarque.QEmbarqueCOD_MOTORISTA.IsNull)) and (DMEmbarque.QEmbarqueCOD_MOTORISTA.Text <> '')) then
      DMEmbarque.QEmbarqueDESC_PLACA.Value := DMOracle.BuscaNome('SELECT DESC_PLACA FROM TB_CADASTRO', 'COD_CADASTRO = ' + DMEmbarque.QEmbarqueCOD_MOTORISTA.Text)
  end;
end;

procedure TFEmbarqueCad.DBPanel9DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFEmbarqueCad.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFEmbarqueCad.DBPPedidoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FPedidoCons;
  Classe := TFPedidoCons;
end;

procedure TFEmbarqueCad.DBPPedidoValidate(Sender: TObject; Value: Variant;
  var isValid: Boolean; var Msg: string);
var
  wDtVencto, wClassificacao, wDescClassificacao, wCadastro, wAtendido, wLiberado,
    wCondPedido, wCondCadastro, wCondClass, wPedido: string;
    wVal_Limite : real;
    wInd_LiberaVenda : String;
begin
  inherited;
  isValid := True;
  if Value > 0 then
  begin
    wCondPedido := 'COD_PEDIDO_CAB = ' + IntToStr(Value);
    wCondCadastro := 'COD_CADASTRO = (' + MontaSelect('NVL(COD_CADASTRO,0)', 'TB_PEDIDO_CAB',
      wCondPedido) + ')';
    wCondClass := 'COD_CLASS_CADASTRO = (' + MontaSelect('NVL(COD_CLASS_CADASTRO,0)', 'TB_CADASTRO',
      wCondCadastro) + ')';
    Buscador.Limpa;
    Buscador.Adiciona('IND_EMBARQUE', 'TB_PEDIDO_CAB', wCondPedido);
    Buscador.Adiciona('COD_CADASTRO', 'TB_PEDIDO_CAB', wCondPedido);
    Buscador.Adiciona('QT_ATENDIDO', 'TB_PEDIDO_ITEM', wCondPedido + ' AND ROWNUM = 1');
    Buscador.Adiciona('MIN(DT_VENCIMENTO)', 'TB_CONTA_RECEBER_CAB',
      wCondCadastro + ' AND IND_SITUACAO <> ' + QuotedStr('BAIXA TOTAL'));
    Buscador.Adiciona('COD_CLASS_CADASTRO', 'TB_CADASTRO',
      wCondCadastro);
    Buscador.Adiciona('DESC_CLASSIFICACAO', 'TB_CLASS_CADASTRO',
      wCondClass);
    Buscador.Adiciona('COD_PEDIDO_CAB', 'TB_EMBARQUE_ITEM',
      wCondPedido + ' AND COD_EMBARQUE <> ' + DMEmbarque.QEmbarqueItemCOD_EMBARQUE.Text);



    Buscador.Buscar;


  //---bloco responsável pela verificação da existencia de pedido utilizado em dois ou mais embarques
  //---verificacao requerida pela Faville/zadimel  --- Fabio 04/02/2005
//  If QEmbarqueItemCod_Pedido_Cab.Text <> '' Then
//    if DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_EMBARQUE_ITEM','COD_PEDIDO_CAB = '+
//       QEmbarqueItemCod_Pedido_Cab.Text) <> '' then
//    begin
//       If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'CGS' Then
//          QEmbarqueItem.cancel;
//       showmessage('Pedido Nº '+QEmbarqueItemCod_Pedido_Cab.Text+' já utilizado em outro embarque');
//    End;   //Esta verificação está sendo feita abaixo


    wLiberado := Buscador.Proximo;
    wCadastro := Buscador.Proximo;
    wAtendido := Buscador.Proximo;
    wDtVencto := Buscador.Proximo;
    wClassificacao := Buscador.Proximo;
    wDescClassificacao := Buscador.Proximo;
    wPedido := Buscador.Proximo;

    //-------Inicio ------ Para MARICOTA não permitir embarque para clientes em débito. Junior 13/09
    {if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARICOTA' then
    begin
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK', wCadastro);
      DMCadastro.QCadastro.Open;
      wVal_Limite := DMCadastro.QCadastroVAL_LIMITE.Value;
      wInd_LiberaVenda := DMCadastro.QCadastroIND_LIBERA_VENDA.Text;
      if wDtvencto <> '' then
      begin
        if (wVal_Limite = 0) and ((wInd_LiberaVenda = 'NAO') and (StrToDate(wDtVencto) < Date)) then
        begin
          Msg := Trim(Msg + #13 + 'Cliente possui títulos em Aberto.');
          isValid := False;
          Exit;
        end;
      end;
    end; } //Retirado para colocar a validação no QEmbarqueItem BeforePost.
    
    if (wPedido <> '') then
    begin
      Msg := 'Pedido ' + IntToStr(Value) + ' já utilizado em outro embarque.';
      isValid := False;
    end;

  //    if (DMPedido.QPedidoConsIND_EMBARQUE.Value = 'S') then
    if (wLiberado = 'S') then
      Msg := Trim(Msg + #13 + 'Pedido já utilizado em outro embarque.');
  //      wCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB', 'COD_PEDIDO_CAB = ' + DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Text);
  //      wAtendido := DMOracle.BuscaNome('SELECT QT_ATENDIDO FROM TB_PEDIDO_ITEM', 'COD_PEDIDO_CAB = ' + DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Text);
    if (wAtendido) = '' then
    begin
      Msg := 'Pedido não cadastrado';
      isValid := False;
      Exit;
    end;
    if StrToFloat(wAtendido) <> 0 then
      Msg := Trim(Msg + #13 + 'Este pedido já foi faturado.');
    if wCadastro <> '' then
    begin
//        wDtVencto := DMOracle.BuscaNome('SELECT MIN(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB', 'COD_CADASTRO = ' + FloatToStr(dmPedido.QPedidoCod_Cadastro.Value) + ' AND IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39));
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MARICOTA' then
      begin
      if wDtvencto <> '' then
        if StrToDate(wDtVencto) < Date then
          Msg := Trim(Msg + #13 + 'Cliente com titulos atrasados.')
        else if DMParamSistema.CodEmpresa <> 'MOINHO' then
          Msg := Trim(Msg + #13 + 'Cliente com titulos a vencer.');
      end;
      if DMParamSistema.CodEmpresa = 'ZADIMEL' then
      begin
//          wClassificacao := DMOracle.BuscaNome('SELECT COD_CLASS_CADASTRO FROM TB_CADASTRO', ' COD_CADASTRO = ' + wCadastro);
        if StrToInt(wClassificacao) > 2 then
        begin
//            wDescClassificacao := DMOracle.BuscaNome('SELECT DESC_CLASSIFICACAO FROM TB_CLASS_CADASTRO', 'COD_CLASS_CADASTRO = ' + Trim(wClassificacao));
          Msg := Trim(Msg + #13 + 'Cliente com Classificação = ' + wDescClassificacao);
        end;
      end;
    end;
  end;
end;

procedure TFEmbarqueCad.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  if (Button = TNavigateBtn(nbPost)) and (not ValidaCampos(Self, DMEmbarque.DSEmbarqueItem)) then
    Abort;
end;

function TFEmbarqueCad.DBPSequenciaRenderizar(Sender: TObject): Boolean;
begin
  inherited;
  Result := (DMParamSistema.CodEmpresa = 'ABATE'); //Campo só para Friella.
end;

function TFEmbarqueCad.DBPQtPesRenderizar(Sender: TObject): Boolean;
begin
  inherited;
  Result := (DMParamSistema.CodEmpresa = 'CGS'); //Campo só para CGS.
end;

function TFEmbarqueCad.DBPQtVidrosRenderizar(Sender: TObject): Boolean;
begin
  inherited;
  Result := (DMParamSistema.CodEmpresa = 'CGS'); //Campo só para CGS.
end;

procedure TFEmbarqueCad.RelaoCargaProduto1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.FmEmbarque21.MeEmbarque.Text := DMEmbarque.QEmbarqueCOD_EMBARQUE.Text;
  FEmbarqueParam.PGRelatorio.Pages[21].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
  with DMEmbarque do
  begin
    QREmbarqueProduto.Close;
    if Trim(FEmbarqueParam.FmEmbarque21.MeEmbarque.Text) <> '' then
      QREmbarqueProduto.SetVariable('EMBARQUE', Trim(FEmbarqueParam.FmEmbarque21.MeEmbarque.Text))
    else
      Raise Exception.Create('É necessário informar o Embarque');

    QREmbarqueProduto.Open;
    if FREmbarqueProduto = nil then
      FREmbarqueProduto := TFREmbarqueProduto.Create(Application);
    FREmbarqueProduto.QRLTitulo.Caption := 'Relatório de Embarque Agrupo por Produto';
    FREmbarqueProduto.QRLEmbarque.Caption := 'Embarque: ' + Trim(FEmbarqueParam.FmEmbarque21.MeEmbarque.Text) +
                                             ' Dt. Emb: ' + QREmbarqueProdutoDT_EMBARQUE.Text;
    FREmbarqueProduto.QRLTransportador.Caption := 'Transportador: ' + QREmbarqueProdutoNOME.Text;

    if FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FREmbarqueProduto.QRPrimario.Preview
    else
      FREmbarqueProduto.QRPrimario.Print;
  end;

end;

procedure TFEmbarqueCad.BtPlacaClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = MrOK then
  begin
    DMEmbarque.QEmbarqueDESC_PLACA.Value := DMVeiculo.QVeiculoConsNUM_PLACA.Text; 
  end;
end;

procedure TFEmbarqueCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  BtPlaca.Enabled := DSPrimario.DataSet.State in [dsEdit, dsInsert];
  OracleNavigator1.Enabled := DSPrimario.DataSet.State in [dsEdit, dsInsert];
  DBNavigator1.Enabled := DSPrimario.DataSet.State in [dsEdit, dsInsert];
end;

procedure TFEmbarqueCad.EtiqCdBarrasEmbarque1Click(Sender: TObject);
var wcont, wQtd: integer;
    wProduto: string;
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[16].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
  begin
    try
      DMOracle.DBCemapa.StartTransaction;
      with DMEmbarque do
      begin
        QEtiqueta.Close;
        QEtiqueta.open;
        if QEtiqueta.RecordCount > 0 then
        begin
          QEtiqueta.First;
          while not QEtiqueta.Eof do
            QEtiqueta.Delete;
        end;
      end;

      with DMEmbarque do
      begin
        QEmbarqueItensPed.Close;
        QEmbarqueItensPed.ClearVariables;
        if FEmbarqueParam.ME17Embarque.Text <> '      ' then
          QEmbarqueItensPed.SetVariable('COD_EMBARQUE', FEmbarqueParam.ME17Embarque.Text)
        else
          raise Exception.Create('É preciso informar o embarque!');
        QEmbarqueItensPed.SetVariable('COD_PRODUTO', Null);
        QEmbarqueItensPed.Open;
        QEmbarqueItensPed.First;
        wcont := 1;

        while not QEmbarqueItensPed.Eof do
        begin
          wProduto := QEmbarqueItensPedCOD_PRODUTO.Text;
          wQtd := StrToInt(QEmbarqueItensPedQT_PEDIDO.Text);

          while (wQtd > 0) do
          begin
            if wcont = 1 then
            begin
              QEtiqueta.Insert; 
              QEtiquetaETIQUETA1.Value := Bib.StrZero(QEmbarqueItensPedCOD_PRODUTO.Text, 6) +
               Bib.StrZero(QEmbarqueItensPedCOD_LOTE_TIPO.Text, 6);
              Dec(wQtd);
            end;

            if wcont = 2 then
            begin
              if QEtiqueta.State = dsbrowse then
                QEtiqueta.Edit;
              QEtiquetaETIQUETA2.Value := Bib.StrZero(QEmbarqueItensPedCOD_PRODUTO.Text, 6) +
               Bib.StrZero(QEmbarqueItensPedCOD_LOTE_TIPO.Text, 6);
              Dec(wQtd);
            end;

            if wcont = 3 then
            begin
              if QEtiqueta.State = dsbrowse then
                QEtiqueta.Edit;
              QEtiquetaETIQUETA3.Value := Bib.StrZero(QEmbarqueItensPedCOD_PRODUTO.Text, 6) +
               Bib.StrZero(QEmbarqueItensPedCOD_LOTE_TIPO.Text, 6);
              Dec(wQtd);
              wcont := 0;
            end;
            Inc(wcont);
            QEtiqueta.Post;
          end;
          QEmbarqueItensPed.Next;
        end;
      end;
      DmOracle.DBCemapa.Commit;
    except
      DmOracle.DBCemapa.Rollback;
      raise;
    end;
    if FREtiqCodBarra_Embarque = nil then
      FREtiqCodBarra_Embarque := TFREtiqCodBarra_Embarque.Create(Application);
    FREtiqCodBarra_Embarque.QuickRep1.Preview;
  end;
end;

procedure TFEmbarqueCad.RelatriodeProduo1Click(Sender: TObject);
var wVirgula, wAux : string;
    i : integer;
begin
  inherited;
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[22].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
  with DMEmbarque do
  begin
    QRRelacaoProducao.Close;
    QRRelacaoProducaoQtdePedido.Close;
    if FEmbarqueParam.LB22Embarque.Items.Count = 0 then
      Raise Exception.Create('Informe os Embarques!')
    else
    begin
      wVirgula := '';
      wAux := '';
      For i:=0 to FEmbarqueParam.LB22Embarque.Items.Count-1 do
      begin
        wAux := wAux + wVirgula + FEmbarqueParam.LB22Embarque.Items.Strings[i];
        wVirgula := ',';
      end;
      QRRelacaoProducao.SetVariable('COD_EMBARQUE','TB_EMBARQUE.COD_EMBARQUE IN ('+ Trim(wAux)+')');
      QRRelacaoProducaoQtdePedido.SetVariable('COD_EMBARQUE','TB_EMBARQUE.COD_EMBARQUE IN ('+ Trim(wAux)+')');
    end;
    QRRelacaoProducao.Open;
    QRRelacaoProducaoQtdePedido.Open;

    if FRRelacaoProducao = nil then
      FRRelacaoProducao := TFRRelacaoProducao.Create(Application);
    if FRRelacaoProducaoQtdePedido = nil then
      FRRelacaoProducaoQtdePedido := TFRRelacaoProducaoQtdePedido.Create(Application);

    FRRelacaoProducaoQtdePedido.QRLTitulo.Caption := 'Relacao Geral para Produção';
    FRRelacaoProducaoQtdePedido.QRLEmbarque.Caption := 'Embarques : '+wAux;

    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FRRelacaoProducaoQtdePedido.QRCompositeReport1.Preview
    Else
      FRRelacaoProducaoQtdePedido.QRCompositeReport1.Print;

  end;
end;

procedure TFEmbarqueCad.DBPanel10DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FHistoricoCons;
  Classe := TFHistoricoCons;
end;

procedure TFEmbarqueCad.DBPanel11DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FDepartamentoCons;
  Classe := TFDepartamentoCons;
end;

procedure TFEmbarqueCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  if (trim(DmEmbarque.QEmbarqueCOD_EMBARQUE.Text) <> '') and (DmEmbarque.QEmbarqueIND_BLOQUEADO.Text = 'S') then
  begin
    FEmbarqueCad.SBCancelar.Click;
    raise Exception.Create('Embarque Bloqueado, procure a gerência');
  end;
end;

procedure TFEmbarqueCad.FecharEmbarqueMxima1Click(Sender: TObject);
var wComando: string;
begin
  inherited;
  if not DMEmbarque.QEmbarque.Eof then
   Begin
    if MessageDlg('Deseja fechar o embarque no Portal Máxima?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        DMOracle.DBCemapa.StartTransaction;
        With DMOracle do
      Begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'UPDATE TB_EMBARQUE SET IND_SINC_MAX_ROTEIRIZADOR = ' + QuotedStr('A') +
          ', DT_FECHAMENTO_MAXIMA = SYSDATE';
        wComando := wComando + ' WHERE COD_EMBARQUE = ' + DMEmbarque.QEmbarqueCOD_EMBARQUE.Text;
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;

        DMOracle.DBCemapa.Commit;
        SBRefreshClick(Self);
        MessageDlg('Embarque fechado no portal Máxima com sucesso.' , mtInformation, [mbOk], 0);
      End;
      except
        DmOracle.DBCemapa.Rollback;
        raise;
      end;
    End;
  end
    else
      raise exception.Create('Selecionar Embarque para ser fechado.');
end;

procedure TFEmbarqueCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  MMCadSimples.Items[2].Items[13].Enabled := DMEmbarque.QEmbarqueDT_FECHAMENTO_MAXIMA.IsNull;
end;

end.

