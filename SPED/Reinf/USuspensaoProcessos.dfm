inherited FSuspensaoProcessos: TFSuspensaoProcessos
  Left = 646
  Top = 33
  BorderStyle = bsSingle
  Caption = 'Suspens'#227'o de Processos'
  ClientHeight = 616
  ClientWidth = 515
  PixelsPerInch = 96
  TextHeight = 14
  object Label2: TLabel [1]
    Left = 8
    Top = 124
    Width = 93
    Height = 14
    Caption = 'Tipo de Suspens'#227'o'
  end
  object Label3: TLabel [2]
    Left = 10
    Top = 163
    Width = 79
    Height = 14
    Caption = 'Data da Decis'#227'o'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 80
    Width = 91
    Height = 14
    Caption = 'C'#243'digo Suspens'#227'o'
    FocusControl = dbeCodSuspensaoCont
  end
  inherited Panel1: TPanel
    Width = 515
    inherited lbPesquisaCodigo: TLabel
      Left = 373
    end
    inherited SBConsulta: TSpeedButton
      Left = 480
    end
    inherited pnSeparador2: TPanel
      Left = 364
    end
    inherited MELocaliza: TMaskEdit
      Left = 431
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 597
    Width = 515
  end
  object dbgSuspensaoProcessos: TDBGrid [6]
    Left = 5
    Top = 224
    Width = 505
    Height = 361
    DataSource = DMReinf.DSReinfSuspProcessoCons
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnCellClick = dbgSuspensaoProcessosCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_SUSPENSAO_R1070'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_IND_SUSPENSAO'
        Title.Caption = 'Cod. Suspens'#227'o Atribu'#237'do'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_SUSPENSAO'
        Title.Caption = 'Tipo Suspens'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_DECISAO'
        Title.Caption = 'Data Decis'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_DEPOSITO'
        Title.Caption = 'Deposito?'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_USUARIO'
        Title.Caption = 'Usu'#225'rio'
        Visible = True
      end>
  end
  object cbTipoSuspensao: TComboBox [7]
    Left = 8
    Top = 137
    Width = 417
    Height = 22
    ItemHeight = 14
    TabOrder = 3
    OnChange = cbTipoSuspensaoChange
    Items.Strings = (
      '01 Liminar em mandado de seguran'#231'a'
      '02 Dep'#243'sito Judicial do montante integral'
      '03 Dep'#243'sito administrativo do montante integral'
      '04 Antecipa'#231#227'o de tutela'
      '05 Liminar em medida cautelar'
      '08 Senten'#231'a em mandado de seguran'#231'a favor'#225'vel ao contribuinte'
      
        '09 Senten'#231'a em a'#231#227'o ordin'#225'ria favor'#225'v el ao contribuinte e confi' +
        'rmada pelo TRF'
      '10 Ac'#243'rd'#227'o do TRF favor'#225'vel ao contribuinte'
      '11 Ac'#243'rd'#227'o do STJ em recurso especial favor'#225'vel ao contribuinte'
      
        '12 Ac'#243'rd'#227'o do STF em recurso extraordin'#225'rio favor'#225'vel ao contrib' +
        'uinte'
      
        '13 Senten'#231'a 1'#170' inst'#226'ncia n'#227'o transitada em julgado com efeito su' +
        'spensivo'
      '90 Decis'#227'o definitiva a favor do contribuinte'
      '92 Sem suspens'#227'o da exigibilidade')
  end
  object dtpkDataDecisao: TDateTimePicker [8]
    Left = 8
    Top = 177
    Width = 145
    Height = 22
    Date = 44390.049210555550000000
    Time = 44390.049210555550000000
    TabOrder = 4
  end
  object dbcbTemDeposito: TDBCheckBox [9]
    Left = 168
    Top = 177
    Width = 97
    Height = 17
    Caption = 'Dep'#243'sito Integral'
    DataField = 'IND_DEPOSITO'
    DataSource = DSPrimario
    TabOrder = 5
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object dbeCodSuspensaoCont: TDBEdit [10]
    Left = 8
    Top = 96
    Width = 144
    Height = 22
    DataField = 'COD_IND_SUSPENSAO'
    DataSource = DSPrimario
    TabOrder = 6
  end
  inherited DSPrimario: TDataSource
    DataSet = DMReinf.QReinfSuspProcesso
  end
end
