inherited FClienteCons_VeiculosVendidos: TFClienteCons_VeiculosVendidos
  Left = 352
  Top = 202
  Width = 601
  Caption = 'Consulta de Vendas por Cliente'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTopo: TPanel
    Width = 593
    object Label7: TLabel [0]
      Left = 16
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label1: TLabel [1]
      Left = 96
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label2: TLabel [2]
      Left = 176
      Top = 16
      Width = 85
      Height = 13
      Caption = 'Valor M'#237'nimo (R$)'
    end
    inherited BtnPesquisar: TBitBtn
      Left = 483
      TabOrder = 3
    end
    object MeDataIni: TMaskEdit
      Left = 16
      Top = 32
      Width = 67
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MeDataFin: TMaskEdit
      Left = 96
      Top = 32
      Width = 69
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object MeValorMinimo: TMaskEdit
      Left = 176
      Top = 32
      Width = 89
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!999999999;0;_'
      MaxLength = 9
      TabOrder = 2
    end
  end
  inherited PnBotoes: TPanel
    Width = 593
    inherited BtnGravar: TBitBtn
      Left = 379
    end
    inherited BtnCancelar: TBitBtn
      Left = 485
    end
  end
  inherited PnCorpo: TPanel
    Width = 593
    inherited PageControl1: TPageControl
      Width = 577
      inherited TabSheet1: TTabSheet
        inherited DbGDados: TDBGrid
          Width = 569
          Columns = <
            item
              Expanded = False
              FieldName = 'CODCLIENTE'
              Title.Alignment = taRightJustify
              Title.Caption = 'C'#243'd. Cliente'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome Cliente'
              Width = 228
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DSCENDERECO'
              Title.Caption = 'Rua'
              Width = 157
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO'
              Title.Alignment = taRightJustify
              Title.Caption = 'N'#250'mero'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DSCBAIRRO'
              Title.Caption = 'Bairro'
              Width = 186
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DSCCIDADE'
              Title.Caption = 'Cidade'
              Width = 209
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DSCESTADO'
              Title.Caption = 'Estado'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALORVENDA'
              Title.Alignment = taRightJustify
              Title.Caption = 'Vlr. Venda'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODVEICULO'
              Title.Alignment = taRightJustify
              Title.Caption = 'C'#243'd. Ve'#237'culo'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DSCVEICULO'
              Title.Caption = 'Descri'#231#227'o Ve'#237'culo'
              Width = 238
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLACA'
              Title.Caption = 'Placa'
              Width = 65
              Visible = True
            end>
        end
      end
    end
  end
  inherited DsConsulta: TDataSource
    Left = 88
    Top = 184
  end
  inherited QConsulta: TIBQuery
    SQL.Strings = (
      'select'
      '  c.codcliente,'
      '  c.nome,'
      '  e.dscendereco,'
      '  c.numero,'
      '  b.dscbairro,'
      '  i.dsccidade,'
      '  s.dscestado,'
      '  o.codveiculo,'
      '  o.dscveiculo,'
      '  o.placa,'
      '  o.valorvenda'
      'from tb_venda v'
      'inner join tb_cliente c on v.codcliente = c.codcliente'
      'inner join tb_endereco e on c.codendereco = e.codendereco'
      'inner join tb_bairro b on c.codbairro = b.codbairro'
      'inner join tb_cidade i on c.codcidade = i.codcidade'
      'inner join tb_estado s on i.codestado = s.codestado'
      'inner join tb_veiculo o on v.codveiculo = o.codveiculo'
      'where v.dtvenda between :DATAINI and :DATAFIN'
      'and o.valorvenda >= :VALORVENDA'
      'order by c.codcliente, c.nome')
    Left = 56
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALORVENDA'
        ParamType = ptUnknown
      end>
    object QConsultaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'TB_CLIENTE.CODCLIENTE'
      Required = True
    end
    object QConsultaNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TB_CLIENTE.NOME'
      Required = True
      Size = 80
    end
    object QConsultaDSCENDERECO: TIBStringField
      FieldName = 'DSCENDERECO'
      Origin = 'TB_ENDERECO.DSCENDERECO'
      Required = True
      Size = 80
    end
    object QConsultaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TB_CLIENTE.NUMERO'
      Required = True
    end
    object QConsultaDSCBAIRRO: TIBStringField
      FieldName = 'DSCBAIRRO'
      Origin = 'TB_BAIRRO.DSCBAIRRO'
      Required = True
      Size = 80
    end
    object QConsultaDSCCIDADE: TIBStringField
      FieldName = 'DSCCIDADE'
      Origin = 'TB_CIDADE.DSCCIDADE'
      Required = True
      Size = 80
    end
    object QConsultaDSCESTADO: TIBStringField
      FieldName = 'DSCESTADO'
      Origin = 'TB_ESTADO.DSCESTADO'
      Required = True
      Size = 80
    end
    object QConsultaCODVEICULO: TIntegerField
      FieldName = 'CODVEICULO'
      Origin = 'TB_VEICULO.CODVEICULO'
      Required = True
    end
    object QConsultaDSCVEICULO: TIBStringField
      FieldName = 'DSCVEICULO'
      Origin = 'TB_VEICULO.DSCVEICULO'
      Required = True
      Size = 80
    end
    object QConsultaPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'TB_VEICULO.PLACA'
      Size = 8
    end
    object QConsultaVALORVENDA: TFloatField
      FieldName = 'VALORVENDA'
      Origin = 'TB_VEICULO.VALORVENDA'
      DisplayFormat = '#0.00'
    end
  end
end
