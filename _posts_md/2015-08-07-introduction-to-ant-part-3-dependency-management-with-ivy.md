--- layout: post status: publish published: true title: 'Introduction to
Ant Part 3: Dependency Management with Ivy' author: display\_name:
Shrimp login: shrimp email: shrimp@shrimpworks.za.net url:
http://shrimpworks.za.net/ author\_login: shrimp author\_email:
shrimp@shrimpworks.za.net author\_url: http://shrimpworks.za.net/
wordpress\_id: 829 wordpress\_url: http://shrimpworks.za.net/?p=829
date: '2015-08-07 10:20:45 +0200' date\_gmt: '2015-08-07 08:20:45 +0200'
categories: - Development tags: - Tutorials - Java - Ant ---

![](http://shrimpworks.za.net/wp-content/uploads/2015/08/102856-150x150.png){.alignleft
width="200" height="200"} So far, we've covered the basics of [creating
a re-distributable `.jar`
package](http://shrimpworks.za.net/2015/07/07/introduction-to-ant-part-1-a-basic-build/)
suitable for use as a library, and [building a Jar file which can be
run](http://shrimpworks.za.net/2015/07/11/introduction-to-ant-part-2-runnable-jar-file/)
by a user or server process.

A major part of any non-trivial application these days is the inclusion
and re-use of 3rd party libraries which implement functionality your
applications require. When a project starts, it's probably easy enough
to manually drop the odd `jar` library into a `lib` directory and forget
about it, but maintaining a large application which depends on many
libraries, which in turn depend on additional libraries for their own
functionality, it can quickly turn into a nightmare to manage.

To solve this problem, many dependency management tools have been
introduced, most notably, [Apache Maven](https://maven.apache.org/).
Maven however, is so much more than just a dependency management tool,
and is actually intended to manage your entire project structure. I
believe however, the combination of Ant and Ivy provides far more
flexibility, extensibility and control over your build and dependency
management processes.

So, let's integrate [Apache Ivy](https://ant.apache.org/ivy/) into our
Ant script as we left it in [part
2](http://shrimpworks.za.net/2015/07/11/introduction-to-ant-part-2-runnable-jar-file/).

[](){#more}[](){#more-829}

For starters, the [code for this part is available in
GitHub](https://github.com/shrimpza/ant-tutorial/tree/master/part03)
once again. I'll walk through the [diff of what's changed since part
2](https://github.com/shrimpza/ant-tutorial/commit/848679fdb39786f07fc9053fbeef2957fd8e1a6b).

As mentioned in my post on [FindBugs integration with
Ant](http://shrimpworks.za.net/2015/06/29/using-findbugs-with-ant/), I'm
a strong believer in the idea that a developer (or user) should be able
to check out or download a project's code and be able to build and start
working on the code with minimal time and effort investment. This is
especially useful in a work environment where you have many developers
working on projects, and time spent flapping around with setting up
build environments has a direct impact on timelines and team output.

To this end, our Ant script will be responsible for downloading and
configuring Ivy as part of the regular build process, meaning a new
developer or user simply has to get your code and have Ant installed -
all additional features and capabilities of the build process should be
"self maintaining". I believe this is another testament to Ant's
flexibility.

Let's go through the changes to our `build.xml` file since part 2:

**build.xml changes:**

``` {.prettyprint}
```

Start by adding the `ivy` XML namespace.

``` {.prettyprint}
    
```

Since we're going to be incorporating additional libraries into our
project, this is a new configuration option which we'll use to point to
where we want them stored. This will map to the `project-root/lib`
directory.

``` {.prettyprint}
    
        
        
    
```

Again, since we're incorporating additional libraries, the new `lib`
directory needs to be added to the class-path so dependencies can be
made use of at compile time. The new
[Fileset](https://ant.apache.org/manual/Types/fileset.html) tag is
pointing out the location of the "default" dependencies (more on what
"default" refers to later - see the explanation on the addition of the
`ivy.xml` file), and is including all `.jar` packages in that location.

``` {.prettyprint}
    
        
    
```

Defining another new class-path. As you'll see later on in the updated
`dist` build target, this is used to add libraries to our application's
manifest file (the manifest includes a list of all packages and paths to
include in the class-path).

``` {.prettyprint}
    
    
    
    
    
```

As the comment tag suggests, these are a couple of options used for
configuring Ivy usage.

Firstly, the version is defined as it's own variable. Later, this will
be built into a download URL, but defining it as a separate value makes
it easier to configure.

Then, the `ivy.home` property sets where the base path to where we want
Ivy to live. I've set this to the `.ant` directory in the user's home
directory.

`ivy.jar.dir` is where Ivy will be downloaded to, and `ivy.jar.file` is
the path to the actual `ivy.jar` file. Also note how the paths are built
up from various properties, so it can be quite easily customised.

Finally, `ivy.lib.dir` references the library directory, and is used as
the root target directory for dependencies Ivy downloads.

``` {.prettyprint}
    
    
        
        
    
```

Now that everything is set up and ready, Ivy itself can be downloaded.
The download operation is defined as it's own [build
target](https://ant.apache.org/manual/targets.html), so it can be
performed independently of everything else in the script (this is very
useful for testing), as well as be used as a dependency by targets which
actually use Ivy.

It starts by [creating the target
directory](https://ant.apache.org/manual/Tasks/mkdir.html) where the Ivy
library will be downloaded to, and then using [Ant's get
task](https://ant.apache.org/manual/Tasks/get.html) to perform a
download of the desired Ivy version, to the previously configured
download location. The `usetimestamp` attribute of the `get` task will
skip re-downloading the library on every build if it hasn't been
modified on the remote server.

``` {.prettyprint}
    
    
        
        
    
```

Again, a small target dedicated to a single function. This time, we need
to make Ant aware that an Ivy task is available, and this is done using
the [taskdef task](https://ant.apache.org/manual/Tasks/taskdef.html).
Another `path` is defined here as well, used to inform Ant where it may
find the task that is being defined.

``` {.prettyprint}
    
    
        
    
```

At last, we can use Ivy to download some dependencies! The `pattern`
attribute in the [retrieve
task](https://ant.apache.org/ivy/history/latest-milestone/use/retrieve.html)
tells Ivy where it should download *artefacts* ("libraries" and
associated source and javadoc packages) to. You can find out [more about
patterns in the Ivy
reference](https://ant.apache.org/ivy/history/latest-milestone/concept.html#patterns).

Note that the "`classifier`" place-holder does not appear to be
documented clearly anywhere, and refers to a Maven package classifier -
for example "sources" or "javadocs", which may accompany a library.

The end result of the `retrieve` task should end up (assuming some
dependencies have been defined) in a structure something like
`project-root/lib/default/some_lib-1.0.jar`.

``` {.prettyprint}
    
    
```

Change to the original `build` target, set to depend on the previously
described `ivy-resolve` task.

From this point, the target dependencies look something like the
following:

`build` (compile .java sources) depends on:

`ivy-resolve` (download libraries which will be needed to compile
sources), which depends on:

`ivy-init` (set up and define the Ivy tasks used to download), which in
turn depends on:

`ivy-download` (download Ivy library itself) before anything else.

``` {.prettyprint}
    
    
        

        
            
                
                
            
        

        
            
        

        
            
                
                
            
            
            
        
    
```

Here's the whole revised `dist` target, which has grown substantially. A
number of new elements have been added;

Firstly, the `mkdir` task has been updated to simply create the `/lib`
directory within the already-configured `${dist.dir}`. It makes parent
directories as needed, so we don't need a separate `mkdir` for each.

The addition of [the copy
task](https://ant.apache.org/manual/Tasks/copy.html) here copies all
*default* libraries (that is, not ones used for testing, coverage, or
other configurations - more on these kinds of configurations in another
episode). It's also explicitly excluding any javadoc or source packages
from the distributable files - you typically don't want to include these
in your distribution.

Another new addition is the `manifestclasspath`, which is referencing
the `dist.classpath` we defined earlier, to make sure that the contents
of the `dist/lib` directory are included in the runtime class-path. This
is referenced by a new `attribute` named `Class-Path` in the [`jar`
task](https://ant.apache.org/manual/Tasks/jar.html)'s `manifest`.

``` {.prettyprint}
        
```

Finally, since we created the `lib` directory as part of the build
process, we need to be sure to clean it up as part of the `clean`
target.

**New file: ivy.xml:**

At last, we arrive at the actual [Ivy
file](https://ant.apache.org/ivy/history/latest-milestone/ivyfile.html)
itself. Since we haven't explicitly declared an [Ivy resolve
task](https://ant.apache.org/ivy/history/latest-milestone/use/resolve.html)
pointing to a specific Ivy file (via the `file` attribute on the
`resolve` task), Ivy will by default use a file named `ivy.xml`, which
is what we're providing in this instance:

``` {.prettyprint}

    

    
        
    

    
        
        
        
    
```

Let's run through the file briefly:

First up,
[info](https://ant.apache.org/ivy/history/latest-milestone/ivyfile/info.html),
which describes some simple properties of the project. This is not
immediately useful to us, but will be for publishing artefacts, and more
intricate dependency management (where the `branch` and `status`
attributes prove particularly useful).

[Configurations](https://ant.apache.org/ivy/history/latest-milestone/ivyfile/configurations.html)
are one of the primary tools Ivy gives us for organising primarily the
dependencies used in different types of builds (for example if we're
running unit tests, we require additional dependencies which we don't
want included as part of our standard build - configurations allow us to
separate out these sorts of things), as well as artefact publishing. You
can [read a bit more about
Configurations](https://ant.apache.org/ivy/history/latest-milestone/concept.html#configurations).

In this case, the inclusion of the `configurations` is not strictly
required, since we're just redefining the `defalut` configuration, which
exists by default anyway. In another part of this series, it will get
much more useful.

At last, what we're actually after after all this, are [the dependencies
themselves](https://ant.apache.org/ivy/history/latest-milestone/ivyfile/dependencies.html).
There are many attributes which can be [defined per
dependency](https://ant.apache.org/ivy/history/latest-milestone/ivyfile/dependency.html)
within this collection. The key requirements are the `org`, `name` and
`rev`.

Often when reviewing the usage documentation for a 3rd party project you
want to use as a dependency, they will provide a Maven dependency,
containing the fields `groupId`, `artifactId` and `version`, which map
directly to Ivy's `org`, `name` and `rev`.

In fact, by default Ivy will download dependencies from the [Central
Maven Repository](https://search.maven.org/), giving you immediate
access to all the same content and libraries.

In my example, I'm downloading some simple [SLF4J](http://slf4j.org/)
resources which [my Main
class](https://github.com/shrimpza/ant-tutorial/blob/master/part03/src/net/shrimpworks/ant/Main.java)
requires to build.

**In Summary**

When you execute an `ant build` or `ant dist` now, the following actions
are going to take place:

1.  Ant will download the Ivy package if it doesn't exist or is out of
    date (`ivy-download`)
2.  Ivy's Ant task will be registered and made available (`ivy-init`)
3.  Dependencies will be resolved and downloaded (`ivy-resolve`)
4.  Source code will be compiled, with the downloaded dependencies on
    the class-path (`build`)
5.  Compiled source and downloaded libraries will be packaged for
    distribution (`dist`)

This step turned out significantly chunkier than expected, but hopefully
it makes sense and is digestible. What we have here is a fairly clean
and simple Ivy implementation, and we'll be building on top of this for
the next edition of this epic saga. In the mean time, I highly recommend
following some of the task and configuration elements I've linked
throughout this document, there are many fun and interesting knobs and
dials to play with.

------------------------------------------------------------------------

Other parts in this series:

[Part 1: A Basic
Build](http://shrimpworks.za.net/2015/07/07/introduction-to-ant-part-1-a-basic-build/)\
[Part 2: Runnable Jar
File](http://shrimpworks.za.net/2015/07/11/introduction-to-ant-part-2-runnable-jar-file/)\
[Part 4: Unit Tests with
JUnit](http://shrimpworks.za.net/2015/09/18/introduction-to-ant-part-4-unit-tests-with-junit/)
