
include <../config.scad>;
use <side.scad>;
use <beam.scad>;

module wall()
{
    // vertical parts
    color("darkblue")
    for (x = [
            -wall_x/2 + material_z/2,
            +wall_x/2 - material_z/2
            ])
    {
        translate([x, 0, 0])
        wall_side();
    }

    // horizontal parts
    usable_z = wall_z - support_z_offset ;
    delta_z = usable_z / (support_count-1);
    offset_z = support_z_offset - support_z/2;
    color("brown")
    for (i=[1:support_count])
    {
        translate([
            0,
            0,
            offset_z + (i-1) * delta_z
            ])
        wall_beam();
    }
}

wall();
