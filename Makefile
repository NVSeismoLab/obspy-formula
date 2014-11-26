#
# makefile for installing obspy formula
#
SALTBASE = /srv/salt
SALTUSER = root
SALTMASTER = salt

.PHONY : install

install: 
	rsync --exclude=.git -vr obspy $(SALTBASE)

deploy: 
	rsync --exclude=.git -vr obspy $(SALTUSER)@$(SALTMASTER):$(SALTBASE)

