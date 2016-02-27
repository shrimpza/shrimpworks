---
layout: post
status: publish
published: true
title: Heavy Delphi cracksmoking
date: '2006-03-03 17:32:28 +0200'
categories:
- Development
tags: []
---

As we all know, PNG images are so much cooler than BMP images.
Especially with alpha channels.

A while ago, I found this [rather spiffy PNG library for
Delphi](http://pngdelphi.sf.net/), which allows you to load PNG files
into a TPicture or similar, complete with alpha channels. Generally, it
works simplest with TImage, however being a TGraphic subclass, you can
do all sorts of drawing and everything else on it.

ANYWAY, I wanted to be able to use these things on buttons (standard
TSpeedButton and TBitBtn), however their Glyph property is a TBitmap,
preventing us from doing a simple Button.Glyph.LoadFromfile and loaging
a PNG file. The other option is to load up the PNG on it's own with a
TPNGObject, and assign it to the glyph property, however the alpha gets
buggered.

So I came up with a crackful work-around (as I'm finding 90% of all
Delphi coding is):

```pascal
procedure pngGlyph(Btn: TControl; Img: String);
var
    PNG: TPNGObject;
    BMP: TBitmap;
begin
    PNG := TPNGObject.Create;
    BMP := TBitmap.Create;

    try
        PNG.LoadFromFile('path\to\glyphs\'+Img+'.PNG');   // Update the path to your .png files, or update this to get them somewhere else.

        BMP.Width := PNG.Width;
        BMP.Height := PNG.Height;
        BMP.Canvas.Brush.Style := bsSolid;
        BMP.Canvas.Brush.Color := clBtnFace;
        BMP.Canvas.FillRect(Rect(0, 0, PNG.Width, PNG.Height));
        BMP.Canvas.Draw(0, 0, PNG);
        BMP.Canvas.Pixels[0, BMP.Height-1] := clBtnFace;

        if (Btn is TSpeedButton) then
            (Btn as TSpeedButton).Glyph.Assign(BMP);
        if (Btn is TBitBtn) then
            (Btn as TBitBtn).Glyph.Assign(BMP);
    finally
        PNG.Free;
        BMP.Free;
    end;
end;
```

To use it, you call it like `pngGlyph(SpeedOrBitButton, 'glyphname');`,
and the procedure will hack your button's glyph into something that
looks nice. You can use fully alpha-enabled PNG files, and they *should*
look right.

Of corse it would be better to create a new button type with this
procedure inside that, so you don't have to call this for every button
you want to add a PNG to, but I don't really feel like re-adding a
million buttons, it's quicker for me to do a million procedure calls :).
