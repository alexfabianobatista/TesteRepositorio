unit UDmCliente;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmCliente = class(TDataModule)
    QSelCliente: TIBQuery;
    DsSelCliente: TDataSource;
    QSelClienteCODCLIENTE: TIntegerField;
    QSelClienteNOME: TIBStringField;
    QSelClienteCPF: TIBStringField;
    QSelClienteRG: TIBStringField;
    QSelClienteNUMERO: TIntegerField;
    QSelClienteCODENDERECO: TIntegerField;
    QSelClienteCODBAIRRO: TIntegerField;
    QSelClienteCODCIDADE: TIntegerField;
    QSelClienteDATA_NASCIMENTO: TDateTimeField;
    QSelClienteDATA_CADASTRO: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmCliente: TDmCliente;

implementation

uses UDmSistema, UFuncoes;

{$R *.dfm}

end.
