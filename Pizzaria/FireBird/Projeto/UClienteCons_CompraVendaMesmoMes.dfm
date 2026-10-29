inherited FClienteCons_CompraVendaMesmoMes: TFClienteCons_CompraVendaMesmoMes
  Left = 405
  Top = 159
  Width = 577
  Caption = 'Consulta Ve'#237'culos Comprados e Vendidos no Mesmo M'#234's'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnTopo: TPanel
    Width = 569
    object Label7: TLabel [0]
      Left = 16
      Top = 16
      Width = 50
      Height = 13
      Caption = 'M'#234's Inicial'
    end
    object Label1: TLabel [1]
      Left = 80
      Top = 16
      Width = 49
      Height = 13
      Caption = 'Ano Inicial'
    end
    object Label2: TLabel [2]
      Left = 176
      Top = 16
      Width = 45
      Height = 13
      Caption = 'M'#234's Final'
    end
    object Label3: TLabel [3]
      Left = 240
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Ano Final'
    end
    inherited BtnPesquisar: TBitBtn
      Left = 459
      TabOrder = 4
    end
    object MeMesIni: TMaskEdit
      Left = 16
      Top = 32
      Width = 32
      Height = 21
      EditMask = '!99;1;_'
      MaxLength = 2
      TabOrder = 0
      Text = '  '
    end
    object MeAnoIni: TMaskEdit
      Left = 80
      Top = 32
      Width = 65
      Height = 21
      EditMask = '!9999;1;_'
      MaxLength = 4
      TabOrder = 1
      Text = '    '
    end
    object MeMesFin: TMaskEdit
      Left = 176
      Top = 32
      Width = 31
      Height = 21
      EditMask = '!99;1;_'
      MaxLength = 2
      TabOrder = 2
      Text = '  '
    end
    object MeAnoFin: TMaskEdit
      Left = 240
      Top = 32
      Width = 65
      Height = 21
      EditMask = '!9999;1;_'
      MaxLength = 4
      TabOrder = 3
      Text = '    '
    end
  end
  inherited PnBotoes: TPanel
    Width = 569
    inherited BtnGravar: TBitBtn
      Left = 355
    end
    inherited BtnCancelar: TBitBtn
      Left = 461
    end
  end
  inherited PnCorpo: TPanel
    Width = 569
    inherited PageControl1: TPageControl
      Width = 553
      inherited TabSheet1: TTabSheet
        inherited DbGDados: TDBGrid
          Width = 545
          Columns = <
            item
              Expanded = False
              FieldName = 'CODVEICULO'
              Title.Alignment = taRightJustify
              Title.Caption = 'C'#243'digo'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DSCVEICULO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 235
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLACA'
              Title.Caption = 'Placa'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTCOMPRA'
              Title.Caption = 'Data Compra'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTVENDA'
              Title.Caption = 'Data Venda'
              Width = 72
              Visible = True
            end>
        end
      end
    end
  end
  inherited DsConsulta: TDataSource
    Left = 144
    Top = 192
  end
  inherited QConsulta: TIBQuery
    SQL.Strings = (
      
        'select e.codveiculo, e.dscveiculo, e.placa, v.dtvenda, c.dtcompr' +
        'a from tb_veiculo e'
      'inner join tb_venda v on e.codveiculo = v.codveiculo'
      'inner join tb_compra c on e.codveiculo = c.codveiculo'
      
        'where extract(month from v.dtvenda) = extract(month from c.dtcom' +
        'pra)'
      'and (v.dtvenda between :DATAINI and :DATAFIN)'
      'and (c.dtcompra between :DATAINI and :DATAFIN)'
      'order by e.codveiculo, e.dscveiculo')
    Left = 112
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIN'
        ParamType = ptUnknown
      end>
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
    object QConsultaPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'TB_VEICULO.PLACA'
      Size = 8
    end
    object QConsultaDTVENDA: TDateTimeField
      FieldName = 'DTVENDA'
      Origin = 'TB_VENDA.DTVENDA'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
    object QConsultaDTCOMPRA: TDateTimeField
      FieldName = 'DTCOMPRA'
      Origin = 'TB_COMPRA.DTCOMPRA'
      Required = True
      DisplayFormat = 'dd/MM/yyyy'
    end
  end
end
