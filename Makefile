##=====================================================================
## WebSiteGenerator: a HTML websites generator. 
## Copyright 2018 Quentin Quadrat <lecrapouille@gmail.com>
##
## This file is part of WebSiteGenerator.
##
## WebSiteGenerator is free software: you can redistribute it and/or
## modify it under the terms of the GNU General Public License as
## published by the Free Software Foundation, either version 3 of the
## License, or (at your option) any later version.
##
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
##=====================================================================

#################################################################
# Root of the project
ROOT=..

#################################################################
# Default path storing generated websites
ifeq ($(BUILD),)
BUILD = $(ROOT)/build
endif

#################################################################
# Get automatically the list of website projects
# WEBSITES=$(shell find $(ROOT) -type d -exec test -e '{}'/Makefile.prj \; -print)

#################################################################
# Makefile rules to be called for each website
TOP_RULES=all clean

# Call the rule for all websites
.PHONY: $(TOP_RULES) $(WEBSITES)
$(TOP_RULES): $(WEBSITES)
$(WEBSITES):
	@$(MAKE) -f html-generator/Makefile.generic $(MAKECMDGOALS) CURDIR=$(ROOT)/$@ WB=html-generator B=$(BUILD)

#################################################################
# Display the list of websites
list:
	@echo "I found the following website projects:"
	@echo $(WEBSITES)

#################################################################
# Clean the project
veryclean:
	@rm -fr $(BUILD)
