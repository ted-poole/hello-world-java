FROM adlinktech/vortex-edge-java-dev:latest as builder
COPY src /build/src
COPY pom.xml /build/pom.xml
WORKDIR /build
RUN mvn package

FROM adlinktech/vortex-edge-java-run:latest
COPY --from=builder /build/target/hello-world-1.0.0.jar .
CMD ["/usr/bin/java", "-classpath", "hello-world-1.0.0.jar", "com.adlink.Hello"]

