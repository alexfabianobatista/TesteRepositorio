unit UPrecoPocket_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, variants;

type
  TDMPrecoPocket = class(TDataModule)
    QPrecoPocket: TOracleDataSet1;
    QPrecoPocketCons: TOracleDataSet1;
    QPrecoPocketConsCOD_PRODUTO: TIntegerField;
    QPrecoPocketConsCOD_PRECO_POCKET: TIntegerField;
    QPrecoPocketConsDESC_PRODUTO: TStringField;
    QPrecoPocketCOD_PRECO_POCKET: TIntegerField;
    QPrecoPocketCOD_PRODUTO: TIntegerField;
    QPrecoPocketQT_QUANTIDADE1: TIntegerField;
    QPrecoPocketQT_QUANTIDADE2: TIntegerField;
    QPrecoPocketQT_QUANTIDADE3: TIntegerField;
    QPrecoPocketQT_QUANTIDADE4: TIntegerField;
    QPrecoPocketQT_QUANTIDADE5: TIntegerField;
    QPrecoPocketQT_QUANTIDADE6: TIntegerField;
    QPrecoPocketQT_QUANTIDADE7: TIntegerField;
    QPrecoPocketQT_QUANTIDADE8: TIntegerField;
    QPrecoPocketQT_QUANTIDADE9: TIntegerField;
    QPrecoPocketCOD_VENDEDOR: TIntegerField;
    QPrecoPocketVAL_PRECO1: TFloatField;
    QPrecoPocketVAL_PRECO2: TFloatField;
    QPrecoPocketVAL_PRECO3: TFloatField;
    QPrecoPocketVAL_PRECO4: TFloatField;
    QPrecoPocketVAL_PRECO5: TFloatField;
    QPrecoPocketVAL_PRECO6: TFloatField;
    QPrecoPocketVAL_PRECO7: TFloatField;
    QPrecoPocketVAL_PRECO8: TFloatField;
    QPrecoPocketVAL_PRECO9: TFloatField;
    QPrecoPocketPERC_DESCONTO1: TFloatField;
    QPrecoPocketPERC_DESCONTO2: TFloatField;
    QPrecoPocketPERC_DESCONTO3: TFloatField;
    QPrecoPocketPERC_DESCONTO4: TFloatField;
    QPrecoPocketPERC_DESCONTO5: TFloatField;
    QPrecoPocketPERC_DESCONTO6: TFloatField;
    QPrecoPocketPERC_DESCONTO7: TFloatField;
    QPrecoPocketPERC_DESCONTO8: TFloatField;
    QPrecoPocketPERC_DESCONTO9: TFloatField;
    QPrecoPocketPERC_ACRESCIMO1: TFloatField;
    QPrecoPocketPERC_ACRESCIMO2: TFloatField;
    QPrecoPocketPERC_ACRESCIMO3: TFloatField;
    QPrecoPocketPERC_ACRESCIMO4: TFloatField;
    QPrecoPocketPERC_ACRESCIMO5: TFloatField;
    QPrecoPocketPERC_ACRESCIMO6: TFloatField;
    QPrecoPocketPERC_ACRESCIMO7: TFloatField;
    QPrecoPocketPERC_ACRESCIMO8: TFloatField;
    QPrecoPocketPERC_ACRESCIMO9: TFloatField;
    QRPrecoPocket: TOracleDataSet1;
    QRPrecoPocketCOD_PRECO_POCKET: TIntegerField;
    QRPrecoPocketCOD_PRODUTO: TIntegerField;
    QRPrecoPocketQT_QUANTIDADE1: TIntegerField;
    QRPrecoPocketQT_QUANTIDADE2: TIntegerField;
    QRPrecoPocketQT_QUANTIDADE3: TIntegerField;
    QRPrecoPocketQT_QUANTIDADE4: TIntegerField;
    QRPrecoPocketQT_QUANTIDADE5: TIntegerField;
    QRPrecoPocketQT_QUANTIDADE6: TIntegerField;
    QRPrecoPocketQT_QUANTIDADE7: TIntegerField;
    QRPrecoPocketQT_QUANTIDADE8: TIntegerField;
    QRPrecoPocketQT_QUANTIDADE9: TIntegerField;
    QRPrecoPocketCOD_VENDEDOR: TIntegerField;
    QRPrecoPocketVAL_PRECO1: TFloatField;
    QRPrecoPocketVAL_PRECO2: TFloatField;
    QRPrecoPocketVAL_PRECO3: TFloatField;
    QRPrecoPocketVAL_PRECO4: TFloatField;
    QRPrecoPocketVAL_PRECO5: TFloatField;
    QRPrecoPocketVAL_PRECO6: TFloatField;
    QRPrecoPocketVAL_PRECO7: TFloatField;
    QRPrecoPocketVAL_PRECO8: TFloatField;
    QRPrecoPocketVAL_PRECO9: TFloatField;
    QRPrecoPocketPERC_DESCONTO1: TFloatField;
    QRPrecoPocketPERC_DESCONTO2: TFloatField;
    QRPrecoPocketPERC_DESCONTO3: TFloatField;
    QRPrecoPocketPERC_DESCONTO4: TFloatField;
    QRPrecoPocketPERC_DESCONTO5: TFloatField;
    QRPrecoPocketPERC_DESCONTO6: TFloatField;
    QRPrecoPocketPERC_DESCONTO7: TFloatField;
    QRPrecoPocketPERC_DESCONTO8: TFloatField;
    QRPrecoPocketPERC_DESCONTO9: TFloatField;
    QRPrecoPocketPERC_ACRESCIMO1: TFloatField;
    QRPrecoPocketPERC_ACRESCIMO2: TFloatField;
    QRPrecoPocketPERC_ACRESCIMO3: TFloatField;
    QRPrecoPocketPERC_ACRESCIMO4: TFloatField;
    QRPrecoPocketPERC_ACRESCIMO5: TFloatField;
    QRPrecoPocketPERC_ACRESCIMO6: TFloatField;
    QRPrecoPocketPERC_ACRESCIMO7: TFloatField;
    QRPrecoPocketPERC_ACRESCIMO8: TFloatField;
    QRPrecoPocketPERC_ACRESCIMO9: TFloatField;
    QRPrecoPocketCOD_VENDEDOR_PARAM: TFloatField;
    QRPrecoPocketvl_preco1_final: TFloatField;
    QRPrecoPocketvl_preco2_final: TFloatField;
    QRPrecoPocketvl_preco3_final: TFloatField;
    QRPrecoPocketvl_preco4_final: TFloatField;
    QRPrecoPocketvl_preco5_final: TFloatField;
    QRPrecoPocketvl_preco6_final: TFloatField;
    QRPrecoPocketvl_preco7_final: TFloatField;
    QRPrecoPocketvl_preco8_final: TFloatField;
    QRPrecoPocketvl_preco9_final: TFloatField;
    QRPrecoPocketDESC_PRODUTO: TStringField;
    procedure QRPrecoPocketCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrecoPocket: TDMPrecoPocket;

