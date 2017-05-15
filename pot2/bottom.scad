
include <../config.scad>;
include <config.scad>;
use <../screw.scad>;

bottom_y = pot_y - 2*material_z - inset_front - inset_back;

module pot_bottom_without_holes()
{
    // center rectangle
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

    // side noses
    for (x = [
            - pot_x/2 + material_z/2,
            + pot_x/2 - material_z/2
            ])
        translate([
            x,
            - pot_y/2 + inset_bottom + material_z,
            0
            ])
        cube([
            material_z + 2*nothing,
            pot_y/3,
            material_z
            ], center=true);
}

module pot_bottom()
{
    difference()
    {
        pot_bottom_without_holes();

        // hole for water
        translate([
            0,
            - bottom_y/2,
            0
            ])
        linear_extrude(
            h = material_z + nothing,
            center = true
            )
        circle(
            r = hole_radius
            );

        // left screw
        translate([-pot_x/2-nothing*2, -bottom_y/2+material_z/2, 0])
        rotate([0, -90, 0])
        screw_cavity();

        // right screw
        translate([+pot_x/2+nothing*2, -bottom_y/2+material_z/2, 0])
        rotate([0, 90, 0])
        screw_cavity();
    }
}

pot_bottom();
