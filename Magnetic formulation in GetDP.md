<p>Here’s
a “big-picture” map of what those names mean and how
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
