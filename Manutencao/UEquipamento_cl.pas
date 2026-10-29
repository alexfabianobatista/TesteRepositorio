unit UEquipamento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMEquipamento = class(TDataModule)
    QEquipamento: TOracleDataSet1;
    QEquipamentoDESC_EQUIPAMENTO: TStringField;
    QEquipamentoCOD_FILIAL: TIntegerField;
    QEquipamentoCOD_DEPARTAMENTO: TIntegerField;
    QEquipamentoDT_AQUISICAO: TDateTimeField;
    QEquipamentoDT_INICIO_ATIVIDADE: TDateTimeField;
    QEquipamentoCOD_CADASTRO: TIntegerField;
    QEquipamentoNR_SERIE: TFloatField;
    QEquipamentoIND_SITUACAO: TStringField;
    QEquipamentoCOD_PATRIMONIO: TIntegerField;
    QEquipamentoItem: TOracleDataSet1;
    QEquipamentoItemDESC_EQUIPAMENTO_ITEM: TStringField;
    QEquipamentoItemDESC_OBSERVACAO: TStringField;
    QEquipamentoItemDESC_COMPLEMENTO: TStringField;
    QEquipamentoItemIND_SITUACAO: TStringField;
    QEquipamentodesc_filial: TStringField;
    QEquipamentodesc_cadastro: TStringField;
    QEquipamentodesc_departamento: TStringField;
    DSEquipamentoItem: TDataSource;
    QEquipamentoItemdesc_tipo_equipamento: TStringField;
    QEquipamentoItemCOD_TIPO_EQUIPAMENTO: TStringField;
    QEquipamentoCOD_USUARIO: TIntegerField;
    QEquipamentoCons: TOracleDataSet1;
    QEquipamentoConsDESC_EQUIPAMENTO: TStringField;
    QEquipamentoConsCOD_FILIAL: TIntegerField;
    QEquipamentoConsCOD_DEPARTAMENTO: TIntegerField;
    QEquipamentoConsDT_AQUISICAO: TDateTimeField;
    QEquipamentoConsDT_INICIO_ATIVIDADE: TDateTimeField;
    QEquipamentoConsCOD_CADASTRO: TIntegerField;
    QEquipamentoConsNR_SERIE: TFloatField;
    QEquipamentoConsCOD_USUARIO: TIntegerField;
    QEquipamentoConsIND_SITUACAO: TStringField;
    QEquipamentoConsCOD_PATRIMONIO: TIntegerField;
    QEquipamentoItemCarac: TOracleDataSet1;
    QCaracteristicasItemAll: TOracleDataSet1;
    QEquipamentoItemCaracDESC_CARACTERISTICA: TStringField;
    QEquipamentoItemCaracCOD_TIPO_EQUIPAMENTO_CARAC: TIntegerField;
    QCaracteristicasItemAllCOD_TIPO_EQUIPAMENTO_CARAC: TIntegerField;
    QCaracteristicasItemAllDESC_TIPO_EQUIPAMENTO_CARAC: TStringField;
    DSEquipamentoItemCarac: TDataSource;
    DSCaracteristicasItemAll: TDataSource;
    QCaracteristicasItemAllCOD_TIPO_EQUIPAMENTO: TStringField;
    QRFichaEquipamento: TOracleDataSet1;
    QEquipamentoItemCons: TOracleDataSet1;
    QEquipamentoItemConsDESC_EQUIPAMENTO_ITEM: TStringField;
    QEquipamentoItemConsCOD_TIPO_EQUIPAMENTO: TStringField;
    QEquipamentoItemConsDESC_OBSERVACAO: TStringField;
    QEquipamentoItemConsDESC_COMPLEMENTO: TStringField;
    QEquipamentoItemConsIND_SITUACAO: TStringField;
    QEquipamentoCOD_EQUIPAMENTO_CAB: TStringField;
    QEquipamentoItemCOD_EQUIPAMENTO_ITEM: TStringField;
    QEquipamentoItemCOD_EQUIPAMENTO_CAB: TStringField;
    QEquipamentoConsCOD_EQUIPAMENTO_CAB: TStringField;
    QEquipamentoItemCaracCOD_EQUIPAMENTO_ITEM: TStringField;
    QEquipamentoItemConsCOD_EQUIPAMENTO_ITEM: TStringField;
    QEquipamentoItemConsCOD_EQUIPAMENTO_CAB: TStringField;
    QEquipamentoItemCaracCOD_EQUIPAMENTO_CAB: TStringField;
    QEquipamentoDESC_CARACTERISTICA_1: TStringField;
    QEquipamentoDESC_CARACTERISTICA_2: TStringField;
    QEquipamentoDESC_CARACTERISTICA_3: TStringField;
    QEquipamentoDESC_CARACTERISTICA_4: TStringField;
    QEquipamentoDESC_CARACTERISTICA_5: TStringField;
    QEquipamentoPeca: TOracleDataSet1;
    QEquipamentoPecaCOD_EQUIPAMENTO_CAB: TStringField;
    QEquipamentoPecaCOD_PRODUTO: TFloatField;
    QEquipamentoPecadesc_equipamento_cab: TStringField;
    QEquipamentoPecadesc_produto: TStringField;
    DSEquipamentoPeca: TDataSource;
    QEquipamentoPecaItem: TOracleDataSet1;
    QEquipamentoPecaItemCOD_EQUIPAMENTO_CAB: TStringField;
    QEquipamentoPecaItemCOD_EQUIPAMENTO_ITEM: TStringField;
    QEquipamentoPecaItemCOD_PRODUTO: TFloatField;
    DSEquipamentoPecaItem: TDataSource;
    QEquipamentoPecaItemdesc_produto: TStringField;
    QEquipamentoPecaItemdesc_equipamento_cab: TStringField;
    QEquipamentoPecaItemdesc_equipamento_item: TStringField;
    QRFichaEquipamentoItem: TOracleDataSet1;
    QEquipamentoPecaQT_PRODUTO: TIntegerField;
    QEquipamentoPecaItemQT_PRODUTO: TIntegerField;
    QRFichaEquipamentoCOD_EQUIPAMENTO_CAB: TStringField;
    QRFichaEquipamentoDESC_EQUIPAMENTO: TStringField;
    QRFichaEquipamentoDT_INICIO_ATIVIDADE: TDateTimeField;
    QRFichaEquipamentoDT_AQUISICAO: TDateTimeField;
    QRFichaEquipamentoNR_SERIE: TFloatField;
    QRFichaEquipamentoCOD_CADASTRO: TIntegerField;
    QRFichaEquipamentoIND_SITUACAO: TStringField;
    QRFichaEquipamentoCOD_FORNECEDOR: TIntegerField;
    QRFichaEquipamentoFORNECEDOR: TStringField;
    QRFichaEquipamentoDESC_FILIAL: TStringField;
    QRFichaEquipamentoCOD_PRODUTO: TFloatField;
    QRFichaEquipamentoDESC_PRODUTO: TStringField;
    QRFichaEquipamentoItemCOD_EQUIPAMENTO_ITEM: TStringField;
    QRFichaEquipamentoItemDESC_EQUIPAMENTO_ITEM: TStringField;
    QRFichaEquipamentoItemCOD_PRODUTO: TFloatField;
    QRFichaEquipamentoItemDESC_PRODUTO: TStringField;
    QRFichaEquipamentoItemCOD_TIPO_EQUIPAMENTO: TStringField;
    QRFichaEquipamentoItemDESC_CARACTERISTICA: TStringField;
    QRFichaEquipamentoItemDESC_TIPO_EQUIPAMENTO_CARAC: TStringField;
    QRFichaEquipamentoItemQT_PRODUTO: TFloatField;
    QRFichaEquipamentoDESC_CARACTERISTICA_1: TStringField;
    QRFichaEquipamentoDESC_CARACTERISTICA_2: TStringField;
    QRFichaEquipamentoDESC_CARACTERISTICA_3: TStringField;
    QRFichaEquipamentoDESC_CARACTERISTICA_4: TStringField;
    QRFichaEquipamentoDESC_CARACTERISTICA_5: TStringField;
    procedure QEquipamentoCalcFields(DataSet: TDataSet);
    procedure QEquipamentoItemCalcFields(DataSet: TDataSet);
    procedure DSEquipamentoItemStateChange(Sender: TObject);
    procedure QEquipamentoAfterInsert(DataSet: TDataSet);
    procedure QEquipamentoAfterEdit(DataSet: TDataSet);
    procedure QEquipamentoAfterOpen(DataSet: TDataSet);
    procedure QEquipamentoItemAfterOpen(DataSet: TDataSet);
    procedure QEquipamentoItemAfterInsert(DataSet: TDataSet);
    procedure QEquipamentoBeforeDelete(DataSet: TDataSet);
    procedure QEquipamentoItemBeforeDelete(DataSet: TDataSet);
    procedure QEquipamentoItemCaracAfterInsert(DataSet: TDataSet);
    procedure QEquipamentoItemBeforeInsert(DataSet: TDataSet);
    procedure QEquipamentoPecaAfterInsert(DataSet: TDataSet);
    procedure QEquipamentoPecaCalcFields(DataSet: TDataSet);
    procedure QEquipamentoPecaItemCalcFields(DataSet: TDataSet);
    procedure QEquipamentoPecaItemAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMEquipamento: TDMEquipamento;

