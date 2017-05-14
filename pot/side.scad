
include <../config.scad>;

module pot_side(x)
{
    translate([
        x,
        -material_z/2,
        0
        ])
    intersection()
    {
        // scale to configured size
        scale([
            material_z,
            pot_y,
            pot_z
            ])
        // rotate into yz plane
        rotate([
            0,
            90,
            0
            ])
        circle(
            r=1
            );

        // z: negative, y: negative
        translate([
            0,
            -pot_y,
            -pot_z
            ])
        cube([
            2*material_z,
            2*pot_y,
            2*pot_z
            ], center=true);
    }

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
