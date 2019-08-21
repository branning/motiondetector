cmake_minimum_required(VERSION 3.1)

project(motiondetector)
find_package( OpenCV REQUIRED )
set(MOTIONDETECTOR_SRC
  src/motiondetector.cpp
)

add_executable(motiondetector ${MOTIONDETECTOR_SRC})
target_link_libraries(motiondetector ${OpenCV_LIBS})
