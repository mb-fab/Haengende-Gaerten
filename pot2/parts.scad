
include <../config.scad>;
include <config.scad>;
use <front+back.scad>;
use <side.scad>;
use <bottom.scad>;

spacing = 1;

module parts()
{
    translate([pot_x/2, material_z, 0])
    // mirror because we have the laminated surface facing down during lasercutting
    mirror([0, 1, 0])
    pot_bottom();

    y_side1 = pot_y + pot_z - material_z + spacing;
    translate([0, y_side1, 0])
    rotate([0, 90, 90])
    pot_side();

    y_side2 = y_side1 + (hook_width+hook_round_top_z)*2 + spacing;
    translate([0, y_side2, 0])
    rotate([0, 90, -90])
    mirror([0, 1, 0])
    pot_side();

    y_front = y_side2 + pot_z + spacing;
    translate([pot_x/2, y_front, 0])
    rotate([90, 0, 0])
    pot_front();

    y_back = y_front + pot_z + hook_width + spacing;
    translate([pot_x/2, y_back, 0])
    rotate([90, 0, 0])
    pot_back();
}

color("brown")
base_material();

translate([hook_width+material_z/2, 0, 0])
parts();
