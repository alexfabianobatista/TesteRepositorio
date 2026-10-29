unit URequisicaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, OracleNavigator, variants, DBPanel,
  ActnList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TFOFI0011 = class(TFTCadSimples)                                                                            
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    SBOSCons: TSpeedButton;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DSRequisicao_Item: TDataSource;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    SBMarcacaoCad: TSpeedButton;
    SBFinalizaMarcacao: TSpeedButton;
    MovimentaodeProdutos1: TMenuItem;
    PCItens: TPageControl;
    TSProduto: TTabSheet;
    Label6: TLabel;
    Bevel2: TBevel;
    Label12: TLabel;
    SBValUnitario: TSpeedButton;
    Label13: TLabel;
    DBGItens: TDBGrid;
    Panel2: TPanel;
    OracleNavigator1: TOracleNavigator;
    DBEQuantidade: TDBEdit;
    DBEValUnitario: TDBEdit;
    DBEdit10: TDBEdit;
    DBPComissao: TDBPanel;
    DBPNumFabricante: TDBPanel;
    DBPMecanico: TDBPanel;
    DBPVendedor: TDBPanel;
    DBPFilial: TDBPanel;
    TSServico: TTabSheet;
    Bevel1: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    OracleNavigator2: TOracleNavigator;
    DBEValUnServico: TDBEdit;
    DBEDescricaoServico: TDBEdit;
    DBPComissaoServico: TDBPanel;
    DSRequisicao_ItemServico: TDataSource;
    BtCalculaItem: TBitBtn;
    BtCalculaTudo: TBitBtn;
    DBPQuantidadeServico: TDBPanel;
    TSVeiculo: TTabSheet;
    DSRequisicao_ItemVeiculo: TDataSource;
    Bevel3: TBevel;
    Label5: TLabel;
    Label11: TLabel;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    OracleNavigator3: TOracleNavigator;
    DBEdit4: TDBEdit;
    DBEDescricaoVeiculo: TDBEdit;
    DBPQuantidade: TDBPanel;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    Label16: TLabel;
    DBEdit13: TDBEdit;
    Label17: TLabel;
    DBEdit14: TDBEdit;
    DBPCadastroMotorista: TDBPanel;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    Label18: TLabel;
    DBEdit5: TDBEdit;
    Label19: TLabel;
    DBEdit15: TDBEdit;
    Label20: TLabel;
    DBEdit16: TDBEdit;
    Opo1: TMenuItem;
    AlteraPreo1: TMenuItem;
    EdCodBarras: TEdit;
    Label21: TLabel;
    procedure SBOSConsClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBMarcacaoCadClick(Sender: TObject);
    procedure SBFinalizaMarcacaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SBValUnitarioClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure MovimentaodeProdutos1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBPComissaoDefine(Sender: TObject;
      var QueryConsulta: TDataSet; var FormConsulta: TForm);
    function AgronewsRenderizar(Sender: TObject): Boolean;
    procedure DBPMecanicoDefine(Sender: TObject; var QueryConsulta: TDataSet;
      var FormConsulta: TForm);
    procedure DBPVendedorDefine(Sender: TObject;
      var QueryConsulta: TDataSet; var FormConsulta: TForm);
    function AgronewsNaoRenderizar(Sender: TObject): Boolean;
    procedure SBCancelarClick(Sender: TObject);
    procedure BtCalculaItemClick(Sender: TObject);
    procedure DBPNumFabricanteCodigoExit(Sender: TObject);
    procedure BtCalculaTudoClick(Sender: TObject);
    procedure DBEValUnServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBPCadastroMotoristaDefine(Sender: TObject;
      var QueryConsulta: TDataSet; var FormConsulta: TForm);
    procedure SBExcluirClick(Sender: TObject);
    procedure DBPNumFabricanteDefineByClass(Sender: TObject;
      var Classe: TClass);
    procedure AlteraPreo1Click(Sender: TObject);
    procedure EdCodBarrasExit(Sender: TObject);
  private
    procedure calculaItem;
    procedure calculaTudo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFI0011: TFOFI0011;

