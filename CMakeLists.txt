cmake_minimum_required (VERSION 2.8.11)
project (lush)


MESSAGE(STATUS ${LUSH_SOURCE_DIR}/deps/lua)


add_subdirectory(deps/luv)

add_custom_target(lua COMMAND make linux
                  WORKING_DIRECTORY ${LUSH_SOURCE_DIR}/deps/lua)
