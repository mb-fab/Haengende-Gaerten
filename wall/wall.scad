
include <../config.scad>;
use <vertical.scad>;
use <horizontal.scad>;

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
        wall_vertical();
    }

    // horizontal parts
    usable_z = wall_z - pot_z;
    delta_z = usable_z / (support_count-1);
    offset_z = pot_z - support_z/2;
    color("brown")
    for (i=[1:support_count])
    {
        translate([
            0,
            0,
            offset_z + (i-1) * delta_z
            ])
        wall_horizontal();
    }
}

wall();
