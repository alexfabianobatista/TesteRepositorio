unit UMensagem_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMMensagem = class(TDataModule)
    DSMensagem: TDataSource;
    DSMensagemCons: TDataSource;
    QMensagem: TOracleDataSet1;
    QMensagemCons: TOracleDataSet1;
    QRMensagem: TOracleDataSet1;
    QMensagemCOD_MENSAGEM: TIntegerField;
    QMensagemDESC_COMPLEMENTO: TStringField;
    QMensagemDESC_COMPLEMENTO1: TStringField;
    QMensagemDESC_COMPLEMENTO2: TStringField;
    QMensagemConsCOD_MENSAGEM: TIntegerField;
    QMensagemConsDESC_MENSAGEM: TStringField;
    QMensagemConsDESC_COMPLEMENTO: TStringField;
    QRMensagemDESC_MENSAGEM: TStringField;
    QRMensagemCOD_MENSAGEM: TIntegerField;
    QRMensagemDESC_COMPLEMENTO: TStringField;
    QMensagemConsDESC_COMPLEMENTO1: TStringField;
    QMensagemConsDESC_COMPLEMENTO2: TStringField;
    QMensagemDESC_COMPLEMENTO3: TStringField;
    QMensagemConsDESC_COMPLEMENTO3: TStringField;
    QMensagemDESC_COMPLEMENTO4: TStringField;
    QMensagemDESC_COMPLEMENTO5: TStringField;
    QMensagemDESC_COMPLEMENTO6: TStringField;
    QMensagemDESC_COMPLEMENTO7: TStringField;
    QMensagemConsDESC_COMPLEMENTO4: TStringField;
    QMensagemConsDESC_COMPLEMENTO5: TStringField;
    QMensagemConsDESC_COMPLEMENTO6: TStringField;
    QMensagemConsDESC_COMPLEMENTO7: TStringField;
    QMensagemDESC_MENSAGEM: TStringField;
    procedure QMensagemAfterInsert(DataSet: TDataSet);
    procedure QMensagemAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMensagem: TDMMensagem;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMMensagem.QMensagemAfterInsert(DataSet: TDataSet);
begin
  QMensagemCod_Mensagem.Value := DMOracle.Sequencia('MENSAGEM');
end;

procedure TDMMensagem.QMensagemAfterPost(DataSet: TDataSet);
begin
  QMensagem.SetVariable('PK',QMensagemCod_Mensagem.Value);
end;

end.
