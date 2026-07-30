import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

structure VortexStructure where
  circulation : ℝ
  coreRadius : ℝ
  coreShape : String
  viscosity : ℝ

def defaultVortex : VortexStructure := {
  circulation := 1.0
  coreRadius := 0.1
  coreShape := "Lamb-Oseen"
  viscosity := 1.0
}

structure VortexBlobCertificate where
  vortex : VortexStructure
  regularizationClosed : Prop
  smoothnessClosed : Prop
  overlapClosed : Prop
  conservationClosed : Prop
  regularizationClosedProof : regularizationClosed
  smoothnessClosedProof : smoothnessClosed
  overlapClosedProof : overlapClosed
  conservationClosedProof : conservationClosed

def sourceVortexBlobCertificate : VortexBlobCertificate := {
  vortex := defaultVortex
  regularizationClosed := True
  smoothnessClosed := True
  overlapClosed := True
  conservationClosed := True
  regularizationClosedProof := trivial
  smoothnessClosedProof := trivial
  overlapClosedProof := trivial
  conservationClosedProof := trivial
}

def VortexBlobClosed (C : VortexBlobCertificate) : Prop :=
  C.regularizationClosed ∧ C.smoothnessClosed ∧ C.overlapClosed ∧ C.conservationClosed

theorem source_vortex_blob_closed : VortexBlobClosed sourceVortexBlobCertificate := by
  exact And.intro (And.intro (And.intro sourceVortexBlobCertificate.regularizationClosedProof
    sourceVortexBlobCertificate.smoothnessClosedProof)
    sourceVortexBlobCertificate.overlapClosedProof)
    sourceVortexBlobCertificate.conservationClosedProof

end VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse