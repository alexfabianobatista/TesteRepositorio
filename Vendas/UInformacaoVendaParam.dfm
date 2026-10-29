inherited FInformacaoVendaParam: TFInformacaoVendaParam
  Left = 215
  Top = 3
  Width = 1000
  Height = 749
  Caption = 'FInformacaoVendaParam'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 984
    Height = 633
    ActivePage = TabSheet1
    object TabSheet1: TTabSheet
      Caption = 'Informa'#231#245'es de Vendas'
      object Label1: TLabel
        Left = 593
        Top = 171
        Width = 17
        Height = 14
        Caption = 'Cor'
      end
      object Label2: TLabel
        Left = 593
        Top = 211
        Width = 22
        Height = 14
        Caption = 'Time'
      end
      object Label3: TLabel
        Left = 593
        Top = 251
        Width = 37
        Height = 14
        Caption = 'Esporte'
      end
      object Label11: TLabel
        Left = 592
        Top = 132
        Width = 53
        Height = 14
        Caption = 'Refer'#234'ncia'
      end
      object GBGenero: TGroupBox
        Left = 14
        Top = 16
        Width = 99
        Height = 149
        Caption = 'G'#234'nero'
        TabOrder = 0
        object cbMasculino: TCheckBox
          Left = 8
          Top = 16
          Width = 73
          Height = 17
          Caption = 'Masculino'
          TabOrder = 0
        end
        object cbFeminino: TCheckBox
          Left = 8
          Top = 36
          Width = 82
          Height = 17
          Caption = 'Feminino'
          TabOrder = 1
        end
        object cbUnissex: TCheckBox
          Left = 8
          Top = 57
          Width = 83
          Height = 17
          Caption = 'Unissex'
          TabOrder = 2
        end
        object cbAdulto: TCheckBox
          Left = 8
          Top = 78
          Width = 79
          Height = 17
          Caption = 'Adulto'
          TabOrder = 3
        end
        object cbInfantil: TCheckBox
          Left = 8
          Top = 99
          Width = 75
          Height = 17
          Caption = 'Infantil'
          TabOrder = 4
        end
        object cbBebe: TCheckBox
          Left = 8
          Top = 120
          Width = 72
          Height = 17
          Caption = 'Beb'#234
          TabOrder = 5
        end
      end
      object GBSalto: TGroupBox
        Left = 120
        Top = 16
        Width = 265
        Height = 149
        Caption = 'Salto'
        TabOrder = 1
        object cbAlto: TCheckBox
          Left = 8
          Top = 24
          Width = 49
          Height = 17
          Caption = 'Alto'
          TabOrder = 0
        end
        object cbBaixo: TCheckBox
          Left = 8
          Top = 48
          Width = 49
          Height = 17
          Caption = 'Baixo'
          TabOrder = 1
        end
        object cbMedio: TCheckBox
          Left = 8
          Top = 72
          Width = 57
          Height = 17
          Caption = 'M'#233'dio'
          TabOrder = 2
        end
        object cbRasteira: TCheckBox
          Left = 8
          Top = 96
          Width = 65
          Height = 17
          Caption = 'Rasteira'
          TabOrder = 3
        end
        object cbGrosso: TCheckBox
          Left = 8
          Top = 120
          Width = 57
          Height = 17
          Caption = 'Grosso'
          TabOrder = 4
        end
        object cbFino: TCheckBox
          Left = 96
          Top = 24
          Width = 49
          Height = 17
          Caption = 'Fino'
          TabOrder = 5
        end
        object cbAnabela: TCheckBox
          Left = 96
          Top = 48
          Width = 65
          Height = 17
          Caption = 'Anabela'
          TabOrder = 6
        end
        object cbFachete: TCheckBox
          Left = 96
          Top = 72
          Width = 57
          Height = 17
          Caption = 'Fachete'
          TabOrder = 7
        end
        object cbEncapado: TCheckBox
          Left = 96
          Top = 96
          Width = 73
          Height = 17
          Caption = 'Encapado'
          TabOrder = 8
        end
        object cbCortica: TCheckBox
          Left = 96
          Top = 120
          Width = 57
          Height = 17
          Caption = 'Corti'#231'a'
          TabOrder = 9
        end
        object cbAcrilico: TCheckBox
          Left = 184
          Top = 24
          Width = 65
          Height = 17
          Caption = 'Acr'#237'lico'
          TabOrder = 10
        end
        object cbLatex: TCheckBox
          Left = 184
          Top = 48
          Width = 57
          Height = 17
          Caption = 'Latex'
          TabOrder = 11
        end
        object cbBorracha: TCheckBox
          Left = 184
          Top = 72
          Width = 73
          Height = 17
          Caption = 'Borracha'
          TabOrder = 12
        end
        object cbPVC: TCheckBox
          Left = 184
          Top = 96
          Width = 41
          Height = 17
          Caption = 'PVC'
          TabOrder = 13
        end
        object cbTR: TCheckBox
          Left = 184
          Top = 120
          Width = 49
          Height = 17
          Caption = 'TR'
          TabOrder = 14
        end
      end
      object GBMaterial: TGroupBox
        Left = 14
        Top = 168
        Width = 371
        Height = 121
        Caption = 'Material'
        TabOrder = 4
        object cbCouro: TCheckBox
          Left = 8
          Top = 24
          Width = 65
          Height = 17
          Caption = 'Couro'
          TabOrder = 0
        end
        object cbSintetico: TCheckBox
          Left = 8
          Top = 48
          Width = 65
          Height = 17
          Caption = 'Sint'#233'tico'
          TabOrder = 1
        end
        object cbSwed: TCheckBox
          Left = 8
          Top = 72
          Width = 57
          Height = 17
          Caption = 'Swed'
          TabOrder = 2
        end
        object cbMicrofibra: TCheckBox
          Left = 8
          Top = 96
          Width = 73
          Height = 17
          Caption = 'Microfibra'
          TabOrder = 3
        end
        object cbVerniz: TCheckBox
          Left = 148
          Top = 24
          Width = 57
          Height = 17
          Caption = 'Verniz'
          TabOrder = 4
        end
        object cbLona: TCheckBox
          Left = 148
          Top = 48
          Width = 49
          Height = 17
          Caption = 'Lona'
          TabOrder = 5
        end
        object cbTecido: TCheckBox
          Left = 148
          Top = 72
          Width = 57
          Height = 17
          Caption = 'Tecido'
          TabOrder = 6
        end
        object cbGliter: TCheckBox
          Left = 148
          Top = 96
          Width = 49
          Height = 17
          Caption = 'Gliter'
          TabOrder = 7
        end
        object cbCamurca: TCheckBox
          Left = 288
          Top = 24
          Width = 73
          Height = 17
          Caption = 'Camur'#231'a'
          TabOrder = 8
        end
        object cbNobuk: TCheckBox
          Left = 288
          Top = 48
          Width = 57
          Height = 17
          Caption = 'Nobuk'
          TabOrder = 9
        end
        object cbElastico: TCheckBox
          Left = 288
          Top = 72
          Width = 65
          Height = 17
          Caption = 'El'#225'stico'
          TabOrder = 10
        end
        object cbPlastico: TCheckBox
          Left = 288
          Top = 96
          Width = 65
          Height = 17
          Caption = 'Pl'#225'stico'
          TabOrder = 11
        end
      end
      object GBConfig: TGroupBox
        Left = 13
        Top = 295
        Width = 572
        Height = 289
        Caption = 'Mais Configura'#231#245'es'
        TabOrder = 6
        object cbBoneca: TCheckBox
          Left = 16
          Top = 24
          Width = 65
          Height = 17
          Caption = 'Boneca'
          TabOrder = 0
        end
        object cbDorsai: TCheckBox
          Left = 111
          Top = 24
          Width = 57
          Height = 17
          Caption = 'Dorsai'
          TabOrder = 1
        end
        object cbSlipper: TCheckBox
          Left = 206
          Top = 24
          Width = 59
          Height = 17
          Caption = 'Slipper'
          TabOrder = 2
        end
        object cbEsportiva: TCheckBox
          Left = 302
          Top = 24
          Width = 73
          Height = 17
          Caption = 'Esportiva'
          TabOrder = 3
        end
        object cbIate: TCheckBox
          Left = 397
          Top = 24
          Width = 49
          Height = 17
          Caption = 'Iate'
          TabOrder = 4
        end
        object cbSlipon: TCheckBox
          Left = 493
          Top = 24
          Width = 57
          Height = 17
          Caption = 'Slipon'
          TabOrder = 5
        end
        object cbIndoorSalao: TCheckBox
          Left = 397
          Top = 143
          Width = 97
          Height = 17
          Caption = 'Indoor/Sal'#227'o'
          TabOrder = 28
        end
        object cbCampo: TCheckBox
          Left = 16
          Top = 53
          Width = 57
          Height = 17
          Caption = 'Campo'
          TabOrder = 6
        end
        object cbSuicoSociety: TCheckBox
          Left = 111
          Top = 53
          Width = 89
          Height = 17
          Caption = 'Sui'#231'o/Society'
          TabOrder = 7
        end
        object cbTiraTornozelo: TCheckBox
          Left = 206
          Top = 53
          Width = 89
          Height = 17
          Caption = 'Tira Tornozelo'
          TabOrder = 8
        end
        object cbSalome: TCheckBox
          Left = 302
          Top = 53
          Width = 57
          Height = 17
          Caption = 'Salom'#233
          TabOrder = 9
        end
        object cbDedo: TCheckBox
          Left = 397
          Top = 53
          Width = 49
          Height = 17
          Caption = 'Dedo'
          TabOrder = 10
        end
        object cbGaspea: TCheckBox
          Left = 493
          Top = 53
          Width = 65
          Height = 17
          Caption = 'Gaspea'
          TabOrder = 11
        end
        object cbTiraX: TCheckBox
          Left = 493
          Top = 143
          Width = 57
          Height = 17
          Caption = 'Tira X'
          TabOrder = 29
        end
        object cb2Tiras: TCheckBox
          Left = 16
          Top = 83
          Width = 65
          Height = 17
          Caption = '2 Tiras'
          TabOrder = 12
        end
        object cbMule: TCheckBox
          Left = 111
          Top = 83
          Width = 49
          Height = 17
          Caption = 'Mule'
          TabOrder = 13
        end
        object cbCoturno: TCheckBox
          Left = 206
          Top = 83
          Width = 65
          Height = 17
          Caption = 'Coturno'
          TabOrder = 14
        end
        object cbMontaria: TCheckBox
          Left = 302
          Top = 83
          Width = 65
          Height = 17
          Caption = 'Montaria'
          TabOrder = 15
        end
        object cbOpenboot: TCheckBox
          Left = 397
          Top = 83
          Width = 73
          Height = 17
          Caption = 'Openboot'
          TabOrder = 16
        end
        object cbAnkleboot: TCheckBox
          Left = 493
          Top = 83
          Width = 73
          Height = 17
          Caption = 'Ankleboot'
          TabOrder = 17
        end
        object cbOver: TCheckBox
          Left = 16
          Top = 173
          Width = 97
          Height = 17
          Caption = 'Over'
          TabOrder = 30
        end
        object cbCanoMedio: TCheckBox
          Left = 16
          Top = 113
          Width = 81
          Height = 17
          Caption = 'Cano M'#233'dio'
          TabOrder = 18
        end
        object cbMangaLonga: TCheckBox
          Left = 16
          Top = 233
          Width = 89
          Height = 17
          Caption = 'Manga Longa'
          TabOrder = 35
        end
        object cbMangaCurta: TCheckBox
          Left = 111
          Top = 233
          Width = 81
          Height = 17
          Caption = 'Manga Curta'
          TabOrder = 36
        end
        object cbTermica: TCheckBox
          Left = 206
          Top = 233
          Width = 65
          Height = 17
          Caption = 'T'#233'rmica'
          TabOrder = 37
        end
        object cbProtecaoSolar: TCheckBox
          Left = 302
          Top = 233
          Width = 97
          Height = 17
          Caption = 'Prote'#231#227'o Solar'
          TabOrder = 38
        end
        object cbLargo: TCheckBox
          Left = 493
          Top = 113
          Width = 57
          Height = 17
          Caption = 'Largo'
          TabOrder = 23
        end
        object cbEstreito: TCheckBox
          Left = 111
          Top = 173
          Width = 58
          Height = 17
          Caption = 'Estreito'
          TabOrder = 31
        end
        object cbMedioConfig: TCheckBox
          Left = 111
          Top = 113
          Width = 57
          Height = 17
          Caption = 'M'#233'dio'
          TabOrder = 19
        end
        object cb2Alcas: TCheckBox
          Left = 206
          Top = 113
          Width = 57
          Height = 17
          Caption = '2 Al'#231'as'
          TabOrder = 20
        end
        object cbTransversal: TCheckBox
          Left = 302
          Top = 113
          Width = 81
          Height = 17
          Caption = 'Transversal'
          TabOrder = 21
        end
        object cbBau: TCheckBox
          Left = 397
          Top = 113
          Width = 41
          Height = 17
          Caption = 'Ba'#250
          TabOrder = 22
        end
        object cbNotebook: TCheckBox
          Left = 16
          Top = 143
          Width = 73
          Height = 17
          Caption = 'Notebook'
          TabOrder = 24
        end
        object cbFesta: TCheckBox
          Left = 111
          Top = 143
          Width = 49
          Height = 17
          Caption = 'Festa'
          TabOrder = 25
        end
        object cbClutch: TCheckBox
          Left = 206
          Top = 143
          Width = 57
          Height = 17
          Caption = 'Clutch'
          TabOrder = 26
        end
        object cbEscolar: TCheckBox
          Left = 16
          Top = 203
          Width = 65
          Height = 17
          Caption = 'Escolar'
          TabOrder = 32
        end
        object cbViagem: TCheckBox
          Left = 111
          Top = 203
          Width = 65
          Height = 17
          Caption = 'Viagem'
          TabOrder = 33
        end
        object cb2Rodas: TCheckBox
          Left = 16
          Top = 263
          Width = 65
          Height = 17
          Caption = '2 Rodas'
          TabOrder = 39
        end
        object cb4Rodas: TCheckBox
          Left = 111
          Top = 263
          Width = 65
          Height = 17
          Caption = '4 Rodas'
          TabOrder = 40
        end
        object cb5Rodas: TCheckBox
          Left = 206
          Top = 263
          Width = 65
          Height = 17
          Caption = '5 Rodas'
          TabOrder = 41
        end
        object cb360: TCheckBox
          Left = 206
          Top = 203
          Width = 49
          Height = 17
          Caption = '360'
          TabOrder = 34
        end
        object cbKit: TCheckBox
          Left = 302
          Top = 143
          Width = 41
          Height = 17
          Caption = 'Kit'
          TabOrder = 27
        end
        object cbChunky: TCheckBox
          Left = 206
          Top = 173
          Width = 67
          Height = 17
          Caption = 'Chunky'
          TabOrder = 42
        end
        object cbSneaker: TCheckBox
          Left = 302
          Top = 173
          Width = 67
          Height = 17
          Caption = 'Sneaker'
          TabOrder = 43
        end
        object cbOxford: TCheckBox
          Left = 397
          Top = 173
          Width = 68
          Height = 17
          Caption = 'Oxford'
          TabOrder = 44
        end
        object cbBrinde: TCheckBox
          Left = 302
          Top = 263
          Width = 97
          Height = 17
          Caption = 'Brinde'
          TabOrder = 45
        end
        object cbEspadrille: TCheckBox
          Left = 302
          Top = 203
          Width = 83
          Height = 17
          Caption = 'Espadrille'
          TabOrder = 46
        end
        object cbContraforte: TCheckBox
          Left = 397
          Top = 203
          Width = 83
          Height = 17
          Caption = 'Contraforte'
          TabOrder = 47
        end
        object cbLuz: TCheckBox
          Left = 398
          Top = 233
          Width = 59
          Height = 17
          Caption = 'Luz'
          TabOrder = 48
        end
      end
      inline FmMarca1: TFmMarca
        Left = 592
        Top = 16
        Width = 267
        Height = 40
        TabOrder = 7
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeMarca: TMaskEdit
          Height = 22
        end
        inherited EdMarca: TEdit
          Height = 22
        end
      end
      inline FmDatas1: TFmDatas
        Left = 592
        Top = 391
        Width = 178
        Height = 60
        TabOrder = 16
        inherited GroupBox1: TGroupBox
          inherited Label1: TLabel
            Width = 26
            Height = 14
          end
          inherited Label2: TLabel
            Height = 14
          end
          inherited MeDtInicial: TMaskEdit
            Height = 22
          end
          inherited MeDtFinal: TMaskEdit
            Height = 22
          end
        end
      end
      inline FmClasse1: TFmClasse
        Left = 592
        Top = 56
        Width = 265
        Height = 37
        TabOrder = 8
        inherited Label1: TLabel
          Width = 33
          Height = 14
        end
        inherited MeClasse: TMaskEdit
          Height = 22
        end
        inherited EdClasse: TEdit
          Height = 22
        end
      end
      inline FmLote1: TFmLote
        Left = 592
        Top = 96
        Width = 265
        Height = 37
        TabOrder = 9
        inherited Label1: TLabel
          Width = 43
          Height = 14
          Caption = 'Tamanho'
        end
        inherited MeLote: TMaskEdit
          Height = 22
        end
        inherited EdLote: TEdit
          Height = 22
        end
      end
      object MECor: TMaskEdit
        Left = 592
        Top = 187
        Width = 265
        Height = 22
        TabOrder = 11
      end
      object METime: TMaskEdit
        Left = 592
        Top = 227
        Width = 265
        Height = 22
        TabOrder = 12
      end
      object MEEsporte: TMaskEdit
        Left = 592
        Top = 267
        Width = 265
        Height = 22
        TabOrder = 13
      end
      object RGSolado: TRadioGroup
        Left = 392
        Top = 16
        Width = 89
        Height = 149
        Caption = 'Solado'
        Items.Strings = (
          'Nenhum'
          'Flat Form'
          'Meia Pata'
          'Anabela')
        TabOrder = 2
      end
      object RGBico: TRadioGroup
        Left = 488
        Top = 16
        Width = 97
        Height = 149
        Caption = 'Bico'
        Items.Strings = (
          'Nenhum'
          'Fino'
          'Redondo'
          'Quadrado'
          'Peep Toe'
          'Navio'
          'Oval')
        TabOrder = 3
      end
      object RGEnfeite: TRadioGroup
        Left = 392
        Top = 168
        Width = 193
        Height = 121
        Caption = 'Enfeite'
        Columns = 2
        Items.Strings = (
          'Nenhum'
          'Pedraria'
          'La'#231'o'
          'Fivela'
          'Barbicacho'
          'Flor'
          'Metal'
          'Pl'#225'stico')
        TabOrder = 5
      end
      object RadioGroup1: TRadioGroup
        Left = 592
        Top = 295
        Width = 265
        Height = 37
        Caption = 'Tipo de Relat'#243'rio'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Estoque e Entradas'
          'Vendas')
        TabOrder = 14
        OnClick = RadioGroup1Click
      end
      object PRelatorio2: TPanel
        Left = 592
        Top = 341
        Width = 265
        Height = 45
        BevelInner = bvSpace
        BevelOuter = bvLowered
        TabOrder = 15
        object Label7: TLabel
          Left = 176
          Top = 20
          Width = 15
          Height = 14
          Caption = 'at'#233
        end
        object Label8: TLabel
          Left = 8
          Top = 20
          Width = 102
          Height = 14
          Caption = 'Mostrar tamanhos de'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 8
          Top = 2
          Width = 49
          Height = 14
          Caption = 'Tamanhos'
        end
        object MELoteIni: TMaskEdit
          Left = 120
          Top = 17
          Width = 40
          Height = 22
          EditMask = '99'
          MaxLength = 2
          TabOrder = 0
          Text = '34'
        end
        object MELoteFin: TMaskEdit
          Left = 200
          Top = 17
          Width = 40
          Height = 22
          EditMask = '99'
          MaxLength = 2
          TabOrder = 1
          Text = '44'
        end
      end
      object MEReferencia: TMaskEdit
        Left = 592
        Top = 148
        Width = 265
        Height = 22
        TabOrder = 10
      end
    end
  end
  inherited BtOk: TBitBtn
    Left = 804
    Top = 680
  end
  inherited BtCancela: TBitBtn
    Left = 900
    Top = 680
  end
  inherited RGPreview: TRadioGroup
    Top = 648
  end
end
