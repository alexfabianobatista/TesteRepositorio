object FImporta: TFImporta
  Left = 456
  Top = 121
  Width = 771
  Height = 507
  Caption = 'Importa Arquivo Excel (Casa das Tintas)'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 763
    Height = 233
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 264
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ler XLS'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object DBGrid4: TDBGrid
      Left = 1
      Top = 48
      Width = 761
      Height = 184
      Align = alBottom
      DataSource = DataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'MARCA'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLASSE'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODBARRA'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMBALAGEM'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NCM'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PESO_BRUTO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PESO_LIQUIDO'
          Width = 100
          Visible = True
        end>
    end
    object BitBtn2: TBitBtn
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Filtrar Dados'
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 424
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Gravar no Banco'
      TabOrder = 3
      OnClick = BitBtn3Click
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 233
    Width = 281
    Height = 247
    Align = alLeft
    DataSource = DsMarca
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_MARCA'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_MARCA'
        Width = 168
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 281
    Top = 233
    Width = 337
    Height = 247
    Align = alLeft
    DataSource = DsClasse
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CLASSE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CLASSE'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_CLASSE'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_SUBCLASSE'
        Width = 25
        Visible = True
      end>
  end
  object DBGrid3: TDBGrid
    Left = 618
    Top = 233
    Width = 145
    Height = 247
    Align = alClient
    DataSource = DsProduto
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CLASSE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_MARCA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_TRIBUTACAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_TIPO_PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_ISS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_INSS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_UNIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_EMBALAGEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_FABRICANTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_GENERO_NCM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_PESO_BRUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_PESO_LIQUIDO'
        Visible = True
      end>
  end
  object OraS1: TOraS
    LogonUsername = 'SISTEMA'
    LogonPassword = 'KARITEC'
    LogonDatabase = 'ORA'
    Connected = True
    Left = 8
    Top = 8
  end
  object QMarca: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_MARCA.ROWID,'
      '  TB_MARCA.COD_MARCA,'
      '  TB_MARCA.DESC_MARCA'
      'FROM'
      '  TB_MARCA')
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000200000009000000434F445F4D415243410100000000000A00000044
      4553435F4D41524341010000000000}
    Session = OraS1
    Left = 112
    Top = 8
    object QMarcaCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
      Required = True
    end
    object QMarcaDESC_MARCA: TStringField
      FieldName = 'DESC_MARCA'
      Required = True
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = CdArquivo
    Left = 8
    Top = 72
  end
  object CdArquivo: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 40
    Data = {
      000100009619E0BD0100000018000000080000000000030000000001054D4152
      4341010049000000010005574944544802000200640006434C41535345010049
      00000001000557494454480200020064000944455343524943414F0100490000
      00010005574944544802000200C80008434F4442415252410100490000000100
      05574944544802000200640009454D42414C4147454D01004900000001000557
      49445448020002006400034E434D010049000000010005574944544802000200
      64000A5045534F5F425255544F01004900000001000557494454480200020064
      000C5045534F5F4C49515549444F010049000000010005574944544802000200
      64000000}
    object CdArquivoMARCA: TStringField
      FieldName = 'MARCA'
      Size = 100
    end
    object CdArquivoCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 100
    end
    object CdArquivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object CdArquivoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 100
    end
    object CdArquivoEMBALAGEM: TStringField
      FieldName = 'EMBALAGEM'
      Size = 100
    end
    object CdArquivoNCM: TStringField
      FieldName = 'NCM'
      Size = 100
    end
    object CdArquivoPESO_BRUTO: TStringField
      FieldName = 'PESO_BRUTO'
      Size = 100
    end
    object CdArquivoPESO_LIQUIDO: TStringField
      FieldName = 'PESO_LIQUIDO'
      Size = 100
    end
  end
  object CdMarca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspMarca'
    Left = 112
    Top = 72
    object CdMarcaCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
      Required = True
    end
    object CdMarcaDESC_MARCA: TStringField
      FieldName = 'DESC_MARCA'
      Required = True
      Size = 50
    end
  end
  object DsMarca: TDataSource
    DataSet = CdMarca
    Left = 112
    Top = 104
  end
  object DspMarca: TDataSetProvider
    DataSet = QMarca
    Left = 112
    Top = 40
  end
  object QClasse: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_CLASSE.ROWID,'
      '  TB_CLASSE.COD_CLASSE,'
      '  TB_CLASSE.DESC_CLASSE,'
      '  TB_CLASSE.NUM_CLASSE,'
      '  TB_CLASSE.NUM_SUBCLASSE'
      'FROM'
      '  TB_CLASSE')
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      04000000040000000A000000434F445F434C415353450100000000000B000000
      444553435F434C415353450100000000000A0000004E554D5F434C4153534501
      00000000000D0000004E554D5F535542434C41535345010000000000}
    Session = OraS1
    Left = 144
    Top = 8
    object QClasseCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QClasseDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object QClasseNUM_CLASSE: TIntegerField
      FieldName = 'NUM_CLASSE'
      Required = True
    end
    object QClasseNUM_SUBCLASSE: TIntegerField
      FieldName = 'NUM_SUBCLASSE'
      Required = True
    end
  end
  object DspClasse: TDataSetProvider
    DataSet = QClasse
    Left = 144
    Top = 40
  end
  object CdClasse: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspClasse'
    Left = 144
    Top = 72
    object CdClasseCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object CdClasseDESC_CLASSE: TStringField
      FieldName = 'DESC_CLASSE'
      Size = 30
    end
    object CdClasseNUM_CLASSE: TIntegerField
      FieldName = 'NUM_CLASSE'
      Required = True
    end
    object CdClasseNUM_SUBCLASSE: TIntegerField
      FieldName = 'NUM_SUBCLASSE'
      Required = True
    end
  end
  object DsClasse: TDataSource
    DataSet = CdClasse
    Left = 144
    Top = 104
  end
  object QProduto: TOracleDataSet1
    SQL.Strings = (
      'SELECT'
      '  TB_PRODUTO.ROWID,'
      '  TB_PRODUTO.COD_PRODUTO,'
      '  TB_PRODUTO.DESC_PRODUTO,'
      '  TB_PRODUTO.COD_CLASSE,'
      '  TB_PRODUTO.COD_MARCA,'
      '  TB_PRODUTO.COD_TRIBUTACAO,'
      '  TB_PRODUTO.IND_TIPO_PRODUTO,'
      '  TB_PRODUTO.PERC_ISS,'
      '  TB_PRODUTO.PERC_INSS,'
      '  TB_PRODUTO.DESC_UNIDADE,'
      '  TB_PRODUTO.NUM_EMBALAGEM,'
      '  TB_PRODUTO.NUM_FABRICANTE,'
      '  TB_PRODUTO.NUM_GENERO_NCM,'
      '  TB_PRODUTO.NUM_PESO_BRUTO,'
      '  TB_PRODUTO.NUM_PESO_LIQUIDO'
      'FROM'
      '  TB_PRODUTO')
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000A000000434F445F434C415353450100000000000B000000
      434F445F50524F4455544F0100000000000C000000444553435F50524F445554
      4F01000000000009000000434F445F4D415243410100000000000E000000434F
      445F5452494255544143414F01000000000010000000494E445F5449504F5F50
      524F4455544F01000000000008000000504552435F4953530100000000000900
      0000504552435F494E53530100000000000C000000444553435F554E49444144
      450100000000000D0000004E554D5F454D42414C4147454D0100000000000E00
      00004E554D5F464142524943414E54450100000000000E0000004E554D5F4745
      4E45524F5F4E434D0100000000000E0000004E554D5F5045534F5F425255544F
      010000000000100000004E554D5F5045534F5F4C49515549444F010000000000}
    Session = OraS1
    Left = 176
    Top = 8
    object QProdutoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object QProdutoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object QProdutoCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object QProdutoCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
    end
    object QProdutoCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
      Required = True
    end
    object QProdutoIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Required = True
      Size = 10
    end
    object QProdutoPERC_ISS: TFloatField
      FieldName = 'PERC_ISS'
      Required = True
    end
    object QProdutoPERC_INSS: TFloatField
      FieldName = 'PERC_INSS'
      Required = True
    end
    object QProdutoDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object QProdutoNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object QProdutoNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 15
    end
    object QProdutoNUM_GENERO_NCM: TStringField
      FieldName = 'NUM_GENERO_NCM'
      Size = 8
    end
    object QProdutoNUM_PESO_BRUTO: TFloatField
      FieldName = 'NUM_PESO_BRUTO'
    end
    object QProdutoNUM_PESO_LIQUIDO: TFloatField
      FieldName = 'NUM_PESO_LIQUIDO'
    end
  end
  object DspProduto: TDataSetProvider
    DataSet = QProduto
    Left = 176
    Top = 40
  end
  object CdProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspProduto'
    Left = 176
    Top = 72
    object CdProdutoCOD_PRODUTO: TFloatField
      FieldName = 'COD_PRODUTO'
      Required = True
    end
    object CdProdutoDESC_PRODUTO: TStringField
      FieldName = 'DESC_PRODUTO'
      Size = 200
    end
    object CdProdutoCOD_CLASSE: TIntegerField
      FieldName = 'COD_CLASSE'
      Required = True
    end
    object CdProdutoCOD_MARCA: TIntegerField
      FieldName = 'COD_MARCA'
    end
    object CdProdutoCOD_TRIBUTACAO: TIntegerField
      FieldName = 'COD_TRIBUTACAO'
      Required = True
    end
    object CdProdutoIND_TIPO_PRODUTO: TStringField
      FieldName = 'IND_TIPO_PRODUTO'
      Required = True
      Size = 10
    end
    object CdProdutoPERC_ISS: TFloatField
      FieldName = 'PERC_ISS'
      Required = True
    end
    object CdProdutoPERC_INSS: TFloatField
      FieldName = 'PERC_INSS'
      Required = True
    end
    object CdProdutoDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 3
    end
    object CdProdutoNUM_EMBALAGEM: TFloatField
      FieldName = 'NUM_EMBALAGEM'
    end
    object CdProdutoNUM_FABRICANTE: TStringField
      FieldName = 'NUM_FABRICANTE'
      Size = 15
    end
    object CdProdutoNUM_GENERO_NCM: TStringField
      FieldName = 'NUM_GENERO_NCM'
      Size = 8
    end
    object CdProdutoNUM_PESO_BRUTO: TFloatField
      FieldName = 'NUM_PESO_BRUTO'
    end
    object CdProdutoNUM_PESO_LIQUIDO: TFloatField
      FieldName = 'NUM_PESO_LIQUIDO'
    end
  end
  object DsProduto: TDataSource
    DataSet = CdProduto
    Left = 176
    Top = 104
  end
  object QSeq: TOracleDataSet1
    SQL.Strings = (
      'SELECT (:SEQ.NEXTVAL) AS VALOR FROM DUAL')
    Variables.Data = {0300000001000000040000003A534551010000000000000000000000}
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000A000000434F445F434C415353450100000000000B000000
      434F445F50524F4455544F0100000000000C000000444553435F50524F445554
      4F01000000000009000000434F445F4D415243410100000000000E000000434F
      445F5452494255544143414F01000000000010000000494E445F5449504F5F50
      524F4455544F01000000000008000000504552435F4953530100000000000900
      0000504552435F494E53530100000000000C000000444553435F554E49444144
      450100000000000D0000004E554D5F454D42414C4147454D0100000000000E00
      00004E554D5F464142524943414E54450100000000000E0000004E554D5F4745
      4E45524F5F4E434D0100000000000E0000004E554D5F5045534F5F425255544F
      010000000000100000004E554D5F5045534F5F4C49515549444F010000000000}
    Session = OraS1
    Left = 208
    Top = 8
    object QSeqVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
end
