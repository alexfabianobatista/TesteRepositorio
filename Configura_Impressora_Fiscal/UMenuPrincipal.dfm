inherited FMenuPrincipal: TFMenuPrincipal
  Left = 452
  Top = 252
  Caption = 'Menu Principal'
  PixelsPerInch = 96
  TextHeight = 14
  inherited MMCadSimples: TMainMenu
    object Manuteno1: TMenuItem [0]
      Caption = '&Manuten'#231#227'o'
      object Cadastraalquotas1: TMenuItem
        Caption = '&Cadastrar al'#237'quotas'
        OnClick = Cadastraalquotas1Click
      end
    end
  end
end
