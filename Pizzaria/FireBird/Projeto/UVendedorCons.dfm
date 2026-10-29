inherited FVendedorCons: TFVendedorCons
  Left = 338
  Top = 176
  Width = 717
  Caption = 'Consulta de Vendedores'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTopo: TPanel
    Width = 709
    Height = 85
    object Label1: TLabel [0]
      Left = 296
      Top = 32
      Width = 48
      Height = 13
      Caption = 'Par'#226'metro'
    end
    inherited BtnPesquisar: TBitBtn
      Left = 599
      Top = 50
      TabOrder = 2
    end
    object RgTipo: TRadioGroup
      Left = 8
      Top = 8
      Width = 281
      Height = 73
      Caption = 'Tipo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Alfab'#233'tica'
        'Data de Admiss'#227'o'
        'Quantidade de Vendas'
        'Valor das Vendas')
      TabOrder = 0
      OnClick = RgTipoClick
    end
    object MePesquisa: TMaskEdit
      Left = 296
      Top = 48
      Width = 272
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
  end
  inherited PnBotoes: TPanel
    Width = 709
    inherited BtnGravar: TBitBtn
      Left = 495
    end
    inherited BtnCancelar: TBitBtn
      Left = 601
    end
  end
  inherited PnCorpo: TPanel
    Top = 85
    Width = 709
    Height = 294
    inherited PageControl1: TPageControl
      Width = 693
      Height = 277
      inherited TabSheet1: TTabSheet
        inherited DbGDados: TDBGrid
          Width = 685
          Height = 249
          Columns = <
            item
              Expanded = False
              FieldName = 'CODVENDEDOR'
              Title.Alignment = taRightJustify
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 221
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMISSAO'
              Title.Alignment = taRightJustify
              Title.Caption = 'Comiss'#227'o'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_ADMISSAO'
              Title.Caption = 'Admiss'#227'o'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD_VENDAS'
              Title.Alignment = taRightJustify
              Title.Caption = 'Qtd. Vendas'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_VENDAS'
              Title.Alignment = taRightJustify
              Title.Caption = 'Valor Vendas'
              Width = 106
              Visible = True
            end>
        end
      end
    end
  end
  inherited QConsulta: TIBQuery
    SQL.Strings = (
      'select'
      
        '    (select count(*) from tb_venda v where v.codvendedor = f.cod' +
        'vendedor) as qtd_vendas,'
      
        '    (select sum(z.valorvenda) from tb_venda v inner join tb_veic' +
        'ulo z on z.codveiculo = v.codveiculo where v.codvendedor = f.cod' +
        'vendedor) as valor_vendas,'
      '    f.*'
      'from tb_vendedor f')
    object QConsultaQTD_VENDAS: TIntegerField
      FieldName = 'QTD_VENDAS'
    end
    object QConsultaVALOR_VENDAS: TFloatField
      FieldName = 'VALOR_VENDAS'
      EditFormat = '#.00'
    end
    object QConsultaCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
      Origin = 'TB_VENDEDOR.CODVENDEDOR'
      Required = True
    end
    object QConsultaNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TB_VENDEDOR.NOME'
      Required = True
      Size = 80
    end
    object QConsultaCOMISSAO: TFloatField
      FieldName = 'COMISSAO'
      Origin = 'TB_VENDEDOR.COMISSAO'
      EditFormat = '#.00'
    end
    object QConsultaDATA_ADMISSAO: TDateTimeField
      FieldName = 'DATA_ADMISSAO'
      Origin = 'TB_VENDEDOR.DATA_ADMISSAO'
      DisplayFormat = 'dd/MM/yyyy'
    end
  end
end
