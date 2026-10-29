inherited FBancoPixCons: TFBancoPixCons
  Left = 412
  Top = 181
  Width = 564
  Caption = 'Buscar Configura'#231#245'es Pix'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  inherited Label1: TLabel
    Width = 78
    Caption = 'Selecione o PSP'
  end
  inherited BtOk: TBitBtn
    Left = 458
  end
  inherited BtCancela: TBitBtn
    Left = 370
  end
  inherited BtProcurar: TBitBtn
    Left = 459
    OnClick = BtProcurarClick
  end
  inherited METexto: TMaskEdit
    Enabled = False
    Text = 'Banc'
    Visible = False
  end
  inherited DBGrid1: TDBGrid
    Width = 532
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_BANCO_AGENCIA_PIX'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_PSP_BANCO'
        Title.Caption = 'C'#243'digo PSP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CLIENT_ID'
        Title.Caption = 'Client ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CLIENT_SECRET'
        Title.Caption = 'Client Secret'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CONSUMER_KEY'
        Title.Caption = 'Consumer Key'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CONSUMER_SECRET'
        Title.Caption = 'Consumer Secret'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_DEVELOPER_APPLICATION_KEY'
        Title.Caption = 'Developer Application Key'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ACCOUNT_ID'
        Title.Caption = 'Account ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ARQUIVO_CHAVE_PRIVADA'
        Title.Caption = 'Arquivo Chave Primaria'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ARQUIVO_CERTIFICADO'
        Title.Caption = 'Arquivo Certificado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ARQUIVO_ROOT_CERTIFICADO'
        Title.Caption = 'Arquivo Certificado Root'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_SECRET_KEY'
        Title.Caption = 'Secret Key'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ACCESS_KEY'
        Title.Caption = 'Access Key'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ARQUIVO_PFX'
        Title.Caption = 'Arquivo PFX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_SENHA_PFX'
        Title.Caption = 'Senha PFX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ACCESS_TOKEN'
        Title.Caption = 'Access Token'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TOKEN'
        Title.Caption = 'Token'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_TOKEN_SANDBOX'
        Title.Caption = 'Token SandBox'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_MEDIATOR_FEE'
        Title.Caption = 'Mediator Fee'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_API_VERSION'
        Title.Caption = 'Vers'#227'o API'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_TIPO_AMBIENTE'
        Title.Caption = 'Tipo Ambiente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IND_PIX_PADRAO'
        Title.Caption = 'Padr'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_USUARIO'
        Visible = True
      end>
  end
  object cbPSPContaPix: TComboBox [7]
    Left = 8
    Top = 24
    Width = 193
    Height = 22
    ItemHeight = 14
    TabOrder = 5
    OnChange = cbPSPContaPixChange
  end
  inherited DSConsulta: TDataSource
    DataSet = DMBancoAgencia.QContaPixCons
    Left = 416
    Top = 65528
  end
  inherited PopupMenu1: TPopupMenu
    Left = 376
    Top = 65528
  end
end