implementation

uses UOficina_cl, UOSCons, URequisicaoCons, UOracle_cl, UVendedorCons,
  UMecanicoCons, UVendedor_cl, UProdutoCons, UProduto_cl, UOSMarcacao,
  UMarcacaoFinaliza, UTela_cl, URequisicaoParam, URMovimentacaoProduto,
  UFmFilial, UFmProduto, UFmDatas, UParamSistema_cl, UComissao_cl,
  UComissaoCons, UBiblioteca, UCadastro_cl, UCadastroCons, UOs_cl;

{$R *.DFM}

procedure TFOFI0011.SBOSConsClick(Sender: TObject);
var
  mExisteRequisicao: string;
begin
  inherited;
  if FOsCons = nil then
    FOsCons := TFOsCons.Create(Application);
  with DMOs do
  begin
    QOSCons.Close;  //A pedido da Raquel, para que quando abra a tela de consulta não apareçam os dados que foram consultados anteriormente, pois por não clicar no botão pesquisar eles selecionavam a OS errada. Por Alessandro em 08/02/13
  end;
  
  if FOsCons.ShowModal = mrOk then
  begin
    with DMOficina do
    begin
      mExisteRequisicao := DMOracle.BuscaNome('SELECT NUM_REQUISICAO FROM TB_REQUISICAO', 'NUM_OS = ' + FloatToStr(DMOs.QOSConsNUM_OS.Value));
      if Trim(mExisteRequisicao) <> '' then // Ja existe uma requisicao para os informada.
      begin
        if QRequisicaoCad.State = dsInsert then
          QRequisicaoCad.cancel;

//        QRequisicao_item.Close;
        QRequisicaoCad.Close;
        QRequisicaoCad.SetVariable('PK', mExisteRequisicao);
        QRequisicaoCad.Open;
//        QRequisicao_item.Open;
      end;

      if DMOs.QOSConsIND_SITUACAO.Value = 'F' then
      begin
        //QRequisicaocad.Close;
        QRequisicaocad.Cancel;
        raise exception.Create('O.S. já foi fechada!');
      end;

 {     QOSMarcacaoCons.Close;
      QOSMarcacaoCons.SetVariable('NUM_OS',DMOs.QOSConsNUM_OS.Value);
      QOSMarcacaoCons.SetVariable('IND_SITUACAO','I');
      QOSMarcacaoCons.SetVariable('COD_MECANICO',Null);
      QOSMarcacaoCons.Open;
      if QOSMarcacaoCons.RecordCount = 0 then
         raise exception.Create('Não foi encontrado registro de marcação para O.S. informada ou marcação já foi encerrada!');
  }
      if QRequisicaoCad.State = dsInsert then
      begin
        QRequisicaoCadNUM_OS.Value := DMOs.QOSConsNUM_OS.Value;
        QRequisicaoCadCOD_VENDEDOR.Value := DMOs.QOSConsCOD_VENDEDOR.Value;
        QRequisicaoCadCOD_FILIAL.Value := DMOs.QOSConsCOD_FILIAL.Value;
      end;
    end;
  end;
end;

procedure TFOFI0011.SBConsultaClick(Sender: TObject);
var
  wSituacao: string;
  wAgronews: Bool;
begin
  inherited;
  if FOFI0016 = nil then
    FOFI0016 := TFOFI0016.Create(Application);
  if FOFI0016.ShowModal = mrOk then
  begin
    with DMOficina do
    begin
      QRequisicaoCad.Close;
//      QRequisicao_item.Close;
//      QRequisicao_itemServico.Close;
//      QRequisicao_itemVeiculo.Close;
        QRequisicaoCad.SetVariable('PK', QRequisicaoItensConsNUM_REQUISICAO.Value);
//      QRequisicao_item.SetVariable('NUM_REQUISICAO',QRequisicaoItensConsNUM_REQUISICAO.Value);
      QRequisicaoCad.Open;
