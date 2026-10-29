unit UProcedimento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, VARIANTS;

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
    procedure QProcedimentoAfterInsert(DataSet: TDataSet);
    procedure QProcedimentoAfterEdit(DataSet: TDataSet);
    procedure QProcedimentoItemCalcFields(DataSet: TDataSet);
    procedure QProcedimentoItemAfterInsert(DataSet: TDataSet);
    procedure QProcedimentoAfterOpen(DataSet: TDataSet);
    procedure QProcedimentoItemBeforeInsert(DataSet: TDataSet);
    procedure DSProcedimentoItemStateChange(Sender: TObject);
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

end.
