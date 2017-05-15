
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
    delta_z = wall_z/support_count;
    color("brown")
    for (i=[1:support_count])
    {
        translate([0, 0, (i-0.5)*delta_z])
        wall_horizontal();
    }
}

wall();
