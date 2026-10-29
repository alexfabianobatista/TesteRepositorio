object FImportaNfe: TFImportaNfe
  Left = 421
  Top = 338
  Width = 404
  Height = 175
  Caption = 'Importa'#231#227'o de NF-e'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 304
    Top = 16
    Width = 20
    Height = 13
    Caption = 'Filial'
  end
  inline FmNota: TFmNota
    Left = 8
    Top = 16
    Width = 285
    Height = 39
    TabOrder = 0
    inherited MeNota: TMaskEdit
      OnExit = FmNota1MeNotaExit
    end
    inherited BtNota: TBitBtn
      OnClick = FmNota1BtNotaClick
    end
  end
  object BtImportar: TBitBtn
    Left = 240
    Top = 56
    Width = 99
    Height = 41
    Caption = '&Importar'
    TabOrder = 3
    OnClick = BtImportarClick
  end
  object MEFilial: TMaskEdit
    Left = 304
    Top = 30
    Width = 33
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
    OnExit = MEFilialExit
  end
  object CBConsultar: TCheckBox
    Left = 8
    Top = 56
    Width = 225
    Height = 17
    Hint = 
      'Faz uma consulta na SEFAZ para verificar a validade da NF-e. Cas' +
      'o ela n'#227'o seja v'#225'lida, ser'#225' apresentado um erro e ela n'#227'o ser'#225' i' +
      'mportada.'
    Caption = 'Consultar esta nota na SEFAZ'
    TabOrder = 2
  end
  object ODXmlEntrada: TOpenDialog
    DefaultExt = 'xml'
    InitialDir = 'C:\Executaveis'
    Title = 'Importar XML de Entrada'
    Left = 248
    Top = 40
  end
  object XML: TXMLDocument
    Left = 312
    Top = 40
    DOMVendorDesc = 'MSXML'
  end
  object SDXmlEntrada: TSaveDialog
    DefaultExt = 'xml'
    InitialDir = 'C:\Executaveis'
    Title = 'Salvar XML de NF-e de entrada.'
    Left = 280
    Top = 40
  end
end