implementation

uses UOracle_cl, UEquipamentoCad;

{$R *.DFM}

procedure TDMEquipamento.QEquipamentoCalcFields(DataSet: TDataSet);
begin
  if (QEquipamentoCod_Filial.text <> '') then
    QEquipamentodesc_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(QEquipamentoCod_Filial.text));
  if (QEquipamentoCod_Departamento.text <> '') then
    QEquipamentodesc_Departamento.Value := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+Trim(QEquipamentoCod_Departamento.text));
  if (QEquipamentoCod_Cadastro.text <> '') then
    QEquipamentodesc_cadastro.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(QEquipamentoCod_Cadastro.text));
end;

procedure TDMEquipamento.QEquipamentoItemCalcFields(DataSet: TDataSet);
begin
  with DMEquipamento do
  begin
    if QEquipamentoItemCod_Tipo_Equipamento.Text <> '' then
      QEquipamentoItemDesc_Tipo_Equipamento.Value := DMOracle.BuscaNome('SELECT DESC_TIPO_EQUIPAMENTO FROM TB_TIPO_EQUIPAMENTO','COD_TIPO_EQUIPAMENTO = '+CHR(39)+QEquipamentoItemCod_Tipo_Equipamento.Text+CHR(39));
  end;
end;

procedure TDMEquipamento.DSEquipamentoItemStateChange(Sender: TObject);
begin
  If DSEquipamentoItem.State in [DSInsert,DSEdit] then
    begin
      FEquipamentoCad.BTTipoEquipamento.Enabled:=True;
    end
  Else
    begin
      FEquipamentoCad.BTTipoEquipamento.Enabled:=False;
    end;

