// Gmsh project created on Mon Aug  4 22:17:37 2025
SetFactory("OpenCASCADE");


// Parameters
x0 = 0; y0 = 0; z0 = 0;
Lx = 4; Ly = 1; R = 0.2;
W = 0.5;  // W must be smaller than R, else geometry will collapse
H = 0.5;

// Inner Rectangle Limits
xc1 = x0 - Lx/2;  xc2 = x0 + Lx/2;
yc1 = y0 - Ly/2;  yc2 = y0 + Ly/2;

// Inner Boundary Points
Point(1) = {xc1 + R, yc1, z0, 1.0};
Point(2) = {xc2 - R, yc1, z0, 1.0};
Point(3) = {xc2, yc1 + R, z0, 1.0};
Point(4) = {xc2, yc2 - R, z0, 1.0};
Point(5) = {xc2 - R, yc2, z0, 1.0};
Point(6) = {xc1 + R, yc2, z0, 1.0};
Point(7) = {xc1, yc2 - R, z0, 1.0};
Point(8) = {xc1, yc1 + R, z0, 1.0};

// Outer Arc Centers (SHIFTED OUT by R for convex arcs)
Point(9) = {xc2 - R, yc1 + R, z0, 1.0};
Point(10) = {xc2 - R, yc2 - R, z0, 1.0};
Point(11) = {xc1 + R, yc2 - R, z0, 1.0};
Point(12) = {xc1 + R, yc1 + R, z0, 1.0};

// Inner Lines
Line(1) = {1, 2};
Circle(2) = {2, 9, 3};
Line(3) = {3, 4};
Circle(4) = {4, 10, 5};
Line(5) = {5, 6};
Circle(6) = {6, 11, 7};
Line(7) = {7, 8};
Circle(8) = {8, 12, 1};

// Outer Boundary Points
Point(13) = {xc1 + R, yc1-W, z0, 1.0};
Point(14) = {xc2 - R, yc1-W, z0, 1.0};
Point(15) = {xc2+W, yc1 + R, z0, 1.0};
Point(16) = {xc2+W, yc2 - R, z0, 1.0};
Point(17) = {xc2 - R, yc2+W, z0, 1.0};
Point(18) = {xc1 + R, yc2+W, z0, 1.0};
Point(19) = {xc1-W, yc2 - R, z0, 1.0};
Point(20) = {xc1-W, yc1 + R, z0, 1.0};

// Outer Lines
Line(9) = {1+12, 2+12};
Circle(10) = {2+12, 9, 3+12};
Line(11) = {3+12, 4+12};
Circle(12) = {4+12, 10, 5+12};
Line(13) = {5+12, 6+12};
Circle(14) = {6+12, 11, 7+12};
Line(15) = {7+12, 8+12};
Circle(16) = {8+12, 12, 1+12};

// Outer and Inner Line Loops
Line Loop(100) = {1, 2, 3, 4, 5, 6, 7, 8};
Line Loop(101) = {9,10,11,12,13,14,15,16};

// Create Plane Surface with Inner Hole
Plane Surface(200) = {100, 101};

// Extrude the hollow surface to 3D
out[] = Extrude {0, 0, H} { Surface{200}; Layers{1}; Recombine; };
