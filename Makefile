# sisimai.github.io/Makefile
#  __  __       _         __ _ _      
# |  \/  | __ _| | _____ / _(_) | ___ 
# | |\/| |/ _` | |/ / _ \ |_| | |/ _ \
# | |  | | (_| |   <  __/  _| | |  __/
# |_|  |_|\__,_|_|\_\___|_| |_|_|\___|
# -----------------------------------------------------------------------------
SHELL := /bin/sh
TIME  := $(shell date '+%s')
NAME  := sisimai.github.io
WGET  := wget -c
CURL  := curl -LOk
CHMOD := chmod
PORT  := 4401
GEM   := gem
CP    := cp
RM    := rm -f

.DEFAULT_GOAL = git-status
REPOS_TARGETS = git-status git-push git-commit-amend git-tag-list git-diff \
				git-reset-soft git-rm-cached git-branch
DEPENDENCIES  = jekyll-sitemap jekyll-redirect-from

# -----------------------------------------------------------------------------
.PHONY: clean

preview:
	open -a 'Google Chrome' ./index.html

open-the-page:
	open -a 'Google Chrome' 'http://localhost:$(PORT)/'

sitemap:
	open -a 'Google Chrome' 'https://www.xml-sitemaps.com'

start-server:
	jekyll clean
	jekyll server --watch -I -P $(PORT) -H 127.0.0.1 --config ./_config.yml

stop-server:
	kill -TERM `ps axu | grep 'jekyll server' | grep -v grep | awk '{ print $$2 }'`
	jekyll clean

restart-server:
	$(MAKE) stop-server
	sleep 1
	$(MAKE) start-server

depend:
	gem install $(DEPENDENCIES)

$(REPOS_TARGETS):
	$(MAKE) -f Repository.mk $@

diff push branch:
	@$(MAKE) git-$@
fix-commit-message: git-commit-amend
cancel-the-latest-commit: git-reset-soft
remove-added-file: git-rm-cached

clean:
	find . -name '.DS_Store' -type f -delete

