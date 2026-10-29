unit UConverte_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,Oracle, OracleData, OraTeste, OraS;

type
  TDMConverte = class(TDataModule)
    QContaReceber: TOracleDataSet1;
    QContaPagar: TOracleDataSet1;
    QContaReceberCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContaReceberCOD_CADASTRO: TIntegerField;
    QContaPagarCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContaPagarCOD_CADASTRO: TIntegerField;
    QContaReceberCOD_CADASTRO_NOVO: TIntegerField;
    QContaPagarCOD_CADASTRO_NOVO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConverte: TDMConverte;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
