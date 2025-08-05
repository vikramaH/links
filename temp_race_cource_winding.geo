

// Onelab parameters of the C-core model 

NL_tol_abs = 1e-8; 	// absolute tolerance on residual for noninear iterations
NL_tol_relax = 1.0; 	// relaxation on residual for noninear iterations
NL_iter_max = 50; 	// maximum number of noninear iterations



Flag_NL = 0 ;
murCore = 1000 ;
VelocityTag = 23;
OptiIterNumber = 0 ;

Flag_Jfixed = 0 ;


  
//  Current = 5e3 ;

js0 = 100e6 ;


Group {
  // Physical regions (in capital letters):
  AIR    = Region[ 12 ];   
 CORE   = Region[ {} ];  
  COILP  = Region[ 11 ];   
 COILN  = Region[ {} ]; 
    
  NOFLUX = Region[ 13];

  // Abstract regions
  Vol_Mag     = Region[ {AIR, COILP} ];
  Vol_S_Mag   = Region[ {COILP} ];
  Sur_Dir_Mag = Region[ {NOFLUX} ];
  Sur_Neu_Mag = Region[ {} ];

  Vol_NL_Mag = Region[ {} ];
  If(Flag_NL)
    Vol_NL_Mag = Region[ {CORE} ];
  EndIf
  Vol_L_Mag  = Region[ {Vol_Mag,-Vol_NL_Mag} ];
}

