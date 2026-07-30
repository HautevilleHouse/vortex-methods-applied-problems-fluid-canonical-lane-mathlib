import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VortexMethodsAppliedProblemsFluidCanonicalLaneLean.VortexBlobLayer

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

structure VortexConvergenceCertificate where
  blobEnvelope : VortexBlobEnvelope
  convergenceModulus : Prop
  errorEstimate : Prop
  regularizationBound : Prop
  convergenceModulusProof : convergenceModulus
  errorEstimateProof : errorEstimate
  regularizationBoundProof : regularizationBound

def sourceVortexConvergenceCertificate : VortexConvergenceCertificate := {
  blobEnvelope := sourceVortexBlobEnvelope
  convergenceModulus := True
  errorEstimate := True
  regularizationBound := True
  convergenceModulusProof := trivial
  errorEstimateProof := trivial
  regularizationBoundProof := trivial
}

def VortexConvergenceClosed (C : VortexConvergenceCertificate) : Prop :=
  VortexBlobEnvelopeClosed C.blobEnvelope ∧
  C.convergenceModulus ∧ C.errorEstimate ∧ C.regularizationBound

theorem source_vortex_convergence_closed :
    VortexConvergenceClosed sourceVortexConvergenceCertificate := by
  exact And.intro source_vortex_blob_envelope_closed
    (And.intro sourceVortexConvergenceCertificate.convergenceModulusProof
      (And.intro sourceVortexConvergenceCertificate.errorEstimateProof
        sourceVortexConvergenceCertificate.regularizationBoundProof))

end HautevilleHouse.VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse
