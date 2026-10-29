object FGraficoVendaVendedor: TFGraficoVendaVendedor
  Left = 11
  Top = 167
  Width = 998
  Height = 487
  Caption = 'Vendas por vendedor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBChart1: TDBChart
    Left = 0
    Top = 0
    Width = 985
    Height = 449
    BackWall.Brush.Color = clWhite
    Title.Brush.Color = clWhite
    Title.Brush.Style = bsClear
    Title.Color = clWhite
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -13
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      'Vendas por Vendedor')
    LeftAxis.Title.Angle = 0
    Legend.DividingLines.Style = psDot
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    BorderStyle = bsSingle
    Color = 14737632
    TabOrder = 0
    object Series1: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsPercent
      Marks.Visible = True
      DataSource = DMGrafico.QGraficoVendedor
      SeriesColor = clRed
      XLabelsSource = 'NOME'
      BarWidthPercent = 50
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'VAL_VENDAS'
    end
  end
  object DataSource1: TDataSource
    DataSet = DMGrafico.QGraficoVendedor
    Left = 8
    Top = 16
  end
end
