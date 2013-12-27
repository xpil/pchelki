import itertools
min_len, letters_in, words_filename = (7, "apanelecnonglhye", r'c:\Users\admin\Downloads\wordlist\2of4brif.txt')
cmb=[]
for i in range(min_len,len(letters_in)):
    for c in itertools.combinations(list(letters_in), i):
        cmb.append(''.join(sorted(''.join(c))))
f = open(words_filename)
words = f.read().split(sep="\n")
f.close()
wordsl = words[:]
for i, wrd in enumerate(wordsl): wordsl[i] = ''.join(sorted(wrd))
i_sect = set(cmb).intersection(wordsl)
results = []
for i, comb in enumerate(i_sect): results.append(words[wordsl.index(comb)])
results.sort(key=len, reverse=True)
print(results)