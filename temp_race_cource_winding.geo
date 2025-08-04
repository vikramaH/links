// Parameters
x0 = 0; y0 = 0; z0 = 0;
Lx = 4; Ly = 1; R = 0.2;
W = 0.05;  // W must be smaller than R, else geometry will collapse
H = 0.5;

// Outer Rectangle Limits
xc1 = x0 - Lx/2;  xc2 = x0 + Lx/2;
yc1 = y0 - Ly/2;  yc2 = y0 + Ly/2;

// Outer Boundary Points
Point(1) = {xc1 + R, yc1, z0, 1.0};
Point(2) = {xc2 - R, yc1, z0, 1.0};
Point(3) = {xc2, yc1 + R, z0, 1.0};
Point(4) = {xc2, yc2 - R, z0, 1.0};
Point(5) = {xc2 - R, yc2, z0, 1.0};
Point(6) = {xc1 + R, yc2, z0, 1.0};
Point(7) = {xc1, yc2 - R, z0, 1.0};
Point(8) = {xc1, yc1 + R, z0, 1.0};

// Outer Arc Centers (SHIFTED OUT by R for convex arcs)
Point(9) = {xc2 + R, yc1, z0, 1.0};
Point(10) = {xc2 + R, yc2, z0, 1.0};
Point(11) = {xc1 - R, yc2, z0, 1.0};
Point(12) = {xc1 - R, yc1, z0, 1.0};

// Outer Lines
Line(1) = {1, 2};
Circle(2) = {2, 9, 3};
Line(3) = {3, 4};
Circle(4) = {4, 10, 5};
Line(5) = {5, 6};
Circle(6) = {6, 11, 7};
Line(7) = {7, 8};
Circle(8) = {8, 12, 1};

// Inner Rectangle Limits (OFFSET INWARD by W)
xc1_in = xc1 + W; xc2_in = xc2 - W;
yc1_in = yc1 + W; yc2_in = yc2 - W;
R_in = R - W;

// Inner Boundary Points
Point(21) = {xc1_in + R_in, yc1_in, z0, 1.0};
Point(22) = {xc2_in - R_in, yc1_in, z0, 1.0};
Point(23) = {xc2_in, yc1_in + R_in, z0, 1.0};
Point(24) = {xc2_in, yc2_in - R_in, z0, 1.0};
Point(25) = {xc2_in - R_in, yc2_in, z0, 1.0};
Point(26) = {xc1_in + R_in, yc2_in, z0, 1.0};
Point(27) = {xc1_in, yc2_in - R_in, z0, 1.0};
Point(28) = {xc1_in, yc1_in + R_in, z0, 1.0};

// Inner Arc Centers (SHIFTED INWARD)
Point(29) = {xc2_in + R_in, yc1_in, z0, 1.0};
Point(30) = {xc2_in + R_in, yc2_in, z0, 1.0};
Point(31) = {xc1_in - R_in, yc2_in, z0, 1.0};
Point(32) = {xc1_in - R_in, yc1_in, z0, 1.0};

// Inner Lines
Line(21) = {21, 22};
Circle(22) = {22, 29, 23};
Line(23) = {23, 24};
Circle(24) = {24, 30, 25};
Line(25) = {25, 26};
Circle(26) = {26, 31, 27};
Line(27) = {27, 28};
Circle(28) = {28, 32, 21};

// Outer and Inner Line Loops
Line Loop(100) = {1, 2, 3, 4, 5, 6, 7, 8};
Line Loop(101) = {21, 22, 23, 24, 25, 26, 27, 28};

// Create Plane Surface with Inner Hole
Plane Surface(200) = {100, 101};

// Extrude the hollow surface to 3D
out[] = Extrude {0, 0, H} { Surface{200}; Layers{1}; Recombine; };
