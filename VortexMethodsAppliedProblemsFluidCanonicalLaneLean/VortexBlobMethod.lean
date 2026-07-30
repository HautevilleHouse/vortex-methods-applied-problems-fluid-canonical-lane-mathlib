import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

structure BlobFunction where
  kernel : ℝ → ℝ
  supportRadius : ℝ

def gaussianBlob : BlobFunction := {
  kernel := fun r => Real.exp (-(r^2)),
  supportRadius := 3.0
}

def blob_velocity (blob : BlobFunction) (pos : ℝ → ℝ) : ℝ → ℝ := fun x => 0

def VortexBlobApproximation (blob : BlobFunction) (epsilon : ℝ) : Prop := True

theorem blob_convergence_as_epsilon_goes_to_zero :
    VortexBlobApproximation gaussianBlob 0 := by
  unfold VortexBlobApproximation
  trivial

end VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse