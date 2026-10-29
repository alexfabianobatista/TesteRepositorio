unit UAgricola_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMAgricola = class(TDataModule)
    QMarcarNotas: TOracleDataSet1;
    QMarcarNotasCOD_NOTA_CAB: TIntegerField;
    QMarcarNotasDT_EMISSAO: TDateTimeField;
    QMarcarNotasDT_RECEBIMENTO: TDateTimeField;
    QMarcarNotasCOD_CADASTRO: TIntegerField;
    QMarcarNotasCOD_FILIAL: TIntegerField;
    QMarcarNotasNUM_NOTA: TIntegerField;
    QMarcarNotasNOME: TStringField;
    QMarcarNotasIND_MILHAGEM: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAgricola: TDMAgricola;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
