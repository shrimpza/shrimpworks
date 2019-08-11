---
layout: post
status: publish
published: true
title: Simple Java Value Objects
categories:
- Development
tags:
- Java
---

It's a really simple thing, but I've been using this simple "pattern" for 
defining simple value objects for years, and it has served me well.

While there's nothing particularly special about this style, I still see a 
significant amount of Java code needlessly following the 
[JavaBeans](https://en.wikipedia.org/wiki/JavaBeans) style, when
using these objects as Beans in the strict sense is not actually desired, 
intended, or required, and simply makes code needlessly verbose and leaves
objects implemented as Beans open to abuse due to leaving their internal state
open for mutation.

This pattern works well over traditional JavaBeans because:

 - it's immutable - invaluable for concurrent or multi-threaded applications
   where you don't want to give applications the ability to change values as
   they please
 - it's neat - due to being immutable, there's no need for superfluous 
   "setters", and if there are no setters, there's no need for "getters", so
   the code is dead simple and easy to work with 
 - it's portable - these objects are trivial to serialise using either Java
   Serialisation (or any of the preferable drop-in replacements), almost any
   serialisation library will be able to serialise them, and Jackson can 
   deserialise them without any additional code
 - due to all the above, they're also ideal for use as messages in event-driven
   systems

Here's an example of a simple object implemented in this style:

```java
import java.beans.ConstructorProperties;

public class User implements Serializable {
  private static final long serialVersionUID = 1L;

  public final String email;
  public final String name;
  public final Address address;

  @ConstructorProperties({ "email", "name", "address" })
  public User(String email, String name, Address address) {
    this.name = name;
    this.email = email;
    this.address = address;  
  }
}
```

This object is now serialisable and deserialisable via Java serialisation or
better alternatives such as 
[FST](https://github.com/RuedigerMoeller/fast-serialization) (just leave off
`Serializable` if you don't need that), as well as JSON serialisation libraries
such as Jackson or GSON.
