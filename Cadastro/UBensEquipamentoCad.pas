unit UBensEquipamentoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMBensEquipamento = class(TDataModule)
    QBensEquipamentos: TOracleDataSet1;
    DSBensEquipamentos: TDataSource;
    QListaBensEquip: TOracleDataSet1;
    QListaBensEquipCOD_BEM_EQUIPAMENTO: TIntegerField;
    QListaBensEquipDESC_MARCA: TStringField;
    QListaBensEquipDESC_MODELO: TStringField;
    QListaBensEquipDESC_ANO_FABRICACAO: TStringField;
    QListaBensEquipVAL_BEM_EQUIPAMENTO: TFloatField;
    QListaBensEquipIND_FINANCIAMENTO: TStringField;
    QListaBensEquipDESC_FAVORECIDO: TStringField;
    QListaBensEquipDT_VENCTO_FINAN: TDateTimeField;
    QListaBensEquipVAL_FINANCIAMENTO: TFloatField;
    QListaBensEquipDESC_OBS: TStringField;
    QListaBensEquipCOD_CADASTRO: TIntegerField;
    QBensEquipamentosCOD_BEM_EQUIPAMENTO: TIntegerField;
    QBensEquipamentosDESC_MARCA: TStringField;
    QBensEquipamentosDESC_MODELO: TStringField;
    QBensEquipamentosDESC_ANO_FABRICACAO: TStringField;
    QBensEquipamentosVAL_BEM_EQUIPAMENTO: TFloatField;
    QBensEquipamentosIND_FINANCIAMENTO: TStringField;
    QBensEquipamentosDESC_FAVORECIDO: TStringField;
    QBensEquipamentosDT_VENCTO_FINAN: TDateTimeField;
    QBensEquipamentosVAL_FINANCIAMENTO: TFloatField;
    QBensEquipamentosDESC_OBS: TStringField;
    QBensEquipamentosCOD_CADASTRO: TIntegerField;
    DSListaBensEquip: TDataSource;
    QBensEquipamentosCons: TOracleDataSet1;
    QBensEquipamentosConsDESC_MARCA: TStringField;
    QBensEquipamentosConsDESC_MODELO: TStringField;
    QBensEquipamentosConsVAL_BEM_EQUIPAMENTO: TFloatField;
    QBensEquipamentosConsCOD_BEM_EQUIPAMENTO: TIntegerField;
    QBensEquipamentosConsNOME: TStringField;
    QBensEquipamentosDESC_TIPO_BEM: TStringField;
    QBensEquipamentosCOD_CADASTRO_PROPRIETARIO: TIntegerField;
    QBensEquipamentosDESC_PLACA: TStringField;
    procedure QBensEquipamentosAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBensEquipamento: TDMBensEquipamento;

implementation

uses UOracle_cl, UCadastro_cl;

{$R *.DFM}

procedure TDMBensEquipamento.QBensEquipamentosAfterInsert(
  DataSet: TDataSet);
begin
  QBensEquipamentosCod_Cadastro.Value:=DMCadastro.QCadastroCod_Cadastro.Value;
end;

end.
