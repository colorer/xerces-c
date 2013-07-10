
# Check for GNU iconv support
if (HAVE_ICONV_H AND HAVE_WCHAR_H AND HAVE_STRING_H AND HAVE_STDLIB_H AND HAVE_STDIO_H AND HAVE_LOCALE_H AND HAVE_CTYPE_H
     AND HAVE_ENDIAN_H AND HAVE_MACHINE_ENDIAN_H AND HAVE_ARPA_NAMESER_COMPAT_H 
     AND HAVE_ICONV_OPEN AND HAVE_ICONV_CLOSE AND HAVE_ICONV) 

  set(t_gnuiconv 1)
endif()

# Check for iconv support
if(HAVE_WCHAR_H AND HAVE_MBLEN AND HAVE_WCSRTOMBS AND HAVE_MBSTOWCS)
  set(t_iconv 1)
endif()

# Check for ICU
if(XERCES_ICU_PREFIX)
  set(t_icu 1)
endif()

# Check for platform-specific transcoders

if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
  set(t_macosunicodeconverter 1)
endif()

if(WIN32 OR MINGW OR MSYS)
  set(t_windows 1)
endif()

if(ENABLE_TRANSCODER_WINDOWS AND t_windows)
  set(XERCES_USE_TRANSCODER_WINDOWS 1)
endif()