
if(ENABLE_STATIC)
  set(LINK_TYPE "STATIC")
else()
  set(LINK_TYPE "SHARED")
endif() 

if(MSVC)
  set(XERCESC ${PROJECT_ROOT}/src/xercesc)
  file(REMOVE ${XERCESC}/util/Xerces_autoconf_config.hpp)
  file(COPY ${XERCESC}/util/Xerces_autoconf_config.msvc.hpp DESTINATION ${XERCESC})
  file(RENAME ${XERCESC}/Xerces_autoconf_config.msvc.hpp ${XERCESC}/util/Xerces_autoconf_config.hpp)

else(MSVC)

endif(MSVC)