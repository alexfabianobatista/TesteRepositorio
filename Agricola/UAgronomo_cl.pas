unit UAgronomo_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMAgronomo = class(TDataModule)
    QRAgronomo: TOracleDataSet1;
    QRAgronomoCOD_AGRONOMO: TIntegerField;
    QRAgronomoNOME: TStringField;
    QRAgronomoDESC_CREA: TStringField;
    QRAgronomoDESC_CPF: TStringField;
    QAgronomoCons: TOracleDataSet1;
    QAgronomoConsCOD_AGRONOMO: TIntegerField;
    QAgronomoConsNOME: TStringField;
    QAgronomoConsDESC_CREA: TStringField;
    QAgronomoConsDESC_CPF: TStringField;
    QAgronomo: TOracleDataSet1;
    QAgronomoCOD_AGRONOMO: TIntegerField;
    QAgronomoNOME: TStringField;
    QAgronomoDESC_CREA: TStringField;
    QAgronomoDESC_CPF: TStringField;
    QAgronomoDESC_ENDERECO: TStringField;
    QAgronomoDESC_CIDADE: TStringField;
    QAgronomoCOD_ESTADO: TStringField;
    QAgronomoNUM_VISTO: TIntegerField;
    QAgronomoCOD_FILIAL: TIntegerField;
    QAgronomoNUM_ART_RELACIONADA: TStringField;
    QAgronomoIND_TECNICO: TStringField;
    procedure QAgronomoAfterInsert(DataSet: TDataSet);
    procedure QAgronomoAfterPost(DataSet: TDataSet);
    procedure QAgronomoBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAgronomo: TDMAgronomo;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMAgronomo.QAgronomoAfterInsert(DataSet: TDataSet);
begin
// QAgronomoCod_Agronomo.Value := DMOracle.Sequencia('AGRONOMO');

end;

procedure TDMAgronomo.QAgronomoAfterPost(DataSet: TDataSet);
var wCodigo:Integer;
begin
   wCodigo := QAgronomoCod_Agronomo.Value;
   QAgronomo.Close;
   QAgronomo.SetVariable('PK',wCodigo);
   QAgronomo.Open;
end;

procedure TDMAgronomo.QAgronomoBeforePost(DataSet: TDataSet);
begin
  if (QAgronomoCOD_FILIAL.Text <> '') then
    DMOracle.ValidaFilial(QAgronomoCOD_FILIAL.Text);
end;

end.
