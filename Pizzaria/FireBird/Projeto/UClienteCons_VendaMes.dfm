inherited FClienteCons_VendaMes: TFClienteCons_VendaMes
  Left = 372
  Top = 163
  Width = 701
  Caption = 'Consulta de Clientes que Compraram em Determinado M'#234's'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTopo: TPanel
    Width = 693
    Height = 69
    object Label7: TLabel [0]
      Left = 16
      Top = 16
      Width = 20
      Height = 13
      Caption = 'M'#234's'
    end
    object Label1: TLabel [1]
      Left = 56
      Top = 16
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    inherited BtnPesquisar: TBitBtn
      Left = 583
      Top = 34
    end
    object MeMes: TMaskEdit
      Left = 16
      Top = 32
      Width = 33
      Height = 21
      EditMask = '!99;1;_'
      MaxLength = 2
      TabOrder = 1
      Text = '  '
    end
    object MeAno: TMaskEdit
      Left = 56
      Top = 32
      Width = 65
      Height = 21
      EditMask = '!9999;1;_'
      MaxLength = 4
      TabOrder = 2
      Text = '    '
    end
  end
  inherited PnBotoes: TPanel
    Width = 693
    inherited BtnGravar: TBitBtn
      Left = 479
    end
    inherited BtnCancelar: TBitBtn
      Left = 585
    end
  end
  inherited PnCorpo: TPanel
    Top = 69
    Width = 693
    Height = 310
    inherited PageControl1: TPageControl
      Width = 677
      Height = 293
      inherited TabSheet1: TTabSheet
        inherited DbGDados: TDBGrid
          Width = 669
          Height = 265
          Columns = <
            item
              Expanded = False
              FieldName = 'CODCLIENTE'
              Title.Alignment = taRightJustify
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 361
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_VENDAS'
              Title.Alignment = taRightJustify
              Title.Caption = 'Qtd. Ve'#237'culos'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_VENDIDO'
              Title.Alignment = taRightJustify
              Title.Caption = 'Valor Total'
              Width = 99
              Visible = True
            end>
        end
      end
    end
  end
  inherited DsConsulta: TDataSource
    Left = 72
    Top = 152
  end
  inherited QConsulta: TIBQuery
    SQL.Strings = (
      
        'select c.codcliente, c.nome, count(*) as NUM_VENDAS, sum(e.valor' +
        'venda) as VALOR_VENDIDO from tb_venda v'
      'inner join tb_veiculo e on v.codveiculo = e.codveiculo'
      'inner join tb_cliente c on v.codcliente = c.codcliente'
      'where v.dtvenda between :DATAINI and :DATAFIN'
      'group by c.codcliente, c.nome'
      'order by c.codcliente, c.nome, 3, 4')
    Left = 40
    Top = 152
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
      end>
    object QConsultaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Required = True
    end
    object QConsultaNOME: TIBStringField
      FieldName = 'NOME'
      Required = True
      Size = 80
    end
    object QConsultaNUM_VENDAS: TIntegerField
      FieldName = 'NUM_VENDAS'
      Required = True
    end
    object QConsultaVALOR_VENDIDO: TFloatField
      FieldName = 'VALOR_VENDIDO'
      DisplayFormat = '#0.00'
    end
  end
end
