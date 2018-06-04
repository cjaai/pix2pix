from os import listdir
from PIL import Image

result = Image.new('RGBA',(1280,720))

files = [f for f in listdir() if f.endswith('.png')]

for file in files:
    print(file)
    i = file[16:18]
    j = file[19:21]
    k = int(i)
    l = int(j)
    print(k)
    print(l)
    im = Image.open(file)
    result.paste(im,box=(64*k,64*l))

result.save('result.png')
