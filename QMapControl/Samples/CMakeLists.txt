
SET(MULTIDEMO_MOC_HEADERS
Multidemo/src/gps_modul.h
Multidemo/src/multidemo.h
)

QT5_WRAP_CPP(MULTIDEMO_MOC_RESULT ${MULTIDEMO_MOC_HEADERS})
SET(MULTIDEMO_SOURCE
Multidemo/src/gps_modul.cpp
Multidemo/src/main.cpp
Multidemo/src/multidemo.cpp
)
TRIBITS_ADD_EXECUTABLE(Multidemo
   NOEXEPREFIX
   SOURCES ${MULTIDEMO_SOURCE} ${MULTIDEMO_MOC_RESULT} ${MULTIDEMO_MOC_HEADERS}
)
