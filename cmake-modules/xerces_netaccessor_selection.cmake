INCLUDE (CheckLibraryExists)

CHECK_LIBRARY_EXISTS(socket socket "" HAVE_LIBSOCKET)
CHECK_LIBRARY_EXISTS(nsl gethostbyname "" HAVE_LIBNSL)


# whether we can support the sockets-based NetAccessor
if (HAVE_SYS_SOCKET_H) 
  set(net_socket 1)
endif()

# Check for platform-specific netaccessors
# whether we can support the CFURL NetAccessor (Mac OS X)
if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin" AND HAVE_CORESERVICES_CORESERVICES_H)
  set(net_cfurl 1)
endif()

if((WIN32 OR MINGW OR MSYS) AND HAVE_WINSOCK2_H)
  set(net_winsock 1)
endif()

if(ENABLE_NETWORK)
  if(ENABLE_NETACCESSOR_WINSOCK AND net_windows)
    set(XERCES_USE_NETACCESSOR_WINSOCK 1)
  elseif(ENABLE_NETACCESSOR_SOCKET AND net_socket)
    set(XERCES_USE_NETACCESSOR_SOCKET 1)
  endif()
endif(ENABLE_NETWORK)