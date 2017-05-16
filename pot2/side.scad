
include <../config.scad>;
include <config.scad>;
use <../corners.scad>;

module pot_side_without_holes(x=0)
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
    upper_hook_part_length = hook_width*2 + material_z;
    translate([
        x,
        0,
        hook_width/2
        ])
    cube([
        material_z,
        upper_hook_part_length,
        hook_width
        ], center=true);

    // rounded top on the upper hook part
    translate([x, 0, hook_width])
    rotate([90, 0, 90])
    round_tip(
        upper_hook_part_length,
        hook_round_top_z,
        material_z,
        upper_hook_part_length/3
        );

    // rounded transition from top edge to hook
    translate([x, -material_z/2-hook_width, 0])
    rotate([90, 0, -90])
    round_corner_inside(
        pot_x - hook_width,
        hook_width,
        material_z
        );

    // back hook part
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

    // round bottom on the back side of the hook
    translate([
        x,
        material_z/2 + hook_width/2,
        -support_z
        ])
    rotate([-90, 0, 90])
    round_tip(
        hook_width,
        hook_round_bottom_z,
        material_z,
        hook_width/3
        );
}

module pot_side(x=0)
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

pot_side();
