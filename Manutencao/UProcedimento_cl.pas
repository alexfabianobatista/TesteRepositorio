unit UProcedimento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMProcedimento = class(TDataModule)
    QProcedimento: TOracleDataSet1;
    QProcedimentoCOD_PROCEDIMENTO_CAB: TIntegerField;
    QProcedimentoItem: TOracleDataSet1;
    QProcedimentoItemCOD_PROCEDIMENTO_CAB: TIntegerField;
    QProcedimentoItemCOD_ATIVIDADE_CAB: TIntegerField;
    QProcedimentoCons: TOracleDataSet1;
    QProcedimentoConsCOD_PROCEDIMENTO_CAB: TIntegerField;
    DSProcedimentoItem: TDataSource;
    QRProcedimento: TOracleDataSet1;
    QRProcedimentoCOD_PROCEDIMENTO_CAB: TIntegerField;
    QRProcedimentoCOD_ATIVIDADE_CAB: TIntegerField;
    QProcedimentoConsDESC_PROCEDIMENTO: TStringField;
    QProcedimentoDESC_PROCEDIMENTO: TStringField;
    QRProcedimentoDESC_PROCEDIMENTO: TStringField;
    QRProcedimentoDESC_ATIVIDADE: TStringField;
    QProcedimentoItemDESC_ATIVIDADE: TStringField;
    QProcedimentoCOD_EQUIPAMENTO_CAB: TStringField;
    QProcedimentoCOD_PERIODICIDADE: TIntegerField;
    QProcedimentoCOD_EQUIPAMENTO_ITEM: TStringField;
    QProcedimentodesc_equipamento_cab: TStringField;
    QProcedimentodesc_equipamento_item: TStringField;
    QProcedimentodesc_periodicidade: TStringField;
    QRProcedimentoDESC_OBSERVACAO: TMemoField;
    procedure QProcedimentoAfterInsert(DataSet: TDataSet);
    procedure QProcedimentoAfterEdit(DataSet: TDataSet);
    procedure QProcedimentoItemCalcFields(DataSet: TDataSet);
    procedure QProcedimentoItemAfterInsert(DataSet: TDataSet);
    procedure QProcedimentoAfterOpen(DataSet: TDataSet);
    procedure QProcedimentoItemBeforeInsert(DataSet: TDataSet);
    procedure DSProcedimentoItemStateChange(Sender: TObject);
    procedure QProcedimentoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMProcedimento: TDMProcedimento;

implementation

uses UOracle_cl, U_AtividadeCad, UProcedimentoCad;

{$R *.DFM}

procedure TDMProcedimento.QProcedimentoAfterInsert(DataSet: TDataSet);
begin
   QProcedimentoItem.close;
   QProcedimentoItem.Open;
end;

procedure TDMProcedimento.QProcedimentoAfterEdit(DataSet: TDataSet);
begin
   QProcedimentoItem.close;
   QProcedimentoItem.Open;
end;

procedure TDMProcedimento.QProcedimentoItemCalcFields(DataSet: TDataSet);
begin
  QProcedimentoItemDesc_Atividade.Value := DMOracle.BuscaNome('SELECT DESC_Atividade FROM TB_Atividade_cab','COD_Atividade_cab = '+Chr(39)+inttostr(QProcedimentoItemCod_Atividade_cab.Value)+Chr(39));
end;

procedure TDMProcedimento.QProcedimentoItemAfterInsert(DataSet: TDataSet);
begin
  QProcedimentoItemCod_Procedimento_Cab.Value := QProcedimentoCod_Procedimento_Cab.Value;


end;

procedure TDMProcedimento.QProcedimentoAfterOpen(DataSet: TDataSet);
begin
   QProcedimentoItem.close;
   QProcedimentoItem.Open;
end;

procedure TDMProcedimento.QProcedimentoItemBeforeInsert(DataSet: TDataSet);
begin
   if QProcedimento.State = DsInsert then
   begin
      QProcedimento.Post;
  end;
end;

procedure TDMProcedimento.DSProcedimentoItemStateChange(Sender: TObject);
begin
   If DSProcedimentoItem.State in [DSInsert,DSEdit] then
  begin
     FProcedimentoCad.BTConsCategoria.enabled:=true;
  end
  Else
  begin
     FProcedimentoCad.BTConsCategoria.enabled:=false;
  end;
end;

procedure TDMProcedimento.QProcedimentoCalcFields(DataSet: TDataSet);
begin
  if QProcedimentoCod_Equipamento_Cab.Text <> '' then
    QProcedimentodesc_equipamento_cab.Value:= DMOracle.BuscaNome('SELECT DESC_EQUIPAMENTO'+
                                                               ' FROM TB_EQUIPAMENTO_CAB','COD_EQUIPAMENTO_CAB = '
                                                               +CHR(39)+QProcedimentoCod_Equipamento_Cab.Text+CHR(39));
  if QProcedimentoCod_Equipamento_Item.Text <> '' then
    QProcedimentodesc_equipamento_item.Value:= DMOracle.BuscaNome('SELECT DESC_EQUIPAMENTO_ITEM'+
                                                               ' FROM TB_EQUIPAMENTO_ITEM','COD_EQUIPAMENTO_ITEM = '
                                                               +CHR(39)+QProcedimentoCod_Equipamento_Item.Text+CHR(39));

  if QProcedimentoCod_Periodicidade.Text <> '' then
    QProcedimentodesc_periodicidade.Value:= DMOracle.BuscaNome('SELECT DESC_PERIODICIDADE'+
                                                               ' FROM TB_PERIODICIDADE','COD_PERIODICIDADE = '
                                                               +CHR(39)+QProcedimentoCod_Periodicidade.Text+CHR(39));
end;

end.
