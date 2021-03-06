---
categories:
- Random
date: "2015-06-29T19:23:53Z"
split: true
published: true
tags: []
title: Using FindBugs with Ant
---

{{< img src=buggy-sm.png class=image-left >}} I've been meaning to
do some posts on setting up a Java build process using Apache's
[Ant](https://ant.apache.org/) and [Ivy](https://ant.apache.org/ivy/),
but never really get that far.

I'm a fan of allowing build dependencies (beyond the actual Ant binary
itself) download automagically as part of the build, rather than
requiring the developer to download and install a bunch of different
tools and then orchestrating them via Ant. Essentially you should be
able to install Ant, grab the code of something you want to build, and
execute it.

To this end I have spend many hours trying to get the
[FindBugs](http://findbugs.sourceforge.net/) static analysis tool and
it's requirements downloaded as Ivy dependencies as is possible with
most tools, but gave up due to some rather weird and seemingly
hard-coded dependency paths and file names within the FindBugs project.

Therefore I gave up and just have it downloading using an [Ant "get"
task](https://ant.apache.org/manual/Tasks/get.html), which feels a bit
brute-force, but sometimes you need to compromise. Here's my solution,
presented as an all-in-one Ant target:

<!--more-->

```xml
<!-- NOTE: "dist" is a target that builds my project .jar file --replace it with your jar build target -->
<target name="findbugs" depends="dist">
    <mkdir dir="${build.reports.dir}"></mkdir>
    
    <!-- findbugs configuration -->
    <property name="findbugs.version" value="3.0.1"></property>
    <property name="findbugs.home" location="${ivy.home}/findbugs"></property>

    <!-- create findbugs home -->
    <mkdir dir="${findbugs.home}"></mkdir>
    
    <!-- download and unzip findbugs to findbugs home dir -->
    <!-- NOTE: you may need to change this mirror to something more local to you -->
    <get src="http://tenet.dl.sourceforge.net/project/findbugs/findbugs/${findbugs.version}/findbugs-${findbugs.version}.zip" 
         dest="${findbugs.home}/findbugs-${findbugs.version}.zip" usetimestamp="true" verbose="true"></get>

    <!-- unzip only the "lib" directory from the findbugs distribution, it's all that's needed -->
    <unzip src="${findbugs.home}/findbugs-${findbugs.version}.zip" dest="${findbugs.home}/lib">
        <patternset>
            <include name="**/lib/*"></include>
        </patternset>
        <mapper type="flatten"></mapper>
    </unzip>

    <!-- define classpath and findbugs task -->
    <path id="findbugs.classpath">
        <fileset dir="${findbugs.home}/lib/" includes="*.jar"></fileset>
    </path>
    <taskdef name="findbugs" classpathref="findbugs.classpath" classname="edu.umd.cs.findbugs.anttask.FindBugsTask"></taskdef>

    <!-- execute findbugs -->
    <!-- NOTE: change the path variables here to whatever your build script or project needs -->
    <findbugs home="${findbugs.home}" output="xml:withMessages" outputFile="${build.reports.dir}/findbugs.xml" nested="false">
        <auxclasspath path="${lib.dir}/default"></auxclasspath>
        <sourcepath path="${src.dir}"></sourcepath>
        <class location="${dist.dir}/${ant.project.name}.jar"></class>
    </findbugs>
</target>
```
