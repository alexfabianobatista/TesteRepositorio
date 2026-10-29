inherited FClienteCons_MaisComprou: TFClienteCons_MaisComprou
  Left = 635
  Top = 139
  Width = 591
  Height = 425
  Caption = 'Consulta de Clientes que Mais Compraram'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTopo: TPanel
    Width = 583
    Height = 69
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
    inherited BtnPesquisar: TBitBtn
      Left = 473
      Top = 34
      TabOrder = 2
    end
    object MeDataIni: TMaskEdit
      Left = 16
      Top = 32
      Width = 69
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
  end
  inherited PnBotoes: TPanel
    Top = 354
    Width = 583
    inherited BtnGravar: TBitBtn
      Left = 369
    end
    inherited BtnCancelar: TBitBtn
      Left = 475
    end
  end
  inherited PnCorpo: TPanel
    Top = 69
    Width = 583
    Height = 285
    inherited PageControl1: TPageControl
      Width = 567
      Height = 268
      inherited TabSheet1: TTabSheet
        inherited DbGDados: TDBGrid
          Width = 559
          Height = 240
          Columns = <
            item
              Expanded = False
              FieldName = 'CODCLIENTE'
              Title.Alignment = taRightJustify
              Title.Caption = 'C'#243'digo'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 351
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VEICULOS_COMPRADOS'
              Title.Alignment = taRightJustify
              Title.Caption = 'Ve'#237'culos Comprados'
              Width = 111
              Visible = True
            end>
        end
      end
    end
  end
  inherited DsConsulta: TDataSource
    Left = 192
    Top = 136
  end
  inherited QConsulta: TIBQuery
    SQL.Strings = (
      
        'select c.codcliente, c.nome, count(*) as VEICULOS_COMPRADOS from' +
        ' tb_venda v'
      'inner join tb_cliente c on v.codcliente = c.codcliente'
      'where v.dtvenda between :DATAINI and :DATAFIN'
      'group by c.codcliente, c.nome'
      'order by 3, c.codcliente, c.nome desc')
    Left = 160
    Top = 136
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
    object QConsultaVEICULOS_COMPRADOS: TIntegerField
      FieldName = 'VEICULOS_COMPRADOS'
      Required = True
    end
  end
end
