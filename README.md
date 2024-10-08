# E-Commerce Microservice Architecture

![img17](https://github.com/user-attachments/assets/dbfdf67b-f3ac-45e0-9db0-0c6ab52961cc)

## Microservices
1. Inventory Service - This service is has APIs to fetch the products, manage the stock etc.
2. Order Service - This service is has APIs to create the orders, fetch orders which communicate with inventory service for product details.

## Discovery Service
In a microservices architecture, each microservice is a standalone application with specific business functionality. Since these microservices need to communicate with each other to function as a 
complete application, they need to know each other’s network locations. Discovery service comes into play here, maintaining a record of these services’ locations, helping them find each other, 
and enabling communication.

**Spring Cloud Eureka** - Eureka is a REST based service which is primarily used for acquiring information about services that you would want to communicate with. This REST service is also known as
Eureka Server. The Services that register in Eureka Server to obtain information about each other are called Eureka Clients.

### Implementation of discovery service
Discorvery service is a whole difference microservice so we need to create different spring boot project.
1. Dependencies - spring-cloud-starter-netflix-eureka-server
2. Add _@EnableEurekaServer_ annotation in the main class
3. application.properties - configure this service such that it do not reguster itself as a client. All other services (including API gateway) are the client of discovery service.

## API Gateway
APIs are a common way of communication between applications. In the case ofmicroservice architecture, there will be a number of services and the client has to know the hostnames of 
all underlying applications to invoke them. To simplify this communication, we prefer a component between client and server to manage all API requests called API Gateway. Additionally, 
we can have other features which include:
* Security — Authentication, authorization
* Routing — routing, request/response manipulation, circuit breaker
* Observability — metric aggregation, logging, tracing

### Implementation of discovery service
API Gateway is a whole difference microservice so we need to create different spring boot project.
* Dependencies - spring-cloud-starter-gateway, spring-cloud-starter-netflix-eureka-client
* Spring Cloud Gateway consists of 3 main building blocks:
1. Route - Think of this as the destination that we want a particular request to route to. It comprises of destination URI, a condition that has to satisfy — Or in terms of technical terms,
Predicates, and one or more filters.
2. Predicate - This is literally a condition to match. i.e. kind of “if” condition..if requests has something — e.g. path=blah or request header contains foo-bar etc.

`Predicates with path:` - Path=/api/v1/orders/**

`Predicates with Method:` - Method=GET

`Predicates with Header:` - Header=User-Agent, Mozilla/*

4. Filters - These are instances of Spring Framework WebFilter. This is where you can apply your magic of modifying request or response. There are quite a lot of out of
box WebFilter that framework provides.

filters:

`- AddRequestHeader=X-Request-Id, 12345`

`- AddResponseHeader=X-Response-id, abcd`

`- RedirectTo=302, https://youtube.com`

`- StripPrefix=1`

`- RemoveRequestHeader=Cookie`

## Open Feign
Spring Cloud OpenFeign is a declarative HTTP client library for building RESTful microservices. It integrates seamlessly with Spring Cloud and simplifies the development of HTTP clients 
by allowing you to create interfaces that resemble the API of the target service. It abstracts away much of the boilerplate code typically associated with making HTTP requests, 
making your codebase cleaner and more maintainable.

### Implementation of open feign
1. Dependencies - spring-cloud-starter-openfeign
2. Add _@EnableFeignClients_ annotation in the main class of service which will be making call to another service.
3. Create an interface to make API calls to another service and annotate it with _@FeignClient_

## API Gateway Filters
API Gateway filters are used to intercept, modify, and enhance requests and responses that pass through an API Gateway. They allow you to apply common cross-cutting concerns
(such as authentication, logging, rate limiting, and transformation) at a centralized entry point before routing requests to microservices. There are two types of filters:
1. Global Filters - applicable for all the request and response.
2. Route specific Filters(LoggingOrdersFilter in this project) - If we want to perform cross cutting concerns only for specific routes. Example - If we want to do logging when request is being made to specific service.

![img18](https://github.com/user-attachments/assets/c2245a2c-6904-484c-86ad-26a54de422fc)
![img19](https://github.com/user-attachments/assets/0660b2cd-ba70-4b21-83d0-45f8f54708a7)

## Config Server
Config Server is a dedicated service that acts as a centralized repository, allowing all microservices to retrieve their configurations dynamically at runtime. Config Server can manage different
environments (e.g., dev, test, prod) and profiles. This means that each environment can have its own set of properties (e.g., different databases or API keys)

### Implementation of config server
Config service is a whole difference microservice so we need to create different spring boot project.
1. Create a github repository and add all the required properties and yml files for all the services with proper naming convention.
2. Dependencies - spring-cloud-starter-config
3. Inside properties of all the services add path of config service to import the configuration. Example - config.import=configserver:http://localhost:8888
4. Add _@EnableConfigServer_ annotation in the main class.
5. Configure the properties file of config service to import the configuration from remote server.

![1_J7SMr1pE98CmMi8Yb2limg](https://github.com/user-attachments/assets/f8a448dd-253e-4881-bf0d-4c43bc8aa72b)
