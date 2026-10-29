inherited FPneuCad: TFPneuCad
  Left = 503
  Top = 158
  Caption = 'Cadastro de Pneu'
  ClientHeight = 408
  ClientWidth = 448
  OnCreate = nil
  OnShow = nil
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Width = 448
    inherited sbEnviarSMS: TSpeedButton
      Left = 247
    end
    inherited lbPesquisaCodigo: TLabel
      Left = 308
    end
    inherited SBConsulta: TSpeedButton
      Left = 412
    end
    inherited pnSeparador2: TPanel
      Left = 296
    end
    inherited MELocaliza: TMaskEdit
      Left = 364
    end
  end
  inherited StBLongHint: TStatusBar
    Top = 389
    Width = 448
  end
  object PageControl1: TPageControl [3]
    Left = 0
    Top = 40
    Width = 449
    Height = 353
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Cabe'#231'alho'
      object Label3: TLabel
        Left = 14
        Top = 144
        Width = 80
        Height = 14
        Caption = 'N'#250'mero de S'#233'rie'
        FocusControl = DBEdit3
      end
      object Label7: TLabel
        Left = 335
        Top = 142
        Width = 81
        Height = 14
        Caption = 'N. Vezes Recap.'
        FocusControl = DBEdit7
      end
      object Label2: TLabel
        Left = 14
        Top = 104
        Width = 49
        Height = 14
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit2
      end
      object Label1: TLabel
        Left = 14
        Top = 8
        Width = 33
        Height = 14
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label4: TLabel
        Left = 84
        Top = 8
        Width = 62
        Height = 14
        Caption = 'Data Compra'
        FocusControl = DBEdit4
      end
      object DBPMarca: TDBPanel
        Left = 14
        Top = 191
        Width = 267
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        CodigoTabStop = True
        DataField = 'COD_MARCA_PNEU'
        DataSource = DSPrimario
        DefineByForm = DBPMarcaDefineByForm
        fkCache = False
        fkCampo = 'DESC_MARCA_PNEU'
        fkChave = 'COD_MARCA_PNEU'
        fkTabela = 'TB_MARCA_PNEU'
        ForeignKey = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        LCaption = 'Marca'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 20.000000000000000000
      end
      object DBEdit3: TDBEdit
        Left = 14
        Top = 160
        Width = 147
        Height = 22
        DataField = 'NUM_SERIE'
        DataSource = DSPrimario
        TabOrder = 3
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 176
        Top = 146
        Width = 145
        Height = 36
        Caption = 'Recapado'
        Columns = 2
        DataField = 'IND_RECAPAGEM'
        DataSource = DSPrimario
        Items.Strings = (
          'N'#227'o'
          'Sim')
        TabOrder = 4
        TabStop = True
        Values.Strings = (
          'NAO'
          'SIM')
      end
      object DBEdit7: TDBEdit
        Left = 333
        Top = 158
        Width = 67
        Height = 22
        DataField = 'NUM_VEZES_RECAPAGEM'
        DataSource = DSPrimario
        TabOrder = 5
      end
      object DBEdit2: TDBEdit
        Left = 14
        Top = 120
        Width = 419
        Height = 22
        DataField = 'DESC_DESCRICAO'
        DataSource = DSPrimario
        TabOrder = 2
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 13
        Top = 233
        Width = 264
        Height = 49
        Caption = 'Situa'#231#227'o'
        Columns = 3
        DataField = 'IND_SITUACAO'
        DataSource = DSPrimario
        Items.Strings = (
          'Ativado'
          'Desativado'
          'Descartado')
        TabOrder = 7
        TabStop = True
        Values.Strings = (
          'ATIVO'
          'DESATIVADO'
          'DESCARTADO')
      end
      object DBEdit1: TDBEdit
        Left = 14
        Top = 24
        Width = 57
        Height = 22
        TabStop = False
        Color = clBtnFace
        DataField = 'COD_PNEU'
        DataSource = DSPrimario
        Enabled = False
        TabOrder = 8
      end
      object DBEdit4: TDBEdit
        Left = 84
        Top = 24
        Width = 81
        Height = 22
        DataField = 'DT_COMPRA'
        DataSource = DSPrimario
        TabOrder = 0
      end
      object DBPFilial: TDBPanel
        Left = 14
        Top = 55
        Width = 267
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        CodigoTabStop = True
        DataField = 'COD_FILIAL'
        DataSource = DSPrimario
        DefineByForm = DBPFilialDefineByForm
        fkCache = False
        fkCampo = 'DESC_FILIAL'
        fkChave = 'COD_FILIAL'
        fkTabela = 'TB_FILIAL'
        ForeignKey = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        LCaption = 'Filial'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 20.000000000000000000
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Trocas'
      ImageIndex = 1
      object Label5: TLabel
        Left = 14
        Top = 8
        Width = 33
        Height = 14
        Caption = 'C'#243'digo'
        FocusControl = DBEdit5
      end
      object DBEdit5: TDBEdit
        Left = 14
        Top = 24
        Width = 57
        Height = 22
        TabStop = False
        Color = clBtnFace
        DataField = 'COD_PNEU'
        DataSource = DSPrimario
        Enabled = False
        TabOrder = 0
      end
      object DBPVeiculoPneuTroca: TDBPanel
        Left = 16
        Top = 224
        Width = 409
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        CodigoTabStop = True
        DataField = 'COD_VEICULO'
        DataSource = DMPneu.DSPneuTroca
        DefineByForm = DBPVeiculoPneuTrocaDefineByForm
        fkCache = False
        fkCampo = 'NUM_PLACA'
        fkChave = 'COD_VEICULO'
        fkTabela = 'TB_VEICULO'
        ForeignKey = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        LCaption = 'Ve'#237'culo'
        ReadOnly = False
        Required = True
        ValidateOnExit = False
        VisibleComponents = [dbpcCodigo, dbpcBusca, dbpcDescricao]
        WidthCodigo = 20.000000000000000000
      end
      object DBGPneuTroca: TDBGrid
        Left = 13
        Top = 51
        Width = 412
        Height = 129
        DataSource = DMPneu.DSPneuTroca
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_PNEU_TROCA'
            Title.Caption = 'C'#243'd.'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_VEICULO'
            Title.Caption = 'Cod. Veiculo'
            Width = 121
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_TROCA'
            Title.Caption = 'Data da troca'
            Visible = True
          end>
      end
      object DBSNPneuTroca: TDBNavigator
        Left = 104
        Top = 192
        Width = 195
        Height = 25
        DataSource = DMPneu.DSPneuTroca
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
        TabOrder = 2
      end
      object DBPDataPneuTroca: TDBPanel
        Left = 16
        Top = 264
        Width = 97
        Height = 37
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        CodigoTabStop = True
        DataField = 'DT_TROCA'
        DataSource = DMPneu.DSPneuTroca
        fkCache = False
        fkChave = 'DT_TROCA'
        ForeignKey = False
        LCaption = 'Data da troca'
        ReadOnly = False
        Required = False
        ValidateOnExit = False
        WidthCodigo = 20.000000000000000000
      end
      object DBREstadoPneuTroca: TDBRadioGroup
        Left = 128
        Top = 264
        Width = 193
        Height = 49
        Caption = 'Estado'
        Columns = 2
        DataField = 'IND_ESTADO'
        DataSource = DMPneu.DSPneuTroca
        Items.Strings = (
          'Novo'
          'Semi-novo'
          'Meia vida'
          'Gasto')
        TabOrder = 5
        Values.Strings = (
          '1'
          '2'
          '3'
          '4')
      end
    end
  end
  inherited MMCadSimples: TMainMenu
    Left = 277
    Top = 40
    inherited Relatrios1: TMenuItem
      object RelatriodePneus1: TMenuItem
        Caption = 'Relat'#243'rio de &Pneus'
        OnClick = RelatriodePneus1Click
      end
      object Trocas1: TMenuItem
        Caption = 'Trocas'
        OnClick = Trocas1Click
      end
    end
  end
  inherited DSPrimario: TDataSource
    DataSet = DMPneu.QPneuCad
    Left = 311
    Top = 40
  end
  inherited ILBotao: TImageList
    Left = 379
    Top = 40
  end
  inherited ALCadastro: TActionList
    Left = 413
    Top = 40
  end
  inherited IdHTTP1: TIdHTTP
    Left = 345
    Top = 40
  end
end
