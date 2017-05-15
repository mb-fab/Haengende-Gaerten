
include <../config.scad>;
use <../corners.scad>;

module wall_vertical()
{
    // horizontal
    translate([0, 0, wall_z/2])
    cube([
        material_z,
        wall_y,
        wall_z
        ], center=true);

    // foot
    translate([0, -(foot_y_front - foot_round_y)/2, +foot_z/2])
    cube([
        material_z,
        foot_y_front - foot_round_y,
        foot_z
        ], center=true);

    translate([0, (foot_y_back - foot_round_y)/2, +foot_z/2])
    cube([
        material_z,
        foot_y_back - foot_round_y,
        foot_z
        ], center=true);

    // round corners on top of the foot
    translate([0, wall_y/2, foot_z])
    rotate([0, -90, 0])
    round_corner_inside(
        wall_y,
        foot_y_back - wall_y/2 - foot_round_y,
        material_z
        );

    translate([0, -wall_y/2, foot_z])
    rotate([0, -90, 180])
    round_corner_inside(
        wall_y,
        foot_y_front - wall_y/2 - foot_round_y,
        material_z
        );

    // round corners on the sides of the foot
    translate([0, foot_y_back - foot_round_y, 0])
    rotate([90, 0, 90])
    round_corner_outside(
        foot_round_y,
        foot_z,
        material_z
        );

    translate([0, - foot_y_front + foot_round_y, 0])
    rotate([90, 0, -90])
    round_corner_outside(
        foot_round_y,
        foot_z,
        material_z
        );
}

wall_vertical();
