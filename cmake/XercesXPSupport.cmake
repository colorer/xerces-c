
# support winXP on MSVC
if(MSVC)
  if(${CMAKE_CL_64} STREQUAL "0")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /arch:IA32")
  endif()
endif()