Function {
  mu0 = 4.e-7 * Pi ;
  nu0 = 1. / mu0 ;

  nu [ Region[{AIR, COILP, COILN}] ] = nu0;
 
  Mat_h_r = { 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 125, 150, 175, 200, 250, 
	      300, 400, 500, 600,  700, 800, 900, 1000, 1250, 1500, 2000, 2500, 5000, 
	      7500,  10000, 15000, 20000, 59000, 174000, 514000, 1520000, 4470000, 
	      13200000, 38900000, 115000000, 339000000, 1000000000 } ;
  Mat_b_r = { 0.0, 0.194880829963, 0.377143018857, 0.537767739762, 0.672888260835, 
	      0.783043000477, 0.871342430831,0.941778611986, 0.998183303557, 1.04378111223, 
	      1.08110469369, 1.14963767549, 1.19607212343, 1.22964695907, 1.25515221835,
	      1.29162498935, 1.31678879432, 1.35015120537, 1.37220092877, 1.38859114656, 
	      1.4017440574, 1.41287024565, 1.42264180514, 1.43146158921, 1.45082466146, 
	      1.46784549989, 1.49819370601, 1.52578650709, 1.64314027719, 1.73458485332, 
	      1.8039068939,1.89568786291, 1.95213815187, 2.1390774927, 2.45827909293, 
	      3.32303272825, 5.85485500678, 13.2701832298, 35.2114648741, 99.8027446541, 
	      291.062951228, 854.036370229, 2515.3105707 } ;

  Mat_b2_r = Mat_b_r()^2;
  Mat_nu_r = Mat_h_r()/Mat_b_r();
  Mat_nu_r(0) = Mat_nu_r(1);
  Mat_nu_b2_r = ListAlt[Mat_b2_r(), Mat_nu_r()];
  nu_interp_r[] = InterpolationLinear[ SquNorm[$1] ]{Mat_nu_b2_r()};
  dnudb2_interp_r[] = dInterpolationLinear[SquNorm[$1]]{Mat_nu_b2_r()};
  h_interp_r[] = nu_interp_r[$1] * $1 ;

  If(!Flag_NL)
    nu [ CORE ]  = nu0/murCore;
    dhdb_NL[ CORE ] = 0;
    mu_analytic = mu0*murCore;
  Else
    nu [ Vol_NL_Mag ] = nu_interp_r[$1] ;
    dhdb_NL[ Vol_NL_Mag ] = 2*dnudb2_interp_r[$1#2]*SquDyadicProduct[#2];
    mu_analytic = 1/Mat_nu_r(0);
  EndIf


  js[] = js0*Vector[0,0,+1];



  VV[] = Vector[$1,$2,0*$3] ;
  dV[] = TensorV[$1,$2,0*$3] ;
  Lie2form[] = TTrace[$2]*$1 - Transpose[$2]*$1; // $1=2-form (vector field), $2=dV (tensor)

  If(Flag_Jfixed)
    LieOf_js[] = Lie2form[js[], $1]; // $1=dV
  Else
    LieOf_js[] = 0;
  EndIf

  // Lie derivative of H(B) where B is a 2-form and H a 1-form ($1:{d a}, $2:dV)
  LieOf_HB[] = nu[$1] * (Transpose[$2] * $1 - TTrace[$2] * $1 + $2 * $1) ;
  LieOf_HB_NL[] = dhdb_NL[$1] * (Transpose[$2] - TTrace[$2] * TensorDiag[1,1,1]) * $1;
}



Group {
  Dom_Hcurl_a_Mag_2D = Region[ {Vol_Mag, Sur_Neu_Mag} ];
}

Function{
  l_a = ListFromServer["Optimization/Results/a"];
  aFromServer[] = ValueFromIndex[]{l_a()};
  For i In {1:3}
    l_v~{i} = ListFromServer[Sprintf["Optimization/Results/velocity_%g_%g",VelocityTag,i]];
    velocity~{i}[] = ValueFromIndex[]{l_v~{i}()};
  EndFor
}

Constraint {
  { Name Dirichlet_a_Mag;
    Case {
      { Region NOFLUX; Type Assign; Value 0; }
    }
  }
  { Name aFromServer;
    Case {
      { Region Vol_Mag; Type Assign; Value aFromServer[]; }
      { Region NOFLUX; Type Assign; Value 0; }
    }
  }
  For i In {1:3}
    { Name velocity~{i} ;
      Case {
        { Region Vol_Mag ; Value velocity~{i}[]; }
      }
    }
  EndFor
}



FunctionSpace {
  { Name Hcurl_a_2D; Type Form1P;
    BasisFunction {
      { Name se; NameOfCoef ae; Function BF_PerpendicularEdge;
        Support Dom_Hcurl_a_Mag_2D ; Entity NodesOf[ All ]; }
    }
    Constraint {
      { NameOfCoef ae; EntityType NodesOf;
        NameOfConstraint Dirichlet_a_Mag; }
    }
  }

  { Name Hcurl_a_2D_fullyfixed; Type Form1P;
    BasisFunction{
      { Name se1; NameOfCoef ae1; Function BF_PerpendicularEdge;
        Support Vol_Mag; Entity NodesOf[All]; }
    }
    Constraint{
      { NameOfCoef ae1; EntityType NodesOf; NameOfConstraint aFromServer; }
    }
  }
  For i In {1:3}
    { Name H_v~{i} ; Type Form0;
      BasisFunction {
        { Name sn ; NameOfCoef un ; Function BF_Node ;
          Support Vol_Mag; Entity NodesOf[ All ] ; }
      }
      Constraint {
        { NameOfCoef un ; EntityType NodesOf ; NameOfConstraint velocity~{i}; }
      }
    }
  EndFor
}

Jacobian {
  { Name Vol ;
    Case { 
      { Region All ; Jacobian Vol ; }
    }
  }
  { Name Sur;
    Case {
      { Region All; Jacobian Sur; }
    }
  }
}

Integration {
  { Name Int ;
    Case { { Type Gauss ;
	Case {
          { GeoElement Point; NumberOfPoints  1; }
          { GeoElement Line; NumberOfPoints  5; }
          { GeoElement Triangle; NumberOfPoints  4; }
          { GeoElement Quadrangle; NumberOfPoints  4; } 
	}
      }
    }
  }
}


// -------------------------------------------------------------------------
// This resolution solves the direct problem to compute the sensitivity
// of the induction flux with respect to a given design variable.


Formulation {
  { Name MagSta_a; Type FemEquation;
    Quantity {
      { Name a; Type Local; NameOfSpace Hcurl_a_2D; }
    }
    Equation {
      Integral { [ nu[{d a}] * Dof{d a} , {d a} ];
	In Vol_Mag ; Jacobian Vol; Integration Int; }
      Integral { JacNL [ dhdb_NL[{d a}] * Dof{d a} , {d a} ];
	In Vol_NL_Mag; Jacobian Vol; Integration Int; }
      Integral { [ -js[] , {a} ];
	In Vol_S_Mag; Jacobian Vol; Integration Int; }
    }
  }
}

Resolution {
  { Name GetPerformances;
    System {
      { Name SYS; NameOfFormulation MagSta_a;}
    }
    Operation {
      If( OptiIterNumber == 1 )
        CreateDir[ResDir];
        DeleteFile[StrCat[ResDir,"w.txt"]];
        DeleteFile[StrCat[ResDir,"Lie_w.txt"]];
      EndIf
      InitSolution[SYS];
      IterativeLoop[NL_iter_max, NL_tol_abs, NL_tol_relax]{
        GenerateJac[SYS];
        SolveJac[SYS];
      }
      PostOperation[Get_ObjectiveConstraints];
    }
  }
}

PostProcessing {
  { Name MagSta_a_2D; NameOfFormulation MagSta_a;
    Quantity {
      { Name az;
        Value {
          Term { [ CompZ[{a}] ]; In Dom_Hcurl_a_Mag_2D; Jacobian Vol; }
        }
      }
      { Name b;
        Value {
          Term { [ {d a} ]; In Dom_Hcurl_a_Mag_2D; Jacobian Vol; }
        }
      }
      { Name by;
        Value {
          Term { [ CompY[{d a}] ]; In Dom_Hcurl_a_Mag_2D; Jacobian Vol; }
        }
      }
      { Name js;
        Value {
          Term { [ js[] ]; In Vol_S_Mag; Jacobian Vol; }
        }
      }
     
    }
  }
}

PostOperation {
  { Name Get_ObjectiveConstraints; NameOfPostProcessing MagSta_a_2D;
    Operation{

      CreateDir["res"];
      Print[js, OnElementsOf Vol_S_Mag, File "res/js.pos"];

      Print[b, OnElementsOf Vol_Mag, File "res/b.pos"];

      Print[az, OnElementsOf Vol_Mag, File "res/az.pos"];

    }
  }
}

















==========================================================================================================






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
