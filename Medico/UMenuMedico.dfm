inherited FMenuMedico: TFMenuMedico
  Left = 118
  Top = 151
  Caption = 'Sistema M'#233'dico'
  PixelsPerInch = 96
  TextHeight = 14
  inherited MMCadSimples: TMainMenu
    object Manuteno1: TMenuItem [0]
      Caption = '&Manuten'#231#227'o'
      object Cadastros1: TMenuItem
        Caption = 'Cadastro &M'#233'dico'
        OnClick = Cadastros1Click
      end
      object CadastroConvnio1: TMenuItem
        Caption = 'Cadastro C&onv'#234'nio'
        OnClick = CadastroConvnio1Click
      end
      object CadastroBaseClculoIRF1: TMenuItem
        Caption = 'Cadastro Base C'#225'lculo-IRF'
        OnClick = CadastroBaseClculoIRF1Click
      end
      object CadastrodeLanamentoparaRepasse1: TMenuItem
        Caption = 'Cadastro de Lan'#231'amentos p/ Repasse'
        OnClick = CadastrodeLanamentoparaRepasse1Click
      end
      object RequisiodeTransfuso1: TMenuItem
        Caption = '&Requisi'#231#227'o de Transfus'#227'o'
        OnClick = RequisiodeTransfuso1Click
      end
      object CadastroPacientes1: TMenuItem
        Caption = 'Cadastro Paciente'
        OnClick = CadastroPacientes1Click
      end
    end
  end
end
