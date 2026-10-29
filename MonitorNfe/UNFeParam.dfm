inherited FNFeParam: TFNFeParam
  Left = 488
  Top = 115
  Height = 482
  Caption = 'Par'#226'metros'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Height = 349
    ActivePage = TabSheet4
    object TabSheet1: TTabSheet
      Caption = 'Inutiliza'#231#227'o de NF-e'
      object Label1: TLabel
        Left = 16
        Top = 96
        Width = 25
        Height = 14
        Caption = 'S'#233'rie'
      end
      object Label2: TLabel
        Left = 216
        Top = 96
        Width = 66
        Height = 14
        Caption = 'N'#250'mero Inicial'
      end
      object Label3: TLabel
        Left = 296
        Top = 96
        Width = 62
        Height = 14
        Caption = 'N'#250'mero Final'
      end
      object Label4: TLabel
        Left = 16
        Top = 144
        Width = 57
        Height = 14
        Caption = 'Justificativa'
      end
      object Label20: TLabel
        Left = 16
        Top = 192
        Width = 106
        Height = 14
        Caption = 'Modelo do Documento'
      end
      inline Fm0Filial: TFmFilial
        Left = 16
        Top = 16
        Width = 353
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Width = 277
          Height = 22
        end
      end
      object ME0Serie: TMaskEdit
        Left = 16
        Top = 112
        Width = 49
        Height = 22
        TabOrder = 2
      end
      object ME0NumInicial: TMaskEdit
        Left = 216
        Top = 112
        Width = 73
        Height = 22
        TabOrder = 3
        Text = '0'
      end
      object ME0NumFinal: TMaskEdit
        Left = 296
        Top = 112
        Width = 73
        Height = 22
        TabOrder = 4
        Text = '0'
      end
      inline Fm0Estado: TFmEstado
        Left = 16
        Top = 56
        Width = 353
        Height = 37
        TabOrder = 1
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeEstado: TMaskEdit
          Height = 22
        end
        inherited EdEstado: TEdit
          Width = 277
          Height = 22
        end
      end
      object ME0Justificativa: TMaskEdit
        Left = 16
        Top = 160
        Width = 353
        Height = 22
        MaxLength = 255
        TabOrder = 5
      end
      object CB0Modelo: TComboBox
        Left = 16
        Top = 208
        Width = 353
        Height = 22
        ItemHeight = 14
        ItemIndex = 0
        TabOrder = 6
        Text = '55 - Nota Fiscal Eletr'#244'nica NF-e'
        Items.Strings = (
          '55 - Nota Fiscal Eletr'#244'nica NF-e'
          '65 - Nota Fiscal de Consumidor Eletr'#244'nica NFC-e')
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'NF-e via e-mail'
      ImageIndex = 1
      object Label6: TLabel
        Left = 16
        Top = 8
        Width = 28
        Height = 14
        Caption = 'E-mail'
      end
      object ME1Email: TMaskEdit
        Left = 16
        Top = 24
        Width = 361
        Height = 22
        TabOrder = 0
      end
      object GP1TipoArquivo: TGroupBox
        Left = 16
        Top = 56
        Width = 361
        Height = 41
        Caption = 'Enviar'
        TabOrder = 1
        object CB1TipoXml: TCheckBox
          Left = 8
          Top = 16
          Width = 49
          Height = 17
          Caption = 'XML'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object CB1TipoPdf: TCheckBox
          Left = 184
          Top = 16
          Width = 49
          Height = 17
          Caption = 'PDF'
          TabOrder = 1
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Reemiss'#227'o de Danfe'
      ImageIndex = 2
      object Label5: TLabel
        Left = 16
        Top = 88
        Width = 87
        Height = 14
        Caption = 'N'#250'mero de c'#243'pias'
      end
      object Label7: TLabel
        Left = 16
        Top = 128
        Width = 54
        Height = 14
        Caption = 'Impressora'
      end
      object Label8: TLabel
        Left = 5
        Top = 8
        Width = 379
        Height = 42
        Caption = 
          'Aten'#231#227'o!'#13#10'Para que a DANFE seja impressa corretamente '#233' necess'#225'r' +
          'io que a impressora'#13#10'esteja configurada para o papel A4. Caso co' +
          'ntr'#225'rio, a impress'#227'o sair'#225' errada.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object SB2Impressora: TSpeedButton
        Left = 352
        Top = 144
        Width = 23
        Height = 22
        OnClick = SB2ImpressoraClick
      end
      object ME2NumVias: TMaskEdit
        Left = 16
        Top = 104
        Width = 89
        Height = 22
        TabOrder = 0
      end
      object ME2Impressora: TMaskEdit
        Left = 16
        Top = 144
        Width = 337
        Height = 22
        TabOrder = 1
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Gera'#231#227'o de NF-e'
      ImageIndex = 3
      object Label9: TLabel
        Left = 16
        Top = 8
        Width = 86
        Height = 14
        Caption = 'Chave de Acesso'
      end
      object SB3ChaveAcesso: TSpeedButton
        Left = 352
        Top = 24
        Width = 23
        Height = 22
        Hint = 'Alterar Chave de Acesso da NF-e'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000369DD2369DD2
          369DD2369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D44392C2C4EBF7C6F4FBBBEFFA369DD2369DD2C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43E8EC17FE1F6
          4EDBF64EDBF6F0FCFE369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D43B89C19FE6F732C9EF4EDBF6B0EEFA369DD2369DD236
          9DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43B88C0
          82E1F532C9EF4EDBF6B0EEFAF1FCFE369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43987BF85E2F732C9EF4EDBF6B0EEFA36
          9DD2369DD2369DD20786C80786C80786C80786C8C8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D43B89C189E2F732C9EF4EDBF64EDBF645D5F43DD0F237CCF036CAEE2CB9
          E50888C90786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43B89C189E2F732C9EF43
          D4F33ED1F23CD0F23BCFF139CEF137CCF036C9EE0D8CCB0786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D41F92CD7CDEF644D5F442D4F341D2F33FD1F23DD0F23BCF
          F13ACEF134BDE60786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C87DDFF648
          D7F546D6F445D5F443D4F341D3F33FD2F23ED0F23BCCEF0786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40786C884E1F74BD9F54AD8F549D8F525ACDD0786C824AB
          DC42D3F349D3F30786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C88DDFF44E
          DBF64DDAF64CDAF50A8ACAB0EEFA0A8ACA46D6F470D8F20786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40786C86DBBE176E3F84EDBF64EDBF629AFDE0786C828AE
          DE6ADFF76ABEE20786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C80A87C9AC
          DCF0A3ECFA6FE2F850DBF66DE1F8A1EBFAAADCF10A87C90786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D40786C80A87C96CBAE0B8E1F3E5F9FDBBE3F36CBA
          E00A87C90786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D407
          86C80786C80786C80786C80786C80786C80786C8C8D0D4C8D0D4}
        OnClick = SB3ChaveAcessoClick
      end
      object ME3Chave: TMaskEdit
        Left = 16
        Top = 24
        Width = 337
        Height = 22
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object PC3EmissaoNFe: TPageControl
        Left = 16
        Top = 200
        Width = 361
        Height = 113
        ActivePage = TSNFe
        Style = tsFlatButtons
        TabOrder = 7
        object TSNFe: TTabSheet
          Caption = 'Enviar NF-e Agora'
        end
        object TSLote: TTabSheet
          Caption = 'Usar envio em lote'
          ImageIndex = 1
          object RG3EmissaoNfe: TRadioGroup
            Left = 0
            Top = 0
            Width = 353
            Height = 32
            Caption = 'Emiss'#227'o do Lote de NF-e'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Enviar agora para a SEFAZ'
              'N'#227'o quero enviar ainda')
            TabOrder = 0
            OnClick = BtOkClick
          end
        end
      end
      object RG3Ambiente: TRadioGroup
        Left = 16
        Top = 56
        Width = 145
        Height = 65
        Caption = 'Ambiente'
        Enabled = False
        Items.Strings = (
          'Produ'#231#227'o'
          'Homologa'#231#227'o')
        TabOrder = 1
      end
      object RG3Contingencia: TRadioGroup
        Left = 181
        Top = 56
        Width = 198
        Height = 65
        Caption = 'Conting'#234'ncia'
        Enabled = False
        Items.Strings = (
          'Normal'
          'Formul'#225'rio de Seguran'#231'a'
          'SCAN')
        TabOrder = 2
      end
      object CB3Danfe: TCheckBox
        Left = 16
        Top = 128
        Width = 169
        Height = 17
        Caption = 'Imprimir DANFE em seguida'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object CB3Email: TCheckBox
        Left = 16
        Top = 152
        Width = 89
        Height = 17
        Caption = 'Enviar e-mails:'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = CB3EmailClick
      end
      object CB3EmailXML: TCheckBox
        Left = 112
        Top = 152
        Width = 57
        Height = 17
        Caption = 'XML'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object CB3EmailPDF: TCheckBox
        Left = 112
        Top = 168
        Width = 57
        Height = 17
        Caption = 'PDF'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object CB3PrevisualizacaoDanfe: TCheckBox
        Left = 181
        Top = 128
        Width = 198
        Height = 17
        Caption = 'Pr'#233'-visualizar NF-e antes da emiss'#227'o'
        TabOrder = 8
      end
    end
    object TabSheet13: TTabSheet
      Caption = 'Gera'#231#227'o de NFC-e'
      ImageIndex = 12
      object Label19: TLabel
        Left = 16
        Top = 8
        Width = 86
        Height = 14
        Caption = 'Chave de Acesso'
      end
      object SB4ChaveAcesso: TSpeedButton
        Left = 352
        Top = 24
        Width = 23
        Height = 22
        Hint = 'Alterar Chave de Acesso da NF-e'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000369DD2369DD2
          369DD2369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D44392C2C4EBF7C6F4FBBBEFFA369DD2369DD2C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43E8EC17FE1F6
          4EDBF64EDBF6F0FCFE369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D43B89C19FE6F732C9EF4EDBF6B0EEFA369DD2369DD236
          9DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43B88C0
          82E1F532C9EF4EDBF6B0EEFAF1FCFE369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43987BF85E2F732C9EF4EDBF6B0EEFA36
          9DD2369DD2369DD20786C80786C80786C80786C8C8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D43B89C189E2F732C9EF4EDBF64EDBF645D5F43DD0F237CCF036CAEE2CB9
          E50888C90786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43B89C189E2F732C9EF43
          D4F33ED1F23CD0F23BCFF139CEF137CCF036C9EE0D8CCB0786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D41F92CD7CDEF644D5F442D4F341D2F33FD1F23DD0F23BCF
          F13ACEF134BDE60786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C87DDFF648
          D7F546D6F445D5F443D4F341D3F33FD2F23ED0F23BCCEF0786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40786C884E1F74BD9F54AD8F549D8F525ACDD0786C824AB
          DC42D3F349D3F30786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C88DDFF44E
          DBF64DDAF64CDAF50A8ACAB0EEFA0A8ACA46D6F470D8F20786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40786C86DBBE176E3F84EDBF64EDBF629AFDE0786C828AE
          DE6ADFF76ABEE20786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C80A87C9AC
          DCF0A3ECFA6FE2F850DBF66DE1F8A1EBFAAADCF10A87C90786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D40786C80A87C96CBAE0B8E1F3E5F9FDBBE3F36CBA
          E00A87C90786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D407
          86C80786C80786C80786C80786C80786C80786C8C8D0D4C8D0D4}
        OnClick = SB3ChaveAcessoClick
      end
      object ME4Chave: TMaskEdit
        Left = 16
        Top = 24
        Width = 337
        Height = 22
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object PC4EmissaoNFe: TPageControl
        Left = 16
        Top = 208
        Width = 361
        Height = 105
        ActivePage = TSNFCe
        Style = tsFlatButtons
        TabOrder = 1
        object TSNFCe: TTabSheet
          Caption = 'Enviar NF-e Agora'
        end
        object TSLoteNFCe: TTabSheet
          Caption = 'Usar envio em lote'
          ImageIndex = 1
          object RG4EmissaoNfce: TRadioGroup
            Left = 0
            Top = 0
            Width = 353
            Height = 34
            Caption = 'Emiss'#227'o do Lote de NF-e'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Enviar agora para a SEFAZ'
              'N'#227'o quero enviar ainda')
            TabOrder = 0
            OnClick = BtOkClick
          end
        end
      end
      object RG4Ambiente: TRadioGroup
        Left = 16
        Top = 56
        Width = 145
        Height = 65
        Caption = 'Ambiente'
        Enabled = False
        Items.Strings = (
          'Produ'#231#227'o'
          'Homologa'#231#227'o')
        TabOrder = 2
      end
      object RG4Contingencia: TRadioGroup
        Left = 192
        Top = 56
        Width = 185
        Height = 65
        Caption = 'Conting'#234'ncia'
        Enabled = False
        Items.Strings = (
          'Normal'
          'Formul'#225'rio de Seguran'#231'a'
          'SCAN')
        TabOrder = 3
      end
      object CB4Danfe: TCheckBox
        Left = 16
        Top = 128
        Width = 193
        Height = 17
        Caption = 'Imprimir DANFE NFC-e em seguida'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object CB4Email: TCheckBox
        Left = 16
        Top = 152
        Width = 89
        Height = 17
        Caption = 'Enviar e-mails:'
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = CB3EmailClick
      end
      object CB4EmailXML: TCheckBox
        Left = 112
        Top = 152
        Width = 57
        Height = 17
        Caption = 'XML'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object CB4EmailPDF: TCheckBox
        Left = 112
        Top = 168
        Width = 57
        Height = 17
        Caption = 'PDF'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Gera'#231#227'o de NFS-e'
      ImageIndex = 5
      object Label10: TLabel
        Left = 16
        Top = 8
        Width = 86
        Height = 14
        Caption = 'Chave de Acesso'
      end
      object SB5ChaveAcesso: TSpeedButton
        Left = 352
        Top = 24
        Width = 23
        Height = 22
        Hint = 'Alterar Chave de Acesso da NF-e'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000369DD2369DD2
          369DD2369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D44392C2C4EBF7C6F4FBBBEFFA369DD2369DD2C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43E8EC17FE1F6
          4EDBF64EDBF6F0FCFE369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D43B89C19FE6F732C9EF4EDBF6B0EEFA369DD2369DD236
          9DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43B88C0
          82E1F532C9EF4EDBF6B0EEFAF1FCFE369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43987BF85E2F732C9EF4EDBF6B0EEFA36
          9DD2369DD2369DD20786C80786C80786C80786C8C8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D43B89C189E2F732C9EF4EDBF64EDBF645D5F43DD0F237CCF036CAEE2CB9
          E50888C90786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43B89C189E2F732C9EF43
          D4F33ED1F23CD0F23BCFF139CEF137CCF036C9EE0D8CCB0786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D41F92CD7CDEF644D5F442D4F341D2F33FD1F23DD0F23BCF
          F13ACEF134BDE60786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C87DDFF648
          D7F546D6F445D5F443D4F341D3F33FD2F23ED0F23BCCEF0786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40786C884E1F74BD9F54AD8F549D8F525ACDD0786C824AB
          DC42D3F349D3F30786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C88DDFF44E
          DBF64DDAF64CDAF50A8ACAB0EEFA0A8ACA46D6F470D8F20786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40786C86DBBE176E3F84EDBF64EDBF629AFDE0786C828AE
          DE6ADFF76ABEE20786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C80A87C9AC
          DCF0A3ECFA6FE2F850DBF66DE1F8A1EBFAAADCF10A87C90786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D40786C80A87C96CBAE0B8E1F3E5F9FDBBE3F36CBA
          E00A87C90786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D407
          86C80786C80786C80786C80786C80786C80786C8C8D0D4C8D0D4}
        OnClick = SB3ChaveAcessoClick
      end
      object ME5Chave: TMaskEdit
        Left = 16
        Top = 24
        Width = 337
        Height = 22
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object RG5Ambiente: TRadioGroup
        Left = 16
        Top = 56
        Width = 145
        Height = 65
        Caption = 'Ambiente'
        Enabled = False
        Items.Strings = (
          'Produ'#231#227'o'
          'Homologa'#231#227'o')
        TabOrder = 1
      end
      object CB5Danfe: TCheckBox
        Left = 16
        Top = 128
        Width = 233
        Height = 17
        Caption = 'Imprimir em seguida'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object CB5Email: TCheckBox
        Left = 16
        Top = 152
        Width = 89
        Height = 17
        Caption = 'Enviar e-mails:'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = CB5EmailClick
      end
      object CB5EmailXML: TCheckBox
        Left = 112
        Top = 152
        Width = 57
        Height = 17
        Caption = 'XML'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object CB5EmailPDF: TCheckBox
        Left = 112
        Top = 168
        Width = 57
        Height = 17
        Caption = 'PDF'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object PC5EmissaoNFSe: TPageControl
        Left = 16
        Top = 192
        Width = 361
        Height = 121
        ActivePage = TSLote2
        Style = tsFlatButtons
        TabOrder = 6
        object TSNFSe: TTabSheet
          Caption = 'Enviar NFS-e Agora'
        end
        object TSLote2: TTabSheet
          Caption = 'Usar envio em lote'
          ImageIndex = 1
          object RG5EmissaoNfse: TRadioGroup
            Left = 0
            Top = 40
            Width = 353
            Height = 41
            Caption = 'Emiss'#227'o do Lote de NFS-e'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Enviar agora'
              'N'#227'o quero enviar ainda')
            TabOrder = 0
            OnClick = BtOkClick
          end
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Gera'#231#227'o de CC-e'
      ImageIndex = 6
      object Label11: TLabel
        Left = 16
        Top = 8
        Width = 86
        Height = 14
        Caption = 'Chave de Acesso'
      end
      object CB6Impressao: TCheckBox
        Left = 16
        Top = 128
        Width = 233
        Height = 17
        Caption = 'Imprimir CC-e em seguida'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object CB6Email: TCheckBox
        Left = 16
        Top = 152
        Width = 89
        Height = 17
        Caption = 'Enviar e-mails:'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CB6EmailClick
      end
      object CB6EmailXml: TCheckBox
        Left = 112
        Top = 152
        Width = 57
        Height = 17
        Caption = 'XML'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object CB6EmailPdf: TCheckBox
        Left = 112
        Top = 168
        Width = 57
        Height = 17
        Caption = 'PDF'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object ME6Chave: TMaskEdit
        Left = 16
        Top = 24
        Width = 337
        Height = 22
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 4
      end
      object RG6Ambiente: TRadioGroup
        Left = 16
        Top = 56
        Width = 145
        Height = 65
        Caption = 'Ambiente'
        Enabled = False
        Items.Strings = (
          'Produ'#231#227'o'
          'Homologa'#231#227'o')
        TabOrder = 5
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Gera'#231#227'o de CT-e'
      ImageIndex = 7
      object Label12: TLabel
        Left = 16
        Top = 8
        Width = 86
        Height = 14
        Caption = 'Chave de Acesso'
      end
      object SB7ChaveAcesso: TSpeedButton
        Left = 352
        Top = 24
        Width = 23
        Height = 22
        Hint = 'Alterar Chave de Acesso do CT-e'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000369DD2369DD2
          369DD2369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D44392C2C4EBF7C6F4FBBBEFFA369DD2369DD2C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43E8EC17FE1F6
          4EDBF64EDBF6F0FCFE369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D43B89C19FE6F732C9EF4EDBF6B0EEFA369DD2369DD236
          9DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43B88C0
          82E1F532C9EF4EDBF6B0EEFAF1FCFE369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43987BF85E2F732C9EF4EDBF6B0EEFA36
          9DD2369DD2369DD20786C80786C80786C80786C8C8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D43B89C189E2F732C9EF4EDBF64EDBF645D5F43DD0F237CCF036CAEE2CB9
          E50888C90786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43B89C189E2F732C9EF43
          D4F33ED1F23CD0F23BCFF139CEF137CCF036C9EE0D8CCB0786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D41F92CD7CDEF644D5F442D4F341D2F33FD1F23DD0F23BCF
          F13ACEF134BDE60786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C87DDFF648
          D7F546D6F445D5F443D4F341D3F33FD2F23ED0F23BCCEF0786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40786C884E1F74BD9F54AD8F549D8F525ACDD0786C824AB
          DC42D3F349D3F30786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C88DDFF44E
          DBF64DDAF64CDAF50A8ACAB0EEFA0A8ACA46D6F470D8F20786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40786C86DBBE176E3F84EDBF64EDBF629AFDE0786C828AE
          DE6ADFF76ABEE20786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C80A87C9AC
          DCF0A3ECFA6FE2F850DBF66DE1F8A1EBFAAADCF10A87C90786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D40786C80A87C96CBAE0B8E1F3E5F9FDBBE3F36CBA
          E00A87C90786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D407
          86C80786C80786C80786C80786C80786C80786C8C8D0D4C8D0D4}
        OnClick = SB3ChaveAcessoClick
      end
      object ME7Chave: TMaskEdit
        Left = 16
        Top = 24
        Width = 337
        Height = 22
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object PC7EmissaoCTe: TPageControl
        Left = 16
        Top = 216
        Width = 361
        Height = 97
        ActivePage = TSLoteCTe
        Style = tsFlatButtons
        TabOrder = 7
        object TSCTe: TTabSheet
          Caption = 'Enviar CT-e Agora'
        end
        object TSLoteCTe: TTabSheet
          Caption = 'Usar envio em lote'
          ImageIndex = 1
          object RG7EmissaoCTe: TRadioGroup
            Left = 0
            Top = 0
            Width = 353
            Height = 41
            Caption = 'Emiss'#227'o do Lote de CT-e'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Enviar agora para a SEFAZ'
              'N'#227'o quero enviar ainda')
            TabOrder = 0
            OnClick = BtOkClick
          end
        end
      end
      object RG7Ambiente: TRadioGroup
        Left = 16
        Top = 56
        Width = 169
        Height = 65
        Caption = 'Ambiente'
        Enabled = False
        Items.Strings = (
          'Produ'#231#227'o'
          'Homologa'#231#227'o')
        TabOrder = 1
      end
      object RG7Contingencia: TRadioGroup
        Left = 192
        Top = 56
        Width = 183
        Height = 65
        Caption = 'Conting'#234'ncia'
        Columns = 2
        Enabled = False
        Items.Strings = (
          'Normal'
          'FDSA'
          'SVC-RS'
          'SVC-SP')
        TabOrder = 2
      end
      object CB7Dacte: TCheckBox
        Left = 16
        Top = 128
        Width = 233
        Height = 17
        Caption = 'Imprimir DACTE em seguida'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object CB7Email: TCheckBox
        Left = 16
        Top = 152
        Width = 89
        Height = 17
        Caption = 'Enviar e-mails:'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = CB7EmailClick
      end
      object CB7EmailXML: TCheckBox
        Left = 112
        Top = 152
        Width = 57
        Height = 17
        Caption = 'XML'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object CB7EmailPDF: TCheckBox
        Left = 112
        Top = 168
        Width = 57
        Height = 17
        Caption = 'PDF'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object CB7PrevisualizacaoDacte: TCheckBox
        Left = 192
        Top = 128
        Width = 124
        Height = 17
        Caption = 'Pr'#233'-visualizar CT-e'
        TabOrder = 8
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Inutiliza'#231#227'o de Numera'#231#227'o CT-e'
      ImageIndex = 8
      object Label13: TLabel
        Left = 16
        Top = 96
        Width = 25
        Height = 14
        Caption = 'S'#233'rie'
      end
      object Label14: TLabel
        Left = 216
        Top = 96
        Width = 66
        Height = 14
        Caption = 'N'#250'mero Inicial'
      end
      object Label15: TLabel
        Left = 296
        Top = 96
        Width = 62
        Height = 14
        Caption = 'N'#250'mero Final'
      end
      object Label16: TLabel
        Left = 16
        Top = 144
        Width = 57
        Height = 14
        Caption = 'Justificativa'
      end
      object Label21: TLabel
        Left = 16
        Top = 192
        Width = 106
        Height = 14
        Caption = 'Modelo do Documento'
      end
      inline Fm8Filial: TFmFilial
        Left = 16
        Top = 16
        Width = 353
        Height = 37
        TabOrder = 4
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Width = 277
          Height = 22
        end
      end
      object Me8Serie: TMaskEdit
        Left = 16
        Top = 112
        Width = 49
        Height = 22
        TabOrder = 0
      end
      object Me8NumInicial: TMaskEdit
        Left = 216
        Top = 112
        Width = 73
        Height = 22
        TabOrder = 1
        Text = '0'
      end
      object Me8NumFinal: TMaskEdit
        Left = 296
        Top = 112
        Width = 73
        Height = 22
        TabOrder = 2
        Text = '0'
      end
      inline Fm8Estado: TFmEstado
        Left = 16
        Top = 56
        Width = 353
        Height = 37
        TabOrder = 5
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeEstado: TMaskEdit
          Height = 22
        end
        inherited EdEstado: TEdit
          Width = 277
          Height = 22
        end
      end
      object Me8Justificativa: TMaskEdit
        Left = 16
        Top = 160
        Width = 353
        Height = 22
        MaxLength = 255
        TabOrder = 3
      end
      object CB8Modelo: TComboBox
        Left = 16
        Top = 208
        Width = 353
        Height = 22
        ItemHeight = 14
        TabOrder = 6
        Text = '57 - Conhecimento de Transporte Eletr'#244'nico'
        Items.Strings = (
          '57 - Conhecimento de Transporte Eletr'#244'nico CT-e'
          
            '67 - Conhecimento de Transporte Eletr'#244'nico Outros Servi'#231'os CT-e ' +
            'OS')
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'Gera'#231#227'o de MDF-e'
      ImageIndex = 9
      object Label17: TLabel
        Left = 16
        Top = 8
        Width = 86
        Height = 14
        Caption = 'Chave de Acesso'
      end
      object SB9ChaveAcesso: TSpeedButton
        Left = 352
        Top = 24
        Width = 23
        Height = 22
        Hint = 'Alterar Chave de Acesso do CT-e'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000369DD2369DD2
          369DD2369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D44392C2C4EBF7C6F4FBBBEFFA369DD2369DD2C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43E8EC17FE1F6
          4EDBF64EDBF6F0FCFE369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D43B89C19FE6F732C9EF4EDBF6B0EEFA369DD2369DD236
          9DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43B88C0
          82E1F532C9EF4EDBF6B0EEFAF1FCFE369DD2C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43987BF85E2F732C9EF4EDBF6B0EEFA36
          9DD2369DD2369DD20786C80786C80786C80786C8C8D0D4C8D0D4C8D0D4C8D0D4
          C8D0D43B89C189E2F732C9EF4EDBF64EDBF645D5F43DD0F237CCF036CAEE2CB9
          E50888C90786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43B89C189E2F732C9EF43
          D4F33ED1F23CD0F23BCFF139CEF137CCF036C9EE0D8CCB0786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D41F92CD7CDEF644D5F442D4F341D2F33FD1F23DD0F23BCF
          F13ACEF134BDE60786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C87DDFF648
          D7F546D6F445D5F443D4F341D3F33FD2F23ED0F23BCCEF0786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40786C884E1F74BD9F54AD8F549D8F525ACDD0786C824AB
          DC42D3F349D3F30786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C88DDFF44E
          DBF64DDAF64CDAF50A8ACAB0EEFA0A8ACA46D6F470D8F20786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D40786C86DBBE176E3F84EDBF64EDBF629AFDE0786C828AE
          DE6ADFF76ABEE20786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40786C80A87C9AC
          DCF0A3ECFA6FE2F850DBF66DE1F8A1EBFAAADCF10A87C90786C8C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D40786C80A87C96CBAE0B8E1F3E5F9FDBBE3F36CBA
          E00A87C90786C8C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D407
          86C80786C80786C80786C80786C80786C80786C8C8D0D4C8D0D4}
        OnClick = SB3ChaveAcessoClick
      end
      object ME9Chave: TMaskEdit
        Left = 16
        Top = 24
        Width = 337
        Height = 22
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object PC9EmissaoMDFe: TPageControl
        Left = 16
        Top = 216
        Width = 361
        Height = 97
        ActivePage = TSMDFe
        Style = tsFlatButtons
        TabOrder = 1
        object TSMDFe: TTabSheet
          Caption = 'Enviar MDF-e Agora'
        end
        object TSLoteMDFe: TTabSheet
          Caption = 'Usar envio em lote'
          ImageIndex = 1
          object RG9EmissaoMDFe: TRadioGroup
            Left = 0
            Top = 0
            Width = 353
            Height = 41
            Caption = 'Emiss'#227'o do Lote de MDF-e'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Enviar agora para a SEFAZ'
              'N'#227'o quero enviar ainda')
            TabOrder = 0
            OnClick = BtOkClick
          end
        end
      end
      object RG9Ambiente: TRadioGroup
        Left = 16
        Top = 56
        Width = 169
        Height = 65
        Caption = 'Ambiente'
        Enabled = False
        Items.Strings = (
          'Produ'#231#227'o'
          'Homologa'#231#227'o')
        TabOrder = 2
      end
      object CB9Damdfe: TCheckBox
        Left = 16
        Top = 128
        Width = 233
        Height = 17
        Caption = 'Imprimir DAMDFE em seguida'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object CB9Email: TCheckBox
        Left = 16
        Top = 152
        Width = 89
        Height = 17
        Caption = 'Enviar e-mails:'
        TabOrder = 4
        OnClick = CB9EmailClick
      end
      object CB9EmailXML: TCheckBox
        Left = 112
        Top = 152
        Width = 57
        Height = 17
        Caption = 'XML'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 5
      end
      object CB9EmailPDF: TCheckBox
        Left = 112
        Top = 168
        Width = 57
        Height = 17
        Caption = 'PDF'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 6
      end
      object CB9PrevisualizacaoDamdfe: TCheckBox
        Left = 199
        Top = 128
        Width = 164
        Height = 17
        Caption = 'Pr'#233'-visualizar MDF-e'
        TabOrder = 7
      end
    end
    object TabSheet11: TTabSheet
      Caption = 'Encerramento de MDF-e'
      ImageIndex = 10
      object Label18: TLabel
        Left = 17
        Top = 7
        Width = 22
        Height = 14
        Caption = 'Data'
      end
      inline Fm10Estado: TFmEstado
        Left = 17
        Top = 48
        Width = 353
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeEstado: TMaskEdit
          Height = 22
        end
        inherited EdEstado: TEdit
          Width = 277
          Height = 22
        end
      end
      inline Fm10Cidade: TFmCidade
        Left = 17
        Top = 88
        Width = 353
        Height = 40
        TabOrder = 1
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeCidade: TMaskEdit
          Height = 22
        end
        inherited EdCidade: TEdit
          Width = 277
          Height = 22
        end
      end
      object MeDataEncMDFe: TMaskEdit
        Left = 17
        Top = 21
        Width = 73
        Height = 22
        EditMask = '!99/99/##00;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
      end
    end
    object TabSheet12: TTabSheet
      Caption = 'Inclus'#227'o de Condutor'
      ImageIndex = 11
      inline Fm11Cadastro: TFmCadastro
        Left = 32
        Top = 112
        Width = 322
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Width = 44
          Height = 14
          Caption = 'Condutor'
        end
        inherited MeCadastro: TMaskEdit
          Height = 22
        end
        inherited EdCadastro: TEdit
          Width = 246
          Height = 22
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Consulta MDF-es N'#227'o Encerrados'
      ImageIndex = 12
      inline Fm12Filial: TFmFilial
        Left = 16
        Top = 16
        Width = 353
        Height = 37
        TabOrder = 0
        inherited Label1: TLabel
          Height = 14
        end
        inherited MeFilial: TMaskEdit
          Height = 22
        end
        inherited EdFilial: TEdit
          Width = 277
          Height = 22
        end
      end
    end
    object TabSheet14: TTabSheet
      Caption = 'Reemiss'#227'o de DACTE'
      ImageIndex = 13
      object Label22: TLabel
        Left = 16
        Top = 88
        Width = 87
        Height = 14
        Caption = 'N'#250'mero de c'#243'pias'
      end
      object Label23: TLabel
        Left = 16
        Top = 128
        Width = 54
        Height = 14
        Caption = 'Impressora'
      end
      object Label24: TLabel
        Left = 5
        Top = 8
        Width = 379
        Height = 42
        Caption = 
          'Aten'#231#227'o!'#13#10'Para que o DACTE seja impresso corretamente '#233' necess'#225'r' +
          'io que a impressora'#13#10'esteja configurada para o papel A4. Caso co' +
          'ntr'#225'rio, a impress'#227'o sair'#225'  errada.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object SB13Impressora: TSpeedButton
        Left = 352
        Top = 144
        Width = 23
        Height = 22
        OnClick = SB13ImpressoraClick
      end
      object ME13NumVias: TMaskEdit
        Left = 16
        Top = 104
        Width = 89
        Height = 22
        TabOrder = 0
      end
      object ME13Impressora: TMaskEdit
        Left = 16
        Top = 144
        Width = 337
        Height = 22
        TabOrder = 1
      end
    end
    object TabSheet15: TTabSheet
      Caption = 'Reemiss'#227'o de Carta de Corre'#231#227'o'
      ImageIndex = 14
      object Label26: TLabel
        Left = 16
        Top = 128
        Width = 54
        Height = 14
        Caption = 'Impressora'
      end
      object SB14Impressora: TSpeedButton
        Left = 352
        Top = 144
        Width = 23
        Height = 22
        OnClick = SB14ImpressoraClick
      end
      object Label27: TLabel
        Left = 5
        Top = 8
        Width = 380
        Height = 65
        AutoSize = False
        Caption = 
          'Aten'#231#227'o!'#13#10'Para que a Carta de Corre'#231#227'o seja impressa corretament' +
          'e '#233' necess'#225'rio que a impressora esteja configurada para o papel ' +
          'A4. Caso contr'#225'rio, a impress'#227'o sair'#225'  errada.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object ME14Impressora: TMaskEdit
        Left = 16
        Top = 144
        Width = 337
        Height = 22
        TabOrder = 0
      end
    end
  end
  inherited BtOk: TBitBtn
    Top = 382
    Width = 89
    Height = 32
    Caption = 'Gerar'
    Default = False
    TabOrder = 2
    Kind = bkCustom
  end
  inherited BtCancela: TBitBtn
    Left = 304
    Top = 382
    Width = 83
    Height = 32
    Caption = 'Cancelar'
    TabOrder = 3
  end
  inherited RGPreview: TRadioGroup
    Top = 360
    TabOrder = 1
    Visible = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 424
    Width = 396
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object PDDanfe: TPrintDialog
    Left = 160
    Top = 352
  end
end
