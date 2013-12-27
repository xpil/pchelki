Attribute VB_Name = "Module1"
Option Explicit

Public Sub PokazAdresZaznaczenia(dokad As Excel.Range)
 Dim adres As String
 adres = Selection.Address
 dokad.Value = adres
End Sub
