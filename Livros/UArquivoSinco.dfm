inherited FArquivoSinco: TFArquivoSinco
  Left = 313
  Top = 169
  Caption = 'Geracao Arquivo Sinco'
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Visible = False
  end
  inherited MMCadSimples: TMainMenu
    inherited Manuteno1: TMenuItem
      inherited Incluir1: TMenuItem
        Visible = False
      end
      inherited Alterar1: TMenuItem
        Visible = False
      end
      inherited Confirmar1: TMenuItem
        Visible = False
      end
      inherited Excluir1: TMenuItem
        Visible = False
      end
      inherited Cancelar1: TMenuItem
        Visible = False
      end
      inherited Atualizar1: TMenuItem
        Visible = False
      end
      inherited Consulta1: TMenuItem
        Visible = False
      end
    end
    object Opo1: TMenuItem
      Caption = 'Op'#231#227'o'
      object LancamentoDiarioGeral1: TMenuItem
        Caption = 'Lancamento Diario Geral'
        OnClick = LancamentoDiarioGeral1Click
      end
      object SaldosMensaisDiarioGeral1: TMenuItem
        Caption = 'Saldos Mensais Diario Geral'
        OnClick = SaldosMensaisDiarioGeral1Click
      end
      object PlanoDeContas1: TMenuItem
        Caption = 'Plano De Contas'
        OnClick = PlanoDeContas1Click
      end
    end
  end
end
