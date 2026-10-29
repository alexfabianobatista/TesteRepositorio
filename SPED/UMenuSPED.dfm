inherited FMenuSPED: TFMenuSPED
  Left = 526
  Top = 251
  Width = 543
  Height = 352
  Caption = 'SPED - Sistema P'#250'blico de Escritura'#231#227'o Digital'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 527
    Height = 269
    inherited BtBaseProducao: TSpeedButton
      Hint = 'Conectado a base de Produ'#231#227'o'
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 269
    Width = 527
  end
  inherited MMCadSimples: TMainMenu
    object Manuteno1: TMenuItem [0]
      Caption = 'Manuten'#231#227'o'
      object GerarArquivo1: TMenuItem
        Caption = 'SPED Fiscal'
        OnClick = GerarArquivo1Click
      end
      object SPEDContbil1: TMenuItem
        Caption = 'SPED Cont'#225'bil'
        OnClick = SPEDContbil1Click
      end
      object ValidaodosDadosparaSPED1: TMenuItem
        Caption = 'Valida'#231#227'o dos Dados para SPED'
        Visible = False
        OnClick = ValidaodosDadosparaSPED1Click
      end
      object SPEDPISCofins1: TMenuItem
        Caption = 'SPED PIS/Cofins'
        OnClick = SPEDPISCofins1Click
      end
      object FCont1: TMenuItem
        Caption = 'FCont'
        OnClick = FCont1Click
      end
      object ECF1: TMenuItem
        Caption = 'ECF'
        OnClick = ECF1Click
      end
      object Reinf1: TMenuItem
        Caption = 'SPED Reinf'
        OnClick = Reinf1Click
      end
    end
    object Relatrios1: TMenuItem [1]
      Caption = 'Relat'#243'rios'
      object ConfernciaSpedPiseCofins1: TMenuItem
        Caption = 'Confer'#234'ncia Sped &Pis e Cofins'
        OnClick = ConfernciaSpedPiseCofins1Click
      end
      object ConfernciaSpedFiscal1: TMenuItem
        Caption = 'Confer'#234'ncia Sped &Fiscal'
        OnClick = ConfernciaSpedFiscal1Click
      end
    end
  end
end
