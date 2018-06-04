from os import listdir
from PIL import Image, ImageDraw, ImageFilter
import os

splitPath = "./facades_test/images/"
mergedPath = "./mergedPath/"

files = [f for f in listdir(splitPath) if f.endswith('outputs.png')]

def merge12():
  result = Image.new('RGBA',(1280,720))
  result2 = Image.new('RGBA',(1280,720))
  for file in files:
    i = file[16:18]
    j = file[19:21]
    k = int(i)
    l = int(j)
    pathFile = os.path.join(splitPath, file)
    im = Image.open(pathFile)
    result.paste(im,box=(64*k,64*l))
    
    if ((k % 2 == 0) and (l % 2 == 0)):
      im = Image.open(pathFile)
      im_crop = im.crop((64, 64, 192, 192))
      result2.paste(im_crop,box=(64*(k+1),64*(l+1)))
      
  result.save('./facades_test/merged1.png')  
  result2.save('./facades_test/merged2.png')


def merge3():
  im1 = Image.open('./facades_test/merged1.png')
  im2 = Image.open('./facades_test/merged2.png')

  im2 = im2.crop((64, 64, 64*18+64, 64*8+64))

  back_im = im1.copy()
  back_im.paste(im2, (64, 64))
  back_im.save('./facades_test/merged3.png')


def main():
  merge12()
  merge3()

main()
