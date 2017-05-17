
project_files = $(wildcard *.scad)

all: model.png pot/pot.png pot2/pot2.png wall/wall.png pot2 wall

%.png: %.scad $(project_files)
	openscad $< --imgsize=1920,1280 --preview -o $@
	convert $@ -trim $@

.PHONY: pot2 wall
pot2:
	cd pot2 && make

wall:
	cd wall && make

clean:
	rm -fr *.png */*.png
	cd pot2 && make clean
	cd wall && make clean

