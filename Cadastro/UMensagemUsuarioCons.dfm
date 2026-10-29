inherited FMensagemUsuarioCons: TFMensagemUsuarioCons
  Left = 523
  Top = 122
  Width = 722
  Height = 375
  Caption = 'Consulta Mensagens para Usu'#225'rios'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Left = 384
    Visible = False
  end
  object Label14: TLabel [1]
    Left = 8
    Top = 8
    Width = 37
    Height = 14
    Caption = 'Usu'#225'rio'
  end
  object SpeedButton8: TSpeedButton [2]
    Left = 53
    Top = 25
    Width = 24
    Height = 24
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
    OnClick = SpeedButton8Click
  end
  inherited BtOk: TBitBtn
    Left = 616
    Top = 321
  end
  inherited BtCancela: TBitBtn
    Left = 528
    Top = 321
  end
  inherited BtProcurar: TBitBtn
    Left = 617
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Left = 384
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Width = 690
    Height = 250
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME_USUARIO_ORIGEM'
        Title.Caption = 'Usu'#225'rio de Origem'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TIPO_FUNCIONARIO'
        Title.Caption = 'Tipo Funcion'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_USUARIO_DESTINO'
        Title.Caption = 'Usu'#225'rio de Destino'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VIGENCIA_INI'
        Title.Caption = 'Vig'#234'ncia Inicial'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VIGENCIA_FIN'
        Title.Caption = 'Vig'#234'ncia Final'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_MENSAGEM'
        Title.Caption = 'Mensagem'
        Width = 368
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_MENSAGEM_USUARIO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_USUARIO_ORIGEM'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COD_USUARIO_DESTINO'
        Visible = False
      end>
  end
  object MeCodUsuario: TMaskEdit [8]
    Left = 8
    Top = 25
    Width = 42
    Height = 22
    EditMask = '######'
    MaxLength = 6
    TabOrder = 5
    Text = '      '
    OnExit = MeCodUsuarioExit
  end
  object MeUsuario: TMaskEdit [9]
    Left = 79
    Top = 25
    Width = 197
    Height = 22
    TabStop = False
    ParentColor = True
    ReadOnly = True
    TabOrder = 6
    Text = 'Todos'
  end
  inherited DSConsulta: TDataSource
    DataSet = DmMensagemUsuario.QMensagemUsuarioCons
  end
end
