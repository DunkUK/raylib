# Populates a ${FILESYSTEM_LACKS_SYMLINKS} variable
message(STATUS "Testing if file system supports symlinks")

#This symlink check causes an error in visual studio - don't think we really need this :o)  See FILESYSTEM_LACKS_SYMLINKS
if (UNIX)
	message(STATUS "In Unix, so executing symlink check")
	execute_process(
	  COMMAND ${CMAKE_COMMAND} -E create_symlink CMakeLists.txt "${CMAKE_CURRENT_BINARY_DIR}/TestingIfSymlinkWorks"
		WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
		RESULT_VARIABLE FILESYSTEM_LACKS_SYMLINKS
	)
else()
	message(STATUS "Skipping symlink check")
	set(FILESYSTEM_LACKS_SYMLINKS ON)
endif()
If (${FILESYSTEM_LACKS_SYMLINKS})
  message(STATUS "Testing if file system supports symlinks -- unsupported")
else()
  message(STATUS "Testing if file system supports symlinks -- supported")
endif()

