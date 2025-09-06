Here’s a “big-picture” map of what those names mean and how practitioners usually choose between them when building a GetDP model. I’ll keep the jargon but try to show the logic step by step.

1. What the word formulation means in GetDP
In GetDP a “Formulation” is just the weak form of Maxwell’s equations you decide to solve, expressed in terms of whichever field variable you take as unknown (scalar potential, vector potential, field itself, etc.).
The choice controls:

what differential operator is discretized,

what kind of source term you specify,

how you impose boundary conditions,

and numerical stability/efficiency.

2. Common electromagnetic formulations
Nickname (GetDP)

Unknown(s)

Typical physics it matches

Source term appears as

Boundary conditions easiest to impose

When it’s most natural

Scalar Magnetic Potential ϕm

scalar ϕm so that H = −∇ϕm

Magnetostatics in simply-connected, current-free regions (air gaps, yokes)

Currents enter as cuts or impressed mmf

Dirichlet (fixed potential) or Neumann on normal B

Good when there is no conduction current inside the solved region (or you represent it by a current sheet / cut)

Vector Potential A

A (usually Coulomb gauge) so B = ∇×A

Magnetostatics with actual current densities J

J appears directly in the RHS

Perfect for coil regions, easy to impose tangential A=0 on symmetry planes

Default for coils, solenoids, transformers

A-V (or A-ϕ) Formulation

Magnetic A + electric scalar V

Full quasi-static / eddy-current problems (conductors where E = −∂A/∂t − ∇V)

Currents induced automatically; impressed currents via constraint on V or J

Easy to treat conducting & non-conducting regions together

Low-freq time-varying fields where conduction matters

E-Based Formulation

Electric field E as unknown

High-frequency or wave problems (curl-curl form)

Currents, charges directly in RHS

Natural for metallic boundaries (E×n = 0)

RF, microwaves, resonances

T-Ω (Current Vector Potential & Magnetic Scalar)

T in conductors, Ω in air

Classical eddy-current alternative, splits conductor/air handling

Source current as boundary mmf or constraints

Good for laminated cores, stator/rotor style machines

Eddy currents at low frequency

H-Based (Curl-Curl)

Magnetic field H

Some magnetostatics, direct B/H material law

Source as impressed current density

Good for nonlinear µ(H)

Less used when current cuts are complicated

3. Role of time structure
Regime

Notes for formulation

Steady DC (magnetostatics)

Scalar ϕm (if no real J) or Vector A (if coil regions with J).

Harmonic / Sinusoidal (low frequency)

A-V or T-Ω handles eddy currents by complex phasor. Scalar ϕm can still be used if no conduction and no J.

Transient (time-domain)

A-V is most common: σ(∂A/∂t + ∇V) = J, B = ∇×A. T-Ω also works.

High-frequency waves

E-based or H-based curl-curl (Maxwell) forms, with complex permittivity/permeability.

So yes—the timing structure strongly influences choice:

If conduction currents change in time, you need both magnetic and electric potentials (A-V).

If purely static, you can drop electric terms and simplify to ϕm or A only.

For waves, curl-curl (E or H) is the natural Maxwell form.

4. Efficiency & Practical Hints
Use the simplest unknown set that still represents your physics: avoid A-V if DC magnetostatics suffices.

Scalar potential fails if your region is not simply connected or has conduction current.

Gauge conditions (∇·A = 0, etc.) matter: GetDP lets you enforce via constraints.

Boundary conditions: tangential A or normal B are trivial in A-formulation; tangential H is easier in ϕm.

5. Quick decision tree
Static, no current in region? → Scalar ϕm.

Static, real J in region? → Vector A.

Time-varying, low-freq, conductors present? → A-V or T-Ω.

High-freq EM waves? → Curl-curl E (or H).
