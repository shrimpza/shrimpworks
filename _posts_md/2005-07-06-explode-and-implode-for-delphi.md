--- layout: post status: publish published: true title: Explode and
Implode for Delphi… author: display\_name: Shrimp login: shrimp email:
shrimp@shrimpworks.za.net url: http://shrimpworks.za.net/ author\_login:
shrimp author\_email: shrimp@shrimpworks.za.net author\_url:
http://shrimpworks.za.net/ wordpress\_id: 30 wordpress\_url:
http://malcolm.shrimpworks.za.net/\~shrimp/blog/?p=30 date: '2005-07-06
13:57:32 +0200' date\_gmt: '2005-07-06 11:57:32 +0200' categories: -
Development tags: \[\] ---

Since I'm bored at the moment, I might as well post some code :D

PHP has 2 nice functions, explode() which breaks a string into an array
using a seperator, and implode() which takes an array and glues it back
into a single string using a seperator. I use it regularly, so
eventually ended up needing one for Delphi too.

I cannot take full credit for the Explode function however, I found it
somewhere and can't for the life of me remember where that might be. It
is somewhat modified from the original though...

Also note that these work with TStrings, rather than arrays.

``` {.prettyprint}
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

``` {.prettyprint}
function Implode(const Strings: TStrings; const separator: string): String;
var
  i: Integer;
begin
  Result := Strings[0];
  for i := 1 to Strings.Count - 1 do
    Result := Result + separator + Strings[i];
end;
```
