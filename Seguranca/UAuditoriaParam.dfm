inherited FAuditoriaParam: TFAuditoriaParam
  Left = 540
  Top = 182
  Width = 809
  Height = 564
  Caption = 'Consulta Auditoria'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PGRelatorio: TPageControl
    Width = 793
    Height = 448
    ActivePage = TabSheet2
    OnChange = PGRelatorioChange
    object TabSheet1: TTabSheet
      Caption = 'TELAS'
      object RGTela: TRadioGroup
        Left = 40
        Top = 16
        Width = 185
        Height = 385
        Caption = 'Selecione a Tela'
        Items.Strings = (
          'CADASTRO CLIENTES'
          'OPERA'#199#213'ES'
          'FILIAL'
          'CAIXA'
          'CONTAS A RECEBER'
          'CONTAS A PAGAR'
          'FINALIDADE'
          'HIST'#211'RICO'
          'NOTAS DE ENTRADA'
          'NOTAS DE SAIDA'
          'PRODUTOS'
          'TRIBUTA'#199#195'O')
        TabOrder = 0
        OnClick = RGTelaClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Cadastro Clientes'
      ImageIndex = 1
    end
    object TabSheet3: TTabSheet
      Caption = 'Opera'#231#245'es'
      ImageIndex = 2
    end
    object TabSheet4: TTabSheet
      Caption = 'Filial'
      ImageIndex = 3
    end
    object TabSheet5: TTabSheet
      Caption = 'Caixa'
      ImageIndex = 4
    end
  end
  inherited BtOk: TBitBtn
    Left = 613
    Top = 495
  end
  inherited BtCancela: TBitBtn
    Left = 709
    Top = 495
  end
  inherited RGPreview: TRadioGroup
    Top = 463
  end
end
