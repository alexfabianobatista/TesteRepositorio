unit URegServPrestados_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMRegServPrestados = class(TDataModule)
    QRegServPrestados: TOracleDataSet1;
    QRegServPrestadosDT_RECEBIMENTO: TDateTimeField;
    QRegServPrestadosNUM_NOTA: TIntegerField;
    QRegServPrestadosCOD_SERIE: TStringField;
    QRegServPrestadosNAT_OPERACAO: TFloatField;
    QRegServPrestadosOBSERVACAO: TStringField;
    QRegServPrestadosVAL_BASE_CALCULO: TFloatField;
    QRegServPrestadosVAL_ISS: TFloatField;
    QRegServPrestadosval_contabil: TFloatField;
    QRegServPrestadosCOD_NOTA_CAB: TIntegerField;
    QRegServPrestadosIND_SITUACAO: TStringField;
    QRegServPrestadosperc_iss: TFloatField;
    QRegServPrestadosval_isento: TFloatField;
    procedure QRegServPrestadosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRegServPrestados: TDMRegServPrestados;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMRegServPrestados.QRegServPrestadosCalcFields(
  DataSet: TDataSet);
begin
  If QRegServPrestadosInd_Situacao.Value = '2' Then
   Begin
     QRegServPrestadosVal_Contabil.Value := StrToFloat(DmOracle.BuscaNome('SELECT SUM(TB_NOTA_ITEM.VAL_TOTAL + TB_NOTA_ITEM.VAL_DESPESAS - pega_desconto_item(tb_nota_item.cod_nota_item)) FROM TB_NOTA_ITEM',
            'COD_NOTA_CAB = ' + FloatToStr(QRegServPrestadosCod_Nota_Cab.Value)));
     QRegServPrestadosPerc_iss.Value := StrToFloat('0'+DmOracle.BuscaNome('SELECT TB_PRODUTO.PERC_ISS FROM TB_NOTA_ITEM,TB_PRODUTO',
            'TB_NOTA_ITEM.COD_PRODUTO=TB_PRODUTO.COD_PRODUTO AND TB_PRODUTO.PERC_ISS > 0 AND COD_NOTA_CAB = ' + FloatToStr(QRegServPrestadosCod_Nota_Cab.Value)));
     QRegServPrestadosVal_Isento.Value := QRegServPrestadosVal_Contabil.Value - QRegServPrestadosVal_Base_Calculo.Value;  
   End
  Else
   Begin
     QRegServPrestadosVal_Contabil.Value := 0;
     QRegServPrestadosPerc_iss.Value := 0;
   End;
end;   
end.

