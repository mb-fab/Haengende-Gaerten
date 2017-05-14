
include <../config.scad>;
include <config.scad>;

module pot_side(x)
{
    // side wall
    translate([
        x,
        -pot_y/2 - material_z/2,
        -pot_z/2
        ])
    cube([
        material_z,
        pot_y,
        pot_z
        ], center=true);

    // upper hook part
    translate([
        x,
        0,
        hook_width/2
        ])
    cube([
        material_z,
        hook_width*2 + material_z,
        hook_width
        ], center=true);

    // hook
    translate([
        x,
        hook_width/2 + material_z/2,
        -support_z/2
        ])
    cube([
        material_z,
        hook_width,
        support_z
        ], center=true);
}

pot_side(0);
