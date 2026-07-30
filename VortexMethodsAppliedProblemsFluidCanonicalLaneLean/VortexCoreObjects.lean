import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Exp

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

abbrev Space2 := Fin 2 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space2 → ℝ
abbrev VectorField := Time → Space2 → Space2

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

structure VortexOperators where
  curl : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  convective : VectorField → VectorField
  vortexStretching : VectorField → VectorField
  vortexStretchingIdempotent : ∀ u, vortexStretching (vortexStretching u) = vortexStretching u

def primitiveVortexOperators : VortexOperators := {
  curl := fun _ => zeroScalarField
  gradient := fun _ => zeroVectorField
  laplacian := fun u => u
  timeDerivative := fun _ => zeroVectorField
  convective := fun _ => zeroVectorField
  vortexStretching := fun u => u
  vortexStretchingIdempotent := by
    intro u
    rfl
}

structure VortexFlow where
  velocity : VectorField
  vorticity : ScalarField
  viscosity : ℝ
  operators : VortexOperators

def primitiveVortexFlow : VortexFlow := {
  velocity := zeroVectorField
  vorticity := zeroScalarField
  viscosity := 1
  operators := primitiveVortexOperators
}

def VorticityEquation (F : VortexFlow) : Prop :=
  F.operators.timeDerivative F.velocity = F.operators.laplacian F.velocity

def VortexStretchingClosed (F : VortexFlow) : Prop :=
  F.operators.vortexStretching F.velocity = F.velocity

def EulerEquationClosed (F : VortexFlow) : Prop :=
  F.operators.convective F.velocity = F.operators.timeDerivative F.velocity

def VortexCoreBalance (F : VortexFlow) : Prop :=
  VorticityEquation F ∧ VortexStretchingClosed F

theorem primitive_vortex_stretching_idempotent_checked (u : VectorField) :
    primitiveVortexOperators.vortexStretching (primitiveVortexOperators.vortexStretching u) =
      primitiveVortexOperators.vortexStretching u := by
  rfl

theorem primitive_vorticity_equation_checked :
    VorticityEquation primitiveVortexFlow := by
  unfold VorticityEquation primitiveVortexFlow primitiveVortexOperators zeroVectorField
  rfl

theorem primitive_vortex_stretching_closed_checked :
    VortexStretchingClosed primitiveVortexFlow := by
  unfold VortexStretchingClosed primitiveVortexFlow primitiveVortexOperators zeroVectorField
  rfl

theorem primitive_euler_equation_closed_checked :
    EulerEquationClosed primitiveVortexFlow := by
  unfold EulerEquationClosed primitiveVortexFlow primitiveVortexOperators zeroVectorField
  rfl

theorem primitive_vortex_core_balance_checked :
    VortexCoreBalance primitiveVortexFlow := by
  exact And.intro primitive_vorticity_equation_checked primitive_vortex_stretching_closed_checked

end HautevilleHouse.VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse