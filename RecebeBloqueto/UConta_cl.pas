unit UConta_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDMConta = class(TDataModule)
    QConta: TQuery;
    QContaCOD_CONTA: TIntegerField;
    QContaDESC_BANCO_AGENCIA: TStringField;
    QContaDESC_SIGLA: TStringField;
    QContaCOD_BANCO: TSmallintField;
    QContaCOD_AGENCIA: TSmallintField;
    QContaDV_AGENCIA: TSmallintField;
    QContaNUM_CONTA: TIntegerField;
    QContaDV_CONTA: TSmallintField;
    QContaDESC_CIDADE: TStringField;
    QContaESTADO: TStringField;
    QContaCons: TQuery;
    QContaConsCOD_CONTA: TIntegerField;
    QContaConsDESC_BANCO_AGENCIA: TStringField;
    QContaConsDESC_SIGLA: TStringField;
    QContaConsCOD_BANCO: TSmallintField;
    QContaConsCOD_AGENCIA: TSmallintField;
    QContaConsDV_AGENCIA: TSmallintField;
    QContaConsNUM_CONTA: TIntegerField;
    QContaConsDV_CONTA: TSmallintField;
    QContaConsDESC_CIDADE: TStringField;
    QContaConsESTADO: TStringField;
    QContaNOME_CEDENTE: TStringField;
    QContaNUM_CONVENIO: TIntegerField;
    QContaIND_FISICA_JURIDICA: TStringField;
    QContaNUM_CGC_CPF: TFloatField;
    QContaVAL_SERIE_ARQUIVO: TIntegerField;
    QContaCOD_CARTEIRA: TSmallintField;
    QContaCOD_VARIACAO: TSmallintField;
    QContaCOD_COMANDO: TSmallintField;
    procedure QContaAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConta: TDMConta;

implementation

uses UAcesso_cl;

{$R *.DFM}

procedure TDMConta.QContaAfterInsert(DataSet: TDataSet);
begin
  QContaCOD_CONTA.Value := DMAcesso.ValorCodigo('COD_CONTA','TB_CONTA');
end;

end.
