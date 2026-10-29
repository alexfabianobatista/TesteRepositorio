inherited FControleViagemParam: TFControleViagemParam
  Left = 477
  Top = 173
  Width = 416
  Height = 445
  Caption = 'Par'#226'metros para relat'#243'rio'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 400
    Height = 329
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Custos de viagem'
      DesignSize = (
        392
        300)
      object Label1: TLabel
        Left = 13
        Top = 132
        Width = 101
        Height = 14
        Caption = 'Descri'#231#227'o da viagem'
      end
      object Label2: TLabel
        Left = 15
        Top = 1
        Width = 20
        Height = 14
        Caption = 'Filial'
      end
      object Label3: TLabel
        Left = 15
        Top = 43
        Width = 44
        Height = 14
        Caption = 'Motorista'
      end
      object Label4: TLabel
        Left = 15
        Top = 84
        Width = 35
        Height = 14
        Caption = 'Ve'#237'culo'
      end
      object Label5: TLabel
        Left = 13
        Top = 181
        Width = 42
        Height = 14
        Caption = 'Dt. inicial'
      end
      object Label6: TLabel
        Left = 91
        Top = 181
        Width = 36
        Height = 14
        Caption = 'Dt. final'
      end
      object Me0Filial: TMaskEdit
        Left = 13
        Top = 16
        Width = 43
        Height = 22
        TabOrder = 0
        OnExit = Me0FilialExit
      end
      object Bt0Filial: TBitBtn
        Left = 60
        Top = 15
        Width = 25
        Height = 24
        TabOrder = 1
        TabStop = False
        OnClick = Bt0FilialClick
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
      object Ed0Filial: TEdit
        Left = 89
        Top = 16
        Width = 268
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        Enabled = False
        TabOrder = 2
        Text = 'Todas'
      end
      object ME0Motorista: TMaskEdit
        Left = 13
        Top = 58
        Width = 43
        Height = 22
        TabOrder = 3
        OnExit = ME0MotoristaExit
      end
      object Btn0Motorista: TBitBtn
        Left = 60
        Top = 57
        Width = 25
        Height = 24
        TabOrder = 4
        TabStop = False
        OnClick = Btn0MotoristaClick
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
      object ED0Motorista: TEdit
        Left = 89
        Top = 58
        Width = 268
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        Enabled = False
        TabOrder = 5
        Text = 'Todas'
      end
      object ME0Veiculo: TMaskEdit
        Left = 13
        Top = 99
        Width = 57
        Height = 22
        TabOrder = 6
        OnExit = ME0VeiculoExit
      end
      object Btn0Veiculo: TBitBtn
        Left = 80
        Top = 98
        Width = 25
        Height = 24
        TabOrder = 7
        TabStop = False
        OnClick = Btn0VeiculoClick
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
      object ED0Veiculo: TEdit
        Left = 110
        Top = 99
        Width = 245
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        Enabled = False
        TabOrder = 8
        Text = 'Todas'
      end
      object ED0Destino: TEdit
        Left = 13
        Top = 150
        Width = 341
        Height = 22
        TabOrder = 9
      end
      object Me0DtInicial: TMaskEdit
        Left = 13
        Top = 197
        Width = 72
        Height = 22
        EditMask = '!99/99/##00;1;_'
        MaxLength = 10
        TabOrder = 10
        Text = '  /  /    '
      end
      object Me0DtFinal: TMaskEdit
        Left = 91
        Top = 197
        Width = 73
        Height = 22
        EditMask = '!99/99/##00;1;_'
        MaxLength = 10
        TabOrder = 11
        Text = '  /  /    '
      end
      object RG0Ordem: TRadioGroup
        Left = 14
        Top = 230
        Width = 195
        Height = 49
        Caption = 'Ordena'#231#227'o'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'C'#243'digo'
          'Data'
          'Viagem')
        TabOrder = 12
      end
    end
  end
  inherited BtOk: TBitBtn
    Left = 220
    Top = 376
  end
  inherited BtCancela: TBitBtn
    Left = 316
    Top = 376
  end
  inherited RGPreview: TRadioGroup
    Top = 344
  end
end
