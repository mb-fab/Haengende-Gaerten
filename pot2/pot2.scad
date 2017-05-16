
include <../config.scad>;
include <config.scad>;
use <front+back.scad>;
use <side.scad>;
use <bottom.scad>;

module pot2()
{
    // bottom
    color("brown")
    translate([
        0,
        -material_z * 3/2 - inset_bottom,
        - pot_z + material_z/2 + inset_bottom
        ])
    pot_bottom();

    // left and right side with hooks
    color("darkgreen")
    for (x = [
            -pot_x/2 + material_z/2,
            +pot_x/2 - material_z/2
            ])
    {
        pot_side(x);
    }

    // front
    color("darkblue")
    translate([
        0,
        - pot_y + inset_front,
        0
        ])
    pot_front();

    // back
    color("darkcyan")
    translate([
        0,
        - material_z - inset_back,
        0
        ])
    pot_back();
}

pot2();
