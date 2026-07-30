import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

abbrev Position := Fin 3 → ℝ
abbrev Circulation := ℝ

structure VortexFilament where
  position : Position
  circulation : Circulation
  coreRadius : ℝ

def zeroFilament : VortexFilament := {
  position := fun _ => 0,
  circulation := 0,
  coreRadius := 0
}

structure VortexFilamentSystem where
  filaments : List VortexFilament
  viscosity : ℝ
  time : ℝ

def vortex_induced_velocity (Γ : ℝ) (r : Position) : Position := fun _ => 0

def filament_advection (sys : VortexFilamentSystem) : VortexFilamentSystem := sys

theorem filament_zero_velocity :
    vortex_induced_velocity 0 (fun _ => 0) = (fun _ => 0) := by
  ext i; simp[vortex_induced_velocity]

end VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse
