// -----------------------------
// C-Type Dipole Magnet + Air Box (3D) in Gmsh
// -----------------------------

// ===== Parameters =====
gap        = 50e-3;      // Pole gap [m]
poleWidth  = 100e-3;     // Pole width [m]
coreLength = 1.1;        // Core length (z-direction)
ironThick  = 150e-3;     // Iron yoke thickness
coilWidth  = 60e-3;      // Coil width [m]
coilHeight = 80e-3;      // Coil height [m]
coilOffset = 20e-3;      // Coil offset from pole face [m]
airBuffer  = 250e-3;     // Air clearance around magnet [m]

// ===== Derived Dimensions =====
halfGap    = gap / 2;
fullHeight = gap + 2 * (ironThick + coilHeight + coilOffset);
fullWidth  = poleWidth + coilOffset + coilWidth;
halfCore   = coreLength / 2;

// ===== Magnet Origin at (0,0)
// The geometry lies in positive X and Y
// We'll center air box around the magnet

// -----------------------------
// Magnet 2D Cross-Section in XY Plane
// -----------------------------

// Points: Iron core (C-shape)
Point(1) = {0, 0, 0};
Point(2) = {poleWidth, 0, 0};
Point(3) = {poleWidth, halfGap, 0};
Point(4) = {0, halfGap, 0};
Point(5) = {0, halfGap + ironThick, 0};
Point(6) = {poleWidth, halfGap + ironThick, 0};

// Coil below
xCoilLeft = -coilOffset - coilWidth;
xCoilRight = -coilOffset;
yCoilBottom = -coilHeight;
yCoilTop = 0;

Point(10) = {xCoilLeft, yCoilBottom, 0};
Point(11) = {xCoilRight, yCoilBottom, 0};
Point(12) = {xCoilRight, yCoilTop, 0};
Point(13) = {xCoilLeft, yCoilTop, 0};

// Coil above
yCoilAboveBottom = gap;
yCoilAboveTop = gap + coilHeight;

Point(20) = {xCoilLeft, yCoilAboveBottom, 0};
Point(21) = {xCoilRight, yCoilAboveBottom, 0};
Point(22) = {xCoilRight, yCoilAboveTop, 0};
Point(23) = {xCoilLeft, yCoilAboveTop, 0};

// Lines for Iron Core
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {4, 5};
Line(6) = {5, 6};
Line(7) = {6, 3};

// Coils
Line(10) = {10, 11};
Line(11) = {11, 12};
Line(12) = {12, 13};
Line(13) = {13, 10};

Line(20) = {20, 21};
Line(21) = {21, 22};
Line(22) = {22, 23};
Line(23) = {23, 20};

// Surfaces
Line Loop(1) = {1, 2, 3, 4};             // Lower core
Line Loop(2) = {5, 6, 7, -3};            // Upper return
Line Loop(3) = {10, 11, 12, 13};         // Bottom coil
Line Loop(4) = {20, 21, 22, 23};         // Top coil

Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
Plane Surface(4) = {4};

// ===== Extrude Magnet
volumes[] = Extrude {0, 0, coreLength} {
    Surface{1, 2, 3, 4}; Layers{1}; Recombine;
};

// Assign volumes
Physical Volume("Iron")        = {volumes[1], volumes[2]};
Physical Volume("Coil_Bottom") = {volumes[3]};
Physical Volume("Coil_Top")    = {volumes[4]};

// -----------------------------
// Air Box Around Magnet
// -----------------------------

// Bounding box of magnet
xmin = xCoilLeft - airBuffer;
xmax = poleWidth + airBuffer;
ymin = yCoilBottom - airBuffer;
ymax = yCoilAboveTop + airBuffer;
zmin = -airBuffer;
zmax = coreLength + airBuffer;

Box(100) = {xmin, ymin, zmin, xmax - xmin, ymax - ymin, zmax - zmin};

// Boolean difference to remove magnet
BooleanDifference {
  Volume{100};
  Delete;
} {
  Volume{volumes[1], volumes[2], volumes[3], volumes[4]};
}

// Define physical groups for air box faces
// Gmsh auto-generates surfaces; we find them by bounding box
Physical Surface("Air_XMin") = Surface In BoundingBox {xmin - 1e-6, ymin, zmin, xmin + 1e-6, ymax, zmax};
Physical Surface("Air_XMax") = Surface In BoundingBox {xmax - 1e-6, ymin, zmin, xmax + 1e-6, ymax, zmax};
Physical Surface("Air_YMin") = Surface In BoundingBox {xmin, ymin - 1e-6, zmin, xmax, ymin + 1e-6, zmax};
Physical Surface("Air_YMax") = Surface In BoundingBox {xmin, ymax - 1e-6, zmin, xmax, ymax + 1e-6, zmax};
Physical Surface("Air_ZMin") = Surface In BoundingBox {xmin, ymin, zmin - 1e-6, xmax, ymax, zmin + 1e-6};
Physical Surface("Air_ZMax") = Surface In BoundingBox {xmin, ymin, zmax - 1e-6, xmax, ymax, zmax + 1e-6};

// Define physical volume for air
Physical Volume("Air") = {1};  // The resulting air box
