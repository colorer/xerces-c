
set(t_inmemory 1)
# Check for platform-specific transcoders

if(WIN32 OR MINGW OR MSYS)
  set(t_win32 1)
endif()

if(ENABLE_MSGLOADER_WIN32 AND t_win32)
  set(XERCES_USE_MSGLOADER_WIN32 1)
endif()