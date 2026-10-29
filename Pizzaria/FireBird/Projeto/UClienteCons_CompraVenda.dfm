inherited FClienteCons_CompraVenda: TFClienteCons_CompraVenda
  Left = 398
  Top = 232
  Width = 554
  Caption = 'Consulta de Clientes com Compra e Venda'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTopo: TPanel
    Width = 546
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
      Left = 436
      TabOrder = 2
    end
    object MeDataIni: TMaskEdit
      Left = 16
      Top = 32
      Width = 68
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
    Width = 546
    inherited BtnGravar: TBitBtn
      Left = 332
    end
    inherited BtnCancelar: TBitBtn
      Left = 438
    end
  end
  inherited PnCorpo: TPanel
    Width = 546
    inherited PageControl1: TPageControl
      Width = 530
      inherited TabSheet1: TTabSheet
        inherited DbGDados: TDBGrid
          Width = 522
          Columns = <
            item
              Expanded = False
              FieldName = 'CODCLIENTE'
              Title.Alignment = taRightJustify
              Title.Caption = 'C'#243'digo'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 267
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD_VENDAS'
              Title.Alignment = taRightJustify
              Title.Caption = 'Qtd. Vendas'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD_COMPRAS'
              Title.Alignment = taRightJustify
              Title.Caption = 'Qtd. Compras'
              Width = 79
              Visible = True
            end>
        end
      end
    end
  end
  inherited DsConsulta: TDataSource
    Left = 192
    Top = 184
  end
  inherited QConsulta: TIBQuery
    SQL.Strings = (
      'Select'
      '  c.codcliente,'
      '  c.nome,'
      
        '  (select count(*) from tb_venda v where v.codcliente = c.codcli' +
        'ente and (v.dtvenda between :DATAINI and :DATAFIN)) as QTD_VENDA' +
        'S,'
      
        '  (select count(*) from tb_compra v where v.codcliente = c.codcl' +
        'iente and (v.dtcompra between :DATAINI and :DATAFIN)) as QTD_COM' +
        'PRAS'
      'From tb_cliente c'
      'where'
      
        '  ((select count(*) from tb_venda v where v.codcliente = c.codcl' +
        'iente and (v.dtvenda between :DATAINI and :DATAFIN)) > 0)'
      'and'
      
        '  ((select count(*) from tb_compra v where v.codcliente = c.codc' +
        'liente and (v.dtcompra between :DATAINI and :DATAFIN)) > 0)'
      'order by c.codcliente, c.nome')
    Left = 160
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
      Origin = 'TB_CLIENTE.CODCLIENTE'
      Required = True
    end
    object QConsultaNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TB_CLIENTE.NOME'
      Required = True
      Size = 80
    end
    object QConsultaQTD_VENDAS: TIntegerField
      FieldName = 'QTD_VENDAS'
      DisplayFormat = '#0.00'
    end
    object QConsultaQTD_COMPRAS: TIntegerField
      FieldName = 'QTD_COMPRAS'
      DisplayFormat = '#0.00'
    end
  end
end
