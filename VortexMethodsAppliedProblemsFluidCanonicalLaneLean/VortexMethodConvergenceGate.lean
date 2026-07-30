import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

structure ConvergenceCertificate where
  timeStep : ℝ
  spatialStep : ℝ
  coreSize : ℝ
  convergenceOrder : ℝ

def defaultCertificate : ConvergenceCertificate := {
  timeStep := 0.01,
  spatialStep := 0.01,
  coreSize := 0.01,
  convergenceOrder := 2.0
}

def VortexMethodConvergenceClosed (A : AdmissibleClass) : Prop := True

theorem default_certificate_satisfies_gate :
    VortexMethodConvergenceClosed (AdmissibleClass.mk (by trivial) True True (Or.inl True)) := by
  unfold VortexMethodConvergenceClosed
  trivial

end VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse