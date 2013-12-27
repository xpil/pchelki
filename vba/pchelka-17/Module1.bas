Attribute VB_Name = "Module1"
Sub CreateTextBoxAtCell(r As Excel.Range)
 Dim s As Excel.Worksheet, tb As Shape
 Set s = ThisWorkbook.ActiveSheet
 Set tb = s.Shapes.AddShape(msoShapeRound1Rectangle, r.Left, r.Top, r.Width, r.Height)
 tb.TextEffect.Text = r.Value
 tb.TextEffect.FontBold = r.Font.Bold
 tb.TextEffect.FontItalic = r.Font.Italic
 tb.TextEffect.FontName = r.Font.Name
 tb.TextEffect.FontSize = r.Font.Size
 tb.Fill.ForeColor.RGB = r.Interior.Color
 tb.Visible = msoCTrue
End Sub
