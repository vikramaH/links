//------------------------------------------------------
// Stripline Circulator Design in Gmsh script
//------------------------------------------------------


// Relation between MKS and CGS units

// 1 Oe = 79.5775 A/m 

// Add in this, design of Above resonance and phase-shift circulators also.
// 4πMs ~ ( f_op / 3 ) ; if f_op is in MHz the 4PiMs will come in Gauss. 


// ============================================================================================================

// ---------- Input menu (light blue) ----------
DefineConstant[

  f0_Hz     = {12e9, Name "Inputs/01--- Frequency ---/01f0 [Hz] (Design frequency)", Highlight "LightBlue"}

// Ha_Oe     = {0.0,  Name "Inputs/--- Ferrite Parameters ---/Ha [Oe] (Anisotropy field)", Highlight "LightBlue"}

  eps_f     = {13.0, Name "Inputs/02--- Ferrite Parameters ---/02εf [–] (Ferrite permittivity)", Highlight "LightBlue"}

//  a_bias    = {0.3,  Name "Inputs/--- Ferrite Parameters ---/Bias fraction Hin/(4πMs) [–]", Highlight "LightBlue"}

  psi_rad   = {0.26, Name "Inputs/03--- Coupling ---/03ψ [rad] (Coupling angle)", Highlight "LightBlue"}

  eps_d     = {1.0,    Name "Inputs/04--- Resonator Parameters ---/εd [–] (Dielectric permittivity)", Highlight "LightBlue"}

  t_m       = {35e-6,  Name "Inputs/04--- Resonator Parameters ---/t_m [m] (Metal thickness)", Highlight "LightBlue"}

  Z0_ohm    = {50.0,   Name "Inputs/04--- Resonator Parameters ---/Z0 [Ω] (Reference impedance)", Highlight "LightBlue"}

  theta_deg = {90,     Name "Inputs/04--- Resonator Parameters ---/θ [deg] (Transformer angle)", Highlight "LightBlue"}

  min_df_mm = {0.5,    Name "Inputs/04--- Resonator Parameters ---/df_min [mm] (Min ferrite thickness)", Highlight "LightBlue"}

];

// ---------- Constants ----------

MU0 = 4*Pi*1e-7;

EPS0 = 8.854187817e-12;

C0  = 299792458.0;            

gamma_Hz_per_Oe = 2.8e6 ; // gyromagnetic ratio (2.8 MHz/Oe)

gamma_rad = gamma_Hz_per_Oe * 2 * Pi ;  

K_MODE = 1.84;  // most circulators are designed for the first operation mode of circulation . K_MODE = 1.84 for that


// ---------- Calculations (internal, hidden) ----------

Ha_Oe     = 50 ;  // Anisotropy field , 0 - 100 Orested

Ms4pi_lo = Max(0.5*(f0_Hz/gamma_Hz_per_Oe) - Ha_Oe, 0);

Ms4pi_hi = Max(0.8*(f0_Hz/gamma_Hz_per_Oe) - Ha_Oe, 0);

Ms4pi_choose = 0.5 * (Ms4pi_lo + Ms4pi_hi);  // selected value of 4PiMs



frac_est = (gamma_Hz_per_Oe * Ms4pi_choose) / f0_Hz; // fractional bandwidth


// according to one author  Hin ≈ 4π Ms (G) × a_bias  where a_bias = 0.1 to 0.5  could be used for a BR operation 
// while a_bias = 2 to 5 for an AR operation.

a_bias = 0.3 ;

Hin = a_bias * Ms4pi_choose;  // It is decided such that the ferrite is fully satuated 


// following are old method of calculating field
//Hd  = 0.88 * Ms4pi_choose;
//H0  = Hin - Ha_Oe + Hd;


omega  = 2 * Pi * f0_Hz ;  // radian frequency of circulator operation

omega_0 = gamma_rad * (Hin + Ha_Oe) ;  // (2 Pi gamma) * Hi

omega_m = gamma_rad * Ms4pi_choose ;  // = (2 Pi gamma) * (4 Pi Ms)



denom = (omega_0*omega_0 - omega*omega);

