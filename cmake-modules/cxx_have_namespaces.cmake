#If the compiler can prevent names clashes using namespaces, define XERCES_HAS_CPP_NAMESPACE.

INCLUDE(CheckCXXSourceRuns)

CHECK_CXX_SOURCE_RUNS("namespace Outer { namespace Inner { int i = 0; }}
  int main() { using namespace Outer::Inner; return i;}"
  HAVE_NAMESPACES)
set(XERCES_HAS_CPP_NAMESPACE ${HAVE_NAMESPACES})
                