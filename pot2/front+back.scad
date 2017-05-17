
include <../config.scad>;
include <config.scad>;
use <../screw.scad>;

module pot_front_without_holes()
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

    // side noses
    for (x = [
            - pot_x/2 + material_z/2,
            + pot_x/2 - material_z/2
            ])
        translate([
            x,
            0,
            - pot_z/2
            ])
        cube([
            material_z + 2*nothing,
            material_z,
            pot_z/3
            ], center=true);
}

module pot_front_with_nose_cutout()
{
    difference()
    {
        pot_front_without_holes();

        // hole for the bottom plane's nose
        translate([0, 0, - pot_z + material_z/2 + inset_bottom])
        cube([
            pot_x/3,
            material_z + nothing,
            material_z
            ], center=true);
    }
}

module pot_front()
{
    difference()
    {
        pot_front_with_nose_cutout();

        // right screw cutout
        translate([pot_x/2, 0, -pot_z/2])
        rotate([0, 90, 0])
        screw_cavity();

        // left screw cutout
        translate([-pot_x/2, 0, -pot_z/2])
        rotate([0, -90, 0])
        screw_cavity();
    }
}

module pot_back()
{
    pot_front_with_nose_cutout();

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
