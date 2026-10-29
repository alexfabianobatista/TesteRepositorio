unit UAtividade_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMAtividade = class(TDataModule)
    QAtividade: TOracleDataSet1;
    QAtividadeCOD_ATIVIDADE_CAB: TIntegerField;
    QAtividadeItem: TOracleDataSet1;
    QAtividadeItemCOD_ATIVIDADE_CAB: TIntegerField;
    QAtividadeItemCOD_CATEGORIA: TStringField;
    Ds_Atividade_Item: TDataSource;
    QAtividadeItemdesc_categoria: TStringField;
    QAtividadeCons: TOracleDataSet1;
    QAtividadeConsCOD_ATIVIDADE_CAB: TIntegerField;
    QRAtividade: TOracleDataSet1;
    QRAtividadeCOD_ATIVIDADE_CAB: TIntegerField;
    QRAtividadeCOD_CATEGORIA: TStringField;
    QRAtividadeDESC_CATEGORIA: TStringField;
    QAtividadeDESC_ATIVIDADE: TStringField;
    QAtividadeConsDESC_ATIVIDADE: TStringField;
    QRAtividadeDESC_ATIVIDADE: TStringField;
    procedure QAtividadeItemCalcFields(DataSet: TDataSet);
    procedure QAtividadeAfterEdit(DataSet: TDataSet);
    procedure QAtividadeAfterInsert(DataSet: TDataSet);
    procedure QAtividadeAfterOpen(DataSet: TDataSet);
    procedure QAtividadeItemBeforeInsert(DataSet: TDataSet);
    procedure Ds_Atividade_ItemStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAtividade: TDMAtividade;

implementation

uses UOracle_cl, U_AtividadeCad;

{$R *.DFM}

procedure TDMAtividade.QAtividadeItemCalcFields(DataSet: TDataSet);
begin
     QAtividadeItemDesc_Categoria.Value := DMOracle.BuscaNome('SELECT DESC_Categoria FROM TB_CATEGORIA_PROFISSIONAL','COD_CATEGORIA = '+Chr(39)+QAtividadeItemCod_Categoria.Value+Chr(39));
end;

procedure TDMAtividade.QAtividadeAfterEdit(DataSet: TDataSet);
begin
  QAtividadeItem.Close;
  QAtividadeItem.Open;
end;

procedure TDMAtividade.QAtividadeAfterInsert(DataSet: TDataSet);
begin
  QAtividadeItem.Close;
  QAtividadeItem.Open;
end;

procedure TDMAtividade.QAtividadeAfterOpen(DataSet: TDataSet);
begin
  QAtividadeItem.Close;
  QAtividadeItem.Open;
end;

procedure TDMAtividade.QAtividadeItemBeforeInsert(DataSet: TDataSet);
begin
   if QAtividade.STATE = DsInsert then
   begin
      QAtividade.Post;
      QAtividadeItemCod_Atividade_Cab.Value := QAtividadeCod_Atividade_Cab.Value;
   end;
end;

procedure TDMAtividade.Ds_Atividade_ItemStateChange(Sender: TObject);
begin
  If DS_Atividade_Item.State in [DSInsert,DSEdit] then
    FAtividadeCad.BTCategoriaCons.enabled:=true
  else
    FAtividadeCad.BTCategoriaCons.enabled:=false;
end;

end.
