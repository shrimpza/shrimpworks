---
categories:
- Development
date: "2005-07-06T13:57:32Z"
published: true
tags: []
title: Explode and Implode for Delphi…
---

Since I'm bored at the moment, I might as well post some code :D

PHP has 2 nice functions, explode() which breaks a string into an array
using a separator, and implode() which takes an array and glues it back
into a single string using a separator. I use it regularly, so
eventually ended up needing one for Delphi too.

I cannot take full credit for the Explode function however, I found it
somewhere and can't for the life of me remember where that might be. It
is somewhat modified from the original though...

Also note that these work with TStrings, rather than arrays.

```pascal
function Explode(const str: string; const separator: string): TStrings;
var
  n: integer;
  p, q, s: PChar;
  item: string;
begin
  Result := TStringList.Create;
  try
    p := PChar(str);
    s := PChar(separator);
    n := Length(separator);
    repeat
      q := StrPos(p, s);
      if q = nil then q := StrScan(p, #0);
      SetString(item, p, q - p);
      Result.Add(item);
      p := q + n;
    until q^ = #0;
  except
    item := '';
    Result.Free;
    raise;
  end;
end;
```

```pascal
function Implode(const Strings: TStrings; const separator: string): String;
var
  i: Integer;
begin
  Result := Strings[0];
  for i := 1 to Strings.Count - 1 do
    Result := Result + separator + Strings[i];
end;
```
