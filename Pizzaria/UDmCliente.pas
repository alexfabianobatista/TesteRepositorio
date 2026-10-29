unit UDmCliente;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmCliente = class(TDataModule)
    QSelCliente: TIBQuery;
    DsSelCliente: TDataSource;
    QSelClienteCOD_CLIENTE: TIntegerField;
    QSelClienteDESC_NOME: TIBStringField;
    QSelClienteDESC_TELEFONE: TIBStringField;
    QSelClienteDESC_ENDERECO: TIBStringField;
    QSelClienteDESC_LOCALIZACAO: TIBStringField;
    QTelCadastrado: TIBQuery;
    QInsCliente: TIBQuery;
    QTelCadastradoCOD_CLIENTE: TIntegerField;
    QTelCadastradoDESC_NOME: TIBStringField;
    QTelCadastradoDESC_TELEFONE: TIBStringField;
    QTelCadastradoDESC_ENDERECO: TIBStringField;
    QTelCadastradoDESC_LOCALIZACAO: TIBStringField;
    QMaxCliente: TIBQuery;
    QMaxClienteULTIMO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmCliente: TDmCliente;

implementation

{$R *.dfm}

end.
