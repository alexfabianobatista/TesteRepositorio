inherited FClienteCons: TFClienteCons
  Left = 361
  Top = 168
  Width = 622
  Height = 400
  Caption = 'Consulta de Clientes'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTopo: TPanel
    Width = 614
    Height = 88
    object Label1: TLabel [0]
      Left = 216
      Top = 32
      Width = 48
      Height = 13
      Caption = 'Par'#226'metro'
    end
    inherited BtnPesquisar: TBitBtn
      Left = 500
      Top = 53
      TabOrder = 2
    end
    object RgTipo: TRadioGroup
      Left = 8
      Top = 8
      Width = 185
      Height = 73
      Caption = 'Tipo'
      ItemIndex = 0
      Items.Strings = (
        'Alfab'#233'tica'
        'C'#243'digo'
        'Data Cadastro')
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
    Top = 329
    Width = 614
    inherited BtnGravar: TBitBtn
      Left = 400
    end
    inherited BtnCancelar: TBitBtn
      Left = 506
    end
  end
  inherited PnCorpo: TPanel
    Top = 88
    Width = 614
    Height = 241
    inherited PageControl1: TPageControl
      Width = 598
      Height = 224
      inherited TabSheet1: TTabSheet
        inherited DbGDados: TDBGrid
          Width = 590
          Height = 196
          Columns = <
            item
              Expanded = False
              FieldName = 'CODCLIENTE'
              Title.Alignment = taRightJustify
              Title.Caption = 'C'#243'digo'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 233
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_CADASTRO'
              Title.Caption = 'Cadastro'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_NASCIMENTO'
              Title.Caption = 'Nascimento'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dscendereco'
              Title.Caption = 'Endere'#231'o'
              Width = 212
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO'
              Title.Alignment = taRightJustify
              Title.Caption = 'N'#250'mero'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dscbairro'
              Title.Caption = 'Bairro'
              Width = 185
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dsccidade'
              Title.Caption = 'Cidade'
              Width = 212
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODENDERECO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CODBAIRRO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CODCIDADE'
              Visible = False
            end>
        end
      end
    end
  end
  inherited QConsulta: TIBQuery
    OnCalcFields = QConsClienteCalcFields
    SQL.Strings = (
      'Select * from tb_cliente')
    object QConsultaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'TB_CLIENTE.CODCLIENTE'
      Required = True
    end
    object QConsultaNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TB_CLIENTE.NOME'
      Required = True
      Size = 80
    end
    object QConsultaCPF: TIBStringField
      FieldName = 'CPF'
      Origin = 'TB_CLIENTE.CPF'
      Required = True
      Size = 12
    end
    object QConsultaRG: TIBStringField
      FieldName = 'RG'
      Origin = 'TB_CLIENTE.RG'
      Size = 12
    end
    object QConsultaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TB_CLIENTE.NUMERO'
      Required = True
    end
    object QConsultaCODENDERECO: TIntegerField
      FieldName = 'CODENDERECO'
      Origin = 'TB_CLIENTE.CODENDERECO'
      Required = True
    end
    object QConsultaCODBAIRRO: TIntegerField
      FieldName = 'CODBAIRRO'
      Origin = 'TB_CLIENTE.CODBAIRRO'
      Required = True
    end
    object QConsultaCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Origin = 'TB_CLIENTE.CODCIDADE'
      Required = True
    end
    object QConsultaDATA_NASCIMENTO: TDateTimeField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'TB_CLIENTE.DATA_NASCIMENTO'
    end
    object QConsultaDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Origin = 'TB_CLIENTE.DATA_CADASTRO'
      Required = True
    end
    object QConsultadscbairro: TStringField
      FieldKind = fkCalculated
      FieldName = 'dscbairro'
      Size = 80
      Calculated = True
    end
    object QConsultadsccidade: TStringField
      FieldKind = fkCalculated
      FieldName = 'dsccidade'
      Size = 80
      Calculated = True
    end
    object QConsultadscendereco: TStringField
      FieldKind = fkCalculated
      FieldName = 'dscendereco'
      Size = 80
      Calculated = True
    end
  end
end
