@@@ -1,16 +1,21 @@
# Builds PEP files to HTML using sphinx
PYTHON=python3
VENVDIR=.venv
JOBS=8
OUTPUT_DIR=build
RENDER_COMMAND=$(VENVDIR)/bin/python3 build.py -j $(JOBS) -o $(OUTPUT_DIR)
## html           to render PEPs to "pep-NNNN.html" files
.PHONY: html
html: venv
	$(RENDER_COMMAND)

## htmlview       to open the index page built by the html target in your browser
.PHONY: htmlview
htmlview: html
	$(PYTHON) -c "import os, webbrowser; webbrowser.open('file://' + os.path.realpath('build/index.html'))"

## dirhtml        to render PEPs to "index.html" files within "pep-NNNN" directories
.PHONY: dirhtml
dirhtml: venv rss
	$(RENDER_COMMAND) --build-dirs
## fail-warning   to render PEPs to "pep-NNNN.html" files and fail the Sphinx build on any warning
.PHONY: fail-warning
fail-warning: venv
	$(RENDER_COMMAND) --fail-on-warning
## check-links    to check validity of links within PEP sources
.PHONY: check-links
check-links: venv
	$(RENDER_COMMAND) --check-links
## rss            to generate the peps.rss file
.PHONY: rss
rss: venv
	$(VENVDIR)/bin/python3 generate_rss.py -o $(OUTPUT_DIR)
## clean          to remove the venv and build files
.PHONY: clean
clean: clean-ven
