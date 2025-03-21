import math

class UndulatorDesigner:
    def __init__(self):
        # Physical constants
        self.c = 299792458  # Speed of light in vacuum (m/s)
        self.e = 1.602176634e-19  # Elementary charge (C)
        self.m_e = 9.1093837015e-31  # Electron rest mass (kg)
        self.mu_0 = 4 * math.pi * 1e-7  # Vacuum permeability (H/m)
        
    def calculate_undulator_parameter(self, B0, lambda_u):
        """Calculate undulator parameter K
        B0: peak magnetic field in Tesla
        lambda_u: undulator period in mm
        """
        # Convert lambda_u from mm to cm for the formula
        lambda_u_cm = lambda_u / 10
        return 0.934 * B0 * lambda_u_cm
    
    def calculate_gamma(self, energy_GeV):
        """Calculate relativistic gamma factor from beam energy in GeV"""
        E_rest_GeV = self.m_e * self.c**2 / (self.e * 1e9)  # Rest energy in GeV
        return energy_GeV / E_rest_GeV
    
    def calculate_radiation_wavelength(self, lambda_u, gamma, K, harmonic=1):
        """Calculate radiation wavelength for given harmonic
        lambda_u: undulator period in meters
        gamma: relativistic factor
        K: undulator parameter
        harmonic: harmonic number (default: 1 for fundamental)
        Returns: wavelength in meters
        """
        if harmonic == 1:
            return (lambda_u / (2 * gamma**2)) * (1 + K**2/2)
        else:
            # For higher harmonics (simplified formula)
            return (lambda_u / (2 * gamma**2 * harmonic)) * (1 + K**2/2)
    
    def calculate_field_halbach(self, B_rem, lambda_u, h, M=4):
        """Calculate peak magnetic field for Halbach array
        B_rem: remanent field of magnets in Tesla
        lambda_u: undulator period in meters
        h: magnet height in meters
        M: number of magnet blocks per period (default: 4)
        """
        return B_rem * (1 - math.exp(-2 * math.pi * h / lambda_u)) * math.sin(math.pi/M)
    
    def calculate_field_vs_gap(self, a, b, c, lambda_u, gap):
        """Calculate field strength as a function of gap
        a, b, c: fitting parameters
        lambda_u: undulator period in meters
        gap: gap between magnet arrays in meters
        """
        g_normalized = gap / lambda_u
        return a * math.exp(-b * g_normalized + c * g_normalized**2)
    
    def calculate_spectral_flux(self, N, K, current, harmonic=1):
        """Calculate relative spectral flux for given harmonic
        N: number of periods
        K: undulator parameter
        current: beam current in mA
        harmonic: harmonic number (default: 1)
        """
        if harmonic == 1:
            return N**2 * K**2 * current / (1 + K**2/2)
        else:
            # Simplified approximation for higher harmonics
            return N**2 * current * K**(2*harmonic) / (harmonic * (1 + K**2/2)**(harmonic+1))
    
    def calculate_phase_error_requirement(self, N):
        """Calculate maximum allowed phase error for good spectral performance
        N: number of periods
        """
        return 1 / (2 * math.sqrt(N))
    
    def calculate_radiation_power(self, energy_GeV, current_mA, B0, lambda_u, N):
        """Calculate total radiation power in watts
        energy_GeV: electron energy in GeV
        current_mA: beam current in mA
        B0: peak magnetic field in Tesla
        lambda_u: undulator period in meters
        N: number of periods
        """
        return 1.27 * energy_GeV**2 * current_mA * B0**2 * lambda_u * N
    
    def calculate_critical_energy(self, energy_GeV, B0):
        """Calculate critical energy in keV
        energy_GeV: electron energy in GeV
        B0: peak magnetic field in Tesla
        """
        return 0.665 * energy_GeV**2 * B0
        
    def calculate_magnetic_force(self, B0, width, length, gap):
        """Calculate magnetic attractive force between undulator jaws
        B0: peak magnetic field in Tesla
        width: width of the magnets in meters
        length: length of the undulator in meters
        gap: gap between undulator jaws in meters
        Returns: force in Newtons
        """
        # Maxwell stress tensor approximation - attractive force per unit area
        # F/A = B²/(2μ₀)
        force_per_area = B0**2 / (2 * self.mu_0)
        
        # Total area is the width times the length
        area = width * length
        
        # The force decreases approximately exponentially with gap
        gap_factor = math.exp(-math.pi * gap / length)
        
        return force_per_area * area * gap_factor
        
    def calculate_max_deflection_angle(self, B0, lambda_u, energy_GeV):
        """Calculate maximum deflection angle of electron beam
        B0: peak magnetic field in Tesla
        lambda_u: undulator period in meters
        energy_GeV: electron energy in GeV
        Returns: deflection angle in radians
        """
        K = self.calculate_undulator_parameter(B0, lambda_u * 1000)  # Convert m to mm
        gamma = self.calculate_gamma(energy_GeV)
        
        # Maximum deflection angle is K/gamma
        return K / gamma
        
    def calculate_max_deflection(self, B0, lambda_u, energy_GeV):
        """Calculate maximum transverse deflection of electron beam
        B0: peak magnetic field in Tesla
        lambda_u: undulator period in meters
        energy_GeV: electron energy in GeV
        Returns: deflection in micrometers
        """
        K = self.calculate_undulator_parameter(B0, lambda_u * 1000)  # Convert m to mm
        gamma = self.calculate_gamma(energy_GeV)
        
        # Maximum deflection is (K*λu)/(2πγ)
        deflection = (K * lambda_u) / (2 * math.pi * gamma)
        return deflection * 1e6  # Convert to micrometers


