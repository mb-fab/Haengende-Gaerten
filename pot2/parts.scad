
include <../config.scad>;
include <config.scad>;
use <front+back.scad>;
use <side.scad>;
use <bottom.scad>;

spacing = 1;

module parts()
{
    translate([-pot_x/2, 0, 0])
    pot_bottom();

    translate([pot_x, 0, 0])
    rotate([0, 90, 0])
    pot_side();

    translate([2*pot_x, 0, 0])
    rotate([0, 90, 0])
    pot_side();

    translate([3*pot_x, 0, 0])
    rotate([90, 0, 0])
    pot_front();

    translate([4*pot_x + spacing, 0, 0])
    rotate([90, 0, 0])
    pot_back();
}

color("brown")
base_material();

parts();
