---
published: true
title: Units API
lang: [PHP]
description: Simple unit-of-measure conversion API
refs:
 - https://shrimpza.github.io/units-api/
---

> [Hosted on GitHub](https://shrimpza.github.io/units-api/)

Units of measure conversion API, based on the work done by 
[Units API for Drupal](https://www.drupal.org/project/unitsapi), though 
decoupled from Drupal and usable as a hosted service as well as a PHP library.

## Usage as a Hosted Service:

**Conversion Request:**

`GET http://host/convert.php?value=5&from=km&to=miles`

**Response:**

```json
{
  "from": {
    "value": "5",
    "unit": {
      "singular": "kilometer",
      "plural": "kilometers",
      "symbol": "km"
    }
  },
  "to": {
    "value": "3.107",
    "unit": {
      "singular": "mile",
      "plural": "miles",
      "symbol": "mi"
    }
  }
}
```

## Usage as a PHP Library:

```php
require_once('path/to/units-api/unitsapi.php');

$api = new UnitsAPI();

$result = $api->convert(5, 'kg', 'lb');

// $result is an associative array with the same structure as the HTTP JSON response
```