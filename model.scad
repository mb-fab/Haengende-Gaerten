
include <config.scad>;
use <wall/wall.scad>;
use <pot2/pot2.scad>;

module model()
{
    wall();

    // horizontal parts
    usable_z = wall_z - pot_z;
    delta_z = usable_z / (support_count-1);
    offset_z = pot_z - support_z/2 + hook_width;
    for (i = [1:support_count/2])
        for (x = [-1, 0, 1])
        {
            translate([
                x*pot_x*2,
                0,
                offset_z + (i-1) * delta_z * 2
                ])
            pot2();
        }
}

model();
