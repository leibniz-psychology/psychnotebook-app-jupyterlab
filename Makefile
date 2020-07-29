PREFIX:=/usr/local
JUPYTER_PREFIX:=/usr/local

# guix patches desktop files itself
install: startjupyterlab org.psychnotebook.jupyterlab.desktop jupyterlab.svg
	install -d $(PREFIX)/bin $(PREFIX)/share/applications $(PREFIX)/share/icons/hicolor/scalable/apps/
	install -m 755 startjupyterlab $(PREFIX)/bin/
	install -m 644 -D org.psychnotebook.jupyterlab.desktop $(PREFIX)/share/applications/
	install -m 644 -D jupyterlab.svg $(PREFIX)/share/icons/hicolor/scalable/apps/

startjupyterlab: startjupyterlab.in
	m4 -DJUPYTER_PREFIX=$(JUPYTER_PREFIX) < $< > $@

