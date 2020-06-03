#!/usr/bin/env python
# coding: utf-8


from PIL import Image
import sys
import os
import re


def decodeImage1bit(image): # 像素rgb最低有效位1位
    pixels = list(image.getdata())  # 获得像素列表
    form = image.format # 获取文件格式
    if str(form) == "PNG":
        binary = ''.join([str(int(r>>1<<1!=r))+str(int(g>>1<<1!=g))+str(int(b>>1<<1!=b)) for (r,g,b,t) in pixels]) # 提取图片中所有最低有效位中的数据 # 提取图片中所有最低有效位中的数据
    elif str(form) == "BMP":
        binary = ''.join([str(int(r>>1<<1!=r))+str(int(g>>1<<1!=g))+str(int(b>>1<<1!=b)) for (r,g,b,t) in pixels]) 
    elif str(form) == "JPEG":
        binary = ''.join([str(int(r>>1<<1!=r))+str(int(g>>1<<1!=g))+str(int(b>>1<<1!=b)) for (r,g,b) in pixels]) 
    else:
        print("error")
        
    with open("binary.txt","w") as f:
        f.write(binary) 
    return binary

def decodeImage2bit(image):# 像素rgb最低有效位2位
    pixels = list(image.getdata())  # 获得像素列表
    form = image.format
    if str(form) == "PNG":
        binary = ''.join(['{:08b}'.format(r)[6:]+'{:08b}'.format(g)[6:]+'{:08b}'.format(b)[6:] for (r,g,b,t) in pixels]) # 提取图片中所有最低有效位中的数据 # 提取图片中所有最低有效位中的数据
    elif str(form) == "BMP":
        binary = ''.join(['{:08b}'.format(r)[6:]+'{:08b}'.format(g)[6:]+'{:08b}'.format(b)[6:] for (r,g,b,t) in pixels]) 
    elif str(form) == "JPEG":
        binary = ''.join(['{:08b}'.format(r)[6:]+'{:08b}'.format(g)[6:]+'{:08b}'.format(b)[6:] for (r,g,b) in pixels]) 
    else:
        print("error!")
        
    with open("binary.txt","w") as f:
        f.write(binary) 
    return binary

keywords = ("sjtu","sudo","command","gun","JNSLIQ")

def lexing_ascii():
    os.system("make clean")
    os.system("make")
    os.system("lexer.exe")
    with open("trivial.txt","r") as f:
        after_string=f.read()
        result= re.match("|".join(keywords),after_string)
        if result:
            print("String matched: "+result.group())
        else:
            print("No string matched")
    return result

# 打印字符串
#print(decodeImage1bit(Image.open("coffee.bmp")))
#print(decodeImage2bit(Image.open("coffee.jpg")))
#print(len(decodeImage2bit(Image.open("coffee.png"))))

# 输出文件
lexing_ascii()
decodeImage1bit(Image.open("coffee.jpg"))






