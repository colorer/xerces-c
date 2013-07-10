#If the compiler supports the std namespace, define XERCES_STD_NAMESPACE

INCLUDE(CheckCXXSourceRuns)

CHECK_CXX_SOURCE_RUNS("#include <iostream>
  std::istream& is = std::cin;
  int main() { return 0;}"
  HAVE_STD_NAMESPACE)
set(XERCES_STD_NAMESPACE ${HAVE_STD_NAMESPACE})
                