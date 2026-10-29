unit UTabelaPrecoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBPanel, DBCtrls, OracleNavigator, Grids,
  DBGrids, DBDirceu, OraTeste, uBiblioteca;

type
  TFTabelaPrecoCad = class(TFTCadSimples)
    Label29: TLabel;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBComboBox3: TDBComboBox;
    ONavigator: TOracleNavigator;
    DsTabelaPrecoitem: TDataSource;
    DBGItens: TDBGrid;
    Label1: TLabel;
    DBEPreco: TDBEdit;
    DBPCodProduto: TDBPanel;
    ActionList1: TActionList;
    AInsertItens: TAction;
    ADeleteItens: TAction;
    DBCBloqueiaDesconto: TDBCheckBox;
    Opes1: TMenuItem;
    AjustaPrecoporPercentual: TMenuItem;
    GroupBox1: TGroupBox;
    btnAplicaPercentual: TBitBtn;
    GroupBox2: TGroupBox;
    DBPanel3: TDBPanel;
    btnPrecoEstoque: TBitBtn;
    btnZerar: TBitBtn;
    btnAplicarPercentualTudo: TBitBtn;
    LbQuantidade: TLabel;
    DBEQuantidade: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtProdutoClick(Sender: TObject);
    procedure DBPCodProdutoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBEPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure SBConsultaClick(Sender: TObject);
    procedure Relatrios1Click(Sender: TObject);
    procedure AInsertItensExecute(Sender: TObject);
    procedure ADeleteItensExecute(Sender: TObject);
    procedure AjustaPrecoporPercentualClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBPCodProdutoCodigoExit(Sender: TObject);
    procedure DBPCodProdutoCodigoChange(Sender: TObject);
    procedure btnAplicaPercentualClick(Sender: TObject);
    procedure btnPrecoEstoqueClick(Sender: TObject);
    procedure btnZerarClick(Sender: TObject);
    procedure btnAplicarPercentualTudoClick(Sender: TObject);
    procedure BtCopiaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTabelaPrecoCad: TFTabelaPrecoCad;

implementation
uses UOracle_cl, UTabelaPreco_cl, Uproduto_cl, UProdutoCons, UTabelaPrecoCons,
     URTabelaPreco, UProdutoParam, DateUtils, UParamSistema_cl, UUsuario_cl;

{$R *.dfm}

procedure TFTabelaPrecoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMTabelaPreco.QTabelaPrecoCab.Open;
  DMTabelaPreco.QTabelaPrecoItem.Open;
  if DMParamSistema.CodEmpresa = 'ALVARES' then
    DMTabelaPreco.QTabelaPrecoItemVAL_PRECO.DisplayFormat := '#,####0.0000';
  if DMParamSistema.CodEmpresa = 'INJEPAR' then
  begin
    LbQuantidade.Visible := True;
    DBEQuantidade.Visible := True;
    DBGItens.Columns.Items[2].Visible := True;
  end;

end;

procedure TFTabelaPrecoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMTabelaPreco.QTabelaPrecoCab.Close;
  DMTabelaPreco.QTabelaPrecoItem.Close;
end;

procedure TFTabelaPrecoCad.BtProdutoClick(Sender: TObject);
begin
  inherited;
   If FProdutoCons  = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = MrOk Then
    DMTabelaPreco.QTabelaPrecoItemCOD_PRODUTO.Value := Trunc(DMProduto.QProdutoConsCOD_PRODUTO.Value);
    
end;

procedure TFTabelaPrecoCad.DBPCodProdutoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;

end;

procedure TFTabelaPrecoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  ONavigator.Enabled:=DSPrimario.State in [Dsinsert,Dsedit];
  btnAplicaPercentual.Enabled:=DSPrimario.State in [Dsinsert,Dsedit];
  btnPrecoEstoque.Enabled:=DSPrimario.State in [Dsinsert,Dsedit];
  btnZerar.Enabled:=DSPrimario.State in [Dsinsert,Dsedit];
  btnAplicarPercentualTudo.Enabled:=DSPrimario.State in [Dsinsert,Dsedit];
end;

procedure TFTabelaPrecoCad.SBConfirmarClick(Sender: TObject);
begin
  Try
    inherited;
    DMOracle.DBCemapa.Commit;
  Except
    Raise;
  End;
end;

procedure TFTabelaPrecoCad.DBEPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
{  if Key = Chr(43) then
  begin
    ONavigator.BtnClick(nbInsert);
    //DBPanel3.SetFocus;
  end;}
end;

procedure TFTabelaPrecoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FTabelaPrecoCons = nil then
    FTabelaPrecoCons := TFTabelaPrecoCons.Create(Application);
  if FTabelaPrecoCons.ShowModal = MrOk then
    with DMTabelaPreco do
    begin
      QTabelaPrecoCab.Close;
      QTabelaPrecoCab.SetVariable('PK', QTabelaPrecoConsCOD_TABELA_PRECO_CAB.Value);
      QTabelaPrecoCab.Open;
    end;

