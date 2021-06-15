
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
	bin/dumblog -out=www/ update src/

.PHONY: demo
demo: blog
	bin/dumblog web

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
