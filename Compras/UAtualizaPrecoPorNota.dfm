object FAtualizaPrecoPorNota: TFAtualizaPrecoPorNota
  Left = 272
  Top = 29
  Width = 1211
  Height = 467
  Caption = 'Atualiza Pre'#231'o Cadastro Produtos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    1195
    428)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 19
    Width = 99
    Height = 13
    Caption = 'Percentual Reajuste:'
  end
  object LbPercReajAtacado: TLabel
    Left = 32
    Top = 43
    Width = 139
    Height = 13
    Caption = 'Percentual Reajuste Atacado'
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 6
    Top = 72
    Width = 1184
    Height = 348
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DsItensNota
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        ReadOnly = True
        Title.Caption = 'C'#243'digo'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        ReadOnly = True
        Title.Caption = 'Descri'#231#227'o'
        Width = 272
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'num_fabricante'
        Title.Caption = 'Num. Fabricante'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'desc_cod_barra'
        Title.Caption = 'C'#243'd. Barras'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_CUSTO'
        ReadOnly = True
        Title.Caption = 'Custo'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_VAREJO'
        ReadOnly = True
        Title.Caption = 'Pre'#231'o Venda'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LUCRO'
        Title.Caption = 'Lucro Atual'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_REAJUSTE'
        Title.Caption = 'Perc. Reajuste'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_UNITARIO_TABELA'
        Title.Caption = 'Novo Pre'#231'o Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_REAJUSTE_ATACADO'
        Title.Caption = 'Perc. Reaj. At'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_ATACADO'
        Title.Caption = 'Pre'#231'o Atacado'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOVO_VAL_ATACADO'
        Title.Caption = 'N. Pre'#231'o Atacado'
        Width = 90
        Visible = True
      end>
  end
  object MePercentual: TMaskEdit
    Left = 176
    Top = 16
    Width = 81
    Height = 21
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 272
    Top = 7
    Width = 113
    Height = 37
    Caption = 'Simular'
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 408
    Top = 8
    Width = 185
    Height = 35
    Caption = 'Confirma Reajuste dos Produtos'
    Default = True
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object MePercentualAtacado: TMaskEdit
    Left = 176
    Top = 40
    Width = 81
    Height = 21
    TabOrder = 4
    Visible = False
  end
  object DsItensNota: TDataSource
    DataSet = DMNotaEntrada.CDSAlteraPreco
    Left = 744
    Top = 16
  end
end
