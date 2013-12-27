# komentarze w Pythonie wstawiamy w ten sposób. Nie ma tutaj komentarzy blokowych (/* ... */) znanych z C

import math, time
# biblioteka math będzie potrzebna do wyliczenia pierwiastka kwadratowego
# biblioteka time przyda się do zmierzenia czasu wykonywania programu

start = time.clock()
# zapamiętujemy czas rozpoczęcia obliczeń

primes = [2, 3]
# inicjalizujemy tablicę primes dwiema początkowymi liczbami pierwszymi.
# Oczywiście można by tu wstawić więcej liczb, oszczędzając w ten sposób trochę obliczeń.
# Ale jesteśmy leniwi, więc wstawiamy tylko dwie: dwójkę i trójkę.
# Pozostałe liczby będą się w tej tablicy pojawiać sukcesywnie
# w miarę wykonywania programu.

candidate = max(primes) + 2
# pierwszy kandydat na liczbę pierwszą to największa z dotychczas znanych liczb pierwszych + 2.
# Czyli w tym przypadku 5.

while candidate <= 1000000:
# otwieramy pętlę główną, iterującą po kandydatach mniejszych od miliona

  ix = 0
  # ustawiamy indeks na zero (na pierwszym elemencie tablicy primes, czyli na dwójce)

  sqrt_candidate = math.sqrt(candidate)
  # wyliczamy i zapamiętujemy pierwiastek kwadratowy z bieżącego kandydata. W pierwszej iteracji będzie to
  # pierwiastek z 5 czyli dwa z hakiem

  while primes[ix] <= sqrt_candidate and candidate % primes[ix] != 0:
  # otwieramy pętlę wewnętrzną, iterującą po potencjalnych dzielnikach pierwszych bieżącego kandydata,
  # od dwójki aż do pierwiastka z kandydata
    ix += 1
    # w tej pętli wewnętrznej jest tylko jedna linijka, zwiększająca indeks dzielnika.
    # Pętla zakończy się, kiedy znajdziemy dzielnik, lub kiedy żaden z potencjalnych dzielników
    # nie dzieli kandydata bez reszty

  if primes[ix] > sqrt_candidate:
  # po wyjściu z pętli sprawdzamy czy dzielnik znajdujący się pod indeksem ix
  # jest większy od pierwiastka z kandydata
    primes.append(candidate)
    # jeżeli tak, kandydat jest liczbą pierwszą, dodajemy go do tablicy primes

  candidate += 2
  # kolejny kandydat jest o 2 większy od poprzedniego. Tutaj kończy się pętla zewnętrzna

elapsed = time.clock() - start
# wyliczamy czas, jaki upłynął od rozpoczęcia obliczeń do chwili obecnej

print("%d primes calculated in %.3f seconds" % (len(primes), elapsed))
# wypisujemy czas wykonania oraz liczbę znalezionych liczb pierwszych na standardowe wyjście

primes.reverse()
# odwracamy tablicę z wyliczonymi liczbami pierwszymi

print(primes[1:100])
# z odwróconej tablicy wypisujemy pierwszych sto elementów
# można by wypisać wszystkie, ale komu by się chciało przeglądać 78498 liczb...