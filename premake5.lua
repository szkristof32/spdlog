project "spdlog"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"src/**.cpp",
		"include/**.h"
	}
	
	includedirs
	{
		"include"
	}
	
	defines
	{
		"SPDLOG_COMPILED_LIB"
	}

	filter "action:vs*"
		buildoptions "/utf-8"

	filter "system:windows"
		systemversion "latest"
		defines
		{
			"SPDLOG_WCHAR_TO_UTF8_SUPPORT"
		}
		
	filter "system:linux"
		systemversion "latest"
		
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		
	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		
	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
