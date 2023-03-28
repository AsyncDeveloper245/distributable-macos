#
#	MetaCall Library by Parra Studios
#	A library for providing a foreing function interface calls.
#
#	Copyright (C) 2016 - 2022 Vicente Eduardo Ferrer Garcia <vic798@gmail.com>
#
#	Licensed under the Apache License, Version 2.0 (the "License");
#	you may not use this file except in compliance with the License.
#	You may obtain a copy of the License at
#
#		http://www.apache.org/licenses/LICENSE-2.0
#
#	Unless required by applicable law or agreed to in writing, software
#	distributed under the License is distributed on an "AS IS" BASIS,
#	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#	See the License for the specific language governing permissions and
#	limitations under the License.
#

# List of modules
set(EXPORT_MODULE_NAMES
	version;preprocessor;environment;format;threading;log;memory;portability;adt;filesystem;reflect;dynlink;detour;serial;configuration;loader;metacall
)

# Macro to search for a specific module
macro(find_module FILENAME)
	if(EXISTS "${FILENAME}")
		set(MODULE_FOUND TRUE)
		include("${FILENAME}")
	endif()
endmacro()

# Macro to search for all modules
macro(find_modules PREFIX)
	foreach(module_name ${EXPORT_MODULE_NAMES})
		find_module("${CMAKE_CURRENT_LIST_DIR}/${PREFIX}/${module_name}/${module_name}-export.cmake")
	endforeach(module_name)
endmacro()

# Try install location
set(MODULE_FOUND FALSE)
find_modules("cmake")

if(MODULE_FOUND)
	return()
endif()

# Try common build locations
find_modules("build/cmake")
find_modules("build-debug/cmake")
