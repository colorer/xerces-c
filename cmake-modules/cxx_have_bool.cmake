# If the compiler recognizes bool as a separate built-in type, define
# HAVE_BOOL. Note that a typedef is not a separate type since you
# cannot overload a function such that it accepts either the basic
# type or the typedef.


INCLUDE(CheckCXXSourceRuns)

CHECK_CXX_SOURCE_RUNS("
	int f(int  x){return 0;}
	int f(char x){return 0;}
	int f(bool x){return 0;}
  int main() { bool b = true; return f(b); return 1;}"
  HAVE_BOOL)
if(NOT HAVE_BOOL)
	set(XERCES_NO_NATIVE_BOOL "0")
endif()