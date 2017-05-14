
include <../config.scad>;

module pot_back()
{
    translate([
        0,
        -material_z,
        -pot_z/2
        ])
    cube([
        pot_x - 2*material_z,
        material_z,
        pot_z
        ], center=true);
}

pot_back();
