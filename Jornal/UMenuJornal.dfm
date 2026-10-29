inherited FMenuJornal: TFMenuJornal
  Left = 367
  Top = 231
  Caption = 'Sistema de Jornal'
  PixelsPerInch = 96
  TextHeight = 14
  inherited MMCadSimples: TMainMenu
    object Manuteno1: TMenuItem [0]
      Caption = '&Manuten'#231#227'o'
      object Contrato1: TMenuItem
        Caption = '&Contrato'
        OnClick = Contrato1Click
      end
      object ControledeRecebimento1: TMenuItem
        Caption = 'Controle de &Recebimento'
        OnClick = ControledeRecebimento1Click
      end
    end
  end
end
