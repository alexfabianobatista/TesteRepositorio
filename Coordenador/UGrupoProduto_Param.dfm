inherited FGrupoProduto_Param: TFGrupoProduto_Param
  Left = 277
  Top = 194
  Height = 326
  Caption = 'Parametros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Height = 209
    ActivePage = TabSheet2
    object TabSheet1: TTabSheet
      Caption = 'Mapa Pr'#234'mio'
      object Label61: TLabel
        Left = 9
        Top = 10
        Width = 20
        Height = 14
        Caption = 'Filial'
      end
      object Label79: TLabel
        Left = 9
        Top = 54
        Width = 53
        Height = 14
        Caption = 'Supervisor'
      end
      object ME1Filial: TMaskEdit
        Left = 9
        Top = 27
        Width = 44
        Height = 22
        EditMask = '######'
        MaxLength = 6
        TabOrder = 0
        Text = '      '
        OnExit = ME1FilialExit
      end
      object ED1Filial: TEdit
        Left = 81
        Top = 27
        Width = 235
        Height = 22
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
        Text = 'Todas'
      end
      object BT1Filial: TBitBtn
        Left = 55
        Top = 27
        Width = 25
        Height = 24
        TabOrder = 1
        TabStop = False
        OnClick = BT1FilialClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        NumGlyphs = 2
      end
      object GroupBox11: TGroupBox
        Left = 9
        Top = 102
        Width = 190
        Height = 70
        Caption = 'Per'#237'odo de Movimenta'#231#227'o'
        TabOrder = 6
        object Label63: TLabel
          Left = 9
          Top = 17
          Width = 13
          Height = 14
          Caption = 'De'
        end
        object Label64: TLabel
          Left = 95
          Top = 17
          Width = 17
          Height = 14
          Caption = 'At'#233
        end
        object ME1DtInicial: TMaskEdit
          Left = 9
          Top = 34
          Width = 78
          Height = 22
          EditMask = '!99/99/00##;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object ME1DtFinal: TMaskEdit
          Left = 95
          Top = 34
          Width = 78
          Height = 22
          EditMask = '!99/99/00##;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
      object ME1Vendedor: TMaskEdit
        Left = 9
        Top = 70
        Width = 44
        Height = 22
        EditMask = '######'
        MaxLength = 6
        TabOrder = 3
        Text = '      '
        OnExit = ME1VendedorExit
      end
      object Bt1Vendedor: TBitBtn
        Left = 54
        Top = 69
        Width = 25
        Height = 23
        TabOrder = 4
        TabStop = False
        OnClick = Bt1VendedorClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        NumGlyphs = 2
      end
      object Ed1Vendedor: TEdit
        Left = 80
        Top = 70
        Width = 236
        Height = 22
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 5
        Text = 'Todos'
      end
      object Rg1TipoRelatorio: TRadioGroup
        Left = 199
        Top = 102
        Width = 117
        Height = 70
        Caption = 'Tipo Relat'#243'rio'
        ItemIndex = 0
        Items.Strings = (
          'Valores'
          'Notas')
        TabOrder = 7
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Rel Grupo Produto'
      ImageIndex = 1
      object Label1: TLabel
        Left = 9
        Top = 8
        Width = 70
        Height = 14
        Caption = 'Grupo Produto'
      end
      object Label2: TLabel
        Left = 11
        Top = 56
        Width = 53
        Height = 14
        Caption = 'Supervisor'
      end
      object Label4: TLabel
        Left = 10
        Top = 101
        Width = 20
        Height = 14
        Caption = 'Ano'
      end
      object Label5: TLabel
        Left = 63
        Top = 101
        Width = 20
        Height = 14
        Caption = 'M'#234's'
      end
      object Me2Grupo: TMaskEdit
        Left = 9
        Top = 27
        Width = 44
        Height = 22
        EditMask = '######'
        MaxLength = 6
        TabOrder = 0
        Text = '      '
        OnExit = Me2GrupoExit
      end
      object Bt2Grupo: TBitBtn
        Left = 55
        Top = 27
        Width = 25
        Height = 24
        TabOrder = 1
        TabStop = False
        OnClick = Bt2GrupoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        NumGlyphs = 2
      end
      object Ed2DescGrupo: TEdit
        Left = 81
        Top = 27
        Width = 234
        Height = 22
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
        Text = 'Todas'
      end
      object Me2Supervisor: TMaskEdit
        Left = 10
        Top = 75
        Width = 44
        Height = 22
        EditMask = '######'
        MaxLength = 6
        TabOrder = 3
        Text = '      '
        OnExit = Me2SupervisorExit
      end
      object Bt2Supervisor: TBitBtn
        Left = 56
        Top = 75
        Width = 25
        Height = 24
        TabOrder = 4
        TabStop = False
        OnClick = Bt2SupervisorClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        NumGlyphs = 2
      end
      object Ed2DescSupervisor: TEdit
        Left = 82
        Top = 75
        Width = 234
        Height = 22
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 5
        Text = 'Todas'
      end
      object Me2Ano: TMaskEdit
        Left = 10
        Top = 117
        Width = 48
        Height = 22
        EditMask = '####'
        MaxLength = 4
        TabOrder = 6
        Text = '    '
      end
      object Me2Mes: TMaskEdit
        Left = 63
        Top = 117
        Width = 38
        Height = 22
        EditMask = '##'
        MaxLength = 2
        TabOrder = 7
        Text = '  '
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Tabela de Pre'#231'os'
      ImageIndex = 2
      object Label3: TLabel
        Left = 9
        Top = 8
        Width = 32
        Height = 14
        Caption = 'Tabela'
      end
      object Me3Tabela: TMaskEdit
        Left = 9
        Top = 27
        Width = 44
        Height = 22
        EditMask = '######'
        MaxLength = 6
        TabOrder = 0
        Text = '      '
        OnExit = Me3TabelaExit
      end
      object bt3Tabela: TBitBtn
        Left = 55
        Top = 27
        Width = 25
        Height = 24
        TabOrder = 1
        TabStop = False
        OnClick = bt3TabelaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        NumGlyphs = 2
      end
      object Ed3Tabela: TEdit
        Left = 81
        Top = 27
        Width = 234
        Height = 22
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
        Text = 'Todas'
      end
      object Rg3Situacao: TRadioGroup
        Left = 8
        Top = 56
        Width = 169
        Height = 81
        Caption = 'Situa'#231#227'o Tabela'
        ItemIndex = 2
        Items.Strings = (
          'Ativa'
          'Desativada'
          'Todas')
        TabOrder = 3
      end
    end
  end
end