end;

procedure TFTabelaPrecoCad.Relatrios1Click(Sender: TObject);
begin
  inherited;
  if FProdutoParam = nil then
    FProdutoParam := TFProdutoParam.Create(Application);
  FProdutoParam.PGRelatorio.Pages[43].TabVisible := true;
  if FProdutoParam.Showmodal = mrOk then
  begin
    if FRTabelaPreco = nil then
      FRTabelaPreco := TFRTabelaPreco.Create(Application);
    with DMTabelaPreco do
    begin
      QRTabelaPreco.Close;

      if Trim(FProdutoParam.FmSubClasse43.MeClasse.Text) = '' then
        QRTabelaPreco.SetVariable('CLASSE', Null)
      else
        QRTabelaPreco.SetVariable('CLASSE', FProdutoParam.FmSubClasse43.MeClasse.Text);
      if (Trim(FProdutoParam.FmSubClasse43.MeSubClasse.Text) = '') then // or (Trim(FProdutoParam.ME43Subclasse.Text) = '0') then
        QRTabelaPreco.SetVariable('SUBCLASSE', Null)
      else
        QRTabelaPreco.SetVariable('SUBCLASSE', FProdutoParam.FmSubClasse43.MeSubClasse.Text);

      if Trim(FProdutoParam.Me43CodTabelaPreco.Text) <> '' then
        QRTabelaPreco.SetVariable('COD_TABELA', Trim(FProdutoParam.Me43CodTabelaPreco.Text))
      else
        QRTabelaPreco.SetVariable('COD_TABELA', Null);
      case FProdutoParam.RG43Situacao.ItemIndex of
        0: QRTabelaPreco.SetVariable('IND_SITUACAO', 'ATIVO');
        1: QRTabelaPreco.SetVariable('IND_SITUACAO', 'DESATIVADO');
        2: QRTabelaPreco.SetVariable('IND_SITUACAO', Null);
      end;

      QRTabelaPreco.SQL[QRTabelaPreco.SQL.Count - 1] := '';
      case FProdutoParam.RG43Ordem.ItemIndex of
        0: QRTabelaPreco.SQL.Add('cla.num_classe,CLA.NUM_SUBCLASSE,TPC.COD_TABELA_PRECO_CAB, TPI.COD_PRODUTO');
        1: QRTabelaPreco.SQL.Add('cla.num_classe,CLA.NUM_SUBCLASSE,TPC.COD_TABELA_PRECO_CAB, PROD.DESC_PRODUTO');
      end;
      QRTabelaPreco.SQL[QRTabelaPreco.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      if DMParamSistema.CodEmpresa = 'INJEPAR' then
        QRTabelaPreco.SQL.Add('ORDER BY TPC.COD_TABELA_PRECO_CAB,  TPI.COD_PRODUTO ')
      else
        QRTabelaPreco.SQL.Add('ORDER BY cla.num_classe,CLA.NUM_SUBCLASSE,TPC.COD_TABELA_PRECO_CAB, TPC.IND_SITUACAO');

      QRTabelaPreco.Open;
      FRTabelaPreco.QRLTitulo.Caption := 'Tabela de Preços';
      //if (Trim(FProdutoParam.FmSubClasse43.MeClasse.Text) = '') and (Trim(FProdutoParam.FmSubClasse43.MeSubClasse.Text) = '') then
//      begin
//        FRTabelaPreco.QRGroup2.Enabled := False;
//        FRTabelaPreco.QRDBText6.Enabled := False;
//        FRTabelaPreco.QRDBText7.Enabled := False;
//        FRTabelaPreco.QRDBText8.Enabled := False;
//      end
//      else
//      begin
//        FRTabelaPreco.QRGroup2.Enabled := True;
//        FRTabelaPreco.QRDBText6.Enabled := True;
//        FRTabelaPreco.QRDBText7.Enabled := True;
//        FRTabelaPreco.QRDBText8.Enabled := True;
//      end;
      if DMParamSistema.CodEmpresa = 'INJEPAR' then //Injepar precisa desses campos no relatório. Junior 14/03/2023 suporte #6823
      begin
        FRTabelaPreco.QRLQtde.Enabled := True;
        FRTabelaPreco.QRLTotal.Enabled := True;
        FRTabelaPreco.QRDBQtd.Enabled := True;
        FRTabelaPreco.QRDBVal_Total_Item.Enabled := True;
        FRTabelaPreco.QRGroup3.Enabled := False;
        FRTabelaPreco.QRSumaryTabelaPreco.Enabled := True;
      end;
      if DMParamSistema.CodEmpresa = 'DEION' then
      begin
        FRTabelaPreco.QRLQtde.Enabled := True;
        FRTabelaPreco.QRLQtde.Caption := '% IPI';
        FRTabelaPreco.QRDBQtd.Enabled := True;
        FRTabelaPreco.QRDBQtd.DataField := 'PERC_IPI';
        FRTabelaPreco.QRLTotal.Enabled := True;
        FRTabelaPreco.QRDBVal_Total_Item.Enabled := True;
        FRTabelaPreco.QRDBVal_Total_Item.DataField := 'VAL_TOTAL_COM_IPI';
      end;
      if FProdutoParam.RGPreview.ItemIndex = 0 then
        FRTabelaPreco.QRPrimario.Preview
      else
        FRTabelaPreco.QRPrimario.Print;
      QRTabelaPreco.Close;
    end;
  end;
end;

procedure TFTabelaPrecoCad.AInsertItensExecute(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [Dsinsert,Dsedit] then
  begin
    ONavigator.BtnClick(nbInsert);
    if DBPCodProduto.CanFocus then
      DBPCodProduto.SetFocus;
  end;
end;

procedure TFTabelaPrecoCad.ADeleteItensExecute(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [Dsedit] then
  begin
    ONavigator.BtnClick(nbDelete);
  end;
end;

procedure TFTabelaPrecoCad.AjustaPrecoporPercentualClick(Sender: TObject);
var
  wPorcentagem : double;
  wCodTabelaPrecoCab : Integer;
begin
  inherited;
  if FProdutoParam = nil then
    FProdutoParam := TFProdutoParam.Create(Application);
  FProdutoParam.PGRelatorio.Pages[44].TabVisible := true;
  if FProdutoParam.Showmodal = mrOk then
  begin
    with DMTabelaPreco do
    begin
      QTabelaPrecoItem.open;
      QReajustaPreco.close;

      if QTabelaPrecoItemCOD_TABELA_PRECO_CAB.Text = '' then
        raise exception.create('Pesquise uma Tabela de Preço para Reajustar.');

      QReajustaPreco.SetVariable('COD_TABELA_PRECO_CAB', QTabelaPrecoItemCOD_TABELA_PRECO_CAB.Value);
      QReajustaPreco.open;
      wPorcentagem := StrToFloat(Trim(FProdutoParam.Me44Porcentagem.Text));
      wCodTabelaPrecoCab := QReajustaPrecoCOD_TABELA_PRECO_CAB.Value;

      if MessageDlg('Deseja Reajustar a Lista de Preço ' + floattostr(wPorcentagem) + '%?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        OPReajustaListaPreco.CallProcedure('PROC_REAJUSTA_LISTA_PRECO', [wPorcentagem, wCodTabelaPrecoCab]);
        QTabelaPrecoItem.Refresh;
        ShowMessage('Lista de Preço Atualizada com Sucesso.');
      end
      else
        ShowMessage('Ocorreu um erro na atualização, a lista não foi reajustada.');
      QReajustaPreco.close;
    end; //end wITH tabelapreco
  end; //end showmodal
end;

procedure TFTabelaPrecoCad.FormShow(Sender: TObject);
begin
  inherited;
  //Gian, 11/11/2017. Solicitado por Marlon somente para Kreuz
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'KREUZ' then
  begin
    if DMUsuario.Privilegiado then
      DBCBloqueiaDesconto.Enabled := True
    else
      DBCBloqueiaDesconto.Enabled := False;
  end;
end;

procedure TFTabelaPrecoCad.DBPCodProdutoCodigoExit(Sender: TObject);
begin
  inherited;
{  with DMTabelaPreco do
  begin
    if QTabelaPrecoItemCOD_PRODUTO.Text <> '' then
      QTabelaPrecoItemVAL_PRECO.Value := StrToFloat(DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = ' +
                                                                                          QUotedStr(QTabelaPrecoItemCOD_PRODUTO.Text)));
  end;  }
end;

procedure TFTabelaPrecoCad.DBPCodProdutoCodigoChange(Sender: TObject);
begin
  inherited;
  DBPCodProdutoCodigoExit(Sender);
end;

procedure TFTabelaPrecoCad.btnAplicaPercentualClick(Sender: TObject);
var
  input: String;
  wPercent, wNovoPreco: Real;
  isNumeric, isOk: Boolean;
begin
  inherited;

  isNumeric := False;
  isOk := False;

  while not isNumeric do
  begin
    if InputQuery('Percentual', 'Informe o percentual (é possível informar percentual negativo):', input) then
    begin
      try
        wPercent := StrToFloat(input);
        isNumeric := True;
        isOk := True;
      except
        ShowMessage('Valor inválido foi digitado.');
      end;
    end
    else
      isNumeric := True;
  end;

  if isOk then
  begin
    wNovoPreco := DMTabelaPreco.QTabelaPrecoItemVAL_PRECO.Value+((DMTabelaPreco.QTabelaPrecoItemVAL_PRECO.Value/100)*wPercent);
    DMOracle.ExecutaSql('UPDATE TB_TABELA_PRECO_ITEM SET VAL_PRECO ='+ QuotedStr(FloatToStr(wNovoPreco)) + ' WHERE COD_TABELA_PRECO_ITEM = ' + DMTabelaPreco.QTabelaPrecoItemCOD_TABELA_PRECO_ITEM.Text);
    DMTabelaPreco.QTabelaPrecoItem.RefreshRecord;
  end;
end;

procedure TFTabelaPrecoCad.btnPrecoEstoqueClick(Sender: TObject);
var
  wNovoPreco: Real;
begin
  inherited;
  try
    wNovoPreco := StrToFloat(DMOracle.FastSelect('VAL_VAREJO','TB_PRODUTO','COD_PRODUTO =' + DMTabelaPreco.QTabelaPrecoItemCOD_PRODUTO.Text));
    DMOracle.ExecutaSql('UPDATE TB_TABELA_PRECO_ITEM SET VAL_PRECO ='+ QuotedStr(FloatToStr(wNovoPreco)) + ' WHERE COD_TABELA_PRECO_ITEM = ' + DMTabelaPreco.QTabelaPrecoItemCOD_TABELA_PRECO_ITEM.Text);
    DMTabelaPreco.QTabelaPrecoItem.RefreshRecord;
  except
    ShowMessage('Erro ao buscar preço do produto, consulte o valor no estoque.');
  end;
end;

procedure TFTabelaPrecoCad.btnZerarClick(Sender: TObject);
begin
  inherited;
    DMOracle.ExecutaSql('UPDATE TB_TABELA_PRECO_ITEM SET VAL_PRECO = 0 WHERE COD_TABELA_PRECO_ITEM = ' + DMTabelaPreco.QTabelaPrecoItemCOD_TABELA_PRECO_ITEM.Text);
    DMTabelaPreco.QTabelaPrecoItem.RefreshRecord;
end;

procedure TFTabelaPrecoCad.btnAplicarPercentualTudoClick(Sender: TObject);
var
  input, wSql: String;
  wPercent, wNovoPreco: Real;
  isNumeric, isOk: Boolean;
begin
  inherited;

  isNumeric := False;
  isOk := False;

  while not isNumeric do
  begin
    if InputQuery('Percentual', 'Informe o percentual (é possível informar percentual negativo):', input) then
    begin
      try
        wPercent := StrToFloat(input);
        isNumeric := True;
        isOk := True;
      except
        ShowMessage('Valor inválido foi digitado.');
      end;
    end
    else
      isNumeric := True;
  end;

  if isOk then
    if MessageDlg('Realmente aplicar pencentual em toda tabela de preço?',mtConfirmation,[mbYes,mbNo], 0) = mrYes then
    begin
      wSql := 'UPDATE TB_TABELA_PRECO_ITEM SET VAL_PRECO = (VAL_PRECO+((VAL_PRECO/100)*' +  Bib.TrocaVirgulaPorPonto(FloatToStr(wPercent)) + ')) WHERE COD_TABELA_PRECO_CAB = ' + DMTabelaPreco.QTabelaPrecoCabCOD_TABELA_PRECO_CAB.Text;
      DMOracle.ExecutaSql(wSql);
      DMTabelaPreco.QTabelaPrecoItem.Refresh;
    end;
end;

procedure TFTabelaPrecoCad.BtCopiaClick(Sender: TObject);
begin
  with DMTabelaPreco do
  begin
    CDSTabelaPrecoItem.EmptyDataSet;
    QTabelaPrecoItem.First;
    while not QTabelaPrecoItem.Eof do
    begin
      CDSTabelaPrecoItem.Append;
      CDSTabelaPrecoItemcod_produto.Value := QTabelaPrecoItemCOD_PRODUTO.Value;
      CDSTabelaPrecoItemval_preco.Value   := QTabelaPrecoItemVAL_PRECO.Value;
      QTabelaPrecoItem.Next;
    end;
    inherited;
    CDSTabelaPrecoItem.First;
    while not CDSTabelaPrecoItem.Eof do
    begin
       QTabelaPrecoItem.Append;
       QTabelaPrecoItemCOD_TABELA_PRECO_CAB.Value := QTabelaPrecoCabCOD_TABELA_PRECO_CAB.Value;
       QTabelaPrecoItemCOD_PRODUTO.Value := CDSTabelaPrecoItemcod_produto.Value;
       QTabelaPrecoItemVAL_PRECO.Value   := CDSTabelaPrecoItemval_preco.Value;
       QTabelaPrecoItem.Post;
       CDSTabelaPrecoItem.Next;
    end;
  end;
end;

end.
