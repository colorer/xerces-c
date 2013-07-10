#check SSE2 and other

INCLUDE(CheckCXXSourceRuns)

#support SSE2
set(CMAKE_REQUIRED_FLAGS_SAVE ${CMAKE_REQUIRED_FLAGS})
set(CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS} "-msse2")
CHECK_CXX_SOURCE_RUNS("#include <emmintrin.h>
  int main() { __m128d v = _mm_setzero_pd(); return 0; }"
  XERCES_HAVE_SSE2_INTRINSIC)
CHECK_INCLUDE_FILES(emmintrin.h HAVE_EMMINTRIN_H)
set(XERCES_HAVE_EMMINTRIN_H ${HAVE_EMMINTRIN_H})
set(CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS_SAVE})

#Define to have SSE2 instruction support detected at runtime using __cpuid
CHECK_CXX_SOURCE_RUNS("#include <intrin.h>
  int main() { 
    int CPUInfo[4];
		__cpuid(CPUInfo, 1);
		return 0;
  }"
  XERCES_HAVE_CPUID_INTRINSIC)

#Define to have SSE2 instruction support detected at runtime using __get_cpuid
CHECK_INCLUDE_FILES(cpuid.h HAVE_CPUID_H)
CHECK_CXX_SOURCE_RUNS("#include <cpuid.h>
  int main() {unsigned int eax, ebx, ecx, edx;
   __get_cpuid (1, &eax, &ebx, &ecx, &edx); return 0; }"
  XERCES_HAVE_GETCPUID)                