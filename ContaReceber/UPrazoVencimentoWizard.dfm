object FPrazoVencimentoWizard: TFPrazoVencimentoWizard
  Left = 367
  Top = 176
  Width = 461
  Height = 359
  Caption = 'Cria'#231#227'o de Prazo de Vencimento'
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
    445
    321)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControlPrazo: TPageControl
    Left = 8
    Top = 8
    Width = 430
    Height = 265
    ActivePage = TabSheet2
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Descri'#231#227'o'
      OnShow = TabSheet1Show
      DesignSize = (
        422
        237)
      object DBDescricao: TDBPanel
        Left = 16
        Top = 104
        Width = 265
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        CodigoTabStop = True
        DataField = 'DESC_PRAZO_VENCIMENTO'
        DataSource = DSPrimario
        fkCache = False
        fkChave = 'DESC_PRAZO_VENCIMENTO'
        ForeignKey = False
        LCaption = 'Descri'#231#227'o'
        ReadOnly = False
        Required = True
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object ListBox1: TListBox
        Left = 16
        Top = 16
        Width = 390
        Height = 73
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        ItemHeight = 13
        Items.Strings = (
          'A descri'#231#227'o do prazo de vencimento '#233' meramente informativa,'
          'para que o usu'#225'rio saiba qual a configura'#231#227'o feita neste prazo.'
          ''
          'Ex. Em um prazo de vencimento que tenha 2 parcelas, para'
          '30 e 60 dias, uma poss'#237'vel descri'#231#227'o seria: "30, 60 DIAS".')
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Prazo'
      ImageIndex = 1
      OnShow = TabSheet2Show
      DesignSize = (
        422
        237)
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 96
        Height = 13
        Caption = 'N'#250'mero de Parcelas'
      end
      object Label2: TLabel
        Left = 16
        Top = 96
        Width = 80
        Height = 13
        Caption = 'Intervalo de Dias'
      end
      object MeParcelas: TMaskEdit
        Left = 16
        Top = 24
        Width = 49
        Height = 21
        EditMask = '!99;1;_'
        MaxLength = 2
        TabOrder = 0
        Text = '  '
      end
      object MeIntervaloDias: TMaskEdit
        Left = 16
        Top = 112
        Width = 49
        Height = 21
        EditMask = '!99;1;_'
        MaxLength = 2
        TabOrder = 1
        Text = '  '
      end
      object ListBox2: TListBox
        Left = 16
        Top = 50
        Width = 385
        Height = 33
        Enabled = False
        ItemHeight = 13
        Items.Strings = (
          
            'O N'#250'mero de Parcelas define a quantidade de parcelas que ser'#227'o g' +
            'eradas.')
        TabOrder = 2
      end
      object ListBox3: TListBox
        Left = 16
        Top = 144
        Width = 385
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        ItemHeight = 13
        Items.Strings = (
          
            'Intervalo de dias '#233' o per'#237'odo de tempo entre o vencimento de cad' +
            'a '
          
            'parcela que ser'#225' gerada, por exemplo, a cada 15 dias, 20 dias ou' +
            ' 30 dias.')
        TabOrder = 3
      end
    end
  end
  object BtnAvancar: TBitBtn
    Left = 336
    Top = 288
    Width = 100
    Height = 25
    Caption = 'Avan'#231'ar'
    TabOrder = 1
    OnClick = BtnAvancarClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF31468B2B3F7EB8C5F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2839713F52922B3D7DB9C7F3FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF2D3E7D435FBC42569C304487BBC8F4FFFFFFFFFFFFFFFFFF4C64B8324587
      3245873245873245873245873245873245873245873354C12B4DBF445BA63549
      92BCC9F4FFFFFFFFFFFF374C94536DC04C68C74C68C74C68C74C68C74C68C74C
      68C74C68C73356CC042FC03356CC4760B13A509DBDCAF5FFFFFF3D539F5572D2
      3056D6254DD3254DD3254DD3254DD3254DD3254DD31D46D11641D01A44D14366
      D94E68BB3F57A8BFCCF6435BAC6681DE4065E2335BE0335BE0335BE0335BE033
      5BE0335BE0335BE0335BE0335BE03D63E25D7DE65770C74862B94861B8758FE8
      5A7DEF5075EE5075EE5075EE5075EE5075EE5075EE5075EE5075EE5075EE577A
      EF6D8BF15D77D24E68C34C66BE819AEC7592F46C8BF36C8BF36C8BF36C8BF36C
      8BF36C8BF36C8BF36C8BF37391F4829CF56680D74F69C2C1CEF74E68C0869CE7
      9AAEF09FB1F19FB2F19FB2F19FB2F1A0B3F2A1B3F1A2B6F88DA5F694ABF66C86
      DA516BC4C1CEF8FFFFFF5F79D1516BC2516BC2516BC2516BC2516BC2516BC251
      6BC2516BC297ADF7A5B8F8738ADB526CC6C1CEF8FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF536DC47D98F57A91DC556FC8C1CE
      F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF556FC6607CDA5671CAC1CEF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C77D35A75D0C2CEF8FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    Layout = blGlyphRight
  end
  object btnVoltar: TBitBtn
    Left = 232
    Top = 288
    Width = 100
    Height = 25
    Caption = 'Voltar'
    TabOrder = 2
    OnClick = btnVoltarClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2CEF85A75D05C
      77D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC1CEF85671CA607CDA556FC6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1CEF8556FC87A91DC7D98F553
      6DC4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      C1CEF8526CC6738ADBA5B8F897ADF7516BC2516BC2516BC2516BC2516BC2516B
      C2516BC2516BC25F79D1FFFFFFC1CEF8516BC46C86DA94ABF68DA5F6A2B6F8A1
      B3F1A0B3F29FB2F19FB2F19FB2F19FB1F19AAEF0869CE74E68C0C1CEF74F69C2
      6680D7829CF57391F46C8BF36C8BF36C8BF36C8BF36C8BF36C8BF36C8BF36C8B
      F37592F4819AEC4C66BE4E68C35D77D26D8BF1577AEF5075EE5075EE5075EE50
      75EE5075EE5075EE5075EE5075EE5075EE5A7DEF758FE84861B84862B95770C7
      5D7DE63D63E2335BE0335BE0335BE0335BE0335BE0335BE0335BE0335BE0335B
      E04065E26681DE435BACBFCCF63F57A84E68BB4366D91A44D11641D01D46D125
      4DD3254DD3254DD3254DD3254DD3254DD33056D65572D23D539FFFFFFFBDCAF5
      3A509D4760B13356CC042FC03356CC4C68C74C68C74C68C74C68C74C68C74C68
      C74C68C7536DC0374C94FFFFFFFFFFFFBCC9F4354992445BA62B4DBF3354C132
      45873245873245873245873245873245873245873245874C64B8FFFFFFFFFFFF
      FFFFFFBBC8F430448742569C435FBC2D3E7DFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9C7F32B3D7D3F529228
      3971FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFB8C5F22B3F7E31468BFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object DSPrimario: TDataSource
    DataSet = DMPrazoVencimento.QPrazo
    Left = 8
    Top = 280
  end
  object DSDias: TDataSource
    DataSet = DMPrazoVencimento.QDias
    Left = 40
    Top = 280
  end
end
