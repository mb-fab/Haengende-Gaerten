
include <../config.scad>;

module wall_horizontal()
{
    cube([
        wall_x - 2*material_z,
        material_z,
        support_z
        ], center=true);
}

wall_horizontal();
