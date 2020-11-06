---
categories:
- Development
date: "2020-11-06"
published: true
tags:
- Java
title: Use Java's built-in HTTP Server for Mocking
---

Frequently while implementing HTTP API or other HTTP clients, you want to be 
able to test your client implementation against an actual HTTP service, 
which helps validate that your headers are set correctly, body is serialised
appropriately, and responses are parsed as expected.

This can be done through the use of various additional libraries and mocking 
frameworks, however I'd argue that for most use cases, something that can 
simply validate and respond to an HTTP request is more than enough.

For such cases, the example below achieves just that. I find this much quicker
and easier to set up, requiring no additional dependencies or learning of a new
DSL, and test setup, execution and teardown are _at least_ a factor of 3-4 
times faster for the same test suite. 

```java
import com.sun.net.httpserver.HttpServer;

public class MyAPIClientTest {
	private static final int PORT = 56897;

	private HttpServer server;

	@BeforeEach
	public void before() throws IOException {
		this.server = HttpServer.create(new InetSocketAddress("127.0.0.1", PORT), 0);
		this.server.setExecutor(Executors.newSingleThreadExecutor());
		this.server.start();
	}

	@AfterEach
	public void after() {
		this.server.stop(0);
	}

	@Test
	public void shouldGetBalance() {
		// test setup - define expectations, set up expected response
		this.server.createContext("/za/pb/v1/accounts/172878438321553632224/balance", e -> {
			try {
				assertEquals(e.getRequestMethod(), "GET");
				assertEquals(e.getRequestHeaders().getFirst("Authorization"), "Bearer Ms9OsZkyrhBZd5yQJgfEtiDy4t2c");

				// JSON.toBytes() is a simple wrapper around a Jackson writeValueAsBytes() call
				byte[] result = JSON.toBytes(Map.of(
						"data", Map.of(
								"accountId", "172878438321553632224",
								"currentBalance", BigDecimal.valueOf(28857.76),
								"availableBalance", BigDecimal.valueOf(98857.76),
								"currency", "ZAR"
						),
						"links", Map.of("self", "/za/pb/v1/accounts/172878438321553632224/balance"),
						"meta", Map.of("totalPages", 1)
				));
				e.sendResponseHeaders(200, result.length);
				e.getResponseBody().write(result);
			} finally {
				e.close();
			}
		});
    
		// run test using my client against the API
		MyClient client = new MyClient("127.0.0.1", PORT);
		Balance = client.getBalance("172878438321553632224");
		// validate response client gathered, etc...
    }
}
```

As you can see, we've simply set up an expectation based on URL and method, 
validated that the `Authorization` was provided as expected, and then 
constructed a suitable response in the format the upstream API should be 
providing.

In place of the constructed API response I've used here, one could also easily
place the contents of real or documented example API responses directly into
the response, for your client to consume.