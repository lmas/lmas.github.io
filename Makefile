
.PHONY: shasum
shasum:
	sha256sum -b bin/* > .sha256sum

.PHONY: verify
verify:
	sha256sum --strict -c .sha256sum

.PHONY: feeds
feeds:
	bin/feedloggr -conf .feedloggr.yaml

.PHONY: blog
blog:
	bin/dumblog update src/

.PHONY: demo
demo: blog
	bin/dumblog web

.PHONY: clean
clean:
	rm -r public/
