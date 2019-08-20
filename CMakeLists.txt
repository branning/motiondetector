cmake_minimum_required(VERSION 2.8)

project(motiondetector)
find_package(OpenCV REQUIRED)
set(MOTIONDETECTOR_SRC
  src/main.cpp
)

add_executable(motiondetector MOTIONDETECTOR_SRC)
target_link_libraries(motiondetector ${OpenCV_LIBS})
