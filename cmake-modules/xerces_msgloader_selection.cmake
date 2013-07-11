# Check for inmemory msgloader
set(msg_inmemory 1)

# Check for iconv support

if(HAVE_NL_TYPES_H AND HAVE_CATOPEN AND HAVE_CATCLOSE AND HAVE_CATGETS)
  set(msg_iconv 1)
endif()
# Check for platform-specific transcoders
if(WIN32 OR MINGW OR MSYS)
  set(msg_win32 1)
endif()


if(ENABLE_MSGLOADER_WIN32 AND msg_win32)
  set(XERCES_USE_MSGLOADER_WIN32 1)
elseif(ENABLE_MSGLOADER_INMEMORY AND msg_inmemory)
  set(XERCES_USE_MSGLOADER_INMEMORY 1)
endif()