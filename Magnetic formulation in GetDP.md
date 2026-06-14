**Main formulations** : V , ϕm or Ω , A , A-V (or A-ϕ) , T−Ω , H , E , h-φ , 𝐓−𝐀 , 𝐉−𝐀 , 𝐓−𝐀-ϕ , 𝐉−𝐀-ϕ etc

H-formulation is perhaps most popular formulation for superconductors (especially HTS).


====> Other formulations :: 
Also see : POTENTIAL FORMULATIONS IN MAGNETICS APPLYING THE FINITE ELEMENT METHOD (2009) ---> more than 20 formulations discussed
https://www.mikrocontroller.net/attachment/642256/magnetic.pdf

1) T-Ω,

2) h-phi (h-φ) Finite-Element Formulation for Modelling Thin Superconducting Layers

3) In 3D, the h-ϕ and especially the t-ω formulation substantially reduce the number of degrees of freedom by using the magnetic scalar potential in non-conducting regions. (Homogenization of HTS coils with the h, h-phi, and t-omega foil conductor model https://arxiv.org/pdf/2604.00154)

4) T-A formulation ( for superconducting coated conductors) ===>  To date, the H-formulation and T-A formulation are two principal formulations applied to the finite element method to analyze the electromagnetic characteristics of HTS materials and devices. (Calculation and comparison of HTS electromagnetic characteristics with different models ; 2021)

5) The H-formulation, used abundantly for the simulation of high-temperature superconductors, has shown to be a very versatile and easily implementable way of modeling electromagnetic phenomena involving superconducting materials. (Implementation of the H-phi Formulation in COMSOL Multiphysics for Simulating the Magnetization of Bulk Superconductors and Comparison with the H-Formulation ; 2020)

