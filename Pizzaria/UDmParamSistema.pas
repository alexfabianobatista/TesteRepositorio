unit UDmParamSistema;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBUpdateSQL;

type
  TDmParamSistema = class(TDataModule)
    QParamSistema: TIBQuery;
    QParamSistemaDESC_FANTASIA: TIBStringField;
    QParamSistemaDESC_RAZAO_SOCIAL: TIBStringField;
    QParamSistemaDESC_CNPJ: TIBStringField;
    QParamSistemaDESC_ENDERECO: TIBStringField;
    QParamSistemaDESC_CIDADE: TIBStringField;
    QParamSistemaDESC_UF: TIBStringField;
    QParamSistemaDESC_TELEFONE: TIBStringField;
    UParamSistema: TIBUpdateSQL;
    QParamSistemaVAL_TAXA_ENTREGA: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmParamSistema: TDmParamSistema;

implementation

uses UDmSistema;

{$R *.dfm}

procedure TDmParamSistema.DataModuleCreate(Sender: TObject);
begin
  QParamSistema.Close;
  QParamSistema.Open;
end;

end.
