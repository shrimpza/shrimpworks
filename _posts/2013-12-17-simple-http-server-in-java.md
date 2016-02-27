---
layout: post
status: publish
published: true
title: Simple HTTP Server in Java
date: '2013-12-17 21:28:42 +0200'
categories:
- Development
tags:
- Java
- HTTP
- Service
---

Some thing I've been using for a while, and which recently became useful
at work as well, is a simple HTTP service written in plain Java with
existing JRE functionality, using an
[HttpServer](http://docs.oracle.com/javase/7/docs/jre/api/net/httpserver/spec/com/sun/net/httpserver/HttpServer.html).

Here's a simple "main()" which sets up two basic "pages", a root (/) and
one which echoes your browser's request headers (/headers/).

``` {.prettyprint}
public class SimpleHTTPService {

    public static void main(String[] args) throws IOException {
        HttpServer server = HttpServerProvider.provider().createHttpServer(new InetSocketAddress(8080), 0);

        server.createContext("/", new HttpHandler() {
            @Override
            public void handle(HttpExchange he) throws IOException {
                byte[] output = "Hello world!".getBytes();
                he.sendResponseHeaders(200, output.length);
                he.getResponseBody().write(output);
            }
        });

        server.createContext("/headers", new HttpHandler() {
            @Override
            public void handle(HttpExchange he) throws IOException {
                StringBuilder result = new StringBuilder("Request Headers");
                for (Entry< String, List< String>> header : he.getRequestHeaders().entrySet()) {
                    result.append(String.format("%s", header.getKey()));
                    for (String val : header.getValue()) {
                        result.append(String.format("%s", val));
                    }
                    result.append("");
                }

                byte[] output = result.toString().getBytes();
                he.sendResponseHeaders(200, output.length);
                he.getResponseBody().write(output);
            }
        });

        server.setExecutor(Executors.newCachedThreadPool());

        server.start();

        System.out.println("HTTP Listening on port " + server.getAddress().getPort());
    }
}
```

Running this as-is will allow you to load up the URLs
`http://localhost:8080/` and `http://localhost:8080/headers/` and see
some output generated by the two registered contexts.

I've defined simple anonymous inner class contexts here, as it's easy to
play with, but obviously you can go wild and develop proper structures
for these.

Combined with something like [FreeMarker](http://freemarker.org/), and
you've got a pretty neat way to deploy simple stand-alone HTTP
applications written in Java with minimal external dependencies.

It's also extremely useful for creating mock-ups services for use in
unit tests for HTTP clients.