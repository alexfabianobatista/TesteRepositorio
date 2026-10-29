inherited FVendaCons: TFVendaCons
  Left = 387
  Top = 176
  Width = 749
  Caption = 'Consulta Vendas'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTopo: TPanel
    Width = 741
    object Label1: TLabel [0]
      Left = 304
      Top = 32
      Width = 48
      Height = 13
      Caption = 'Par'#226'metro'
    end
    object Label2: TLabel [1]
      Left = 440
      Top = 32
      Width = 48
      Height = 13
      Caption = 'Par'#226'metro'
      Visible = False
    end
    inherited BtnPesquisar: TBitBtn
      Left = 631
      TabOrder = 3
    end
    object RgTipo: TRadioGroup
      Left = 16
      Top = 8
      Width = 265
      Height = 73
      Caption = 'Tipo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Nome do Cliente'
        'Descri'#231#227'o do Ve'#237'culo'
        'Nome do Vendedor'
        'Entre Datas')
      TabOrder = 0
      OnClick = RgTipoClick
    end
    object MePesquisa: TMaskEdit
      Left = 304
      Top = 48
      Width = 273
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object MePesquisa2: TMaskEdit
      Left = 440
      Top = 48
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      Visible = False
    end
  end
  inherited PnBotoes: TPanel
    Width = 741
    inherited BtnGravar: TBitBtn
      Left = 527
    end
    inherited BtnCancelar: TBitBtn
      Left = 633
    end
  end
  inherited PnCorpo: TPanel
    Width = 741
    inherited PageControl1: TPageControl
      Width = 725
      inherited TabSheet1: TTabSheet
        inherited DbGDados: TDBGrid
          Width = 717
          Columns = <
            item
              Expanded = False
              FieldName = 'CODVENDA'
              Title.Alignment = taRightJustify
              Title.Caption = 'Venda'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODCLIENTE'
              Title.Alignment = taRightJustify
              Title.Caption = 'Cliente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMECLIENTE'
              Title.Caption = 'Nome Cliente'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODVEICULO'
              Title.Alignment = taRightJustify
              Title.Caption = 'Ve'#237'culo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DSCVEICULO'
              Title.Caption = 'Descri'#231#227'o Ve'#237'culo'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLACA'
              Title.Caption = 'Placa'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODVENDEDOR'
              Title.Alignment = taRightJustify
              Title.Caption = 'Vendedor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMEVENDEDOR'
              Title.Caption = 'Nome Vendedor'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTVENDA'
              Title.Caption = 'Data Venda'
              Width = 85
              Visible = True
            end>
        end
      end
    end
  end
  inherited DsConsulta: TDataSource
    Left = 56
    Top = 160
  end
  inherited QConsulta: TIBQuery
    SQL.Strings = (
      
        'Select v.*, c.nome as nomecliente, e.dscveiculo, e.placa, d.nome' +
        ' as nomevendedor from tb_venda v'
      'inner join tb_cliente c on v.codcliente = c.codcliente'
      'inner join tb_veiculo e on v.codveiculo = e.codveiculo'
      'inner join tb_vendedor d on v.codvendedor = d.codvendedor')
    Left = 24
    Top = 160
    object QConsultaCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
      Origin = 'TB_VENDA.CODVENDA'
      Required = True
    end
    object QConsultaCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
      Origin = 'TB_VENDA.CODVENDEDOR'
      Required = True
    end
    object QConsultaCODVEICULO: TIntegerField
      FieldName = 'CODVEICULO'
      Origin = 'TB_VENDA.CODVEICULO'
      Required = True
    end
    object QConsultaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'TB_VENDA.CODCLIENTE'
      Required = True
    end
    object QConsultaDTVENDA: TDateTimeField
      FieldName = 'DTVENDA'
      Origin = 'TB_VENDA.DTVENDA'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object QConsultaNOMECLIENTE: TIBStringField
      FieldName = 'NOMECLIENTE'
      Origin = 'TB_CLIENTE.NOME'
      Required = True
      Size = 80
    end
    object QConsultaDSCVEICULO: TIBStringField
      FieldName = 'DSCVEICULO'
      Origin = 'TB_VEICULO.DSCVEICULO'
      Required = True
      Size = 80
    end
    object QConsultaPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'TB_VEICULO.PLACA'
      Size = 8
    end
    object QConsultaNOMEVENDEDOR: TIBStringField
      FieldName = 'NOMEVENDEDOR'
      Origin = 'TB_VENDEDOR.NOME'
      Required = True
      Size = 80
    end
  end
end