def get_user_input(prompt, default, input_type=float):
    """Get user input with default value"""
    try:
        user_input = input(f"{prompt} [{default}]: ")
        if user_input.strip() == '':
            return default
        return input_type(user_input)
    except ValueError:
        print(f"Invalid input. Using default value: {default}")
        return default


def print_header(text):
    """Print a section header"""
    print("\n" + "=" * 60)
    print(f" {text} ".center(60, "-"))
    print("=" * 60)


def print_table(headers, data):
    """Print data in tabular format"""
    # Find maximum width for each column
    col_widths = [len(h) for h in headers]
    for row in data:
        for i, item in enumerate(row):
            col_widths[i] = max(col_widths[i], len(str(item)))
    
    # Print headers
    header_str = "  ".join(h.ljust(col_widths[i]) for i, h in enumerate(headers))
    print(header_str)
    print("-" * len(header_str))
    
    # Print data
    for row in data:
        print("  ".join(str(item).ljust(col_widths[i]) for i, item in enumerate(row)))


def main():
    print_header("PERMANENT MAGNET PLANAR UNDULATOR DESIGNER")
    print("This program calculates undulator parameters and radiation properties.")
    
    designer = UndulatorDesigner()
    
    # Get input parameters from user
    print_header("INPUT PARAMETERS")
    
    lambda_u_mm = get_user_input("Undulator Period (λu) [mm]", 20)
    lambda_u = lambda_u_mm / 1000  # Convert to meters
    
    N = get_user_input("Number of Periods (N)", 50, int)
    gap_mm = get_user_input("Gap [mm]", 10)
    gap = gap_mm / 1000  # Convert to meters
    
    energy_GeV = get_user_input("Electron Energy [GeV]", 3.0)
    current_mA = get_user_input("Beam Current [mA]", 500)
    
    B_rem = get_user_input("Magnet Material Remanent Field [T]", 1.2)
    h_mm = get_user_input("Magnet Height [mm]", 30)
    h = h_mm / 1000  # Convert to meters
    
    M = get_user_input("Number of Blocks per Period (M)", 4, int)
    
    # New parameters
    magnet_width_mm = get_user_input("Magnet Width [mm]", 60)
    magnet_width = magnet_width_mm / 1000  # Convert to meters
    
    # Calculate results
    gamma = designer.calculate_gamma(energy_GeV)
    B0 = designer.calculate_field_halbach(B_rem, lambda_u, h, M)
    K = designer.calculate_undulator_parameter(B0, lambda_u_mm)
    
    # Display basic results
    print_header("BASIC PARAMETERS")
    print(f"Peak Magnetic Field (B0): {B0:.4f} T")
    print(f"Undulator Parameter (K): {K:.4f}")
    print(f"Relativistic Factor (γ): {gamma:.2f}")
    
    # Calculate and display radiation properties
    print_header("RADIATION PROPERTIES")
    
    # Table headers for radiation data
    rad_headers = ["Harmonic", "Wavelength (nm)", "Energy (eV)", "Rel. Intensity"]
    rad_data = []
    
    for harmonic in range(1, 8):  # Calculate first 7 harmonics
        if harmonic % 2 == 1 or K > 1:  # Only odd harmonics for K<<1
            lambda_r = designer.calculate_radiation_wavelength(lambda_u, gamma, K, harmonic)
            lambda_r_nm = lambda_r * 1e9  # Convert to nm
            energy_eV = 1240 / lambda_r_nm  # Approximate conversion
            
            # Calculate relative intensity (simplified)
            if harmonic == 1:
                rel_intensity = 1.0
            else:
                # Approximate intensity scaling for higher harmonics
                rel_intensity = (K**(2*harmonic) / ((1 + K**2/2)**(harmonic+1))) / harmonic**2
            
            rad_data.append([
                harmonic,
                f"{lambda_r_nm:.4f}",
                f"{energy_eV:.2f}",
                f"{rel_intensity:.4f}"
            ])
    
    print_table(rad_headers, rad_data)
    
    # Calculate and display additional parameters
    phase_error = designer.calculate_phase_error_requirement(N)
    power = designer.calculate_radiation_power(energy_GeV, current_mA, B0, lambda_u, N)
    E_crit = designer.calculate_critical_energy(energy_GeV, B0)
    
    print_header("ADDITIONAL PARAMETERS")
    print(f"Maximum Allowed Phase Error: {phase_error:.6f} rad")
    print(f"Total Radiation Power: {power:.2f} W")
    print(f"Critical Energy: {E_crit:.2f} keV")
    
    # Calculate beam deflection
    max_angle_rad = designer.calculate_max_deflection_angle(B0, lambda_u, energy_GeV)
    max_angle_mrad = max_angle_rad * 1000  # Convert to mrad
    max_deflection = designer.calculate_max_deflection(B0, lambda_u, energy_GeV)
    
    print_header("BEAM DEFLECTION")
    print(f"Maximum Deflection Angle: {max_angle_mrad:.4f} mrad")
    print(f"Maximum Transverse Deflection: {max_deflection:.4f} µm")
    
    # Calculate magnetic field and forces vs gap
    print_header("FIELD AND FORCE VS GAP ANALYSIS")
    
    # Use empirical formula with typical parameters for field
    a = B0 * math.exp(2 * gap / lambda_u)  # Back-calculate a from current B0 and gap
    b = 4.0  # Typical value
    c = 0.2  # Typical value
    
    # Calculate undulator length
    undulator_length = N * lambda_u
    
    gap_headers = ["Gap (mm)", "Field (T)", "K Parameter", "Force (kN)", "Force/Length (kN/m)"]
    gap_data = []
    
    for g_mm in range(5, 31, 5):  # Gaps from 5 to 30 mm in steps of 5
        g = g_mm / 1000  # Convert to meters
        field = designer.calculate_field_vs_gap(a, b, c, lambda_u, g)
        k_param = designer.calculate_undulator_parameter(field, lambda_u_mm)
        
        # Calculate magnetic force at this gap
        force = designer.calculate_magnetic_force(field, magnet_width, undulator_length, g)
        force_kN = force / 1000  # Convert to kilonewtons
        force_per_length = force / undulator_length / 1000  # kN/m
        
        gap_data.append([
            g_mm,
            f"{field:.4f}",
            f"{k_param:.4f}",
            f"{force_kN:.2f}",
            f"{force_per_length:.2f}"
        ])
    
    print_table(gap_headers, gap_data)
    
    # Summary
    print_header("SUMMARY")
    
    lambda_r_fundamental = designer.calculate_radiation_wavelength(lambda_u, gamma, K)
    lambda_r_nm = lambda_r_fundamental * 1e9  # Convert to nm
    energy_eV = 1240 / lambda_r_nm  # Approximate conversion
    
    force_current = designer.calculate_magnetic_force(B0, magnet_width, undulator_length, gap)
    force_kN = force_current / 1000  # Convert to kilonewtons
    
    print("Undulator Configuration:")
    print(f"- {N} periods of {lambda_u_mm:.2f} mm length")
    print(f"- Total length: {undulator_length*1000:.1f} mm")
    print(f"- Gap: {gap_mm:.2f} mm")
    print(f"- Peak field: {B0:.4f} T (K = {K:.2f})")
    print(f"- Magnetic attraction force: {force_kN:.2f} kN ({force_kN/undulator_length:.2f} kN/m)")
    
    print("\nBeam Properties:")
    print(f"- Energy: {energy_GeV:.2f} GeV")
    print(f"- Maximum deflection angle: {max_angle_mrad:.4f} mrad")
    print(f"- Maximum transverse excursion: {max_deflection:.2f} µm")
    
    print("\nRadiation Properties:")
    print(f"- Fundamental wavelength: {lambda_r_nm:.2f} nm ({energy_eV:.2f} eV)")
    print(f"- Total power: {power:.2f} W")
    
    print("\nThank you for using the PM Planar Undulator Designer!")


if __name__ == "__main__":
    main()
