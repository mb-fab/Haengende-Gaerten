
include <../config.scad>;
use <beam.scad>;

spacing = 1;

// planar arrangement of all parts required for the wall
module parts()
{
    // middle supports
    translate([wall_x/2, support_z/2, 0])
    for (i=[0:support_count-1])
    {
        translate([0, i*(support_z + spacing), 0])
        rotate([90, 0, 0])
        wall_beam();
    }
}

color("brown")
base_material();
parts();
