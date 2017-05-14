
include <../config.scad>;
include <config.scad>;

module pot_bottom()
{
    bottom_y = pot_y - 2*material_z;

    translate([
        0,
        -bottom_y/2,
        0
        ])
    cube([
        pot_x - 2*material_z,
        bottom_y,
        material_z
        ], center=true);
}

pot_bottom();
