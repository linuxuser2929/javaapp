FROM eclipse-temurin:17-jdk AS builder

WORKDIR /app

COPY /src .

RUN javac /src/Main.java

FROM eclipse-temurin:17-jre AS runner

WORKDIR /app

COPY --from=builder /app/* .class .

ENTRYPOINT ["java", "Main"]
