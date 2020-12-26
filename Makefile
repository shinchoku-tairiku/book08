SATYSFI:=./scripts/run-docker.sh
PDFTOOLS:=./scripts/run-pdf-tools.sh

BOOK_NAME:=shinchoku-tairiku-08.pdf

.PHONY: book
book: build
	$(PDFTOOLS) pdftk A=cover.pdf B=main.pdf cat A B output $(BOOK_NAME)
	$(PDFTOOLS) exiftool -Title='進捗大陸08' -Author='@yutopp,@no_maddo,@pocketberserker,@youxkei' -Producer='SATySFi' -Creator='SATySFi' -overwrite_original $(BOOK_NAME)

.PHONY: build
build: .satysfi/dist/fonts
	$(SATYSFI) src/main.saty -o main.pdf

.satysfi/dist/fonts:
	./scripts/install-fonts.sh fonts.txt .satysfi

.PHONY: clean-fonts
clean-fonts:
	rm -rf .satysfi/dist/fonts/

.PHONY: check
check: .satysfi/dist/fonts
	$(SATYSFI) --debug-show-overfull src/main.saty -o check.pdf
