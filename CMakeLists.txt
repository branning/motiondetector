cmake_minimum_required(VERSION 3.1)

# Enable C++11
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

project(motiondetector)
find_package( OpenCV REQUIRED )
set(MOTIONDETECTOR_SRC
  src/main.cpp
)

add_executable(motiondetector ${MOTIONDETECTOR_SRC})
target_link_libraries(motiondetector ${OpenCV_LIBS})