//      QRequisicao_item.Open;
//      QRequisicao_itemServico.Open;
//      QRequisicao_itemVeiculo.Open;

      QRequisicaoCons.Close;
      QRequisicaoCons.SetVariable('NUM_OS', QRequisicaoCadNUM_OS.Value);
      QRequisicaoCons.SetVariable('COD_FILIAL', Null);
      QRequisicaoCons.SetVariable('IND_SITUACAO', Null);
      QRequisicaoCons.Open;
      if QRequisicaoConsNUM_OS.Value > 0 then
      begin
        wSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_OS', 'NUM_OS = ' + QRequisicaoConsNum_OS.Text);
        if wSituacao = 'F' then
          OracleNavigator1.Enabled := False
        else
          OracleNavigator1.Enabled := True;
      end;
      if not wAgronews then
        QRequisicaoItensCons.Close;
    end;
  end;
end;

procedure TFOFI0011.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
  with DMOficina do
  begin
    QRequisicaoCad.Close;
    QRequisicaoCad.SetVariable('PK', Null);
    QRequisicao_item.Close;
    QRequisicao_item.SetVariable('NUM_REQUISICAO', Null);
    QRequisicaoCad.Open;
    QRequisicao_item.Open;
  end;
end;

procedure TFOFI0011.SBIncluirClick(Sender: TObject);
begin
  inherited;
  SBOSCons.Click;
end;

procedure TFOFI0011.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBOSCons.Enabled := (DSPrimario.State in [dsInsert, dsEdit]);
  BtCalculaItem.Enabled := (DSPrimario.State in [dsInsert, dsEdit]);
  BtCalculaTudo.Enabled := (DSPrimario.State in [dsInsert, dsEdit]);
  SBValUnitario.Enabled := (DSPrimario.State in [dsInsert, dsEdit]);
end;

procedure TFOFI0011.SBMarcacaoCadClick(Sender: TObject);
begin
  inherited;
  if FOFI0010 = nil then
    FOFI0010 := TFOFI0010.Create(Application);
  FOFI0010.ShowModal;
end;

procedure TFOFI0011.SBFinalizaMarcacaoClick(Sender: TObject);
begin
  inherited;
  if FMarcacaoFinalizar = nil then
    FMarcacaoFinalizar := TFMarcacaoFinalizar.Create(Application);
  FMarcacaoFinalizar.ShowModal;
end;

procedure TFOFI0011.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  with DMOficina do
//  begin
//    QRequisicao_itemServico.Close;
//    QRequisicao_item.Close;
//    QRequisicaoCad.Close;
//  end;
//  Action:= caFree;
//  FOFI0011:= Nil;
end;

