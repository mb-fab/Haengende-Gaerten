
include <../config.scad>;
use <../screw.scad>;

module wall_beam_without_screw_holes()
{
    // beam
    cube([
        wall_x - 2*material_z,
        material_z,
        support_z
        ], center=true);

    // noses
    for (x = [
            - wall_x/2 + material_z/2,
            + wall_x/2 - material_z/2
            ])
        translate([x, 0, 0])
        cube([
            material_z + nothing,
            material_z,
            support_z/2
            ], center=true);
}

module wall_beam()
{
    difference()
    {
        wall_beam_without_screw_holes();

        // right screw
        translate([+ wall_x/2 + nothing, 0, 0])
        rotate([0, 90, 0])
        screw_cavity();

        // left screw
        translate([- wall_x/2 - nothing, 0, 0])
        translate([])
        rotate([0, -90, 0])
        screw_cavity();
    }
}

wall_beam();