end;

procedure TDMEquipamento.QEquipamentoAfterInsert(DataSet: TDataSet);
begin
  DMEquipamento.QEquipamentoItem.close;
  DMEquipamento.QEquipamentoItem.Open;

  DMEquipamento.QEquipamentoPeca.Close;
  DMEquipamento.QEquipamentoPeca.Open;
end;

procedure TDMEquipamento.QEquipamentoAfterEdit(DataSet: TDataSet);
begin
  DMEquipamento.QEquipamentoItem.close;
  DMEquipamento.QEquipamentoItem.Open;
  
  DMEquipamento.QEquipamentoPeca.Close;
  DMEquipamento.QEquipamentoPeca.Open;
end;

procedure TDMEquipamento.QEquipamentoAfterOpen(DataSet: TDataSet);
begin
  DMEquipamento.QEquipamentoItem.close;
  DMEquipamento.QEquipamentoItem.setVariable('COD_EQUIPAMENTO_CAB',DMEquipamento.QEquipamentoCod_Equipamento_Cab.value);
  DMEquipamento.QEquipamentoItem.Open;

  DMEquipamento.QEquipamentoPeca.Close;
  DMEquipamento.QEquipamentoPeca.setVariable('COD_EQUIPAMENTO_CAB',DMEquipamento.QEquipamentoCod_Equipamento_Cab.Value);
  DMEquipamento.QEquipamentoPeca.Open;
end;

procedure TDMEquipamento.QEquipamentoItemAfterOpen(DataSet: TDataSet);
begin
  QCaracteristicasItemAll.Close;
  QEquipamentoItemCarac.Close;
  if QEquipamentoItemCod_Tipo_equipamento.Text <> '' then
  begin
    QCaracteristicasItemAll.setVariable('COD_TIPO_EQUIPAMENTO',QEquipamentoItemCod_Tipo_equipamento.Text);
    QCaracteristicasItemAll.Open;
    QEquipamentoItemCarac.setVariable('COD_EQUIPAMENTO_ITEM',QEquipamentoItemCod_Equipamento_Item.Text);
    QEquipamentoItemCarac.Open;
  end;
  DMEquipamento.QEquipamentoPecaItem.Close;
  DMEquipamento.QEquipamentoPecaItem.setVariable('COD_EQUIPAMENTO_ITEM',DMEquipamento.QEquipamentoItemCOD_EQUIPAMENTO_ITEM.Value);
  DMEquipamento.QEquipamentoPecaItem.Open;
end;

procedure TDMEquipamento.QEquipamentoItemAfterInsert(DataSet: TDataSet);
begin
  QEquipamentoItemCod_Equipamento_Cab.Value:=QEquipamentoCod_Equipamento_Cab.Value;
  DMEquipamento.QEquipamentoPecaItem.Close;
  DMEquipamento.QEquipamentoPecaItem.Open;
end;

procedure TDMEquipamento.QEquipamentoBeforeDelete(DataSet: TDataSet);
begin
{  QEquipamentoItem.first;
  while not(QEquipamentoItem.eof) do
  begin
    QEquipamentoItem.delete;
    QEquipamentoItem.next;
  end;  }
end;

