Attribute VB_Name = "Module1"
Enum Jablko
  ANTONOWKA
  MALINOWKA
  RENETA
  LOBO
  KOSZTELA
End Enum

Enum Pojazd
 Samochod = 10
 Autobus = 20
 Samolot = 30
 Balon = 40
 Rower = 50
 Deskorolka = 60
End Enum

Enum Naczynie
 Kubek = 1
 Miska
 Szklanka
 Talerz
 Wiadro
End Enum

Enum Kolor
 Bialy
 Czarny
 Brazowy
 Niebieski = 10
 Zielony
 Czerwony
 Zolty
End Enum

Dim j As Jablko

j = ANTONOWKA

Const ANTONOWKA = 0, MALINOWKA = 1, RENETA = 2, LOBO = 3, KOSZTELA = 4

j = 7

Enum Jablko
 [_Pierwszy]
 ANTONOWKA
 MALINOWKA
 RENETA
 LOBO
 KOSZTELA
 [_Ostatni]
End Enum

Function Walidacja(v As Jablko) As Boolean
 If (v > Jablko.[_Pierwszy] And v < Jablko.[_Ostatni]) Then
  Walidacja = True
 Else
  Walidacja = False
 End If
End Function

Enum FiltrAuta
 IloscDrzwi = 1
 Przebieg = 2
 Marka = 4
 Model = 8
 RodzajPaliwa = 16
 TypNadwozia = 32
 RodzajSkrzyniBiegow = 64
 Kolor = 128
 Rocznik = 256
End Enum

Dim a As FiltrAuta
a = RodzajPaliwa Or Model

If a And FiltrAuta.RodzajSkrzyniBiegow Then
' tutaj blok kodu wykonuj¹cy siê je¿eli do filtra wybrano rodzaj skrzyni biegów
End If
