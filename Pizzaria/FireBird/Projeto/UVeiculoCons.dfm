inherited FVeiculoCons: TFVeiculoCons
  Left = 290
  Top = 236
  Width = 690
  Height = 429
  Caption = 'Consulta Ve'#237'culos'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTopo: TPanel
    Width = 682
    Height = 88
    object Label1: TLabel [0]
      Left = 216
      Top = 32
      Width = 48
      Height = 13
      Caption = 'Par'#226'metro'
    end
    inherited BtnPesquisar: TBitBtn
      Left = 572
      Top = 53
      TabOrder = 2
    end
    object RgTipo: TRadioGroup
      Left = 8
      Top = 8
      Width = 185
      Height = 73
      Caption = 'Tipo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Placa'
        'Cor'
        'Modelo'
        'Marca'
        'C'#243'digo'
        'Chassi')
      TabOrder = 0
      OnClick = RgTipoClick
    end
    object MePesquisa: TMaskEdit
      Left = 216
      Top = 48
      Width = 273
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
  end
  inherited PnBotoes: TPanel
    Top = 358
    Width = 682
    inherited BtnGravar: TBitBtn
      Left = 468
    end
    inherited BtnCancelar: TBitBtn
      Left = 574
    end
  end
  inherited PnCorpo: TPanel
    Top = 88
    Width = 682
    Height = 270
    inherited PageControl1: TPageControl
      Width = 666
      Height = 253
      inherited TabSheet1: TTabSheet
        inherited DbGDados: TDBGrid
          Width = 658
          Height = 225
          Columns = <
            item
              Expanded = False
              FieldName = 'CODVEICULO'
              Title.Alignment = taRightJustify
              Title.Caption = 'C'#243'digo'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DSCVEICULO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 265
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANOFAB'
              Title.Alignment = taRightJustify
              Title.Caption = 'Ano Fab.'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANOMODELO'
              Title.Alignment = taRightJustify
              Title.Caption = 'Ano Modelo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CHASSI'
              Title.Alignment = taRightJustify
              Title.Caption = 'Chassi'
              Width = 196
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLACA'
              Title.Caption = 'Placa'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALORCOMPRA'
              Title.Alignment = taRightJustify
              Title.Caption = 'Vlr. Compra'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALORVENDA'
              Title.Alignment = taRightJustify
              Title.Caption = 'Vlr. Venda'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DSCCOR'
              Title.Caption = 'Cor'
              Width = 135
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DSCMARCA'
              Title.Caption = 'Marca'
              Width = 114
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODMARCA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CODCOR'
              Visible = False
            end>
        end
      end
    end
  end
  inherited QConsulta: TIBQuery
    SQL.Strings = (
      'select v.*, c.dsccor, m.dscmarca from TB_VEICULO v'
      'inner join tb_cor c on v.codcor = c.codcor'
      'inner join tb_marca m on v.codmarca = m.codmarca')
    object QConsultaCODVEICULO: TIntegerField
      FieldName = 'CODVEICULO'
      Origin = 'TB_VEICULO.CODVEICULO'
      Required = True
    end
    object QConsultaDSCVEICULO: TIBStringField
      FieldName = 'DSCVEICULO'
      Origin = 'TB_VEICULO.DSCVEICULO'
      Required = True
      Size = 80
    end
    object QConsultaCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
      Origin = 'TB_VEICULO.CODMARCA'
      Required = True
    end
    object QConsultaANOFAB: TIntegerField
      FieldName = 'ANOFAB'
      Origin = 'TB_VEICULO.ANOFAB'
      Required = True
    end
    object QConsultaANOMODELO: TIntegerField
      FieldName = 'ANOMODELO'
      Origin = 'TB_VEICULO.ANOMODELO'
      Required = True
    end
    object QConsultaPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'TB_VEICULO.PLACA'
      Size = 8
    end
    object QConsultaCODCOR: TIntegerField
      FieldName = 'CODCOR'
      Origin = 'TB_VEICULO.CODCOR'
      Required = True
    end
    object QConsultaVALORCOMPRA: TFloatField
      FieldName = 'VALORCOMPRA'
      Origin = 'TB_VEICULO.VALORCOMPRA'
      Required = True
      DisplayFormat = '#0.00'
    end
    object QConsultaVALORVENDA: TFloatField
      FieldName = 'VALORVENDA'
      Origin = 'TB_VEICULO.VALORVENDA'
      Required = True
      DisplayFormat = '#0.00'
    end
    object QConsultaDSCCOR: TIBStringField
      FieldName = 'DSCCOR'
      Origin = 'TB_COR.DSCCOR'
      Required = True
      Size = 80
    end
    object QConsultaDSCMARCA: TIBStringField
      FieldName = 'DSCMARCA'
      Origin = 'TB_MARCA.DSCMARCA'
      Required = True
      Size = 80
    end
    object QConsultaCHASSI: TIBStringField
      FieldName = 'CHASSI'
      Origin = 'TB_VEICULO.CHASSI'
      Required = True
      Size = 30
    end
  end
end
