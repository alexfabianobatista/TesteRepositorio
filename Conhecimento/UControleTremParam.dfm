inherited FControleTremParam: TFControleTremParam
  Left = 377
  Top = 143
  Width = 433
  Height = 319
  Caption = 'Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 425
    ActivePage = TabSheet2
    object TabSheet1: TTabSheet
      Caption = 'Controle Trem'
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 51
        Height = 14
        Caption = 'Remetente'
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 57
        Height = 14
        Caption = 'Destinat'#225'rio'
      end
      object Me1Remetente: TMaskEdit
        Left = 8
        Top = 24
        Width = 65
        Height = 22
        TabOrder = 0
        OnExit = Me1RemetenteExit
      end
      object Me1Destinatario: TMaskEdit
        Left = 8
        Top = 64
        Width = 65
        Height = 22
        TabOrder = 1
        OnExit = Me1DestinatarioExit
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 96
        Width = 177
        Height = 65
        Caption = 'Data Controle'
        TabOrder = 2
        object Label3: TLabel
          Left = 79
          Top = 27
          Width = 17
          Height = 14
          Caption = 'At'#233
        end
        object Me1Data_I: TMaskEdit
          Left = 7
          Top = 24
          Width = 64
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object Me1Data_F: TMaskEdit
          Left = 103
          Top = 24
          Width = 64
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
      object BtRemetente: TBitBtn
        Left = 76
        Top = 24
        Width = 29
        Height = 23
        TabOrder = 3
        TabStop = False
        OnClick = BtRemetenteClick
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
      object Ed1Remetente: TEdit
        Left = 107
        Top = 24
        Width = 174
        Height = 22
        Color = clBtnFace
        Enabled = False
        TabOrder = 4
        Text = 'Todos'
      end
      object BtDestinatario: TBitBtn
        Left = 76
        Top = 64
        Width = 29
        Height = 23
        TabOrder = 5
        TabStop = False
        OnClick = BtDestinatarioClick
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
      object Ed1Destinatario: TEdit
        Left = 107
        Top = 64
        Width = 174
        Height = 22
        Color = clBtnFace
        Enabled = False
        TabOrder = 6
        Text = 'Todos'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Peso por Vag'#227'o/Nota'
      ImageIndex = 1
      object SbBuscaFluxoTrem: TSpeedButton
        Left = 69
        Top = 24
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
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
        OnClick = SbBuscaFluxoTremClick
      end
      object lblFluxoTrem: TLabel
        Left = 8
        Top = 8
        Width = 53
        Height = 14
        Caption = 'Fluxo Trem'
      end
      object Label5: TLabel
        Left = 97
        Top = 8
        Width = 53
        Height = 14
        Caption = 'Num. Fluxo'
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 96
        Width = 177
        Height = 65
        Caption = 'Data Vag'#227'o'
        TabOrder = 1
        object Label4: TLabel
          Left = 79
          Top = 27
          Width = 17
          Height = 14
          Caption = 'At'#233
        end
        object Me2Data_I: TMaskEdit
          Left = 7
          Top = 24
          Width = 64
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object Me2Data_F: TMaskEdit
          Left = 103
          Top = 24
          Width = 64
          Height = 22
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
      end
      object MeFluxoTrem: TMaskEdit
        Left = 7
        Top = 24
        Width = 58
        Height = 22
        TabOrder = 0
        OnExit = MeFluxoTremExit
      end
      object MeDescFluxo: TMaskEdit
        Left = 96
        Top = 24
        Width = 185
        Height = 22
        TabStop = False
        Color = clBtnFace
        Enabled = False
        TabOrder = 2
      end
    end
  end
end
