inherited FMenuSuino: TFMenuSuino
  Left = 205
  Top = 165
  Caption = 'Controle de Su'#237'nos'
  PixelsPerInch = 96
  TextHeight = 14
  inherited MMCadSimples: TMainMenu
    object Manuteo1: TMenuItem [0]
      Caption = 'Manute'#231#227'o'
      object Despesas1: TMenuItem
        Caption = 'Despesas'
        OnClick = Despesas1Click
      end
      object Sobra1: TMenuItem
        Caption = 'Sobras'
        OnClick = Sobra1Click
      end
      object ControledeUPL1: TMenuItem
        Caption = 'Controle de UPL'
        OnClick = ControledeUPL1Click
      end
      object CadastroIncentivos1: TMenuItem
        Caption = 'Cadastro Incentivos'
        OnClick = CadastroIncentivos1Click
      end
      object abelaRemuneraodeLeito1: TMenuItem
        Caption = 'Tabela Remunera'#231#227'o de Leit'#227'o'
        OnClick = abelaRemuneraodeLeito1Click
      end
    end
  end
end
