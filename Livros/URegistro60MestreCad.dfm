inherited FRegistro60MestreCad: TFRegistro60MestreCad
  Left = 373
  Top = 173
  Caption = 'Arquivo Magn'#233'tico - Tipo 60 Mestre / Anal'#237'tico'
  ClientHeight = 358
  ClientWidth = 582
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 582
  end
  inherited StBLongHint: TStatusBar
    Top = 339
    Width = 582
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 41
    Width = 582
    Height = 298
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Mestre'
      object Label1: TLabel
        Left = 56
        Top = 16
        Width = 33
        Height = 14
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 56
        Top = 56
        Width = 65
        Height = 14
        Caption = 'Data Emiss'#227'o'
        FocusControl = DBEdit2
      end
      object Label6: TLabel
        Left = 352
        Top = 16
        Width = 140
        Height = 14
        Caption = 'Cont. Ordem Opera'#231#227'o Inicial'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 352
        Top = 56
        Width = 136
        Height = 14
        Caption = 'Cont. Ordem Opera'#231#227'o Final'
        FocusControl = DBEdit7
      end
      object Label8: TLabel
        Left = 352
        Top = 96
        Width = 81
        Height = 14
        Caption = 'Cont. Redu'#231#227'o Z'
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 352
        Top = 136
        Width = 116
        Height = 14
        Caption = 'Cont. Rein'#237'cio Opera'#231#227'o'
        FocusControl = DBEdit9
      end
      object Label10: TLabel
        Left = 352
        Top = 176
        Width = 88
        Height = 14
        Caption = 'Valor Venda Bruta'
        FocusControl = DBEdit10
      end
      object Label11: TLabel
        Left = 352
        Top = 216
        Width = 109
        Height = 14
        Caption = 'Valor Totalizador Geral'
        FocusControl = DBEdit11
      end
      object Label5: TLabel
        Left = 200
        Top = 56
        Width = 37
        Height = 14
        Caption = 'Modelo '
        FocusControl = DBEdit5
      end
      object DBEdit1: TDBEdit
        Left = 56
        Top = 32
        Width = 89
        Height = 22
        Color = clBtnFace
        DataField = 'COD_REGISTRO_MESTRE'
        DataSource = DSPrimario
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 56
        Top = 72
        Width = 137
        Height = 22
        DataField = 'DT_HORA_EMISSAO_RZ'
        DataSource = DSPrimario
        TabOrder = 1
      end
      object DBEdit6: TDBEdit
        Left = 352
        Top = 32
        Width = 144
        Height = 22
        DataField = 'NUM_COO_INI'
        DataSource = DSPrimario
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 352
        Top = 72
        Width = 144
        Height = 22
        DataField = 'NUM_COO_FIN'
        DataSource = DSPrimario
        TabOrder = 5
      end
      object DBEdit8: TDBEdit
        Left = 352
        Top = 112
        Width = 144
        Height = 22
        DataField = 'NUM_CONTADOR_REDUCAOZ'
        DataSource = DSPrimario
        TabOrder = 6
      end
      object DBEdit9: TDBEdit
        Left = 352
        Top = 152
        Width = 144
        Height = 22
        DataField = 'NUM_REINICIO_OPRERACAO'
        DataSource = DSPrimario
        TabOrder = 7
      end
      object DBEdit10: TDBEdit
        Left = 352
        Top = 192
        Width = 144
        Height = 22
        DataField = 'VAL_VENDA_BRUTA'
        DataSource = DSPrimario
        TabOrder = 8
      end
      object DBEdit11: TDBEdit
        Left = 352
        Top = 232
        Width = 144
        Height = 22
        DataField = 'VAL_TOTAL_GERAL'
        DataSource = DSPrimario
        TabOrder = 9
      end
      object GbEquipamento: TGroupBox
        Left = 56
        Top = 104
        Width = 193
        Height = 105
        Caption = 'Equipamento'
        TabOrder = 3
        object Label3: TLabel
          Left = 8
          Top = 16
          Width = 80
          Height = 14
          Caption = 'N'#250'mero de S'#233'rie'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 8
          Top = 56
          Width = 43
          Height = 14
          Caption = 'Nr. Caixa'
          FocusControl = DBEdit4
        end
        object DBEdit3: TDBEdit
          Left = 8
          Top = 32
          Width = 177
          Height = 22
          DataField = 'DESC_SERIE'
          DataSource = DSPrimario
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 8
          Top = 72
          Width = 57
          Height = 22
          DataField = 'NUM_SEQUENCIAL'
          DataSource = DSPrimario
          TabOrder = 1
        end
      end
      object DBEdit5: TDBEdit
        Left = 200
        Top = 72
        Width = 49
        Height = 22
        DataField = 'DESC_MODELO'
        DataSource = DSPrimario
        TabOrder = 2
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Anal'#237'tico'
      ImageIndex = 1
      object Label12: TLabel
        Left = 16
        Top = 16
        Width = 33
        Height = 14
        Caption = 'C'#243'digo'
        FocusControl = DBEdit12
      end
      object Label15: TLabel
        Left = 16
        Top = 56
        Width = 87
        Height = 14
        Caption = 'ST / Aliquota ICMS'
        FocusControl = DBEdit15
      end
      object Label16: TLabel
        Left = 16
        Top = 96
        Width = 116
        Height = 14
        Caption = 'Valor Acumulado Parcial'
        FocusControl = DBEdit16
      end
      object DBEdit12: TDBEdit
        Left = 16
        Top = 32
        Width = 144
        Height = 22
        Color = clBtnFace
        DataField = 'COD_REGISTRO_ANALITICO'
        DataSource = DsAnalitico
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit15: TDBEdit
        Left = 16
        Top = 72
        Width = 60
        Height = 22
        DataField = 'IND_SITUACAO_TRIBUTARIA'
        DataSource = DsAnalitico
        TabOrder = 1
      end
      object DBEdit16: TDBEdit
        Left = 16
        Top = 112
        Width = 113
        Height = 22
        DataField = 'VLR_ACUMULADO_TOTAL_PARCIAL'
        DataSource = DsAnalitico
        TabOrder = 2
      end
      object DBGrid1: TDBGrid
        Left = 192
        Top = 48
        Width = 369
        Height = 209
        DataSource = DsAnalitico
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_REGISTRO_ANALITICO'
            Title.Alignment = taRightJustify
            Title.Caption = 'C'#243'digo'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IND_SITUACAO_TRIBUTARIA'
            Title.Caption = 'ST / Aliquota ICMS'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_ACUMULADO_TOTAL_PARCIAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor Acumulado Parcial'
            Width = 140
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 192
        Top = 16
        Width = 369
        Height = 25
        DataSource = DsAnalitico
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
        TabOrder = 4
      end
    end
  end
  inherited MMCadSimples: TMainMenu
    inherited Relatrios1: TMenuItem
      object RelatrioECFPerodo1: TMenuItem
        Caption = 'Relat'#243'rio ECF Per'#237'odo'
        OnClick = RelatrioECFPerodo1Click
      end
    end
    object Operao1: TMenuItem
      Caption = 'Opera'#231#227'o'
      object CadastrarreduoZ1: TMenuItem
        Caption = '&Cadastrar redu'#231#227'o Z'
        OnClick = CadastrarreduoZ1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMLivroFiscal.QTipo60Mestre
  end
  object DsAnalitico: TDataSource
    DataSet = DMLivroFiscal.QTipo60Analitico
    Left = 536
    Top = 40
  end
end
