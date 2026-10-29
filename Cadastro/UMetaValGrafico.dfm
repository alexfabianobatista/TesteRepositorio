object FMetaValGrafico: TFMetaValGrafico
  Left = 192
  Top = 136
  Width = 747
  Height = 499
  Caption = 'Metas por Valor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBChart2: TDBChart
    Left = 1
    Top = 0
    Width = 737
    Height = 465
    BackWall.Brush.Color = clWhite
    MarginBottom = 1
    MarginTop = 1
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -13
    Title.Font.Name = 'Times New Roman'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'Metas/Valor')
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    TabOrder = 0
    object Series2: TPieSeries
      Active = False
      Marks.ArrowLength = 8
      Marks.Transparent = True
      Marks.Visible = True
      DataSource = DMVendedor.QMetaValGrafico
      SeriesColor = clRed
      XLabelsSource = 'DESCRICAO'
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1.000000000000000000
      PieValues.Order = loNone
      PieValues.ValueSource = 'VALOR'
    end
    object Series4: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = True
      DataSource = DMVendedor.QMetaValGrafico
      SeriesColor = clGreen
      XLabelsSource = 'DESCRICAO'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      XValues.ValueSource = 'VALOR'
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'VALOR'
    end
  end
end
