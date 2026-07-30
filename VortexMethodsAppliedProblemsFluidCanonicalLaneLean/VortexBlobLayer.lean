import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VortexMethodsAppliedProblemsFluidCanonicalLaneLean.VortexCoreObjects

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

structure VortexBlobEnvelope where
  flow : VortexFlow
  coreRadius : ℝ
  circulation : ℝ
  coreShape : String
  superpositionClosed : Prop
  coreRadiusPositive : ℝ>0
  circulationNonZero : ℝ≠0
  superpositionClosedProof : superpositionClosed
  coreRadiusPositiveProof : coreRadiusPositive
  circulationNonZeroProof : circulationNonZero

def sourceVortexBlobEnvelope : VortexBlobEnvelope := {
  flow := primitiveVortexFlow
  coreRadius := 1
  circulation := 1
  coreShape := "Gaussian"
  superpositionClosed := True
  coreRadiusPositive := by
    have : (1 : ℝ) > 0 := by norm_num
    exact this
  circulationNonZero := by
    have : (1 : ℝ) ≠ 0 := by norm_num
    exact this
  superpositionClosedProof := trivial
  coreRadiusPositiveProof := by
    have : (1 : ℝ) > 0 := by norm_num
    exact this
  circulationNonZeroProof := by
    have : (1 : ℝ) ≠ 0 := by norm_num
    exact this
}

def VortexBlobEnvelopeClosed (E : VortexBlobEnvelope) : Prop :=
  E.superpositionClosed ∧ E.coreRadiusPositive ∧ E.circulationNonZero

theorem source_vortex_blob_envelope_closed :
    VortexBlobEnvelopeClosed sourceVortexBlobEnvelope := by
  exact And.intro sourceVortexBlobEnvelope.superpositionClosedProof
    (And.intro sourceVortexBlobEnvelope.coreRadiusPositiveProof sourceVortexBlobEnvelope.circulationNonZeroProof)

end HautevilleHouse.VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse
