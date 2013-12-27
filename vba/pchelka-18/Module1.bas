Attribute VB_Name = "Module1"
Option Explicit
Public Sub AddGradient(rngFrom As Excel.Range, rngTo As Excel.Range, _
                        colFrom As Long, colTo As Long)

    If rngFrom.Row <> rngTo.Row Then
        MsgBox "rngFrom and rngTo have to be in the same row!", vbOKOnly + vbCritical
        End
    End If

    If rngFrom.Column = rngTo.Column Then
        MsgBox "rngFrom and rngTo have to be in different columns!", vbOKOnly + vbCritical
        End
    End If

    rngFrom.Interior.Color = colFrom
    rngTo.Interior.Color = colTo

    Dim rng As Excel.Range
    Dim diffR As Double, diffG As Double, diffB As Double
    Dim R As Integer, G As Integer, B As Integer

    diffR = (colTo Mod 256 - colFrom Mod 256) / (rngTo.Column - rngFrom.Column)
    diffG = (((colTo \ 256) Mod 256 - (colFrom \ 256) Mod 256)) / (rngTo.Column - rngFrom.Column)
    diffB = (colTo \ 65536 - colFrom \ 65536) / (rngTo.Column - rngFrom.Column)

    Set rng = rngFrom.Offset(0, 1)

    Do While rng.Column < rngTo.Column
        R = colFrom Mod 256 + diffR * (rng.Column - rngFrom.Column)
        G = (colFrom \ 256) Mod 256 + diffG * (rng.Column - rngFrom.Column)
        B = colFrom \ 65536 + diffB * (rng.Column - rngFrom.Column)
        rng.Interior.Color = RGB(R, G, B)
        Set rng = rng.Offset(0, 1)
    Loop
End Sub