6) Thin shell (TS) model for modeling thin HTS tapes in 2-D (Thin-Shell Approach for Modeling Superconducting Tapes in the H-φ Finite-Element Formulation ; 2021)
7) T-A-Φ and J-A-Φ formulations for efficient electromagnetic simulations of High-Temperature Superconductors in 2D (https://hal.science/hal-04988674/file/J_A_phi_and_T_A_phi_formulation_SUST_vf.pdf)


<p>Here’s a “big-picture” map of what those names mean and how
practitioners usually choose between them when building a GetDP
model. I’ll keep the jargon but try to show the logic step by step.</p>
<hr>

<h2 class="western">1. What the word <em>formulation</em> means in
GetDP</h2>
<p>In GetDP a “Formulation” is just the weak form of Maxwell’s
equations you decide to solve, expressed in terms of whichever field
variable you take as <strong>unknown</strong> (scalar potential,
vector potential, field itself, etc.).<br>
The choice controls:</p>
<ul>
	<li><p>what differential operator is discretized,</p>
	</li><li><p>what kind of source term you specify,</p>
	</li><li><p>how you impose boundary conditions,</p>
	</li><li><p>and numerical stability/efficiency.</p>
</li></ul>
<hr>

<h2 class="western">2. Common electromagnetic formulations</h2>
<table cellpadding="2" cellspacing="2">
	<thead>
		<tr>
			<th style="border: none; padding: 0cm"><p>Nickname (GetDP)</p>
			</th>
			<th style="border: none; padding: 0cm"><p>Unknown(s)</p>
			</th>
			<th style="border: none; padding: 0cm"><p>Typical physics it
				matches</p>
			</th>
			<th style="border: none; padding: 0cm"><p>Source term appears as</p>
			</th>
			<th style="border: none; padding: 0cm"><p>Boundary conditions
				easiest to impose</p>
			</th>
			<th style="border: none; padding: 0cm"><p>When it’s most natural</p>
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td style="border: none; padding: 0cm"><p><strong>Scalar Magnetic
				Potential</strong> ϕm</p>
			</td>
			<td style="border: none; padding: 0cm"><p>scalar ϕm so that <strong>H
				= −∇ϕm</strong></p>
			</td>
			<td style="border: none; padding: 0cm"><p>Magnetostatics in
				<strong>simply-connected, current-free</strong> regions (air
				gaps, yokes)</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Currents enter as <em>cuts</em>
				or impressed mmf</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Dirichlet (fixed
				potential) or Neumann on normal B</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Good when there is no
				conduction current inside the solved region (or you represent it
				by a current sheet / cut)</p>
			</td>
		</tr>
		<tr>
			<td style="border: none; padding: 0cm"><p><strong>Vector Potential</strong>
				<strong>A</strong></p>
			</td>
			<td style="border: none; padding: 0cm"><p><strong>A</strong>
				(usually Coulomb gauge) so <strong>B = ∇×A</strong></p>
			</td>
			<td style="border: none; padding: 0cm"><p>Magnetostatics <strong>with
				actual current densities</strong> J</p>
			</td>
			<td style="border: none; padding: 0cm"><p>J appears directly in
				the RHS</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Perfect for coil
				regions, easy to impose tangential A=0 on symmetry planes</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Default for coils,
				solenoids, transformers</p>
			</td>
		</tr>
		<tr>
			<td style="border: none; padding: 0cm"><p><strong>A-V (or A-ϕ)
				Formulation</strong></p>
			</td>
			<td style="border: none; padding: 0cm"><p>Magnetic <strong>A</strong>
				+ electric scalar <strong>V</strong></p>
			</td>
			<td style="border: none; padding: 0cm"><p>Full quasi-static /
				eddy-current problems (conductors where <strong>E = −∂A/∂t
				− ∇V</strong>)</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Currents induced
				automatically; impressed currents via constraint on V or J</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Easy to treat conducting
				&amp; non-conducting regions together</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Low-freq time-varying
				fields where conduction matters</p>
			</td>
		</tr>
		<tr>
			<td style="border: none; padding: 0cm"><p><strong>E-Based
				Formulation</strong></p>
			</td>
			<td style="border: none; padding: 0cm"><p>Electric field <strong>E</strong>
				as unknown</p>
			</td>
			<td style="border: none; padding: 0cm"><p>High-frequency or wave
				problems (curl-curl form)</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Currents, charges
				directly in RHS</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Natural for metallic
				boundaries (E×n = 0)</p>
			</td>
			<td style="border: none; padding: 0cm"><p>RF, microwaves,
				resonances</p>
			</td>
		</tr>
		<tr>
			<td style="border: none; padding: 0cm"><p><strong>T-Ω</strong>
				(Current Vector Potential &amp; Magnetic Scalar)</p>
			</td>
			<td style="border: none; padding: 0cm"><p><strong>T</strong> in
				conductors, <strong>Ω</strong> in air</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Classical eddy-current
				alternative, splits conductor/air handling</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Source current as
				boundary mmf or constraints</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Good for laminated
				cores, stator/rotor style machines</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Eddy currents at low
				frequency</p>
			</td>
		</tr>
		<tr>
			<td style="border: none; padding: 0cm"><p><strong>H-Based
				(Curl-Curl)</strong></p>
			</td>
			<td style="border: none; padding: 0cm"><p>Magnetic field <strong>H</strong></p>
			</td>
			<td style="border: none; padding: 0cm"><p>Some magnetostatics,
				direct B/H material law</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Source as impressed
				current density</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Good for nonlinear µ(H)</p>
			</td>
			<td style="border: none; padding: 0cm"><p>Less used when current
				cuts are complicated</p>
			</td>
		</tr>
	</tbody>
</table>
<hr>

<h2 class="western">3. Role of <strong>time structure</strong></h2>
<table cellpadding="2" cellspacing="2">
	<thead>
		<tr>
			<th style="border: none; padding: 0cm"><p>Regime</p>
			</th>
			<th style="border: none; padding: 0cm"><p>Notes for formulation</p>
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td style="border: none; padding: 0cm"><p><strong>Steady DC
				(magnetostatics)</strong></p>
			</td>
			<td style="border: none; padding: 0cm"><p>Scalar ϕm (if no real
				J) or Vector A (if coil regions with J).</p>
			</td>
		</tr>
		<tr>
			<td style="border: none; padding: 0cm"><p><strong>Harmonic /
				Sinusoidal</strong> (low frequency)</p>
			</td>
			<td style="border: none; padding: 0cm"><p>A-V or T-Ω handles eddy
				currents by complex phasor. Scalar ϕm can still be used if no
				conduction and no J.</p>
			</td>
		</tr>
		<tr>
			<td style="border: none; padding: 0cm"><p><strong>Transient
				(time-domain)</strong></p>
			</td>
			<td style="border: none; padding: 0cm"><p>A-V is most common:
				<strong>σ(∂A/∂t + ∇V) = J</strong>, <strong>B = ∇×A</strong>.
				T-Ω also works.</p>
			</td>
		</tr>
		<tr>
			<td style="border: none; padding: 0cm"><p><strong>High-frequency
				waves</strong></p>
			</td>
			<td style="border: none; padding: 0cm"><p>E-based or H-based
				curl-curl (Maxwell) forms, with complex
				permittivity/permeability.</p>
			</td>
		</tr>
	</tbody>
</table>
<p>So yes—<strong>the timing structure strongly influences choice</strong>:</p>
<ul>
	<li><p>If conduction currents change in time, you need <strong>both</strong>
	magnetic and electric potentials (A-V).</p>
	</li><li><p>If purely static, you can drop electric terms and simplify to
	ϕm or A only.</p>
	</li><li><p>For waves, curl-curl (E or H) is the natural Maxwell form.</p>
</li></ul>
<hr>

<h2 class="western">4. Efficiency &amp; Practical Hints</h2>
<ul>
	<li><p><strong>Use the simplest unknown set that still represents
	your physics</strong>: avoid A-V if DC magnetostatics suffices.</p>
	</li><li><p><strong>Scalar potential fails</strong> if your region is not
	simply connected or has conduction current.</p>
	</li><li><p><strong>Gauge conditions</strong> (∇·A = 0, etc.) matter:
	GetDP lets you enforce via constraints.</p>
	</li><li><p><strong>Boundary conditions</strong>: tangential A or normal
	B are trivial in A-formulation; tangential H is easier in ϕm.</p>
</li></ul>
<hr>

<h3 class="western">5. Quick decision tree</h3>
<ol>
	<li><p><strong>Static, no current in region?</strong> → Scalar ϕm.</p>
	</li><li><p><strong>Static, real J in region?</strong> → Vector A.</p>
	</li><li><p><strong>Time-varying, low-freq, conductors present?</strong>
	→ A-V or T-Ω.</p>
	</li><li><p><strong>High-freq EM waves?</strong> → Curl-curl E (or H).</p>

--------
14-6-2026


0. **inductor.pro** is the best example for AMTD. It can be understood to be a H dipole magnet. It is simulated in 2D ( axis-symmetric and planar), 3D (1/4, 1/2 or full), linear/non-linear B-H curce, static/harmonic/time-domain, Constraint (none /week) , type_of_gauage (Coulomb / tree-cotree) ,

1. There are many examples of machine design using getdp.

2. **Magnetodynamics with cohomology conditions** : 
The example contains a 3D model of an induction heating device, using T-Omega
and A-v formulations and the Gmsh cohomology solver. It also includes simple thermal coupling. The electromagnetic modeling aspects of the problem turn out to be subtle. The so-called A-V formulation of the problem is straightforward to implement, but it results in a large linear system that might be difficult to solve. 

In the T−Omega formulation of the problem, the same accuracy is achieved with a smaller linear system, but its implementation involves so-called thick-cuts, or source fields, that aren't discussed much in the finite element curriculum and may be difficult to produce. Here, we call them cohomology basis functions, and generate them using the cohomology solver implemented in Gmsh.

3. Inductor : 2D and 3D model of an inductor/core system
The example contains both 2D and 3D models, static and dynamic, linear and nonlinear. The 2D model is very similar to the FEMM inductor example
(http://www.femm.info/wiki/InductanceExample).

4. defining norm of a vector quantity

{ Name nb  ; Value { Term { [ Norm[{d a}] ] ; In Domain ; Jacobian Vol ; } } }

4a. defining z-component of the vector potential

{ Name az; 
        Value {
          Term { [ CompZ[{a}] ]; In Vol_Mag; Jacobian Vol; }
        }



5. Conclusion of "Calculation of the eddy current field in components of Tokamak type fusion reactors using the open source GetDP software_2025"

GetDP is an **efficient and reliable** open source tool for future calculations. All kinds of weak formulations of computational problems from different physical domains can be added to the solution sequence using finite element discretization. The freedom of being able to work with an arbitrary amount of function spaces and complicated constraints allows the efficient solution of a wide variety of complex computational multi-physics problems.

6. Life-HTS/magnet/magnet.pro has options for simulating in 8 types of formulations. It is wrth seeing.

7. What Formulation Should One Choose for Modeling a 3D HTS Magnet Motor Pole with a Ferromagnetic Material? (2022)

8. Two approches to field due to current:

a) for simple geometries, specify the curent density (as in inductor.pro) ::: parametrise the current for each mesh element within the 3D coil. However this is hardly scalable for more complex / various coil geometries.

b) add a plane coil_cut within the 3D coil and add some current density vectors normal to this plane. Considering that the coil is simulated as a 'conducting element', the current should be flowing throught the whole coil.

9. The gauge condition :  tree-cotree and coulomb gauge. ====> used to reduce degree of freedom so that problem has UNIQUE solution.

10. How to define current density in 3D volume?

11. There are many formulations for magnetic field computation because no single formulation is optimal for all electromagnetic problems. Different formulations trade off accuracy, computational cost, ease of applying boundary conditions, treatment of conductors, and compatibility with circuit coupling.

**Common formulations and their uses ==>**

Formulation		Unknowns						Typical use

V			Electric scaler potential			Electrostatics, steady electric current flow, low-f current flow

ϕm or Ω		Magnetic scalar potential			Current-free regions (permanent magnets only)

A			Magnetic vector potential			General magnetostatics, eddy currents

A−V (A−ϕ) 		A + V					Transient EM, Eddy-current problems, Coupling to external circuits

T−Ω			Current vector potential + Ω			Electrical machines, stranded coils

H-formulation		Magnetic field intensity			Superconductors

E-formulation		Electric field			Full Wave problems (RF cavities, Filters. Dielectric resonators)

**Notes-**

1) Even using the same unknowns, formulations can be different. For example, electrostatics and current flow problems use the same variable V. But their formulations are different. Similarily, H is used as unknown for RF devices and also for superconducting devices. But the actual formulations are different.