implementation

uses UOracle_cl, UVendedor_cl;

{$R *.DFM}

procedure TDMPrecoPocket.QRPrecoPocketCalcFields(DataSet: TDataSet);
begin
  QRPrecoPocketVl_Preco1_Final.Value := QRPrecoPocketVal_Preco1.Value;
  QRPrecoPocketVl_Preco2_Final.Value := QRPrecoPocketVal_Preco2.Value;
  QRPrecoPocketVl_Preco3_Final.Value := QRPrecoPocketVal_Preco3.Value;
  QRPrecoPocketVl_Preco4_Final.Value := QRPrecoPocketVal_Preco4.Value;
  QRPrecoPocketVl_Preco5_Final.Value := QRPrecoPocketVal_Preco5.Value;
  QRPrecoPocketVl_Preco6_Final.Value := QRPrecoPocketVal_Preco6.Value;
  QRPrecoPocketVl_Preco7_Final.Value := QRPrecoPocketVal_Preco7.Value;
  QRPrecoPocketVl_Preco8_Final.Value := QRPrecoPocketVal_Preco8.Value;
  QRPrecoPocketVl_Preco9_Final.Value := QRPrecoPocketVal_Preco9.Value;
  
  If QRPrecoPocketCod_Vendedor_Param.Value <> Null Then
   Begin
     DMVendedor.QVendedor.Close;
     DMVendedor.QVendedor.SetVariable('Pk',QRPrecoPocketCod_Vendedor_Param.Value);
     DMVendedor.QVendedor.Open;
     If QRPrecoPocketVl_Preco1_Final.Value <> 0 Then
       QRPrecoPocketVl_Preco1_Final.Value := QRPrecoPocketVl_Preco1_Final.Value + DMVendedor.QVendedorVal_Frete_Pocket.Value;
     If QRPrecoPocketVl_Preco2_Final.Value <> 0 Then
       QRPrecoPocketVl_Preco2_Final.Value := QRPrecoPocketVl_Preco2_Final.Value + DMVendedor.QVendedorVal_Frete_Pocket.Value;
     If QRPrecoPocketVl_Preco3_Final.Value <> 0 Then
       QRPrecoPocketVl_Preco3_Final.Value := QRPrecoPocketVl_Preco3_Final.Value + DMVendedor.QVendedorVal_Frete_Pocket.Value;
     If QRPrecoPocketVl_Preco4_Final.Value <> 0 Then
       QRPrecoPocketVl_Preco4_Final.Value := QRPrecoPocketVl_Preco4_Final.Value + DMVendedor.QVendedorVal_Frete_Pocket.Value;
     If QRPrecoPocketVl_Preco5_Final.Value <> 0 Then
       QRPrecoPocketVl_Preco5_Final.Value := QRPrecoPocketVl_Preco5_Final.Value + DMVendedor.QVendedorVal_Frete_Pocket.Value;
     If QRPrecoPocketVl_Preco6_Final.Value <> 0 Then
       QRPrecoPocketVl_Preco6_Final.Value := QRPrecoPocketVl_Preco6_Final.Value + DMVendedor.QVendedorVal_Frete_Pocket.Value;
     If QRPrecoPocketVl_Preco7_Final.Value <> 0 Then
       QRPrecoPocketVl_Preco7_Final.Value := QRPrecoPocketVl_Preco7_Final.Value + DMVendedor.QVendedorVal_Frete_Pocket.Value;
     If QRPrecoPocketVl_Preco8_Final.Value <> 0 Then
       QRPrecoPocketVl_Preco8_Final.Value := QRPrecoPocketVl_Preco8_Final.Value + DMVendedor.QVendedorVal_Frete_Pocket.Value;
     If QRPrecoPocketVl_Preco9_Final.Value <> 0 Then
       QRPrecoPocketVl_Preco9_Final.Value := QRPrecoPocketVl_Preco9_Final.Value + DMVendedor.QVendedorVal_Frete_Pocket.Value;
     If DMVendedor.QVendedorPerc_Icms_Pocket.Value <> 0 Then
      Begin
        QRPrecoPocketVl_Preco1_Final.Value := QRPrecoPocketVl_Preco1_Final.Value + QRPrecoPocketVal_Preco1.Value * DMVendedor.QVendedorPerc_Icms_Pocket.Value / 100;
        QRPrecoPocketVl_Preco2_Final.Value := QRPrecoPocketVl_Preco2_Final.Value + QRPrecoPocketVal_Preco2.Value * DMVendedor.QVendedorPerc_Icms_Pocket.Value / 100;
        QRPrecoPocketVl_Preco3_Final.Value := QRPrecoPocketVl_Preco3_Final.Value + QRPrecoPocketVal_Preco3.Value * DMVendedor.QVendedorPerc_Icms_Pocket.Value / 100;
        QRPrecoPocketVl_Preco4_Final.Value := QRPrecoPocketVl_Preco4_Final.Value + QRPrecoPocketVal_Preco4.Value * DMVendedor.QVendedorPerc_Icms_Pocket.Value / 100;
        QRPrecoPocketVl_Preco5_Final.Value := QRPrecoPocketVl_Preco5_Final.Value + QRPrecoPocketVal_Preco5.Value * DMVendedor.QVendedorPerc_Icms_Pocket.Value / 100;
        QRPrecoPocketVl_Preco6_Final.Value := QRPrecoPocketVl_Preco6_Final.Value + QRPrecoPocketVal_Preco6.Value * DMVendedor.QVendedorPerc_Icms_Pocket.Value / 100;
        QRPrecoPocketVl_Preco7_Final.Value := QRPrecoPocketVl_Preco7_Final.Value + QRPrecoPocketVal_Preco7.Value * DMVendedor.QVendedorPerc_Icms_Pocket.Value / 100;
        QRPrecoPocketVl_Preco8_Final.Value := QRPrecoPocketVl_Preco8_Final.Value + QRPrecoPocketVal_Preco8.Value * DMVendedor.QVendedorPerc_Icms_Pocket.Value / 100;
        QRPrecoPocketVl_Preco9_Final.Value := QRPrecoPocketVl_Preco9_Final.Value + QRPrecoPocketVal_Preco9.Value * DMVendedor.QVendedorPerc_Icms_Pocket.Value / 100;
      End;
   End;
end;

end.
