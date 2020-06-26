PREFIX:=/usr/local
JUPYTER_PREFIX:=/usr/local

# guix patches desktop files itself
install: startjupyterlab org.psychnotebook.jupyterlab.desktop
	install -d $(PREFIX)/bin $(PREFIX)/share/applications
	install -m 755 startjupyterlab $(PREFIX)/bin/
	install -m 644 -D org.psychnotebook.jupyterlab.desktop $(PREFIX)/share/applications/

startjupyterlab: startjupyterlab.in
	m4 -DJUPYTER_PREFIX=$(JUPYTER_PREFIX) < $< > $@

