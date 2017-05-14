
include <../config.scad>;
use <side.scad>;
use <back.scad>;
use <front.scad>;

module pot()
{
    for (x = [
            -pot_x/2 + material_z/2,
            +pot_x/2 - material_z/2
            ])
    {
        pot_side(x);
    }

    pot_back();

    #pot_front();
}

pot();
