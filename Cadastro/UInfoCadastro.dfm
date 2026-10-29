object FInfoCadastro: TFInfoCadastro
  Left = 521
  Top = 194
  Width = 522
  Height = 467
  Caption = 'Informa'#231#245'es r'#225'pidas de cadastro'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 506
    Height = 428
    Align = alClient
    TabOrder = 0
    DesignSize = (
      506
      428)
    object Label1: TLabel
      Left = 32
      Top = 213
      Width = 52
      Height = 13
      Caption = 'Assinatura:'
    end
    object DBText7: TDBText
      Left = 200
      Top = 32
      Width = 289
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NOME'
      DataSource = DSInfoCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText8: TDBText
      Left = 208
      Top = 60
      Width = 281
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NUM_CGC_CPF'
      DataSource = DSInfoCadastro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 76
      Top = 112
      Width = 51
      Height = 13
      Caption = 'Sem foto'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label9: TLabel
      Left = 76
      Top = 312
      Width = 51
      Height = 13
      Caption = 'Sem foto'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Image1: TImage
      Left = 24
      Top = 29
      Width = 153
      Height = 169
    end
    object Image2: TImage
      Left = 24
      Top = 232
      Width = 153
      Height = 166
    end
    object GroupBox1: TGroupBox
      Left = 198
      Top = 95
      Width = 290
      Height = 306
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Pessoas autorizadas'
      TabOrder = 0
      DesignSize = (
        290
        306)
      object DBText1: TDBText
        Left = 64
        Top = 40
        Width = 210
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        DataField = 'NOME_AUTORIZADO1'
        DataSource = DSInfoCadastro
      end
      object DBText2: TDBText
        Left = 64
        Top = 56
        Width = 210
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DESC_CPF_AUTORIZADO1'
        DataSource = DSInfoCadastro
      end
      object Label2: TLabel
        Left = 24
        Top = 40
        Width = 37
        Height = 13
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 29
        Top = 56
        Width = 28
        Height = 13
        Caption = 'CPF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 24
        Top = 88
        Width = 37
        Height = 13
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 29
        Top = 104
        Width = 28
        Height = 13
        Caption = 'CPF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 64
        Top = 88
        Width = 210
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        DataField = 'NOME_AUTORIZADO2'
        DataSource = DSInfoCadastro
      end
      object DBText4: TDBText
        Left = 64
        Top = 104
        Width = 210
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DESC_CPF_AUTORIZADO2'
        DataSource = DSInfoCadastro
      end
      object Label6: TLabel
        Left = 24
        Top = 141
        Width = 37
        Height = 13
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 29
        Top = 157
        Width = 28
        Height = 13
        Caption = 'CPF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 64
        Top = 141
        Width = 210
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        DataField = 'NOME_AUTORIZADO3'
        DataSource = DSInfoCadastro
      end
      object DBText6: TDBText
        Left = 64
        Top = 157
        Width = 210
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DESC_CPF_AUTORIZADO3'
        DataSource = DSInfoCadastro
      end
    end
  end
  object DSInfoCadastro: TDataSource
    DataSet = DMCadastro.QInfoCadastro
    Left = 208
    Top = 368
  end
end
