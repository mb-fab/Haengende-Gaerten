
$fn = 200;
nothing = 0.05;

/**
 * @brief Draws a round corner in the XY plane.
 */
module round_corner_outside(x=1, y=1, z=1)
{
    scale([x, y, 1])
    translate([0, 0, -z/2])
    intersection()
    {
        // full circle
        linear_extrude(z)
        circle(1);

        // x >= 0; y >= 0;
        cube([x, y, z]);
    }
}

/**
 * @brief Draws a round corner in the XY plane.
 */
module round_corner_inside(x=1, y=1, z=1)
{
    scale([x, y, z])
    translate([0, 0, -1/2])
    difference()
    {
        // x >= 0; y >= 0;
        cube([1, 1, 1]);

        translate([1, 1, -nothing/2])
        linear_extrude(1 + nothing)
        circle(1);
    }
}

rotate(180)
round_corner_outside(10, 8);

round_corner_inside(10, 8);
