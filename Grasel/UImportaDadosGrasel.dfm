object FImportaDadosGrasel: TFImportaDadosGrasel
  Left = 179
  Top = 133
  Width = 696
  Height = 480
  Caption = 'Importa Dados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 552
    Top = 4
    Width = 24
    Height = 13
    Caption = 'Erros'
  end
  object Label1: TLabel
    Left = 488
    Top = 4
    Width = 52
    Height = 13
    Caption = 'Importados'
  end
  object SBBase: TSpeedButton
    Left = 16
    Top = 8
    Width = 81
    Height = 25
    Hint = 'Seleciona a Base de Dados que deseja utilizar'
    AllowAllUp = True
    GroupIndex = 1
    Down = True
    Caption = 'Produ'#231#227'o'
    Glyph.Data = {
      76020000424D7602000000000000760000002800000040000000100000000100
      0400000000000002000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF33333F3333333333333333333333333333333333330000033
      33333333F888883FF333F3333300000333333333330000033333333007788800
      33333338833FFF883F33F3330077888003333333007788800333330778000888
      033333833F888FFF83F3F330778000888033333077800088803330770F9F9F08
      803338F38833388FF8F3F30770FAFAF08803330770FAFAF088033070F00000F0
      8033383833888338F83FF3070F00000F080333070F00000F0803078F0091100F
      88038F3838333838FF8FF078F00A2200F8803078F00A2200F880070909191109
      08038F838F3333838F8FF070A0A2A220A0803070A0A2A220A0800F0F0999910F
      08038F838F3333838F8FF0F0F0AAAA20F08030F0F0AAAA20F0800F090F991909
      07038F838FF33383838FF0F0A0FAA2A0A07030F0A0FAA2A0A0700F8F00FF900F
      870383F838FFF838F383F0F8F00FFA00F87030F8F00FFA00F8703070F00000F0
      703338F83388833838F3F3070F00000F070333070F00000F070330F70F9F9F07
      7033383F883338833833F30F70FAFAF07703330F70FAFAF07703330F78000877
      03333383FF88833F8333F330F780008770333330F7800087703333300FFF7700
      3333333883FFFF883333F33300FFF7700333333300FFF7700333333330000033
      33333333388888333333F3333300000333333333330000033333}
    NumGlyphs = 4
    ParentShowHint = False
    ShowHint = True
    OnClick = SBBaseClick
  end
  object MEImp: TMaskEdit
    Left = 488
    Top = 20
    Width = 49
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object MENaoImp: TMaskEdit
    Left = 552
    Top = 20
    Width = 49
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object PB: TProgressBar
    Left = 104
    Top = 16
    Width = 273
    Height = 16
    TabOrder = 2
  end
  object PageControl1: TPageControl
    Left = 24
    Top = 56
    Width = 641
    Height = 361
    ActivePage = TabSheet7
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object DBGrid1: TDBGrid
        Left = 16
        Top = 32
        Width = 601
        Height = 257
        DataSource = DMImportaGrasel.DsCadastro
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGOCLIENTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'APELIDO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECONUMERORUA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECOBAIRRO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECOCXPOSTAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECOCOMPLEMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECOANTERIOR'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESIDENCIALFONE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESIDENCIALFAX'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMERCIALFONE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMERCIALFAX'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTATO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTATOCELULAR'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESSOAFISICAJURIDICA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONSUMIDORFINAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPFCNPJ'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RGIE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATANASCIMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HOMEPAGE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMEPAI'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMEMAE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NATURALIDADE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADOCIVIL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SEXO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOPROFISSAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOCLASSIFICACAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOREGIAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIABANCARIA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIALIMITECREDITO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIASERASA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIACOMERCIAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALARIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRABALHOLOCAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRABALHOENDERECO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRABALHOFONE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRABALHOCIDADE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOCARGO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONJUGE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONJUGEDATANASCIMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESTRICAOMOTIVO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIASPC'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESTRICAODECREDITO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RESTRICAODEDEBITO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FOTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BLOQUEARVENDA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAASSOCIACAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDENCIAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ATIVO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SIMPLESFEDERAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COFINS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PIS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CSLL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SIMPLESFEDERAL_MOTIVO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMITIR_NF_APOS_CF'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSCRICAOMUNICIPAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPFCNPJ_CONJUGUE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RGIE_CONJUGUE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAULTATUA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONJUGECONTATO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONJUGETRABALHOLOCAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CARTAOSENHA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CARTAOVALIDADE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BLOQUEARVENDAVEICULO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REPRESENTANTE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CARTAOHABILITADO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CARTAOPERMITEVENDASEM'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MSN'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRABALHOENDERECONUMERORUA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRABALHOCAIXAPOSTAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRABALHOCEP'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRABALHOBAIRRO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGONOBANCO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRIBUINTEICMS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'POSICAO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAVALIDADECREDENCIAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOOPERACAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LIBERACAO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRIBUINTEIPI'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORGAOEMISSORRG'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAEMISSAORRG'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPOPRECO'
            Width = 64
            Visible = True
          end>
      end
      object BitBtn1: TBitBtn
        Left = 272
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Importar'
        TabOrder = 1
        OnClick = BitBtn1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Estado'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 16
        Top = 32
        Width = 601
        Height = 257
        DataSource = DMImportaGrasel.DsEstado
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'SIGLA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAIS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REGIAOTRIBUTARIA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOUF'
            Width = 64
            Visible = True
          end>
      end
      object BitBtn2: TBitBtn
        Left = 272
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Importar'
        TabOrder = 1
        OnClick = BitBtn2Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Cidades'
      ImageIndex = 2
      object DBGrid3: TDBGrid
        Left = 16
        Top = 32
        Width = 601
        Height = 257
        DataSource = DMImportaGrasel.DsCidades
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Width = 64
            Visible = True
          end>
      end
      object BitBtn3: TBitBtn
        Left = 256
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Importa'
        TabOrder = 1
        OnClick = BitBtn3Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Fornecedor'
      ImageIndex = 3
      object DBGrid4: TDBGrid
        Left = 16
        Top = 32
        Width = 601
        Height = 257
        DataSource = DMImportaGrasel.DsFornecedor
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'APELIDO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECONUMERORUA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECOBAIRRO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECOCXPOSTAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECOCOMPLEMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECOANTERIOR'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMERCIALFONE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMERCIALFAX'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTATO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTATOCELULAR'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESSOAFISICAJURIDICA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPFCNPJ'
            Width = 163
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RGIE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HOMEPAGE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BANCO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BANCOCONTA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BANCOAGENCIA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRACAPAGAMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOGOMARCA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ATIVIDADE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REGIMEFEDERALSIMPLES'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REGIMEESTADUALSIMPLES'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOCLASSIFICACAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REPRESENTANTE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REPRESENTANTEFONE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ATIVO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMETRANSFERENCIA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_CIDADE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Width = 64
            Visible = True
          end>
      end
      object BitBtn4: TBitBtn
        Left = 272
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Importar'
        TabOrder = 1
        OnClick = BitBtn4Click
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Produtos'
      ImageIndex = 4
      object DBGrid5: TDBGrid
        Left = 16
        Top = 32
        Width = 601
        Height = 257
        DataSource = DMImportaGrasel.DSProduto
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOORIGINAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 401
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADE1'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOCAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLASSIFICACAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LINHA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRIBUTACAOICMS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRIBUTACAOIPI'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FOTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGONCM'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMEROVOLUME'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ORIGEMPRODUTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'APLICACAO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTIGOLEGISLACAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTIGOLEGISLACAOSUBSTITUICAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTIGOLEGISLACAOSUBSTITUTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTROLADOPORSERIE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LUBRIFICANTE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITOPISCOFINS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOFINAME'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAUTAICMSINTERNA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAUTAICMSEXTERNA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAUTAICMSSUBSTITUTOVALOR'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAUTAICMSSUBSTITUTOPERC'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAUTAIPIVALOR'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGODUN14'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TARAPRIMARIA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TARASECUNDARIA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAOLINHA1'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAOLINHA2'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REGISTROSIF'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALIDADERESFRIADO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALIDADECONGELADO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPOPRODUTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GRUPO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECOPAUTAFISCAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECOPAUTAFISCALINTERESTADUAL'
            Width = 64
            Visible = True
          end>
      end
      object BitBtn5: TBitBtn
        Left = 272
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Importar'
        TabOrder = 1
        OnClick = BitBtn5Click
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Descontos '
      ImageIndex = 5
      object DBGrid6: TDBGrid
        Left = 16
        Top = 32
        Width = 601
        Height = 257
        DataSource = DMImportaGrasel.DsDesconto
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOPRODUTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UMIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTO'
            Visible = True
          end>
      end
      object BitBtn6: TBitBtn
        Left = 272
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Importar'
        TabOrder = 1
        OnClick = BitBtn6Click
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Conta Pagar Cab'
      ImageIndex = 6
      object DBGrid7: TDBGrid
        Left = 16
        Top = 32
        Width = 601
        Height = 257
        DataSource = DMImportaGrasel.DsContaPagarCab
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERODUPLICATA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMEROPARCELA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERODOCUMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOFORNECEDOR'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAEMISSAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAVENCIMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAVENCIMENTOPROTESTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORDUPLICATA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORDOCUMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORSALDO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORJUROACUMULADO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JUROCALCULADOATE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOCOBRANCA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUITADA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOFUNCIONARIO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOPEDIDO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGONF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Width = 64
            Visible = True
          end>
      end
      object BitBtn7: TBitBtn
        Left = 272
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Importar'
        TabOrder = 1
        OnClick = BitBtn7Click
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Conta Pagar Mov'
      ImageIndex = 7
      object DBGrid8: TDBGrid
        Left = 16
        Top = 32
        Width = 601
        Height = 257
        DataSource = DMImportaGrasel.DsContaPagarMov
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERODUPLICATA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMEROPARCELA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAPAGAMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORDESCONTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORJUROS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORPAGO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERORECIBO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOLANCAMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOLANCAMENTOBANCO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORDUPLICATA_ANT_PGTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORJURO_ANT_PGTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAOCOBRARJURO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAOBAIXA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAGAMENTOINTEGRAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOFUNCIONARIO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOCAIXAABERTURA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOVINCULO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJCONTAPAGAR'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJCAIXAABERTURA'
            Width = 64
            Visible = True
          end>
      end
      object BitBtn8: TBitBtn
        Left = 272
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Importar'
        TabOrder = 1
        OnClick = BitBtn8Click
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Conta Receber Cab'
      ImageIndex = 8
      object DBGrid9: TDBGrid
        Left = 16
        Top = 32
        Width = 601
        Height = 257
        DataSource = DMImportaGrasel.DsContaReceberCab
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERODUPLICATA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMEROPARCELA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERODOCUMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOCLIENTE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAEMISSAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAVENCIMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAVENCIMENTOPROTESTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORDUPLICATA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORDOCUMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORSALDO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORJUROACUMULADO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JUROCALCULADOATE'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOCOBRANCA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUITADA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAOFATURA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOFUNCIONARIO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOSSONUMERO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGONF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOPEDIDO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRATOJORNAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPOCONTRATO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IRRF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GERARCOBRANCA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Width = 64
            Visible = True
          end>
      end
      object BitBtn9: TBitBtn
        Left = 272
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Importar'
        TabOrder = 1
        OnClick = BitBtn9Click
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'Conta Receber Mov'
      ImageIndex = 9
      object DBGrid10: TDBGrid
        Left = 16
        Top = 32
        Width = 601
        Height = 257
        DataSource = DMImportaGrasel.DSContaReceberMov
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERODUPLICATA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMEROPARCELA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAPAGAMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORDESCONTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORJUROS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORPAGO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERORECIBO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOLANCAMENTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOLANCAMENTOBANCO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORDUPLICATA_ANT_PGTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORJURO_ANT_PGTO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAOCOBRARJURO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACAOBAIXA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAGAMENTOINTEGRAL'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOFUNCIONARIO'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOCAIXAABERTURA'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORIRRF'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJCONTARECEBER'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJCAIXAABERTURA'
            Width = 64
            Visible = True
          end>
      end
      object BitBtn10: TBitBtn
        Left = 272
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Importar'
        TabOrder = 1
        OnClick = BitBtn10Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.Txt'
    FileName = 'NomeArquivo'
    Filter = 'Arquivo texto|*.TXT'
    InitialDir = 'C:\'
    Left = 596
    Top = 81
  end
end
