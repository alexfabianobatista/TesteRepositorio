unit UOficinaOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, OracleNavigator, Grids, DBGrids,
  ActnList;

type
  TItem = Record
    UnItem: String;
    CodItem: Integer;
    QtdItem: Real;
    DescItem: String;
    PercDesconto: Real;
    ValDesconto: Real;
    ValUn: Real;
    ValItem: Real;
end;

type
  TFOficinaOrcamento = class(TFTCadSimples)
    PageControl1: TPageControl;
    TSOficinaOrcamento: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    DBDirceu2: TDBDirceu;
    SBCadastroCons: TSpeedButton;
    SBMarcaCons: TSpeedButton;
    SBVeiculoCons: TSpeedButton;
    DSItens: TDataSource;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEProduto: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    DBDirceu3: TDBDirceu;
    DBGrid1: TDBGrid;
    OracleNavigator1: TOracleNavigator;
    SBProdutoCons: TSpeedButton;
    Panel2: TPanel;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    DBDirceu4: TDBDirceu;
    SBFilialCons: TSpeedButton;
    ImprimirOramento1: TMenuItem;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    N2: TMenuItem;
    RelatriodeOramentos1: TMenuItem;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    DSSomaItemOrcamento: TDataSource;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure SBCadastroConsClick(Sender: TObject);
    procedure SBMarcaConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBVeiculoConsClick(Sender: TObject);
    procedure SBProdutoConsClick(Sender: TObject);
    procedure DSItensStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBRefreshClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBFilialConsClick(Sender: TObject);
    procedure ImprimirOramento1Click(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure DBEProdutoExit(Sender: TObject);
    procedure RelatriodeOramentos1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure EmiteOrcamento;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOficinaOrcamento: TFOficinaOrcamento;

implementation

uses UOficina_cl, UCadastro_cl, UCadastroCons, UMarca_cl, UMarcaCons,
  UVeiculoCons, UProduto_cl, UProdutoCons, UOracle_cl,
  UOficinaOrcamentoCons, UFilial_cl, UFilialCons, UBiblioteca,
  UOficinaOrcamentoParam, URelatorio_cl, UROficinaOrcamento, UFmFilial,
  UFmCadastro, UFmMarca, UFmVeiculo, UROficinaOrcamentoSintetico,
  USerie_cl;

{$R *.dfm}

procedure TFOficinaOrcamento.SBCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
    DMOficina.QOficinaOrcamentoCadCOD_CADASTRO.Value := DMCadastro.QCadastroConsCOD_CADASTRO.Value;
end;

procedure TFOficinaOrcamento.SBMarcaConsClick(Sender: TObject);
begin
  inherited;
  if FMarca_Cons = nil then
    FMarca_Cons := TFMarca_Cons.Create(Application);
  if FMarca_Cons.ShowModal = MrOk then
    DMOficina.QOficinaOrcamentoCadCOD_MARCA.Value := DMMarca.QMarcaConsCOD_MARCA.Value;
end;

procedure TFOficinaOrcamento.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBCadastroCons.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  SBMarcaCons.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  SBVeiculoCons.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  SBFilialCons.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
end;

procedure TFOficinaOrcamento.SBVeiculoConsClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = MrOk then
    DMOficina.QOficinaOrcamentoCadCOD_VEICULO.Value := DMOficina.QVeiculoConsCOD_VEICULO.Value;
end;

procedure TFOficinaOrcamento.SBProdutoConsClick(Sender: TObject);
begin
  inherited;
  DBEProduto.SetFocus;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
    DMOficina.QOficinaOrcamentoItemCOD_PRODUTO.Value := Trunc(DMProduto.QProdutoConsCOD_PRODUTO.Value);
end;

procedure TFOficinaOrcamento.DSItensStateChange(Sender: TObject);
begin
  inherited;
  SBProdutoCons.Enabled := (DSItens.State in [DsEdit, DsInsert]);
end;

procedure TFOficinaOrcamento.FormCreate(Sender: TObject);
begin
  inherited;
  DMOficina.QOficinaOrcamentoCad.Close;
  DMOficina.QOficinaOrcamentoCad.open;
  DMOficina.QOficinaOrcamentoItem.Close;
  DMOficina.QOficinaOrcamentoItem.open;
end;

procedure TFOficinaOrcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DSItens.State in [DsEdit, DsInsert] then
  begin
    MessageDlg('Itens não confirmados!'+#13+#10+'Confirme os dados dos itens antes de sair.', mtError, [mbOK], 0);
    Abort;
  end;
  inherited;
end;

procedure TFOficinaOrcamento.SBRefreshClick(Sender: TObject);
var wCod: Integer;
begin
//  inherited;
  wCod := DMOficina.QOficinaOrcamentoCadCOD_OFICINA_ORCAMENTO_CAB.Value;
  DMOficina.QOficinaOrcamentoCad.Close;
  DMOficina.QOficinaOrcamentoCad.SetVariable('PK', wCod);
  DMOficina.QOficinaOrcamentoCad.open;
end;

procedure TFOficinaOrcamento.SBCancelarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Rollback;
  SBRefreshClick(Self);
end;

procedure TFOficinaOrcamento.SBConfirmarClick(Sender: TObject);
var
  wSerie: String;
  wSerieModelo: String;
begin
  DMOficina.QOficinaOrcamentoItem.First;
  if DMOficina.QOficinaOrcamentoItem.Eof then
    Raise Exception.Create('Não é possível inserir Orçamento sem itens.');
  if not (DMOficina.QOficinaOrcamentoCadNUM_ORCAMENTO.Value > 0) then
  begin
    wSerie := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_SERIE','COD_SERIE = '+QuotedStr('ORC'));
    wSerieModelo := DMOracle.BuscaNome('SELECT COD_SERIE_MODELO FROM TB_SERIE','COD_SERIE = '+QuotedStr('ORC'));
    If wSerie = '' then
      Raise Exception.Create('É necessário criar uma Série chamada ORC.')
    else
      DMOficina.QOficinaOrcamentoCadNUM_ORCAMENTO.Value := DMSerie.NumeroSerie(DMOficina.QOficinaOrcamentoCadCOD_FILIAL.Value,'ORC',
        wSerieModelo);
  end;
  inherited;
  
  DMOracle.DBCemapa.Commit;
  if (MessageDlg('Imprimir orçamento agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    EmiteOrcamento;
end;

procedure TFOficinaOrcamento.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOficinaOrcamentoCons = nil then
    FOficinaOrcamentoCons := TFOficinaOrcamentoCons.Create(Application);
  if FOficinaOrcamentoCons.ShowModal = MrOk then
  begin
    DMOficina.QOficinaOrcamentoCad.Close;
    DMOficina.QOficinaOrcamentoCad.SetVariable('PK', DMOficina.QOficinaOrcamentoConsCOD_OFICINA_ORCAMENTO_CAB.Value);
    DMOficina.QOficinaOrcamentoCad.open;
  end;
end;

procedure TFOficinaOrcamento.SBFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
    DMOficina.QOficinaOrcamentoCadCOD_FILIAL.Value := DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFOficinaOrcamento.EmiteOrcamento;
var
  wProdutos: Array of TItem;
  wServicos: Array of TItem;
  wItem: TItem;
  wCont, wMaxLinhas, j, i: Integer;
  wAux: String;
  wTotalProdutos, wTotalServicos, wDescontoProdutos, wDescontoServicos: Real;
begin
  wTotalProdutos := 0;
  wTotalServicos := 0;
  wDescontoProdutos := 0;
  wDescontoServicos := 0;

  with DMOficina do
  begin
    if QOficinaOrcamentoCadCOD_OFICINA_ORCAMENTO_CAB.Text = '' then
      Raise Exception.Create('Por favor, selecione um orçamento antes de emitir.');
    QOficinaOrcamentoItem.First;
    while not QOficinaOrcamentoItem.Eof do
      with DMProduto do
      begin
        QProduto.Close;
        QProduto.SetVariable('PK', QOficinaOrcamentoItemCOD_PRODUTO.Value);
        QProduto.open;

        wItem.UnItem := QProdutoDESC_UNIDADE.Value;
        wItem.CodItem := Trunc(QProdutoCOD_PRODUTO.Value);
        wItem.QtdItem := QOficinaOrcamentoItemQT_QUANTIDADE.Value;
        wItem.DescItem := QProdutoDESC_PRODUTO.Value;
        if QOficinaOrcamentoItemDESC_COMPLEMENTO.Text <> '' then
          wItem.DescItem := QOficinaOrcamentoItemDESC_COMPLEMENTO.Value;
        wItem.PercDesconto := QOficinaOrcamentoItemPERC_DESCONTO.Value;
        wItem.ValUn := QOficinaOrcamentoItemVAL_UNITARIO.Value;
        wItem.ValItem := QOficinaOrcamentoItemVAL_TOTAL.Value;
        wItem.ValDesconto := wItem.ValItem * wItem.PercDesconto / 100;

        if QProdutoIND_TIPO_PRODUTO.Value <> 'SERVIÇO' then
        begin
          i := Length(wProdutos);
          SetLength(wProdutos, i + 1);
          wProdutos[i] := wItem;
          wDescontoProdutos := wDescontoProdutos + wItem.ValDesconto;
          wTotalProdutos := wTotalProdutos + wItem.ValItem;
        end
        else
        begin
          i := Length(wServicos);
          SetLength(wServicos, i + 1);
          wServicos[i] := wItem;
          wDescontoServicos := wDescontoServicos + wItem.ValDesconto;
          wTotalServicos := wTotalServicos + wItem.ValItem;
        end;
        QOficinaOrcamentoItem.Next;
      end;
  end;
  wAux := DMOracle.BuscaNome('SELECT DESC_LPT_PEDIDO FROM TB_FILIAL', 'COD_FILIAL = ' +
                                  DMOficina.QOficinaOrcamentoCadCOD_FILIAL.Text);
  if Imp = Nil Then
    Imp := TImp.Create;
  if Trim(wAux) = 'LPT1' then
    Imp.AbreImpressora
  else
    if Trim(wAux) = 'LPT2'
    then
      Imp.AbreImpressora_Lpt2
    else
      Imp.AbreImpressora_Com2;
  Imp.ConfiguraImpressora('CONDENSADO_ON','OITAVOS',88);


  // Emissão de Orçamento para a Retífica INJEPAR
  i := 0;
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK', DMOficina.QOficinaOrcamentoCadCOD_FILIAL.Value);
  DMFilial.QFilial.open;
  wMaxLinhas := 53;

  while (i < Length(wProdutos)) or (i < Length(wProdutos)) do
  begin
    wCont := 0;
    Imp.WriteXY(0,wCont,DMFilial.QFilialDESC_FILIAL.Value);
    if i > 0 then
      Imp.WriteXY(17,wCont,'CONTINUACAO');
    Imp.WriteXY(18.5,wCont,FormatDateTime('dd/MM/yyyy', Date));
    Inc(wCont);
    Imp.WriteXY(0,wCont,DMFilial.QFilialDESC_ENDERECO.Value + ', ' +
        DMFilial.QFilialNUM_ENDERECO.Text + ', ' +
        DMFilial.QFilialDESC_CIDADE.Text + ' - ' +
        DMFilial.QFilialCOD_ESTADO.Text);
    Inc(wCont);
    Imp.WriteXY(0,wCont,'FONE/FAX ' + DMFilial.QFilialDESC_TELEFONE.Text +
        '      CEP ' + DMFilial.QFilialDESC_CEP.Text);
    Inc(wCont,2);
    Imp.WriteXY(8.5,wCont,'O  R  C  A  M  E  N  T  O');
    Inc(wCont);
    Imp.WriteXY(17.5,wCont,'Nro: ' + Bib.NumToTexto(DMOficina.QOficinaOrcamentoCadNUM_ORCAMENTO.Value, 0, 12));
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Cliente......: ');
    Imp.WriteXY(2.5,wCont,DMOficina.QOficinaOrcamentoCadCOD_CADASTRO.Text + ' - ' + DMOficina.QOficinaOrcamentoCadDESC_CADASTRO.Value);
    if DMOficina.QOficinaOrcamentoCadCOD_CADASTRO.Text <> '' then
      Imp.WriteXY(16.5,wCont,'Fone: ' + DMOracle.BuscaNome('SELECT DESC_TELEFONE FROM TB_CADASTRO',
          'COD_CADASTRO = ' + DMOficina.QOficinaOrcamentoCadCOD_CADASTRO.Text));
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Prazo p/ Pgto:');
    Inc(wCont);
    Imp.WriteXY(0,wCont,'Motor........:');
    if DMOficina.QOficinaOrcamentoCadIND_DESCRICAO_MARCA.Value <> 'S' then
    begin
      Imp.WriteXY(2.5,wCont,DMOracle.BuscaNome('SELECT DESC_MARCA FROM TB_MARCA','COD_MARCA = ' +
          DMOficina.QOficinaOrcamentoCadCOD_MARCA.Text, True));
      Imp.WriteXY(10,wCont, DMOficina.QOficinaOrcamentoCadDESC_COMPL_MARCA.Value);
    end
    else
      Imp.WriteXY(2.5,wCont, DMOficina.QOficinaOrcamentoCadDESC_COMPL_MARCA.Value);
//    if DMOficina.QOficinaOrcamentoCadCOD_VEICULO.Text <> '' then
//      Imp.WriteXY(2.5,wCont,DMOracle.BuscaNome('SELECT DESC_CARACTERISTICA FROM TB_VEICULO',
//          'COD_VEICULO = ' + DMOficina.QOficinaOrcamentoCadCOD_VEICULO.Text));
    Imp.WriteXY(16.5,wCont,'Data Entrada: ' + DMOficina.QOficinaOrcamentoCadDT_ORCAMENTO.Text);
    Inc(wCont);

    j := 0;
    while (j < 20) do
    begin
      Imp.WriteXY(j, wCont, '======='); //  Imprime a linha de traços
      Inc(j);
    end;

    Inc(wCont);
    j := 0;
    Imp.WriteXY(5,wCont,'P  E  C  A  S');
    Imp.WriteXY(10.5,wCont,'||');
    Imp.WriteXY(13.8,wCont,'M  A  O    D  E    O  B  R  A');
    Inc(wCont);
    while (j < 20) do
    begin
      Imp.WriteXY(j, wCont, '-------'); //  Imprime a linha de traços
      Inc(j);
    end;

    Inc(wCont);
    Imp.WriteXY(0,wCont,'Uni');
    Imp.WriteXY(0.8,wCont,'Codigo');
    Imp.WriteXY(3,wCont,'Qtd');
    Imp.WriteXY(3.6,wCont,'Discriminacao');
    Imp.WriteXY(8.8,wCont,'Vlr. Total');

    Imp.WriteXY(10.5,wCont,'||');
    Imp.WriteXY(10.9,wCont,'Qtd');
    Imp.WriteXY(11.5,wCont,'Uni');
    Imp.WriteXY(12.5,wCont,'Discriminacao');
    Imp.WriteXY(18.5,wCont,'Vlr. Total');

    j := 0;
    while (i < Length(wProdutos)) or (i < Length(wServicos)) do
    begin
      Inc(wCont);
      if i < Length(wProdutos) then
      begin
        Imp.WriteXY(0.1,wCont,wProdutos[i].UnItem);
        Imp.WriteXY(0.8,wCont,Bib.NumToTexto(wProdutos[i].CodItem, 0, 6));
        Imp.WriteXY(2,wCont,Bib.NumToTexto(wProdutos[i].QtdItem, 0, 10));
        Imp.WriteXY(3.6,wCont,Copy(wProdutos[i].DescItem, 1, 30));
        Imp.WriteXY(8.4,wCont,Bib.NumToTexto(wProdutos[i].ValItem, 2, 12));
      end;

      Imp.WriteXY(10.5,wCont,'||');
      if i < Length(wServicos) then
      begin
        Imp.WriteXY(10.9,wCont,Bib.NumToTexto(wServicos[i].QtdItem, 0, 3));
        Imp.WriteXY(11.6,wCont,wServicos[i].UnItem);
        Imp.WriteXY(12.5,wCont,Copy(wServicos[i].DescItem, 1, 37));
        Imp.WriteXY(18.2,wCont,Bib.NumToTexto(wServicos[i].ValItem, 2, 12));
      end;

      Inc(i);
      Inc(j);
      if (j >= wMaxLinhas) and (((Length(wProdutos) - i) > 1) or ((Length(wServicos) - i) > 1)) then
      begin
        Inc(wCont);
        Imp.WriteXY(16,wCont,'CONTINUA...');
        Break;
      end;
    end;

    Inc(wCont, wMaxLinhas - j + 1);
    if (wMaxLinhas - j + 1) = 0 then
      Inc(wCont, 2);
    Imp.WriteXY(0.2,wCont,'SUB-TOTAL:');
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(wTotalProdutos, 2, 17));
    Imp.WriteXY(10.5,wCont,'||');
    Imp.WriteXY(11,wCont,'SUB-TOTAL:');
    Imp.WriteXY(17.5,wCont,Bib.NumToTexto(wTotalServicos, 2, 17));

    wDescontoProdutos := wDescontoProdutos + DMOficina.QOficinaOrcamentoCadVAL_DESCONTO_PECAS.Value;
    wDescontoServicos := wDescontoServicos + DMOficina.QOficinaOrcamentoCadVAL_DESCONTO_SERVICOS.Value;

    Inc(wCont);
    Imp.WriteXY(0.2,wCont,'DESCONTO:');
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(wDescontoProdutos, 2, 17));
    Imp.WriteXY(10.5,wCont,'||');
    Imp.WriteXY(11,wCont,'DESCONTO:');
    Imp.WriteXY(17.5,wCont,Bib.NumToTexto(wDescontoServicos, 2, 17));

    Inc(wCont);
    Imp.WriteXY( 7.5,wCont,'-----------------');
    Imp.WriteXY(10.5,wCont,'||');
    Imp.WriteXY(17.5,wCont,'-----------------');

    Inc(wCont);
    Imp.WriteXY(0.2,wCont,'LIQUIDO:');
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(wTotalProdutos - wDescontoProdutos, 2, 17));
    Imp.WriteXY(10.5,wCont,'||');
    Imp.WriteXY(11,wCont,'LIQUIDO:');
    Imp.WriteXY(17.5,wCont,Bib.NumToTexto(wTotalServicos - wDescontoServicos, 2, 17));

    Inc(wCont);
    j := 0;
    while (j < 20) do
    begin
      Imp.WriteXY(j, wCont, '======='); //  Imprime a linha de traços
      Inc(j);
    end;

    Inc(wCont);
    Imp.WriteXY(0.2,wCont,'TOTAL GERAL:');
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(wTotalProdutos + wTotalServicos, 2, 17));

    Inc(wCont);
    Imp.WriteXY(0.2,wCont,'DESCONTO TOTAL:');
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(wDescontoProdutos + wDescontoServicos, 2, 17));

    Inc(wCont);
    Imp.WriteXY(7.5,wCont,'-----------------');

    Inc(wCont);
    Imp.WriteXY(0.2,wCont,'TOTAL GERAL LIQUIDO:');
    Imp.WriteXY(7.5,wCont,Bib.NumToTexto(wTotalProdutos + wTotalServicos - wDescontoProdutos - wDescontoServicos, 2, 17));

    Inc(wCont, 2);
    Imp.WriteXY(0,wCont,'Observacoes: ' + Copy(DMOficina.QOficinaOrcamentoCadDESC_SERVICO.Value,1,85));
    Inc(wCont);
    Imp.WriteXY(0,wCont,Copy(DMOficina.QOficinaOrcamentoCadDESC_SERVICO.Value,86,98));

    Inc(wCont);
    Imp.WriteXY(0,wCont,Copy(DMOficina.QOficinaOrcamentoCadDESC_SERVICO.Value,184,98));
    Imp.WriteXY(14.5,wCont,'_____________________________________');
    Inc(wCont);
    Imp.WriteXY(16.5,wCont,'AUTORIZO');

    Inc(wCont);
    j := 0;
    while (j < 20) do
    begin
      Imp.WriteXY(j, wCont, '======='); //  Imprime a linha de traços
      Inc(j);
    end;

    Imp.SaltaPagina;
  end;
  Imp.FechaImpressora;
