
include <../config.scad>;

module wall_vertical()
{
    // horizontal
    translate([
        0,
        0,
        wall_z/2
        ])
    cube([
        material_z,
        wall_width,
        wall_z
        ], center=true);

    // foot
    translate([
        0,
        -wall_y/2 + wall_width/2,
        +foot_z/2
        ])
    cube([
        material_z,
        wall_y,
        foot_z
        ], center=true);
}

wall_vertical();
