
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
        screw_radius,
        screw_radius,
        screw_length
        ], center=true);

    // cavity for the nut
    translate([
        0,
        0,
        -nut_offset
        ])
    cube([
        nut_wrench_size,
        nut_wrench_size,
        nut_height
        ], center=true);
}

screw_cavity();

