---
categories:
- Development
date: "2006-05-24T08:06:01Z"
published: true
tags:
- Delphi
- Graphics
- TCanvas
title: 'Delphi: Write multi-line text on a TCanvas'
---

I've had to do quite a bit of stuff with images in Delphi recently (lots
of manual drawing too), and discovered TCanvas' TextOut method will only
draw text onto one line, line breaks and newlines are ignored. Google
search results suggested Windows' DrawText function, however despite all
the formatting and alignment flags it takes, it refused to draw text
centred vertically.

Anyway, here's a small-ish procedure which will take your multi-line
text, and draw it centred on the canvas you pass it. You also need to
pass the width and height of the canvas you're drawing to. It assumes
the font can everything else has been set by you, prior to calling it.
Also, be sure "Graphics" is in your "uses" section.

```pascal
procedure multilineCanvasText(canvas: TCanvas; text: String; width, height: Integer);
var
  textSize: TSize;
  lines: TStringList;
  i, blockHeight: Integer;
begin
  // lazy man's way of splitting text by line into a list (split by #13#10)
  lines := TStringList.Create;
  lines.Text := text;

  // see how high our block of text is going to be, based on the font the canvas
  // currently has set
  textSize := canvas.TextExtent('LOZL!');
  blockHeight := textSize.cy * lines.Count;
  blockHeight := blockHeight;

  // go through each line and output it
  for i := 0 to lines.Count - 1 do
  begin
    // we need the width of each line, so we can center it on the canvas
    textSize := canvas.TextExtent(lines[i]);
    // render the text
    canvas.TextOut((width div 2) - (textSize.cx div 2),
                   (height div 2) - (blockHeight div 2) + (textSize.cy * i),
                   lines[i]);
  end;
  freeAndNull(lines);
end;
```