2) More unknows does not mean more time required to solve. It can be less.

3) **Whitney forms** -- Whitney forms were introduced by the mathematician Hassler Whitney. They use A and V as variables but use edge, face or volume is the associated mesh entity. 

4) Choosing the formulation is often as important as choosing the mesh or solver.

5) **Why is the weak form often better?**

The weak form:

Reduces derivative requirements. Naturally incorporates boundary conditions. Produces symmetric matrices for many problems. Makes FEM possible.
Often guarantees existence and uniqueness under broader conditions.

In fact, many PDEs do not possess classical (strong) solutions at all, but they do possess weak solutions.

So "weak" refers to weaker mathematical requirements on the solution, not to weaker accuracy or weaker physics. In finite-element analysis, the weak form is usually the preferred formulation.

=============================

==============================

 

**Formulations in electromagnetics**

Magnetostatics is the subfield of electromagnetics describing a static magnetic field, such as the one generated by a steady electric current or a permanent magnet. 

Developing finite element models includes writing the differential problem describing the chosen physics into an alternative form, called a **formulation**, that is suited for a practical implementation of the finite element method. 

In the context of Finite Element Method (FEM) simulations for electromagnetics, a formulation refers to the specific set of unknown variables (degrees of freedom) and the corresponding governing equations derived from Maxwell's equations that are solved for on the mesh.

