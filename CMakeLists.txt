cmake_minimum_required (VERSION 2.8.9)
project (xerces-c)

# Options
OPTION(ENABLE_SHARED "Enable building of shared libraries" OFF)
OPTION(ENABLE_STATIC "Enable building of static libraries" ON)
OPTION(ENABLE_NETWORK "Build with network support" ON)
OPTION(ENABLE_THREADS "Enable threads" ON)
OPTION(ENABLE_MSGLOADER_WIN32  "Enable Windows MsgLoader support" ON)
OPTION(ENABLE_MSGLOADER_INMEMORY  "Enable InMemory MsgLoader support" OFF)
#OPTION(ENABLE_MSGLOADER_ICU "Enable ICU-based MsgLoader support" OFF)
#OPTION(ENABLE_MSGLOADER_ICONV "Enable Iconv-based MsgLoader support" OFF)
#OPTION(ENABLE_TRANSCODER_GNUICONV  "Enable GNU iconv-based transcoder support" OFF)
#OPTION(ENABLE_TRANSCODER_ICONV  "Enable iconv-based transcoder support" OFF)
#OPTION(ENABLE_TRANSCODER_ICU "Enable icu-based transcoder support" OFF)
#OPTION(ENABLE_TRANSCODER_MACOSUNICODECONVERTER  "Enable MacOSUnicodeConverter-based transcoder support" OFF)
OPTION(ENABLE_TRANSCODER_WINDOWS  "Enable Windows-based transcoder support" ON)
#OPTION(ENABLE_NETACCESSOR_CURL "Enable libcurl-based NetAccessor support" OFF)
#OPTION(ENABLE_NETACCESSOR_SOCKET "Enable sockets-based NetAccessor support" OFF)
#OPTION(ENABLE_NETACCESSOR_CFURL "Enable cfurl-based NetAccessor support" OFF)
OPTION(ENABLE_NETACCESSOR_WINSOCK "Enable winsock-based NetAccessor support " ON)

# Validate options
IF(NOT ENABLE_STATIC AND NOT ENABLE_SHARED)
    MESSAGE(FATAL_ERROR "Neither ENABLE_STATIC nor ENABLE_SHARED is on. Nothing will be built.")
ENDIF()

# Set a reasonable default for the build type
IF(NOT CMAKE_BUILD_TYPE)
    SET(CMAKE_BUILD_TYPE Release CACHE STRING "Build type, one of: Release, Debug, RelWithDebInfo, or MinSizeRel" FORCE)
ENDIF()
IF(NOT LIBRARY_BITS)
	SET(LIBRARY_BITS 32 CACHE STRING "How many bits to use for building: 32, 64")
ENDIF()
MESSAGE(STATUS "Build type -- ${CMAKE_BUILD_TYPE} ${LIBRARY_BITS} bits")

# get source root
GET_FILENAME_COMPONENT(PROJECT_ROOT "${CMAKE_CURRENT_SOURCE_DIR}" ABSOLUTE)

# Configure for this platform
LIST(APPEND CMAKE_MODULE_PATH "${PROJECT_ROOT}/cmake-modules")
INCLUDE(configure)

ADD_SUBDIRECTORY(src)