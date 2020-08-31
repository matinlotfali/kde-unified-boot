import aggdraw as aggdraw
from PIL import Image

size = (256, 8)
backgroundColor = 0x2a2a2b
foregroundColor = 0xffffff
transparent = 0x000000


def rounded_rectangle(draw, x,y, w, h, corner_radius, fill=None, outline=None):
    fill = aggdraw.Brush(fill)
    if w < corner_radius:
        corner_radius = w
    if h < corner_radius:
        corner_radius = h
    w = w+x
    h = h+y
    draw.rectangle((x, y + corner_radius, w, h - corner_radius), fill, outline)
    draw.rectangle((x + corner_radius, y, w - corner_radius, h), fill, outline)
    draw.pieslice([x, y, x + corner_radius * 2, y + corner_radius * 2], 180, 270, fill, outline)
    draw.pieslice([w - corner_radius * 2, h - corner_radius * 2, w, h], 0, 90, fill, outline)
    draw.pieslice([x, h - corner_radius * 2, x + corner_radius * 2, h], 90, 180, fill, outline)
    draw.pieslice([w - corner_radius * 2, y, w, y + corner_radius * 2], 270, 360, fill, outline)


for i in range(0,128):
    im = Image.new('RGBA', size, transparent)
    draw = aggdraw.Draw(im)
    rounded_rectangle(draw, 0,0,size[0], size[1], 2, backgroundColor)
    rounded_rectangle(draw, 0,0,i,       size[1], 1.5, foregroundColor)
    draw.flush()
    im.save('unified-bgrt/progress-'+str(i)+'.png')

