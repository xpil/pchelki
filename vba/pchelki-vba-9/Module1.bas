Attribute VB_Name = "Module1"

Option Explicit

Public Function szukaj(gdzie As Excel.Range, czego As String) As String
    Dim ret As Excel.Range
    Set ret = gdzie.Find(what:=czego)
    If ret Is Nothing Then
        szukaj = "Nie znaleziono '" & czego & "' w kom�r" & Switch(gdzie.Count = 1, "ce", True, "kach") & "[" & gdzie.Address & "]"
    Else
        szukaj = "Szukano '" & czego & "', znaleziono '" & ret.Value & "' w kom�rce [" & ret.Address & "]"
    End If
End Function