end;

procedure TFOficinaOrcamento.ImprimirOramento1Click(Sender: TObject);
begin
  inherited;
  EmiteOrcamento;
end;

procedure TFOficinaOrcamento.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  DBEProduto.SetFocus;
end;

procedure TFOficinaOrcamento.SBExcluirClick(Sender: TObject);
begin
//  inherited;
  If not (MessageDlg('Apagar este registro?',mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    Exit;
  if DMOficina.QOficinaOrcamentoCad.Eof then
    Raise Exception.Create('Selecione um orçamento.');
  try
    if not DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.StartTransaction;
    DMOracle.ExecutaSql('DELETE FROM TB_OFICINA_ORCAMENTO_ITEM WHERE COD_OFICINA_ORCAMENTO_CAB = ' + DMOficina.QOficinaOrcamentoCadCOD_OFICINA_ORCAMENTO_CAB.Text, False);
    DMOficina.QOficinaOrcamentoCad.Delete;
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  except
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Rollback;
    Raise;
  end;
end;

procedure TFOficinaOrcamento.DBEProdutoExit(Sender: TObject);
var
  wAux: String;
begin
  inherited;
  with DMOficina do
    if (QOficinaOrcamentoItem.State in [DsEdit, DsInsert]) and (QOficinaOrcamentoCadCOD_MARCA.Value > 0) then
      if ((QOficinaOrcamentoItemVAL_UNITARIO.Text = '') or not (QOficinaOrcamentoItemVAL_UNITARIO.Value > 0)) and (QOficinaOrcamentoItemCOD_PRODUTO.Text <> '') then
      begin
        wAux := DMOracle.BuscaNome('SELECT VAL_PRODUTO_MARCA FROM TB_PRODUTO_MARCA',
                                   'COD_PRODUTO = ' + QOficinaOrcamentoItemCOD_PRODUTO.Text +
                                   'AND COD_MARCA = ' + QOficinaOrcamentoCadCOD_MARCA.Text);
        if wAux <> '' then
          QOficinaOrcamentoItemVAL_UNITARIO.Value := StrToFloat(wAux);
      end;
end;

procedure TFOficinaOrcamento.RelatriodeOramentos1Click(Sender: TObject);
begin
  inherited;
  if FOficinaOrcamentoParam = nil then
    FOficinaOrcamentoParam := TFOficinaOrcamentoParam.Create(Application);
  FOficinaOrcamentoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FOficinaOrcamentoParam.ShowModal = MrOk then
    with DMOficina_Relatorio do
    begin
      if (Trim(FOficinaOrcamentoParam.Fm0Datas.MeDtInicial.Text) = '') or
          (Trim(FOficinaOrcamentoParam.Fm0Datas.MeDtFinal.Text) = '') then
        Raise Exception.Create('Por favor, informe as datas inicial e final.');
      if FOficinaOrcamentoParam.RGAnaliticoSintetico.ItemIndex = 0 then      
      begin    // ANALITICO
        QROficinaOrcamento.Close;
        QROficinaOrcamento.SetVariable('DT_INICIO', FOficinaOrcamentoParam.Fm0Datas.MeDtInicial.Text);
        QROficinaOrcamento.SetVariable('DT_FIM', FOficinaOrcamentoParam.Fm0Datas.MeDtFinal.Text);
        if Trim(FOficinaOrcamentoParam.Fm0Filial.MeFilial.Text) <> '' then
          QROficinaOrcamento.SetVariable('COD_FILIAL', FOficinaOrcamentoParam.Fm0Filial.MeFilial.Text)
        else
          QROficinaOrcamento.SetVariable('COD_FILIAL', null);
        if Trim(FOficinaOrcamentoParam.Fm0Cadastro.MeCadastro.Text) <> '' then
          QROficinaOrcamento.SetVariable('COD_CADASTRO', FOficinaOrcamentoParam.Fm0Cadastro.MeCadastro.Text)
        else
          QROficinaOrcamento.SetVariable('COD_CADASTRO', null);
        if Trim(FOficinaOrcamentoParam.Fm0Veiculo.MeVeiculo.Text) <> '' then
          QROficinaOrcamento.SetVariable('COD_VEICULO', FOficinaOrcamentoParam.Fm0Veiculo.MeVeiculo.Text)
        else
          QROficinaOrcamento.SetVariable('COD_VEICULO', null);
        if Trim(FOficinaOrcamentoParam.Fm0Marca.MeMarca.Text) <> '' then
          QROficinaOrcamento.SetVariable('COD_MARCA', FOficinaOrcamentoParam.Fm0Marca.MeMarca.Text)
        else
          QROficinaOrcamento.SetVariable('COD_MARCA', null);
        QROficinaOrcamento.open;

        if FROficinaOrcamento = nil then
          FROficinaOrcamento := TFROficinaOrcamento.Create(Application);
        FROficinaOrcamento.QRLFilial.Caption := FOficinaOrcamentoParam.Fm0Filial.EdFilial.Text;
        FROficinaOrcamento.QRLVeiculo.Caption := FOficinaOrcamentoParam.Fm0Veiculo.EdVeiculo.Text;
        FROficinaOrcamento.QRLCadastro.Caption := FOficinaOrcamentoParam.Fm0Cadastro.EdCadastro.Text;
        FROficinaOrcamento.QRLMarca.Caption := FOficinaOrcamentoParam.Fm0Marca.EdMarca.Text;

        if FOficinaOrcamentoParam.RGPreview.ItemIndex = 0 then
          FROficinaOrcamento.QRPrimario.Preview
        else
          FROficinaOrcamento.QRPrimario.Print;
        QROficinaOrcamento.Close;
      end
      else
      begin     // SINTETICO
        QROficinaOrcamentoSintetico.Close;
        QROficinaOrcamentoSintetico.SetVariable('DT_INICIO', FOficinaOrcamentoParam.Fm0Datas.MeDtInicial.Text);
        QROficinaOrcamentoSintetico.SetVariable('DT_FIM', FOficinaOrcamentoParam.Fm0Datas.MeDtFinal.Text);
        if Trim(FOficinaOrcamentoParam.Fm0Filial.MeFilial.Text) <> '' then
          QROficinaOrcamentoSintetico.SetVariable('COD_FILIAL', FOficinaOrcamentoParam.Fm0Filial.MeFilial.Text)
        else
          QROficinaOrcamentoSintetico.SetVariable('COD_FILIAL', null);
        if Trim(FOficinaOrcamentoParam.Fm0Cadastro.MeCadastro.Text) <> '' then
          QROficinaOrcamentoSintetico.SetVariable('COD_CADASTRO', FOficinaOrcamentoParam.Fm0Cadastro.MeCadastro.Text)
        else
          QROficinaOrcamentoSintetico.SetVariable('COD_CADASTRO', null);
        if Trim(FOficinaOrcamentoParam.Fm0Veiculo.MeVeiculo.Text) <> '' then
          QROficinaOrcamentoSintetico.SetVariable('COD_VEICULO', FOficinaOrcamentoParam.Fm0Veiculo.MeVeiculo.Text)
        else
          QROficinaOrcamentoSintetico.SetVariable('COD_VEICULO', null);
        if Trim(FOficinaOrcamentoParam.Fm0Marca.MeMarca.Text) <> '' then
          QROficinaOrcamentoSintetico.SetVariable('COD_MARCA', FOficinaOrcamentoParam.Fm0Marca.MeMarca.Text)
        else
          QROficinaOrcamentoSintetico.SetVariable('COD_MARCA', null);
        QROficinaOrcamentoSintetico.open;

        if FROficinaOrcamentoSintetico = nil then
          FROficinaOrcamentoSintetico := TFROficinaOrcamentoSintetico.Create(Application);
        FROficinaOrcamentoSintetico.QRLFilial.Caption := FOficinaOrcamentoParam.Fm0Filial.EdFilial.Text;
        FROficinaOrcamentoSintetico.QRLVeiculo.Caption := FOficinaOrcamentoParam.Fm0Veiculo.EdVeiculo.Text;
        FROficinaOrcamentoSintetico.QRLCadastro.Caption := FOficinaOrcamentoParam.Fm0Cadastro.EdCadastro.Text;
        FROficinaOrcamentoSintetico.QRLMarca.Caption := FOficinaOrcamentoParam.Fm0Marca.EdMarca.Text;

        if FOficinaOrcamentoParam.RGPreview.ItemIndex = 0 then
          FROficinaOrcamentoSintetico.QRPrimario.Preview
        else
          FROficinaOrcamentoSintetico.QRPrimario.Print;
        QROficinaOrcamentoSintetico.Close;
      end;
    end;
end;

procedure TFOficinaOrcamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = '+') then
  begin
    if (DSPrimario.State in [DsEdit, DsInsert]) then
    begin
      if DSItens.State in [DsEdit, DsInsert] then
        DMOficina.QOficinaOrcamentoItem.Post;
      DMOficina.QOficinaOrcamentoItem.Append;
      DBEProduto.SetFocus;
    end;
    key := #0;
  end;
end;

end.
