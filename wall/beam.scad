
include <../config.scad>;

module wall_beam()
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
            support_z/3
            ], center=true);
}

wall_beam();
