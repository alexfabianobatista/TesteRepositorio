inherited FMenu: TFMenu
  Left = 107
  Top = 291
  Height = 102
  Caption = 'Menu Coordenador'
  PixelsPerInch = 96
  TextHeight = 14
  inherited MMCadSimples: TMainMenu
    object Manuteno1: TMenuItem [0]
      Caption = '&Manuten'#231#227'o'
      object GrupoProduto1: TMenuItem
        Caption = '&Grupo Produto'
        OnClick = GrupoProduto1Click
      end
      object CadastroTabelaPreos1: TMenuItem
        Caption = 'Cadastro Tabela Pre'#231'os'
        OnClick = CadastroTabelaPreos1Click
      end
      object CadastroVerbapRepresenante1: TMenuItem
        Caption = 'Cadastro Verba p/Represenante'
        OnClick = CadastroVerbapRepresenante1Click
      end
      object DistribuiVerbaPVendedor1: TMenuItem
        Caption = 'Distribui Verba P/Vendedor'
        OnClick = DistribuiVerbaPVendedor1Click
      end
    end
  end
end
