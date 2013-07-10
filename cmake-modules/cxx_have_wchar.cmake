INCLUDE(CheckCXXSourceRuns)

#If the compiler can prevent names clashes using namespaces, define HAVE_LSTRING
CHECK_CXX_SOURCE_RUNS("
  const wchar_t* s=L\"wide string\";
  int main() { return 0;}"
  HAVE_LSTRING)
set(XERCES_LSTRSUPPORT ${HAVE_LSTRING})

# check if the Windows API is defined as using wchar_t or unsigned short; if it's wchar_t, we need to map XMLCh to be wchar_t
# (this is safe because on Windows wchar_t is used to store UTF-16 codepoints, while it is not true on Unix)
CHECK_CXX_SOURCE_RUNS("#include <windows.h>
  wchar_t file[] = L\"dummy.file\";
  int main() { DeleteFileW(file);return 0;}"
  XERCES_INCLUDE_WCHAR_H)

if(XERCES_INCLUDE_WCHAR_H)
  set(XERCES_XMLCH_T "wchar_t")
else()
  set(XERCES_XMLCH_T ${XERCES_U16BIT_INT})
endif()
CHECK_TYPE_SIZE("wchar_t" SIZEOF_WCHAR_T)
               