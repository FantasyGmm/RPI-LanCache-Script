# -*- coding: utf-8 -*-
import os
import time
import Adafruit_SSD1306
import subprocess
from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont

def getRAMinfo():
    p = os.popen('free')
    i = 0
    while 1:
        i = i + 1
        line = p.readline()
        if i==2:
            return(line.split()[1:4])

disp = Adafruit_SSD1306.SSD1306_128_64(rst=None,i2c_address=0x3C)
disp.begin()
disp.clear()
disp.display()
width = disp.width
height = disp.height
image = Image.new('1', (width, height))
draw = ImageDraw.Draw(image)
font = ImageFont.load_default()
padding = -2
top = padding
bottom = height-padding
x = 0
while True:
    draw.rectangle((0,0,width,height), outline=0, fill=0)
    cmd = "top -bn1 | grep load | awk '{printf \"CPU Load: %.2f\", $(NF-2)}'"
    CPU = subprocess.check_output(cmd, shell = True )
    Temp = os.popen('vcgencmd measure_temp').readline()
    Temp = Temp.replace("temp=","").replace("'C\n","")
    CPU_Clock = os.popen('vcgencmd measure_clock arm').readline()
    CPU_Clock = round(int(CPU_Clock.replace("frequency(48)=",""))/1000/1000,1)
    RAM_stats = getRAMinfo()
    RAM_total = round(int(RAM_stats[0]) / 1000,1)
    RAM_used = round(int(RAM_stats[1]) / 1000,1)
    draw.text((x,top),"CPU Temp:" + Temp + "°C",font=font,fill=255)
    draw.text((x, top+10),CPU,font=font,fill=255)
    draw.text((x, top+20),"Memory:" + str(round(RAM_used/1024,2)) + "/" + str(round(RAM_total/1024,2)) + " GB",font=font,fill=255)
    draw.text((x,top+30),"CPU Clock:" + str(CPU_Clock) + " Ghz",font=font,fill=255)
    disp.image(image)
    disp.display()
    time.sleep(.1)
    pass