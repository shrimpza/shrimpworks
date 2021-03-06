---
categories:
- Development
date: "2015-07-11T10:26:27Z"
split: true
published: true
tags:
- Tutorials
- Java
- Ant
title: 'Introduction to Ant Part 2: Runnable Jar File'
---

{{< img src=2015-07-11-ant.png class="image-left" >}}
In part 1, we went over the basics of [using
Ant to create a redistributable `.jar`
file]({{< relref "2015-07-07-introduction-to-ant-part-1-a-basic-build" >}}),
suitable for use as a library in other projects. A lot of the time
however, you're probably going to want to be building things which can
actually be *run* as regular Java applications.

Once again, the [code for this tutorial is available in
GitHub](https://github.com/shrimpza/ant-tutorial/tree/master/part02).
More usefully, you may want to see the [diff between the part 1 script
and the new
one](https://github.com/shrimpza/ant-tutorial/commit/7425d635cfc68444e1abbc4b16ddf2ccb83337f0).

Here's a quick explanation of what we've done to achieve an executable
jar file:

<!--more-->

```xml
<!-- for a runnable jar file, add the main class name -->
<property name="main.class" value="net.shrimpworks.ant.Main"/>
```

Along with other common properties which may change from
project-to-project, I like to include the main class definition near the
top. This is simply the full class name of the class which holds your
`public static void main(...)` method.

When making non-runnable library projects, this may be left blank in the
future.

```xml
<jar ...>
    <manifest>
        <attribute name="Main-Class" value="${main.class}"/>
    </manifest>
    ....
</jar>
```

Here, we're telling the Ant [jar
task](https://ant.apache.org/manual/Tasks/jar.html) to create a custom
[Manifest file](https://ant.apache.org/manual/Tasks/manifest.html)
within the `.jar` file. The only attribute we need at this point, is to
tell it where to find our main class, stored in the `${main.class}`
property. This manifest will also expand in future revisions of this
build file as we delve into dependency management and introduce third
party libraries to our project.

That's all there is to this part. A quick `ant` in the project
directory, will yield an updated `.jar` file, which can be executed as
follows:

```sh
$ java -jar dist/hello-world.jar
```

---

Other parts in this series:

- [Part 1: A Basic
Build]({{< relref "2015-07-07-introduction-to-ant-part-1-a-basic-build" >}})
- [Part 3: Dependency Management with
Ivy]({{< relref "2015-08-07-introduction-to-ant-part-3-dependency-management-with-ivy" >}})
- [Part 4: Unit Tests with
JUnit]({{< relref "2015-09-18-introduction-to-ant-part-4-unit-tests-with-junit" >}})
