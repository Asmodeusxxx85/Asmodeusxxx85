@@ -11,6 +11,11 @@ RENDER_COMMAND=$(VENVDIR)/bin/python3 build.py -j $(JOBS) -o $(OUTPUT_DIR)
html: venv
	$(RENDER_COMMAND)

## htmlview       to open the index page built by the html target in your browser
.PHONY: htmlview
htmlview: html
	$(PYTHON) -c "import os, webbrowser; webbrowser.open('file://' + os.path.realpath('build/index.html'))"

## dirhtml        to render PEPs to "index.html" files within "pep-NNNN" directories
.PHONY: dirhtml
dirhtml: venv rss
