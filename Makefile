all:
	./install.sh

uninstall:
	rm -rf release ;

clean:
	rm -rf vim

.PHONY: clean uninstall
