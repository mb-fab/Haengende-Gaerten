
include <../config.scad>;
include <config.scad>;

module pot_side_without_holes(x)
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

module pot_side(x)
{
    difference()
    {
        pot_side_without_holes(x);

        // front nose cutout
        translate([
            x,
            - pot_y + inset_front,
            - pot_z/6 - pot_z/3
            ])
        cube([
            material_z + nothing,
            material_z,
            pot_z/3
            ], center=true);

        // back nose cutout
        translate([
            x,
            - material_z - inset_back,
            - pot_z/6 - pot_z/3
            ])
        cube([
            material_z + nothing,
            material_z,
            pot_z/3
            ], center=true);

        // bottom nose cutout
        translate([
            x,
            - pot_y/2 - material_z/2,
            - pot_z + material_z/2 + inset_bottom
            ])
        cube([
            material_z + nothing,
            pot_y/3,
            material_z
            ], center=true);
    }
}

pot_side(0);