procedure TDMEquipamento.QEquipamentoItemBeforeDelete(DataSet: TDataSet);
begin
{  QEquipamentoItem.First;
  while not(QEquipamentoItem.eof)do
  begin
    Try
      QEquipamentoItemCarac.Close;
      QEquipamentoItemCarac.setVariable('COD_EQUIPAMENTO_ITEM',QEquipamentoItemCod_Equipamento_Item.Value);
      QEquipamentoItemCarac.Open;
      QEquipamentoItemCarac.first;
      while not(QEquipamentoItemCarac.eof) do
      begin
        QEquipamentoItemCarac.delete;
        QEquipamentoItemCarac.next;
      end ;
    DMOracle.DBCemapa.StartTransaction;
    except
      DMEquipamento.QEquipamentoItemCarac.Cancel;
      DMOracle.DBCemapa.RollBack;
      Raise Exception.Create ('Erro ao excluir as caracteristicas do equipamento');
    End;
    QEquipamentoItem.next;
  end;
  QEquipamentoItem.First;  }
  DMEquipamento.QEquipamentoPecaItem.Close;
  DMEquipamento.QEquipamentoPecaItem.setVariable('COD_EQUIPAMENTO_ITEM',DMEquipamento.QEquipamentoItemCOD_EQUIPAMENTO_ITEM.Value);
  DMEquipamento.QEquipamentoPecaItem.Open;
end;

procedure TDMEquipamento.QEquipamentoItemCaracAfterInsert(
  DataSet: TDataSet);
begin
//  QEquipamentoItemCaracCod_Equipamento_Cab.Value:=QEquipamentoCod_Equipamento_Cab.Value;
end;

procedure TDMEquipamento.QEquipamentoItemBeforeInsert(DataSet: TDataSet);
begin
  if QEquipamento.State in [DSInsert,DSEdit] then
    QEquipamento.Post;
end;

procedure TDMEquipamento.QEquipamentoPecaAfterInsert(DataSet: TDataSet);
begin
  DMEquipamento.QEquipamentoPecaCod_Equipamento_Cab.Value:=DMEquipamento.QEquipamentoCOD_EQUIPAMENTO_CAB.Value;
  FEquipamentoCad.BTProdutoCons4Click(self);
  if QEquipamento.State in [DSInsert,DSEdit] then
    QEquipamento.post;
end;

procedure TDMEquipamento.QEquipamentoPecaCalcFields(DataSet: TDataSet);
begin
  if (QEquipamentoPecaCod_Produto.text <> '') then
    QEquipamentoPecadesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(QEquipamentoPecaCod_Produto.text));
  if (QEquipamentoPecaCod_Equipamento_Cab.text <> '') then
    QEquipamentoPecadesc_equipamento_cab.Value := DMOracle.BuscaNome('SELECT DESC_EQUIPAMENTO FROM TB_EQUIPAMENTO_CAB','COD_EQUIPAMENTO_CAB = '+chr(39)+Trim(QEquipamentoPecaCOD_EQUIPAMENTO_CAB.text)+chr(39));
end;

procedure TDMEquipamento.QEquipamentoPecaItemCalcFields(DataSet: TDataSet);
begin
  if (QEquipamentoPecaItemCod_Produto.text <> '') then
    QEquipamentoPecaItemdesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(QEquipamentoPecaItemCod_Produto.text));
  if (QEquipamentoPecaItemCod_Equipamento_Cab.text <> '') then
    QEquipamentoPecaItemdesc_equipamento_cab.Value := DMOracle.BuscaNome('SELECT DESC_EQUIPAMENTO FROM TB_EQUIPAMENTO_CAB','COD_EQUIPAMENTO_CAB = '+chr(39)+Trim(QEquipamentoPecaItemCod_Equipamento_Cab.text)+chr(39));
  if (QEquipamentoPecaItemCod_Equipamento_Item.text <> '') then
    QEquipamentoPecaItemdesc_equipamento_cab.Value := DMOracle.BuscaNome('SELECT DESC_EQUIPAMENTO_ITEM FROM TB_EQUIPAMENTO_ITEM','COD_EQUIPAMENTO_ITEM = '+chr(39)+Trim(QEquipamentoPecaItemCod_Equipamento_Item.text)+chr(39));

end;

procedure TDMEquipamento.QEquipamentoPecaItemAfterInsert(
  DataSet: TDataSet);
begin
  DMEquipamento.QEquipamentoPecaItemCod_Equipamento_Cab.Value:=DMEquipamento.QEquipamentoCOD_EQUIPAMENTO_CAB.Value;
  DMEquipamento.QEquipamentoPecaItemCod_Equipamento_Item.Value:=DMEquipamento.QEquipamentoItemCOD_EQUIPAMENTO_Item.Value;
  FEquipamentoCad.BTProdutoCons6Click(self);
end;

end.
