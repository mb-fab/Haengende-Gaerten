
include <../config.scad>;

module pot_front()
{
    angle = atan(pot_y/pot_z);
    diagonal_length = sqrt(pow(pot_y,2) + pow(pot_z,2));

    e = material_z/2;
    m = material_z;
    d1 = m / sin(angle);
    f = sin(angle) * e;
    d2 = f / sin(90-angle);
    lower_inset = d1 + d2;

    upper_inset = 3;

    translate([
        0,
        -sin(angle)*lower_inset - material_z/2,
        -pot_z + sin(90-angle)*lower_inset
        ])
    rotate([
        angle,
        0,
        0
        ])
    // rotate round the bottom middle
    translate([
        0,
        0,
        (diagonal_length - lower_inset - upper_inset)/2
        ])
    cube([
        pot_x - 2*material_z,
        material_z,
        diagonal_length - lower_inset - upper_inset
        ], center=true);
}

pot_front();