If (Abs(denom) < 1e-12) denom = 1e-12; EndIf

mu_rel    = 1 + (omega_0*omega_m)/denom;

kappa_rel = (omega*omega_m)/denom;

QL = 1 / (Sqrt(2)* kappa_rel / mu_rel ) ;   // approximate loaded quality factor 


mu_eff = ( mu_rel * mu_rel - kappa_rel * kappa_rel ) / mu_rel;  // effective permeability

kappa_eff = omega * Sqrt (Abs (MU0 * EPS0 * eps_f * mu_eff )) ; // effective propagation constant 


Rf = ( K_MODE * C0 ) / (omega * Sqrt(eps_f * Abs(mu_eff)));  // resonator radius

RC   = 0.8*Rf ; // It has been theoretically and experimentally proved that the diameter of the center conductor should be taken 80% of the disk resonator


Yeff = Sqrt(eps_f*EPS0/(MU0*Abs(mu_eff)));  // Yeff is the intrinsic wave admittance

split = Abs(kappa_rel/mu_rel);

GR  = (Yeff*split)/Sin(psi_rad);  // The wave admittance of the circulator at the center frequency of operation

W_inner = 2 * RC * Sin(psi_rad);  // where W is the inner width of Y-junction (mm) ; ψ is the coupling angle (rad).  Decreasing the coupling angle
// from light coupling (ψ = 0.3) to tight coupling (ψ = 0.1)
// will result in widening of the bandwidth operation, as Wu and
// Rosenbaum explained regarding their ‘‘continuous tracking
// technique’’ [9], which matches very well with measurement results in [52].


// ===> Following two formulas seem to be dimensionaly incorrect

Z_eff = (120 * Pi / Yeff)*Abs(EPS0/(MU0 * mu_eff )) ;  // impedance of the ferrite resonator

// Should it be 1 / Yeff ???

Z_d = 120 * Pi / Sqrt(eps_f) ; // the impedance outside the disk



// calculation od disk thickness  ===> see its correctness
rhs = 2.093*omega*EPS0*eps_f*(Rf*Rf)*(kappa_rel/mu_rel);

df = rhs/GR;

If (df < (min_df_mm/1000.0)) df = min_df_mm/1000.0; EndIf



// ---------- Results menu (yellow, read-only) ----------
DefineConstant[
  Ms_lo_out     = {Ms4pi_lo,     Name "Results/--- Ferrite ---/_4πMs lower [G]", ReadOnly 1, Highlight "Yellow"}
  Ms_hi_out     = {Ms4pi_hi,     Name "Results/--- Ferrite ---/_4πMs upper [G]", ReadOnly 1, Highlight "Yellow"}
  Ms_choose_out = {Ms4pi_choose, Name "Results/--- Ferrite ---/_4πMs chosen [G]", ReadOnly 1, Highlight "Yellow"}

  mu_rel_out    = {mu_rel,       Name "Results/--- Ferrite ---/μ_rel [–]", ReadOnly 1, Highlight "Yellow"}
  kappa_out     = {kappa_rel,    Name "Results/--- Ferrite ---/κ [–]", ReadOnly 1, Highlight "Yellow"}
  mu_eff_out    = {mu_eff,       Name "Results/--- Ferrite ---/μ_eff [–]", ReadOnly 1, Highlight "Yellow"}

  Rf_out        = {1000*Rf,      Name "Results/--- Resonator ---/01Rf [mm] (Ferrite radius)", ReadOnly 1, Highlight "Yellow"}
  df_out        = {1000*df,      Name "Results/--- Resonator ---/02df [mm] (Ferrite thickness)", ReadOnly 1, Highlight "Yellow"}
  W_inner_out   = {1000*W_inner, Name "Results/--- Resonator ---/03W [mm] (Stripline inner width)", ReadOnly 1, Highlight "Yellow"}
  GR_out        = {GR,           Name "Results/--- Resonator ---/04GR [S] (Wave addmittance of circulator)", ReadOnly 1, Highlight "Yellow"}

  frac_est_out  = {frac_est,     Name "Results/03--- Performance ---/Fractional BW [–]", ReadOnly 1, Highlight "Yellow"}
];

