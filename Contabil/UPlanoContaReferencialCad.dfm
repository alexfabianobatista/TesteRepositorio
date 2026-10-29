inherited FPlanoContaReferencialCad: TFPlanoContaReferencialCad
  Left = 283
  Top = 221
  Caption = 'Plano de Contas Referencial'
  ClientHeight = 226
  ClientWidth = 437
  PixelsPerInch = 96
  TextHeight = 14
  object Label4: TLabel [0]
    Left = 22
    Top = 104
    Width = 28
    Height = 14
    Caption = 'Conta'
    FocusControl = DBEdit4
  end
  object Label5: TLabel [1]
    Left = 22
    Top = 64
    Width = 33
    Height = 14
    Caption = 'C'#243'digo'
    FocusControl = DBEdit5
  end
  object Label1: TLabel [2]
    Left = 22
    Top = 144
    Width = 49
    Height = 14
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit1
  end
  inherited Panel1: TPanel
    Width = 437
    inherited SBConsulta: TSpeedButton
      Left = 407
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 303
    end
    inherited MELocaliza: TMaskEdit
      Left = 359
    end
    inherited pnSeparador2: TPanel
      Left = 291
    end
  end
  object DBEdit4: TDBEdit [5]
    Left = 22
    Top = 120
    Width = 123
    Height = 22
    DataField = 'NUM_PLANO_CONTA_REFERENCIAL'
    DataSource = DSPrimario
    TabOrder = 3
  end
  object DBEdit5: TDBEdit [6]
    Left = 22
    Top = 80
    Width = 65
    Height = 22
    TabStop = False
    DataField = 'COD_PLANO_CONTA_REFERENCIAL'
    DataSource = DSPrimario
    ParentColor = True
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit1: TDBEdit [7]
    Left = 22
    Top = 160
    Width = 371
    Height = 22
    DataField = 'DESC_PLANO_CONTA_REFERENCIAL'
    DataSource = DSPrimario
    TabOrder = 4
  end
  inherited StBLongHint: TStatusBar
    Top = 207
    Width = 437
  end
  inherited MMCadSimples: TMainMenu
    Left = 232
    inherited Relatrios1: TMenuItem
      object PlanodeContasReferencial1: TMenuItem
        Caption = 'Plano de Contas Referencial'
        OnClick = PlanodeContasReferencial1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DmPlanoContaReferencial.QPlanoContaReferencial
    Left = 200
  end
  inherited ILBotao: TImageList
    Left = 168
  end
  inherited ALCadastro: TActionList
    Left = 270
  end
end
