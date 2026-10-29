object FOficinaConfirma: TFOficinaConfirma
  Left = 343
  Top = 129
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Confirma'#231#227'o de Ordem de Servi'#231'o'
  ClientHeight = 388
  ClientWidth = 292
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 292
    Height = 337
    ActivePage = TSContasReceber
    Align = alTop
    TabOrder = 0
    object TSContasReceber: TTabSheet
      Caption = 'Contas '#224' Receber'
      object Label4: TLabel
        Left = 72
        Top = 178
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label1: TLabel
        Left = 160
        Top = 178
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label8: TLabel
        Left = 32
        Top = 178
        Width = 21
        Height = 13
        Caption = 'Dias'
      end
      object Label6: TLabel
        Left = 8
        Top = 45
        Width = 48
        Height = 13
        Caption = 'Finalidade'
      end
      object Label31: TLabel
        Left = 8
        Top = 5
        Width = 67
        Height = 13
        Caption = 'Departamento'
      end
      object LTotal: TLabel
        Left = 8
        Top = 264
        Width = 157
        Height = 13
        Caption = 'Total da Ordem de Servi'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBContaReceber: TListBox
        Left = 32
        Top = 96
        Width = 215
        Height = 81
        TabStop = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 6
      end
      object BtApagaParcela: TBitBtn
        Left = 33
        Top = 219
        Width = 215
        Height = 25
        Caption = 'Apagar Parcela'
        TabOrder = 5
        TabStop = False
        OnClick = BtApagaParcelaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          333333777777777F33333330B00000003333337F7777777F3333333000000000
          333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
          333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
          03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
          03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
          3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
          333333333377F7F33333333333330F03333333333337F7F33333333333330B03
          3333333333373733333333333333303333333333333373333333}
        NumGlyphs = 2
      end
      object MEDiasCR: TMaskEdit
        Left = 32
        Top = 193
        Width = 32
        Height = 21
        EditMask = '###'
        MaxLength = 3
        TabOrder = 2
        Text = '   '
        OnExit = MEDiasCRExit
      end
      object MEDataCR: TMaskEdit
        Left = 72
        Top = 194
        Width = 73
        Height = 21
        EditMask = '!99/99/00##;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
      end
      object MEValorCR: TMaskEdit
        Left = 160
        Top = 194
        Width = 89
        Height = 21
        TabOrder = 4
        OnExit = MEValorCRExit
      end
      object MEFinalidade: TMaskEdit
        Left = 8
        Top = 61
        Width = 47
        Height = 21
        EditMask = '######'
        MaxLength = 6
        TabOrder = 1
        Text = '2     '
        OnExit = MEFinalidadeExit
      end
      object BtConsFinalidade: TBitBtn
        Left = 56
        Top = 61
        Width = 22
        Height = 22
        TabOrder = 7
        TabStop = False
        OnClick = BtConsFinalidadeClick
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
      object EdFinalidade: TEdit
        Left = 80
        Top = 61
        Width = 193
        Height = 21
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 8
      end
      object MEDepartamento: TMaskEdit
        Left = 8
        Top = 21
        Width = 48
        Height = 21
        EditMask = '######'
        MaxLength = 6
        TabOrder = 0
        Text = '1     '
        OnExit = MEDepartamentoExit
      end
      object BtConsDepartamento: TBitBtn
        Left = 56
        Top = 21
        Width = 22
        Height = 22
        TabOrder = 9
        TabStop = False
        OnClick = BtConsDepartamentoClick
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
      object EdDepartamento: TEdit
        Left = 80
        Top = 21
        Width = 193
        Height = 21
        TabStop = False
        ParentColor = True
        ReadOnly = True
        TabOrder = 10
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 352
    Width = 91
    Height = 25
    Caption = 'Confirmar'
    Default = True
    TabOrder = 1
    OnClick = BitBtn1Click
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
  object BitBtn2: TBitBtn
    Left = 184
    Top = 352
    Width = 91
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    Kind = bkCancel
  end
end