The choice of formulation is critical because it determines:

* What you solve for : The primary unknown (e.g., magnetic vector potential A, magnetic field H, scalar potential φ).

* Physical Phenomena Captured : Whether the formulation includes static fields, eddy currents, motion, etc.

* Computational Efficiency : Some formulations have more unknowns and are more computationally expensive.

* Ease of Applying Boundary Conditions : Some make it easier to set certain boundary conditions (like tangential H fields).

* Numerical Stability : Some are less prone to numerical errors like "cancelation errors" in regions of high permeability.

===> the full Maxwell’s equations describe wave phenomena, whereas the magnetodynamics equations define a diffusion problem.
The magnetodynamic (or magneto-quasistatic) approximation of Maxwell’s equations consists in neglecting the electric displacement current ∂td in the Ampere-Maxwell’s law.

===> Maxwell's equations is completed by constitutive following relations. For isotropic materials, three scalar parameters are introduced and define the relations

b = µh,        d = εe,        j = σe

with µ the permeability (H/m), ε the permittivity (F/m) and σ the electrical conductivity (S/m).
In general, constitutive relations are nonlinear and the three parameters µ, ε and σ can be
complicated functionals or functions of, e.g., position, temperature, magnetic field, electric field
or mechanical stress and strain. 

===> In COMSOL, these are the proposed formulations (1) Magnetic Fields, No Current; (2) Magnetic Fields only ; (3) Magnetic and Electric Fields;  and (4) Magnetic Field Formulation. These are sometimes called Vm, A, A-V, and T formulations, respectively.

