---
layout: post
status: publish
published: true
title: Dump an array of data to CSV with PHP
date: '2005-08-02 15:59:22 +0200'
categories:
- Development
tags: []
---

Ok, so this is such an insanely simple thing to do. I once tried looking
for a PHP class or package which could write Excel .xls files from data
in an array. Well, I found a really ugly class which simply saved a .csv
file as .xls. Anyway, I ended up writing my own 4-line function for
that:

```php
function arrayToCSV($data) {
    $csv = implode(',', array_keys($data[0])) . '\r\n';
    for ($i = 0; $i < count($data); $i++) {
        $csv .= implode(',', $data[$i]) . '\r\n';
    }
    return $csv;
}
```

You'll have to do your own validation for empty arrays and things
elsewhere. It returns a string with each record from the array on it's
own line, seperated by commas. `$data` is expected in a format something
like this:

```php
$data[] = array('name' => 'Bob', 'age' => 12);
$data[] = array('name' => 'Jack', 'age' => 15);
```

Which looks something like this: `print_r($data)`:

```php
Array
(
    [0] => Array
        (
            [name] => Bob
            [age] => 12
        )
    [1] => Array
        (
            [name] => Jack
            [age] => 15
        )
)
```

If you're using ADODB, you can use this little function to convert the
recordset to a suitable array (there are some built-in functions to
convery recordsets to arrays, but they all end up giving you pretty
useless data).

```php
function rsToArray($rs) {
    $arr = array();
    while (!$rs->EOF) {
        $arr[] = $rs->GetRowAssoc(False);
        $rs->MoveNext();
    }
    return $arr;
}
```
