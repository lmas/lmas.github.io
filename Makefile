
SRC=src
DST=docs
BUILDBRANCH=gh-pages

########################################################################################################################

.PHONY: buildblog
buildblog: clean
	./.scripts/buildblog $(SRC) $(DST)

.PHONY: serve
serve: clean buildblog
	python -m http.server --directory $(DST)

#.PHONY: edit
#edit:
#        mkdir --parents "$(BLOGDIR)/$(title)"
#        $(EDITOR) "$(BLOGDIR)/$(title)/post.md"

.PHONY: checkscripts
checkscripts:
	shellcheck .scripts/*

.PHONY: clean
clean:
	rm -rf $(DST)

########################################################################################################################

.PHONY: setupbranch
setupbranch: clean
	git switch --orphan $(BUILDBRANCH)
	mkdir -p $(DST)/news
	touch $(DST)/news/.gitkeep
	git add $(DST)
	git commit -m "Initializes build branch"
	@echo ""
	@echo "Done, don't forget to manually push the branch to your remote!"