The A–V Formulation

The A Formulation can be combined with The V Formulation to take into account static electric fields. This formulation, referred to as the A–V formulation, is used by The Magnetic and Electric Fields Interface. The A–V formulation solves two dependent variables — A and V in a fully coupled way. For more details, see the Theory for the Magnetic and Electric Fields Interface.


The A–Vm Formulation

(Vm is magnetic scalar potential)

Mixed formulations are also used in computational electromagnetics. These formulations use different formulations that are more suitable for specific computation domains. One of the most famous mixed formulations is the A–Vm formulation, which is a combination of The A Formulation and The Vm Formulation. In this mixed formulation, The A Formulation is used to model current-carrying domains, and The Vm Formulation is used to model the air gap and other nonconducting domains. The two formulations are coupled on their common interfacing boundaries. The A–Vm formulation is used by The Rotating Machinery, Magnetic Interface.


T-A formulation

In recent years, the T-A formulation has emerged as an efficient approach for modelling the
electromagnetic behaviour of high-temperature superconductor (HTS) tapes in the form of
coated conductors (CCs). HTS CCs are characterized by an extremely large width-to-thickness
ratio of the superconducting layer, normally up to 1000 ∼ 6000, which in general leads to a very
large number of degrees of freedom. The T-A formulation considers the superconducting layer
to be infinitely thin. The magnetic vector potential A is used to calculate the magnetic field
distribution in all simulated domains. The current vector potential T is used to calculate the
current density in the superconducting layer, which is a material simulated with a highly
nonlinear power-law resistivity.


Standard and Mixed Finite Element Formulations

h-φ , a , h-φ-a, t-a, h-φ-b, and a-j 

h - magnetic field  ,  a - mag vector potential , φ - scaler magnetic potential,  T - electric vector potential, b - magnetic flux density, j - current density.

The h-φ-formulation is a weak form of Faraday’s law.

(ref : This thesis : Standard and Mixed Finite Element Formulations for Systems with Type-II Superconductors)

===> We highlight the fact that the best formulation is problem-dependent and we give general recommendations for obtaining
efficient time-stepping and linearization techniques.

Summary Table
Formulation	Primary Unknowns	Key Application	Pros	Cons
a (A)	Magnetic Vector Potential	General 3D Magnetostatics	Robust, handles currents & magnets	3 unknowns/node, expensive
ϕ	Scalar Potential	Magnetostatics (no currents)	Very efficient (1 unknown/node)	Cannot model regions with current
h-φ (H-φ)	H-Field, Scalar Potential	Magnetostatics (high-μ materials)	Avoids numerical cancelation	More complex than simple ϕ
a-φ (A-φ)	A-Vector Potential, φ-Scalar	3D Eddy Currents (AC)	Industry standard for AC	Computationally expensive
t-Ω (T-Ω)	T-Vector Potential, Ω-Scalar	Eddy Currents in conductors	Efficient for eddy-dominated problems	Less common, harder to find sources
h-φ-a (H-φ-A)	H, φ, A	Hybrid AC/Motors	Accuracy in iron + efficiency in air	Complex setup & coupling
a-j (A-J)	A-Vector Potential, J-Current	Superconductors	Directly models nonlinear E-J law	Specialized use case

In practice, modern simulation software (like COMSOL, ANSYS Maxwell, JMAG) often chooses the optimal formulation automatically based on the physics interfaces you add (e.g., "Magnetic Fields" vs. "Magnetic Fields, No Currents") but allows advanced users to select and modify them for specific needs.
