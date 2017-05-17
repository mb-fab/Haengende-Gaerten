
include <config.scad>;

/*
 * Positive model of a cavity
 * required for pressing in a nut
 * and screwing in a screw
 */
module screw_cavity()
{
    // cavity for the screw thread
    translate([
        0,
        0,
        -screw_length/2
        ])
    cube([
        screw_diameter,
        material_z + 2*nothing,
        screw_length
        ], center=true);

    // cavity for the nut
    translate([
        0,
        0,
        - nut_offset - nut_height/2
        ])
    cube([
        nut_wrench_size,
        material_z + 2*nothing,
        nut_height
        ], center=true);
}

screw_cavity();

