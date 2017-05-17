
// all measures in millimeters

// rendering quality
$fn = 200;
nothing = 0.05;

// material to cut from
material_x = 1000;
material_y = 500;
material_z = 3;

// plate to cut from
module base_material()
{
    translate([0, 0, -material_z*3/2-nothing])
    cube([
        material_x,
        material_y,
        material_z
        ]);
}

// wall configuration: bounding box measures
wall_x = 550;
wall_y = 30;
wall_z = 400;

// the round top is added on top of the wall
wall_round_top_z = 8;

// length of the foot towards the front and back of the wall (asymmetrical)
foot_y_back = 100;
foot_y_front = 175;
foot_y = foot_y_front + foot_y_back;

// foot height
foot_z = 25;

// rounded corners at front and back of the foot
foot_round_y = 20;

foot_gap_y = (foot_y_front + foot_y_back) * 0.8;
foot_gap_z = material_z;

// number of support beams
support_count = 6;

// height of a support beam
support_z = 25;

// pot configuration: outer measures of the top opening
// small pots:
pot_x = 70;
pot_y = 70;
pot_z = 40;
/*
// medium size pots:
pot_x = 80;
pot_y = 80;
pot_z = 50;
*/

// pots have hooks to hang at the wall supports
hook_width = 10;

// screw: M3
screw_diameter = 2.85;
screw_length = 5.5;
nut_height = 2.4 -0.5;
nut_wrench_size = 5.0;
nut_offset = material_z;
washer_radius = 7;
