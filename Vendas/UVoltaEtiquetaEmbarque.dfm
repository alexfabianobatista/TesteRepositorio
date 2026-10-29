object FVoltaEtiquetaEmbarque: TFVoltaEtiquetaEmbarque
  Left = 298
  Top = 188
  Width = 347
  Height = 208
  VertScrollBar.Position = 25
  Caption = 'Volta Etiqueta Embarque'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 80
    Width = 39
    Height = 13
    Caption = 'Etiqueta'
  end
  object Label2: TLabel
    Left = 99
    Top = 80
    Width = 37
    Height = 13
    Caption = 'Produto'
  end
  object Label3: TLabel
    Left = 8
    Top = -17
    Width = 48
    Height = 13
    Caption = 'Embarque'
  end
  object Label4: TLabel
    Left = 13
    Top = 31
    Width = 33
    Height = 13
    Caption = 'Pedido'
  end
  object MEVoltaEtiqueta: TMaskEdit
    Left = 1
    Top = 98
    Width = 94
    Height = 21
    TabOrder = 0
    OnExit = MEVoltaEtiquetaExit
  end
  object EdVoltaEtiqueta: TEdit
    Left = 96
    Top = 98
    Width = 236
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 176
    Top = 127
    Width = 75
    Height = 25
    Caption = '&Sair'
    TabOrder = 2
    TabStop = False
    OnClick = BitBtn1Click
    Kind = bkClose
  end
  object BtConfirma: TButton
    Left = 72
    Top = 127
    Width = 75
    Height = 25
    Caption = 'Confirma'
    TabOrder = 3
    OnClick = BtConfirmaClick
  end
  object MEEmbarque: TMaskEdit
    Left = 8
    Top = 0
    Width = 76
    Height = 21
    TabOrder = 4
    OnExit = MEEmbarqueExit
  end
  object MePedido: TMaskEdit
    Left = 8
    Top = 48
    Width = 76
    Height = 21
    TabOrder = 5
    OnExit = MePedidoExit
  end
  object EdEmbarque: TEdit
    Left = 87
    Top = 0
    Width = 231
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object EdPedido: TEdit
    Left = 85
    Top = 48
    Width = 233
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object CpLeitor: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    OnRxChar = CpLeitorRxChar
    Left = 312
  end
end
