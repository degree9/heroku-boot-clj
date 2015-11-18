FROM degree9/heroku-boot-clj:latest

ENV BOOT_VERSION=2.4.2

RUN boot build

# this may work (untested)
ONBUILD ENTRYPOINT ["/usr/bin/boot", "repl"]
