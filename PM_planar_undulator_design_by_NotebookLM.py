import numpy as np

print("Planar Permanent Magnet (PM) Undulator Design Tool")
print("--------------------------------------------------")
print("This tool provides a basic calculation for planar PM undulator parameters based on user inputs and simplified models.")
print("It draws upon information from the provided sources, particularly regarding the relationships between electron beam energy, radiation wavelength, undulator period, and magnetic field.")
print("Please note that this is a simplified tool and does not encompass all complexities of real undulator design, such as field errors, engineering constraints, or specific PM material properties beyond a general remanent field assumption in some models.")
print()

# --- User Inputs ---
while True:
    try:
        electron_energy_gev = float(input("Enter the electron beam energy in GeV: "))
        if electron_energy_gev <= 0:
            raise ValueError
        break
    except ValueError:
        print("Invalid input. Please enter a positive number for electron beam energy.")

relativistic_factor = electron_energy_gev * 1.0e9 / (0.511e6)  # gamma [1]
print(f"Relativistic factor (gamma): {relativistic_factor:.2f}")
print()

while True:
    try:
        desired_radiation_wavelength_nm = float(input("Enter the desired radiation wavelength in nm: "))
        if desired_radiation_wavelength_nm <= 0:
            raise ValueError
        desired_radiation_wavelength_m = desired_radiation_wavelength_nm * 1.0e-9
        break
    except ValueError:
        print("Invalid input. Please enter a positive number for radiation wavelength.")
print(f"Desired radiation wavelength: {desired_radiation_wavelength_nm:.2f} nm ({desired_radiation_wavelength_m:.2e} m)")
print()

while True:
    undulator_period_mm_str = input("Enter the undulator period (lambda_u) in mm (or type 'calculate_period'): ")
    if undulator_period_mm_str.lower() == 'calculate_period':
        undulator_period_m = None
        break
    try:
        undulator_period_mm = float(undulator_period_mm_str)
        if undulator_period_mm <= 0:
            raise ValueError
        undulator_period_m = undulator_period_mm * 1.0e-3
        break
    except ValueError:
        print("Invalid input. Please enter a positive number for the undulator period or 'calculate_period'.")
if undulator_period_m is not None:
    print(f"Undulator period (lambda_u): {undulator_period_mm:.2f} mm ({undulator_period_m:.2e} m)")
    print()

while True:
    magnet_gap_mm_str = input("Enter the magnet gap (g) in mm (or type 'calculate_gap'): ")
    if magnet_gap_mm_str.lower() == 'calculate_gap':
        magnet_gap_m = None
        break
    try:
        magnet_gap_mm = float(magnet_gap_mm_str)
        if magnet_gap_mm <= 0:
            raise ValueError
        magnet_gap_m = magnet_gap_mm * 1.0e-3
        break
    except ValueError:
        print("Invalid input. Please enter a positive number for the magnet gap or 'calculate_gap'.")
if magnet_gap_m is not None:
    print(f"Magnet gap (g): {magnet_gap_mm:.2f} mm ({magnet_gap_m:.2e} m)")
    print()

# --- Calculations ---
speed_of_light = 2.99792458e8  # m/s
electron_charge = 1.602176634e-19  # C
electron_mass = 9.1093837015e-31  # kg
mu0 = 4 * np.pi * 1e-7  # T m / A

print("\n--- Calculated Parameters ---")

if undulator_period_m is not None:
    # Calculate Undulator Parameter (K) based on B0 (if provided later)
    def calculate_k(peak_magnetic_field_t, undulator_period_m):
        k = 0.934 * undulator_period_m * 100 * peak_magnetic_field_t  # Using approximation from [2] with period in cm
        return k

    # Calculate radiation wavelength [1-4]
    calculated_radiation_wavelength_m = (undulator_period_m / (2 * relativistic_factor**2)) * (1 + (0.5 * 1**2)) # Assuming K=1 for initial estimate
    print(f"Estimated radiation wavelength (for K=1): {calculated_radiation_wavelength_m * 1e9:.2f} nm")
    if magnet_gap_m is not None:
        # Estimate Peak Magnetic Field (B0) for a PPM undulator using a simplified formula from [5]
        # This formula is for a "wide open undulator" and assumes a remanent field (Br).
        # We'll ask the user for a typical Br value.
        while True:
            try:
                remanent_field_t = float(input("Enter an estimated remanent field (Br) of the permanent magnet material in Tesla (e.g., 1.1): "))
                if remanent_field_t <= 0:
                    raise ValueError
                break
            except ValueError:
                print("Invalid input. Please enter a positive number for the remanent field.")

        b_factor = 2.1  # Typical value from [5]
        a_factor = np.pi  # Typical value from [5]
        gap_to_period_ratio = magnet_gap_m / undulator_period_m
        estimated_peak_magnetic_field_t_ppm = b_factor * remanent_field_t * np.exp(-gap_to_period_ratio * a_factor)
        print(f"Estimated peak magnetic field (B0) for PPM undulator: {estimated_peak_magnetic_field_t_ppm:.2f} T (using simplified model from [5])")

        # Recalculate K with the estimated B0
        calculated_k = calculate_k(estimated_peak_magnetic_field_t_ppm, undulator_period_m)
        print(f"Undulator parameter (K): {calculated_k:.2f}")

        # Recalculate radiation wavelength with the calculated K [1-4]
        recalculated_radiation_wavelength_m = (undulator_period_m / (2 * relativistic_factor**2)) * (1 + (calculated_k**2 / 2))
        print(f"Recalculated radiation wavelength: {recalculated_radiation_wavelength_m * 1e9:.2f} nm")

elif undulator_period_m is None:
    if magnet_gap_m is not None:
        print("To calculate the undulator period, we need an estimate of the peak magnetic field (B0) or the undulator parameter (K).")
        print("Alternatively, if you provide a remanent field (Br) for a PPM undulator, we can iterate to find a consistent period.")
        print("Due to the complexity of inverting the B0 formula and the underdetermined nature of the problem without more constraints, calculating the period is not implemented in this basic version.")
    else:
        print("Please provide either the undulator period or the magnet gap to proceed with calculations.")

print("\n--- Notes ---")
print("- The formulas used here are simplified and may not be accurate for all undulator designs, especially hybrid types with iron [6].")
print("- The peak magnetic field estimation for PPM undulators is based on an approximation [5]. Actual values can vary based on magnet block geometry and material properties.")
print("- The undulator parameter K is dimensionless and influences the deflection of the electron beam and the generated radiation spectrum [1, 2].")
print("- Achieving the desired radiation wavelength depends on the precise values of electron beam energy, undulator period, and the undulator parameter K [1-4].")
print("- Engineering constraints, such as minimum achievable magnet gaps and maximum usable magnetic field strengths for permanent magnets, are not considered in this basic tool [7, 8].")
print("- For more accurate and detailed undulator design, specialised magnetostatic software is required, especially for hybrid designs [6].")
