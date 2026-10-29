object FMetaKgGrafico: TFMetaKgGrafico
  Left = 269
  Top = 188
  Width = 745
  Height = 503
  Caption = 'Metas por KG'
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
  object DBChart1: TDBChart
    Left = 0
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
      'Metas/KG')
    LeftAxis.LabelsOnAxis = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    TabOrder = 0
    object Series1: TPieSeries
      Active = False
      Marks.ArrowLength = 0
      Marks.Style = smsValue
      Marks.Transparent = True
      Marks.Visible = True
      DataSource = DMVendedor.QMetaKGGrafico
      SeriesColor = clRed
      XLabelsSource = 'DESCRICAO'
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1.000000000000000000
      PieValues.Order = loNone
      PieValues.ValueSource = 'QUANTIDADE'
    end
    object Series3: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = True
      DataSource = DMVendedor.QMetaKGGrafico
      SeriesColor = clGreen
      XLabelsSource = 'DESCRICAO'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      XValues.ValueSource = 'QUANTIDADE'
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'QUANTIDADE'
    end
  end
end
