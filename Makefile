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
CP    := cp
RM    := rm -f

.DEFAULT_GOAL = git-status
REPOS_TARGETS = git-status git-push git-commit-amend git-tag-list git-diff \
				git-reset-soft git-rm-cached git-branch

# -----------------------------------------------------------------------------
.PHONY: clean

preview:
	open -a 'Google Chrome' ./index.html

open-the-page:
	open -a 'Google Chrome' 'http://127.0.0.1:$(PORT)/'

start-httpd:
	$(MAKE) open-the-page
	ruby -run -e httpd . -p $(PORT) 

start-server:
	$(MAKE) open-the-page
	jekyll server --watch -P $(PORT) -H 127.0.0.1

$(REPOS_TARGETS):
	$(MAKE) -f Repository.mk $@

diff push branch:
	@$(MAKE) git-$@
fix-commit-message: git-commit-amend
cancel-the-latest-commit: git-reset-soft
remove-added-file: git-rm-cached

clean:
	find . -name '.DS_Store' -type f -delete

