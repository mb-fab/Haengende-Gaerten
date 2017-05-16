
include <../config.scad>;
use <beam.scad>;
use <side.scad>;

spacing = 1;

// planar arrangement of all parts required for the wall
module parts()
{
    // first side structure
    translate([foot_y_back, 0, 0])
    rotate([0, 90, 90])
    wall_side();

    // second side structure
    translate([
        foot_y + foot_y_front + spacing,
        0,
        0
        ])
    mirror()
    rotate([0, 90, 90])
    wall_side();

    // middle supports
    translate([2*foot_y + support_z, wall_x/2, 0])
    for (i=[0:support_count-1])
    {
        translate([i*(support_z + spacing), 0, 0])
        rotate([90, 0, 90])
        wall_beam();
    }
}

color("brown")
base_material();
parts();