procedure TFOFI0011.FormActivate(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QRequisicaoCad.Close;
//    QRequisicao_item.Close;
//    QRequisicao_itemServico.Close;
//    QRequisicao_itemVeiculo.Close;
    QRequisicaoCad.Open;
//    QRequisicao_item.Open;
//    QRequisicao_itemServico.Open;
//    QRequisicao_itemVeiculo.Open;
  end;
end;

procedure TFOFI0011.SBValUnitarioClick(Sender: TObject);
var
  wUltCusto1 :String;
  wUltCusto2 :String;
  wUltVenda1 :String;
  wUltVenda2 :String;
begin
  inherited;
  with DMOficina do
  begin
    if QRequisicao_itemNUM_FABRICANTE.Value <> '' then
    begin
      wUltCusto1 := DMOracle.BuscaNome('SELECT NVL(E.VL_ULTIMO_CUSTO,0) FROM ' +
          'TB_ESTOQUE E INNER JOIN TB_PRODUTO P ON E.COD_PRODUTO = P.COD_PRODUTO ',
          'P.NUM_FABRICANTE = ' + quotedStr(QRequisicao_itemNUM_FABRICANTE.Value) +
          ' AND E.COD_LOTE_TIPO = 1  AND E.COD_FILIAL = 1');
      wUltCusto2 := DMOracle.BuscaNome('SELECT NVL(E.VL_ULTIMO_CUSTO, 0) FROM ' +
          'TB_ESTOQUE E INNER JOIN TB_PRODUTO P ON E.COD_PRODUTO = P.COD_PRODUTO ',
          'P.NUM_FABRICANTE = ' + quotedStr(QRequisicao_itemNUM_FABRICANTE.Value) +
          ' AND E.COD_LOTE_TIPO = 1  AND E.COD_FILIAL = 2');
      wUltVenda1 := DMOracle.BuscaNome('SELECT NVL(E.VL_ULTIMA_VENDA,0) FROM ' +
          'TB_ESTOQUE E INNER JOIN TB_PRODUTO P ON E.COD_PRODUTO = P.COD_PRODUTO ',
          'P.NUM_FABRICANTE = ' + quotedStr(QRequisicao_itemNUM_FABRICANTE.Value) +
          ' AND E.COD_LOTE_TIPO = 1  AND E.COD_FILIAL = 1');
      wUltVenda2 := DMOracle.BuscaNome('SELECT NVL(E.VL_ULTIMA_VENDA, 0) FROM ' +
          'TB_ESTOQUE E INNER JOIN TB_PRODUTO P ON E.COD_PRODUTO = P.COD_PRODUTO ',
          'P.NUM_FABRICANTE = ' + quotedStr(QRequisicao_itemNUM_FABRICANTE.Value) +
          ' AND E.COD_LOTE_TIPO = 1  AND E.COD_FILIAL = 2');

      if wUltCusto1 = '' then
        wUltCusto1 := '0';
      if wUltCusto2 = '' then
        wUltCusto2 := '0';
      if wUltVenda1 = '' then
        wUltVenda1 := '0';
      if wUltVenda2 = '' then
        wUltVenda2 := '0';

      ShowMessage('Filial 1: ' +
        'Custo ' +
        FormatFloat('#,##0.00',StrToFloat(wUltCusto1)) +
        '  Preço ' +
        FormatFloat('#,##0.00',StrToFloat(wUltVenda1)) +
        chr(13) +
        'Filial 2: ' +
        'Custo ' +
        FormatFloat('#,##0.00',StrToFloat(wUltCusto2)) +
        '  Preço ' +
        FormatFloat('#,##0.00',StrToFloat(wUltVenda2))
        );
    end;
    if (QRequisicao_itemVAL_UNITARIO.text <> '') then
    begin
      QRequisicao_itemVal_Unitario.value := StrToFloat(inputBox('Insira o Novo Valor Unitário', 'Valor:', ''));
      QRequisicao_itemInd_Desconto.Value := 'S';
    end;
  end;
end;

procedure TFOFI0011.SBAlterarClick(Sender: TObject);
begin
  if DMOs.QOSCadIND_SITUACAO.Value = 'F' then
    MessageDlg('OS já foi fechada.', mtError, [mbOK], 0)
  else
    inherited;
end;

procedure TFOFI0011.MovimentaodeProdutos1Click(Sender: TObject);
var
  wDataI, wDataF: TDate;
begin
  inherited;
  if FRequisicaoParam = nil then
    FRequisicaoParam := TFRequisicaoParam.Create(Application);
  FRequisicaoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FRequisicaoParam.ShowModal = MrOk then
  begin
    try
      wDataI := StrToDate(FRequisicaoParam.FmDatas1.MeDtInicial.Text);
      wDataF := StrToDate(FRequisicaoParam.FmDatas1.MeDtFinal.Text);
    except
      raise Exception.Create('Datas informadas estão incorretas.');
    end;
    with DMOficina do
    begin
      QRMovimentacaoProduto.Close;
      QRMovimentacaoProduto.SetVariable('DT_I', wDataI);
      QRMovimentacaoProduto.SetVariable('DT_F', wDataF);
      if Trim(FRequisicaoParam.FmFilial1.MeFilial.Text) <> '' then
        QRMovimentacaoProduto.SetVariable('COD_FILIAL', Trim(FRequisicaoParam.FmFilial1.MeFilial.Text))
      else
        QRMovimentacaoProduto.SetVariable('COD_FILIAL', null);
      if Trim(FRequisicaoParam.FmProduto1.MeProduto.Text) <> '' then
        QRMovimentacaoProduto.SetVariable('COD_PRODUTO', Trim(FRequisicaoParam.FmProduto1.MeProduto.Text))
      else
        QRMovimentacaoProduto.SetVariable('COD_PRODUTO', null);
      QRMovimentacaoProduto.open;

      if FRMovimentacaoProduto = nil then
        FRMovimentacaoProduto := TFRMovimentacaoProduto.Create(Application);
      FRMovimentacaoProduto.QRLFilial.Caption := FRequisicaoParam.FmFilial1.EdFilial.Text;
      FRMovimentacaoProduto.QRLProduto.Caption := FRequisicaoParam.FmProduto1.EdProduto.Text;
      FRMovimentacaoProduto.QRLPeriodo.Caption := FRequisicaoParam.FmDatas1.MeDtInicial.Text +
        ' até ' +
        FRequisicaoParam.FmDatas1.MeDtFinal.Text;
      if FRequisicaoParam.RGPreview.ItemIndex = 0 then
        FRMovimentacaoProduto.QRPrimario.Preview
      else
        FRMovimentacaoProduto.QRPrimario.Print;
      QRMovimentacaoProduto.Close;
    end;
  end;
end;

procedure TFOFI0011.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS') and
      (DSPrimario.State in [DsEdit, DsInsert]) then
  begin
    if Key = '+' then
    begin
      if PCItens.ActivePage = TSProduto then
      begin
        if DSRequisicao_Item.State <> DsBrowse then
          DMOficina.QRequisicao_item.Post;
        DMOficina.QRequisicao_item.Append;
        DBEQuantidade.SetFocus;
      end
      else if PCItens.ActivePage = TSServico then
      begin
        if DSRequisicao_ItemServico.State <> DsBrowse then
          DMOficina.QRequisicao_itemServico.Post;
        DMOficina.QRequisicao_itemServico.Append;
        DBEDescricaoServico.SetFocus;
      end
      else if PCItens.ActivePage = TSVeiculo then
      begin
        if DSRequisicao_ItemVeiculo.State <> DsBrowse then
          DMOficina.QRequisicao_itemVeiculo.Post;
        DMOficina.QRequisicao_itemVeiculo.Append;
        DBEDescricaoVeiculo.SetFocus;
      end;
      Key := #0;
    end;
    if Key = '-' then
    begin
      if PCItens.ActivePage = TSProduto then
      begin
        if DSRequisicao_Item.State <> DsBrowse then
          DMOficina.QRequisicao_item.Cancel
        else
          DMOficina.QRequisicao_item.Delete;
      end
      else if PCItens.ActivePage = TSServico then
      begin
        if DSRequisicao_ItemServico.State <> DsBrowse then
          DMOficina.QRequisicao_itemServico.Cancel
        else
          DMOficina.QRequisicao_itemServico.Delete;
      end
      else if PCItens.ActivePage = TSVeiculo then
      begin
        if DSRequisicao_ItemVeiculo.State <> DsBrowse then
          DMOficina.QRequisicao_itemVeiculo.Cancel
        else
          DMOficina.QRequisicao_itemVeiculo.Delete;
      end;
      Key := #0;
    end;
  end;
end;

procedure TFOFI0011.DBPComissaoDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FComissaoCons = nil then
    FComissaoCons := TFComissaoCons.Create(Application);
  FormConsulta := FComissaoCons;
  QueryConsulta := DMComissao.QComissaoCons;
end;

function TFOFI0011.AgronewsRenderizar(Sender: TObject): Boolean;
begin
  inherited;
  Result := (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS');
end;

procedure TFOFI0011.DBPMecanicoDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FMecanicoCons = nil then
    FMecanicoCons := TFMecanicoCons.Create(Application);
  FormConsulta := FMecanicoCons;
  QueryConsulta := DMOficina.QMecanicoCons;
end;

procedure TFOFI0011.DBPVendedorDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  FormConsulta := FVendedorCons;
  QueryConsulta := DMVendedor.QVendedorCons;
end;

function TFOFI0011.AgronewsNaoRenderizar(Sender: TObject): Boolean;
begin
  inherited;
  Result := DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS';
end;

procedure TFOFI0011.SBCancelarClick(Sender: TObject);
begin
  if DSRequisicao_Item.State <> DsBrowse then
    DMOficina.QRequisicao_item.Cancel;
  if DSRequisicao_ItemServico.State <> DsBrowse then
    DMOficina.QRequisicao_itemServico.Cancel;
  if DSRequisicao_ItemVeiculo.State <> DsBrowse then
    DMOficina.QRequisicao_itemVeiculo.Cancel;
  inherited;
  DMOracle.DBCemapa.Rollback;
end;

procedure TFOFI0011.BtCalculaItemClick(Sender: TObject);
begin
  inherited;
  if (DSPrimario.State in [DsEdit, DsInsert]) and (PCItens.ActivePage = TSServico) and
    (DMOficina.QRequisicao_itemServicoCOD_REQUISICAO_ITEM.Value > 0) then
  begin
    if (DSRequisicao_ItemServico.State = DsBrowse) then
      DMOficina.QRequisicao_itemServico.Edit;
    calculaItem;
  end;
end;

procedure TFOFI0011.calculaItem;
var
  wHoras: Real;
begin
  with DMOficina do
  begin
    QOSMarcacaoCons.Close;
    QOSMarcacaoCons.SetVariable('COD_REQUISICAO_ITEM', QRequisicao_itemServicoCOD_REQUISICAO_ITEM.Value);
    QOSMarcacaoCons.SetVariable('IND_SITUACAO', 'I');
    QOSMarcacaoCons.Open;
    if (QOSMarcacaoCons.RecordCount > 0) and (
      MessageDlg('Atenção!' + #13 + #10 + 'Existem marcações não finalizadas para este item. ' +
      'Deseja calcular mesmo assim?', mtWarning, [mbYes, mbNo], 0) in [mrNo, mrNone]) then
      Exit;

    QOSMarcacaoCons.Close;
    QOSMarcacaoCons.SetVariable('COD_REQUISICAO_ITEM', QRequisicao_itemServicoCOD_REQUISICAO_ITEM.Value);
    QOSMarcacaoCons.SetVariable('IND_SITUACAO', 'F');
    QOSMarcacaoCons.Open;

    wHoras := 0;
    QOSMarcacaoCons.First;
    while not QOSMarcacaoCons.Eof do
    begin
      wHoras := wHoras + Bib.HorasEntre(QOSMarcacaoConsDT_INICIO.Value, QOSMarcacaoConsDT_FIM.Value);
      QOSMarcacaoCons.Next;
    end;
    if (DSRequisicao_ItemServico.State in [DsEdit, DsInsert]) then
      QRequisicao_itemServicoQT_QUANTIDADE.Value := wHoras
    else
    begin
      DMOracle.ExecutaSql('UPDATE TB_REQUISICAO_ITEM SET QT_QUANTIDADE = ' +
        Bib.TrocaVirgulaPorPonto(FormatFloat('0.000', wHoras)) + ' WHERE COD_REQUISICAO_ITEM = ' +
        QRequisicao_itemServicoCOD_REQUISICAO_ITEM.Text, False);
      QRequisicao_itemServico.RefreshRecord;
    end;
  end;
end;

procedure TFOFI0011.DBPNumFabricanteCodigoExit(Sender: TObject);
begin
  inherited;
  if (DSRequisicao_Item.State in [DsEdit, DsInsert]) and
    (DMOficina.QRequisicao_itemNUM_FABRICANTE.Value <> '') and
    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS') then
  begin
    if Copy(DMOficina.QRequisicao_itemNUM_FABRICANTE.Value, 1, 2) = 'SI' then
      DMOficina.QRequisicao_itemCOD_FILIAL.Value := 2;
    //Raquel pediu para tirar a filial 2 e colocar a data da última compra. Vanessa 23/05/2016
    //ShowMessage('Filial: 01 - Quantidade: ' + DMOracle.BuscaNome('SELECT TB_ESTOQUE.QT_QUANTIDADE  FROM TB_PRODUTO, TB_ESTOQUE', ' TB_ESTOQUE.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
//      + ' AND TB_ESTOQUE.COD_LOTE_TIPO = 1 AND TB_PRODUTO.NUM_FABRICANTE = ' + CHR(39) + (DMOficina.QRequisicao_itemNUM_FABRICANTE.Value) + CHR(39)
//      + ' AND TB_ESTOQUE.COD_FILIAL = 1') + CHR(13) + 'Filial: 02 - Quantidade: '
//      + (DMOracle.BuscaNome('SELECT TB_ESTOQUE.QT_QUANTIDADE  FROM TB_PRODUTO, TB_ESTOQUE', ' TB_ESTOQUE.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
//      + ' AND TB_ESTOQUE.COD_LOTE_TIPO = 1 AND TB_PRODUTO.NUM_FABRICANTE = ' + CHR(39) + (DMOficina.QRequisicao_itemNUM_FABRICANTE.Value) + CHR(39)
//      + ' AND TB_ESTOQUE.COD_FILIAL = 2 ORDER BY TB_ESTOQUE.COD_FILIAL')));

      ShowMessage('Filial: 01 - Quantidade: ' + DMOracle.BuscaNome('SELECT TB_ESTOQUE.QT_QUANTIDADE  FROM TB_PRODUTO, TB_ESTOQUE', ' TB_ESTOQUE.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      + ' AND TB_ESTOQUE.COD_LOTE_TIPO = 1 AND TB_PRODUTO.NUM_FABRICANTE = ' + CHR(39) + (DMOficina.QRequisicao_itemNUM_FABRICANTE.Value) + CHR(39)
      + ' AND TB_ESTOQUE.COD_FILIAL = 1') + CHR(13) + 'Data Última Compra: '
      + (DMOracle.BuscaNome('SELECT TB_ESTOQUE.DT_COMPRA FROM TB_ESTOQUE, TB_PRODUTO', 'TB_ESTOQUE.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      + ' AND TB_PRODUTO.NUM_FABRICANTE = ' + CHR(39) + (DMOficina.QRequisicao_itemNUM_FABRICANTE.Value) + CHR(39))));
  end;
end;

procedure TFOFI0011.BtCalculaTudoClick(Sender: TObject);
begin
  inherited;
  if (DSPrimario.State in [DsEdit, DsInsert]) and (PCItens.ActivePage = TSServico) and
    (DMOficina.QRequisicao_itemServicoCOD_REQUISICAO_ITEM.Value > 0) then
  begin
    if (DSRequisicao_ItemServico.State in [DsEdit, DsInsert]) then
      DMOficina.QRequisicao_itemServico.Post;
    calculaTudo;
  end;
end;

procedure TFOFI0011.calculaTudo;
begin
  with DMOficina do
  begin
    QRequisicao_itemServico.First;
    while not QRequisicao_itemServico.Eof do
    begin
      calculaItem;
      QRequisicao_itemServico.Next;
    end;
    calculaTotalRequisicao;
  end;
end;

procedure TFOFI0011.DBEValUnServicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  wStr: String;
  wVal: Real;
begin
  inherited;
  if (DSPrimario.State in [DsEdit, DsInsert]) and (Key = 123) then
    with DMOficina do
    begin
      wStr := FloatToStr(QRequisicao_itemServicoVAL_UNITARIO.Value *
          QRequisicao_itemServicoQT_QUANTIDADE.Value);
      if InputQuery('Valor Total', 'Insira o Valor', wStr) then
      begin
        try
          wVal := StrToFloat(wStr);
        except
          Exit;
        end;
        QRequisicao_itemServico.Edit;
        QRequisicao_itemServicoVAL_UNITARIO.Value := wVal / QRequisicao_itemServicoQT_QUANTIDADE.Value;
        QRequisicao_itemServico.Post;
      end;
    end;
end;

procedure TFOFI0011.FormCreate(Sender: TObject);
// var b: Boolean;
begin
  inherited;
{  b := DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS';
  if b then
  begin
    DBEValUnitario.Color := clWindow;
    StBLongHint.Panels.Add.Text := StBLongHint.SimpleText;
    StBLongHint.Panels.Add.Text := '"+" - NOVO ITEM; "-" - DEL/CANC ITEM; ALT I - CALC. ITEM; ALT T - CALC. TUDO';
    StBLongHint.Panels.Items[0].Width := 450;
    StBLongHint.SimplePanel := False;
  end;
  DBEValUnitario.ReadOnly := not b;
  DBEValUnitario.TabStop := b;
  SBValUnitario.Enabled := not b;
  SBValUnitario.Visible := not b;
  DBGItens.TabStop := b;
  TSServico.TabVisible := b;
  TSVeiculo.TabVisible := b;
}
end;

procedure TFOFI0011.DBPCadastroMotoristaDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  FormConsulta := FCadastroCons;
  QueryConsulta := DMCadastro.QCadastroCons;
end;

procedure TFOFI0011.SBExcluirClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFOFI0011.DBPNumFabricanteDefineByClass(Sender: TObject;
  var Classe: TClass);
begin
  inherited;
  Classe := TFProdutoCons;
end;

procedure TFOFI0011.AlteraPreo1Click(Sender: TObject);
Var wVal_Unitario : String;
begin
  inherited;
  wVal_Unitario := inputBox('Insira o Novo Valor Unitário', 'Valor:', '');
  DMOracle.QExecSQL.Close;
  DMOracle.QExecSQL.SQL.Clear;
  DMOracle.QExecSQL.SQL.Add('UPDATE TB_REQUISICAO_ITEM SET Val_Unitario = '+
                           Bib.TrocaVirgulaPorPonto(wVal_Unitario) +
                           ',Ind_Desconto = ' + QuotedStr('S') +
                           ' WHERE COD_PRODUTO='+DMoficina.QRequisicao_itemCOD_PRODUTO.Text +
                           ' And NUM_REQUISICAO='+DMOficina.QRequisicao_itemNUM_REQUISICAO.Text);
  DMOracle.QExecSQL.ExecSQL;
  if DMOracle.DBCemapa.InTransaction = true then
     DMOracle.DBCemapa.Commit;
  DMOracle.QExecSQL.Close;
end;

procedure TFOFI0011.EdCodBarrasExit(Sender: TObject);
var
  wCodProduto, wCodItem, wAuxValorUn, wNumFabricante, wCodBarras: String;
  wAchou: Boolean;
  wValorUn: Real;
begin
  inherited;
  if trim(EdCodBarras.Text) <> '' then
  begin
    wCodBarras := trim(EdCodBarras.Text);
    EdCodBarras.Clear;
    if not (DSRequisicao_Item.State in [DsEdit, DsInsert]) then
    begin
      EdCodBarras.SetFocus;
      raise Exception.Create('O registro não está em edição!' + chr(13) +'Clique no botão "+" antes de passar o código de barras!');
    end;
    wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(wCodBarras));
    EdCodBarras.Clear;
    if wCodProduto = '' then
    begin
      EdCodBarras.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end
    else
    begin
      wNumFabricante := DMOracle.FastSelect('NUM_FABRICANTE', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
      if wNumFabricante = '' then
      begin
        EdCodBarras.SetFocus;
        raise Exception.Create('O produto ' + wCodProduto + ' está cadastrado, porém não possui o número do fabricante informado, verifique.');
      end
      else
      begin
        DMOficina.QRequisicao_itemNUM_FABRICANTE.Value := wNumFabricante;
        DBPNumFabricanteCodigoExit(Self);
        DBEQuantidade.SetFocus;
      end;
    end;
  end;
end;

end.

