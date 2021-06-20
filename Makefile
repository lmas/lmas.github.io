
DUMBLOG=./bin/dumblog -out=www/
FEEDLOG=./bin/feedloggr -conf .feedloggr.yaml
BLOGDIR=./src/blog/2021

.PHONY: shasum
shasum:
	sha256sum -b bin/* > .sha256sum

.PHONY: verify
verify:
	sha256sum --strict -c .sha256sum

.PHONY: feeds
feeds:
	${FEEDLOG}

.PHONY: blog
blog:
	${DUMBLOG} update src/

.PHONY: demo
demo: blog
	${DUMBLOG} web

.PHONY: edit
edit:
	mkdir --parents "$(BLOGDIR)/$(title)"
	$(EDITOR) "$(BLOGDIR)/$(title)/post.md"

.PHONY: clean
clean:
	rm -r www/

####################################################################################################

.PHONY: prebuild
prebuild:
	git config --local user.name "Gull-Bot"
	git config --local user.email "gull-bot@larus.se"
	git checkout origin/build -- www/

.PHONY: postbuild
postbuild:
	git checkout build
	git add --all www/
	git commit -m "Auto build"

.PHONY: deploybuild
deploybuild:
	git push
	curl --silent "${DEPLOY_URL}"

.PHONY: buildfeeds
buildfeeds: prebuild feeds postbuild deploybuild

.PHONY: buildblog
buildblog: prebuild blog postbuild deploybuild
