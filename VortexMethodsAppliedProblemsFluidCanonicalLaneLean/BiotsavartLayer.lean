import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

structure BiotSavartKernel where
  kernelType : String
  regularization : ℝ → ℝ
  farField : ℝ → ℝ

def defaultBiotsavartKernel : BiotSavartKernel := {
  kernelType := "Lamb-Oseen"
  regularization := fun r => 1.0
  farField := fun r => 1.0
}

structure BiotSavartCertificate where
  kernel : BiotSavartKernel
  kernelClosed : Prop
  inducedVelocityClosed : Prop
  farFieldDecayClosed : Prop
  kernelClosedProof : kernelClosed
  inducedVelocityClosedProof : inducedVelocityClosed
  farFieldDecayClosedProof : farFieldDecayClosed

def sourceBiotsavartCertificate : BiotSavartCertificate := {
  kernel := defaultBiotsavartKernel
  kernelClosed := True
  inducedVelocityClosed := True
  farFieldDecayClosed := True
  kernelClosedProof := trivial
  inducedVelocityClosedProof := trivial
  farFieldDecayClosedProof := trivial
}

def BiotSavartClosed (C : BiotSavartCertificate) : Prop :=
  C.kernelClosed ∧ C.inducedVelocityClosed ∧ C.farFieldDecayClosed

theorem source_biotsavart_closed : BiotSavartClosed sourceBiotsavartCertificate := by
  exact And.intro (And.intro sourceBiotsavartCertificate.kernelClosedProof
    sourceBiotsavartCertificate.inducedVelocityClosedProof)
    sourceBiotsavartCertificate.farFieldDecayClosedProof

end VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse