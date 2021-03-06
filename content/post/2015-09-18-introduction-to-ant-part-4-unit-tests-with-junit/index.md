---
categories:
- Development
date: "2015-09-18T08:24:28Z"
split: true
published: true
tags:
- Tutorials
- Java
- Ant
title: 'Introduction to Ant Part 4: Unit Tests with JUnit'
---

{{< img src=2015-09-18-ant.png class="image-left" >}}Now that we have [dependency management with
Ivy]({{< relref "2015-08-07-introduction-to-ant-part-3-dependency-management-with-ivy" >}})
working along with everything else covered before, we've covered almost
everything required to start building *real* projects with Ant.

Another thing any *real* project should have, is unit tests. Thankfully,
using the scaffolding already put in place in earlier parts of this
series, integrating a [JUnit](http://junit.org/) testing task into our
existing build script is really straight-forward.

<!--more-->

The code for this part of the tutorial is [available on
GitHub](https://github.com/shrimpza/ant-tutorial/tree/master/part04). To
see what's new and changed, [this diff is quite
useful](https://github.com/shrimpza/ant-tutorial/commit/e893782d64e1a93453d0e8fd1b331cf86e9c9eb9).
I'll break down what's in that diff:

```xml
<!-- basic paths --> 
...
<property name="test.dir" location="test"/>
...
```

To start off, adding a new property to keep track of where the test
classes will live.

Your directory tree will look something like this:

```
  Project Root
   - src
     - yourpackage
       - YourClass.java
   - test
     - yourpackage
       - YourClassTest.java
```

```xml
...
<property name="build.test.dir" location="${build.dir}/test"/>
```

Similarly, the output directory for compiled/built test sources.

```xml
<path id="test.classpath">
    <fileset dir="${lib.dir}" includes="test/*.jar"/>
    <pathelement path="${build.test.dir}"/>
</path>
```

Defining a classpath dedicated to tests, which includes all
[Ivy](https://ant.apache.org/ivy/)-downloaded libraries for testing, as
well as th actual compiled test classes themselves.

It may not seem immediately useful to have a dedicated directory/path
for testing libraries, however before long, you'll likely come across
various libraries and frameworks (aside form JUnit itself) which assist
with and facilitate things like mocking, in-memory database testing,
etc., which you'll need to exclude from your distributable builds. It's
neater to manage these dependencies separately.

```xml
<!-- Build test classes -->
<target name="build-tests" depends="build" description="compile test source files">
    <mkdir dir="${build.test.dir}"/>

    <javac srcdir="${test.dir}" destdir="${build.test.dir}" includeantruntime="false" debug="on">
        <classpath refid="default.classpath"/>
        <classpath refid="test.classpath"/>
    </javac>
</target>
```

This looks nearly identical to [the `build` target defined back in part
1]({{< relref "2015-07-07-introduction-to-ant-part-1-a-basic-build" >}}),
with some changes to the variables used - this time making reference to
the test paths and properties.

It's also added the test
[classpath](https://ant.apache.org/manual/using.html#path) to the [javac
task](https://ant.apache.org/manual/Tasks/javac.html) in addition to the
`default.classpath` which will include the built contents of the main
`src` directory.

You may also note that this target depends on the `build` target - the
test classes will depend on the primary source files being built before
they can be.

```xml
<!-- Run tests -->
<target name="run-tests" depends="build-tests" description="run junit tests">
    <junit printsummary="yes" fork="yes" haltonfailure="no"
            errorproperty="tests.errors" failureproperty="tests.failures">
        <classpath refid="default.classpath"/>
        <classpath refid="test.classpath"/>

        <formatter type="plain" usefile="false"/>
        
        <batchtest>
            <fileset dir="${test.dir}">
                <include name="**/*Test.java"/>
            </fileset>
        </batchtest>
    </junit>
</target>
```

The build target which actually executes the [junit
task](https://ant.apache.org/manual/Tasks/junit.html) to run our test
cases.

A couple of attributes are being set here, but most importantly within
this particular script are `errorproperty` and `failureproperty`. Ant
will set properties with the names specified in the event of a test
error or failure. We can use these in the `test` target described below
to alter the behavior of the script based on what happened within the
tests.

The `formatter` element in use here is indicating we want plain-text
output, and it should only be printed to the console, rather than sent
to a file. Although I'm not using it in this particular script, a common
use-case would be to set the format `type` to `xml`, and use the `todir`
attribute of the `batchtest` element to have the test reports written to
XML files, which may then be presented as fancy HTML reports, usually by
a build server such as [Jenkins](http://jenkins-ci.org/), which is
incredibly useful.

Finally, we are using the `batchtest` tag to indicate we want to run a
*batch* of tests. The `fileset` provided is using the test source
directory we defined, and is only going to process test classes whose
name ends in `...Test.java`. This is useful since you may want to
include helper, utility and mock classes within the test sources path,
which typically JUnit would choke on, as it looks for tests in *all*
provided files within the `fileset` provided.

```xml
<!-- Run tests, exiting with status code 1 on error, or 2 on test failure -->
<target name="test" depends="run-tests" description="run junit tests, and fail the build on error or failure">
    <fail if="tests.errors" message="Error encountered while executing tests" status="1"/>
    <fail if="tests.failures" message="Tests failed" status="2"/>
</target>
```

The final change to `build.xml`, the actual `test` target itself.

Used in combination with the attributes passed to the `junit` task
defined in the `run-tests`, this target allows us to fail the build with
varying exit codes to allow automated build tools to react or report
differently, based on the outcome of the tests, without needing to parse
logs or the test reports. Mostly this is a convenience feature.

That's it for the `build.xml` changes, now a minor adjustment to
`ivy.xml` to download JUnit for us:

```xml
...
    <conf name="test" extends="default"/>
...

<dependencies>
    ...
    <!-- test dependencies -->
    <dependency org="junit" name="junit" rev="4.11" conf="test->default"/>
...
```

Pretty straight-forward, with the addition of the `test` configuration.
[Ivy
Configurations](https://ant.apache.org/ivy/history/latest-milestone/ivyfile/configurations.html)
offer a way of grouping different sets of dependencies for different
purposes. In our case, the `test` configuration can be used for all
test-related third-party dependencies, *including* JUnit itself! For
example if you were developing a database application, and wanted your
tests to run against an in-memory Derby database rather than something
external, you'd configure that dependency as part of the `test`
configuration, which would mean it would not be included in your
`default` libraries used by your (probably) redistributable code.

That's about all there is to it. You can now execute the following to
run unit tests in your project:

```sh
$ ant test
```

---

Other parts in this series:

- [Part 1: A Basic
Build]({{< relref "2015-07-07-introduction-to-ant-part-1-a-basic-build" >}})
- [Part 2: Runnable Jar
File]({{< relref "2015-07-11-introduction-to-ant-part-2-runnable-jar-file" >}})
- [Part 3: Dependency Management with
Ivy]({{< relref "2015-08-07-introduction-to-ant-part-3-dependency-management-with-ivy" >}})
