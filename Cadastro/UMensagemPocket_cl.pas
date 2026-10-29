unit UMensagemPocket_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMMensagemPocket = class(TDataModule)
    QMensagemPocket_Cad: TOracleDataSet1;
    QMensagemPocket_CadCOD_MENSAGEM_POCKET: TIntegerField;
    QMensagemPocket_CadCOD_VENDEDOR: TIntegerField;
    QMensagemPocket_CadDESC_MENS_01: TStringField;
    QMensagemPocket_CadDESC_MENS_02: TStringField;
    QMensagemPocket_CadDESC_MENS_03: TStringField;
    QMensagemPocket_CadDESC_MENS_04: TStringField;
    QMensagemPocket_CadDESC_MENS_05: TStringField;
    QMensagemPocket_CadDESC_MENS_06: TStringField;
    QMensagemPocket_CadDESC_MENS_07: TStringField;
    QMensagemPocket_CadDESC_MENS_08: TStringField;
    QMensagemPocket_CadDESC_MENS_09: TStringField;
    QMensagemPocket_CadDESC_MENS_10: TStringField;
    QMensagemPocket_CadDESC_MENS_11: TStringField;
    QMensagemPocket_CadDESC_MENS_12: TStringField;
    QMensagemPocket_CadDESC_MENS_13: TStringField;
    QMensagemPocket_CadDESC_MENS_14: TStringField;
    QMensagemPocket_CadDESC_MENS_15: TStringField;
    QMensagemPocket_CadDESC_MENS_16: TStringField;
    QMensagemPocket_Cadnome_vendedor: TStringField;
    QMensagemPocket_Cons: TOracleDataSet1;
    QMensagemPocket_ConsCOD_VENDEDOR: TIntegerField;
    QMensagemPocket_ConsCOD_MENSAGEM_POCKET: TIntegerField;
    QMensagemPocket_ConsDESC_MENS_01: TStringField;
    QMensagemPocket_ConsNOME: TStringField;
    procedure QMensagemPocket_CadCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMensagemPocket: TDMMensagemPocket;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMMensagemPocket.QMensagemPocket_CadCalcFields(
  DataSet: TDataSet);
begin
  QMensagemPocket_Cadnome_vendedor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                                   'COD_VENDEDOR = '+FloatToStr(QMensagemPocket_CadCod_Vendedor.Value));

end;

end.
