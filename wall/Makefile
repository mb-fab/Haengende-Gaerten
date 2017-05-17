
project_files = $(wildcard *.scad ../*.scad)

all: beams.svg sides.svg

%.svg: $(project_files)
	openscad projection-$(basename $@).scad -o $(basename $@)-projection.svg
	cat $(basename $@)-projection.svg | replace "stroke=\"black\" fill=\"lightgray\"" "stroke=\"red\" fill=\"none\"" > $(basename $@)-red.svg
	cat $(basename $@)-red.svg | sed -e "s/stroke-width=\"\([0-9]*\.[0-9]*\)\"//g" -e "s/stroke=\"red\"/stroke=\"red\" stroke-width=\"0.1\"/g" > $(basename $@)-hairline.svg

clean:
	rm -fr *-projection.svg *-red.svg *-hairline.svg

