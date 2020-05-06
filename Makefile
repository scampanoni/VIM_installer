all:
	./install.sh

uninstall:
	rm -rf release enable ;

clean:
	rm -rf vim

.PHONY: clean uninstall
