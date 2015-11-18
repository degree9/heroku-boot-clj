FROM heroku/jvm

# Install Boot

RUN apt-get update \
    && apt-get install -y wget \
    && wget -O /app/bin/boot https://github.com/boot-clj/boot-bin/releases/download/2.4.2/boot.sh \
    && chmod +x /app/bin/boot

# Boot ENV

ENV BOOT_HOME /app/.boot
ENV BOOT_AS_ROOT yes
ENV BOOT_LOCAL_REPO /app/m2
ENV BOOT_JVM_OPTIONS=-Xmx2g
ENV BOOT_VERSION 2.4.2
ENV BOOT_CLOJURE_VERSION 1.7.0

# download & install deps, cache REPL and web deps
RUN /usr/bin/boot web -s doesnt/exist repl -e '(System/exit 0)' && rm -rf target

ENTRYPOINT ["/app/bin/boot"]
