
project_files = $(wildcard *.scad)

all: pot/pot.png pot2/pot2.png wall/wall.png cuts-hairline.svg

%.png: %.scad $(project_files)
	openscad $< --imgsize=1280,1024 --preview -o $@
	convert $@ -trim $@

projection.svg: projection.scad $(project_files)
	openscad $< -o $@

cuts-red.svg: projection.svg
	cat $< | replace "stroke=\"black\" fill=\"lightgray\"" "stroke=\"red\" fill=\"none\"" > $@

cuts-hairline.svg: cuts-red.svg
	cat $< | sed -e "s/stroke-width=\"\([0-9]*\.[0-9]*\)\"//g" -e "s/stroke=\"red\"/stroke=\"red\" stroke-width=\"0.1\"/g" > $@

clean:
	rm -fr *.png projection*.svg cuts*.svg

