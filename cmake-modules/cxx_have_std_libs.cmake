# If the compiler supports ISO C++ standard library (i.e., can include the files 
# iostream, map, iomanip and cmath), define XERCES_NEW_IOSTREAMS


INCLUDE(CheckCXXSourceRuns)

set(CMAKE_REQUIRED_FLAGS_SAVE ${CMAKE_REQUIRED_FLAGS})
set(CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS} "-DHAVE_NAMESPACES=${XERCES_STD_NAMESPACE}")
CHECK_CXX_SOURCE_RUNS("#include <iostream>
	#include <map>
	#include <iomanip>
	#include <cmath>
	#ifdef HAVE_NAMESPACES
		using namespace std;
	#endif
  int main() { return 0;}"
  HAVE_STD_LIBS)
set(CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS_SAVE})

set(XERCES_NEW_IOSTREAMS ${HAVE_STD_LIBS})
                