object DMContFiscM: TDMContFiscM
  OldCreateOrder = False
  Left = 521
  Top = 262
  Height = 298
  Width = 412
  object QReg030: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  :DT_INI_PERIODO AS DT_INI,'
      
        '  CAST(TO_CHAR(LAST_DAY(:DT_FIN_PERIODO), '#39'DD/MM/YYYY'#39')AS DATE) ' +
        'AS DT_FIN'
      '/*  CASE'
      '    WHEN ((SUBSTR(:DT_INI_PERIODO, 1, 5) = '#39'01/01'#39')'
      '      AND (SUBSTR(:DT_FIN_PERIODO,1, 5) = '#39'31/12'#39')) THEN'
      '      '#39'A00'#39
      '    ELSE'
      
        '      DECODE(:DT_FIN_PERIODO, NULL, '#39#39', '#39'A'#39'||SUBSTR(:DT_FIN_PERI' +
        'ODO, 4, 2)) '
      '  END AS PER_APUR'
      '*/'
      'FROM'
      '  DUAL'
      '')
    Variables.Data = {
      03000000020000000F0000003A44545F494E495F504552494F444F0C00000000
      000000000000000F0000003A44545F46494E5F504552494F444F0C0000000000
      000000000000}
    Session = DMOracle.DBCemapa
    Left = 32
    Top = 32
  end
end
