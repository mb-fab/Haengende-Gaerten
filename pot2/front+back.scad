
include <../config.scad>;
include <config.scad>;

module pot_front()
{
    // upper edge of wall is at z=0
    translate([
        0,
        0,
        -pot_z/2
        ])
    cube([
        pot_x - 2*material_z,
        material_z,
        pot_z
        ], center=true);
}

module pot_back()
{
    pot_front();

    translate([
        0,
        0,
        hook_width/2
        ])
    cube([
        pot_x - 2*material_z,
        material_z,
        hook_width
        ], center=true);
}

pot_front();
