#Define to have XMemory.hpp avoid declaring a matching operator delete for the placement operator new

INCLUDE(CheckCXXSourceRuns)

CHECK_CXX_SOURCE_RUNS("
	#include <stdlib.h>
  class XMemory
  {
  public :
     void* operator new(size_t s) { return 0; }
     void* operator new(size_t s, void* ptr) { return 0; }
     void operator delete(void* p) {}
     void operator delete(void* p, void* ptr) {}
  };
  int main() {return 0; }"
  HAVE_DELETE)
if(NOT HAVE_DELETE)
 set(XERCES_NO_MATCHING_DELETE_OPERATOR "1")
endif()
