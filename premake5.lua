project "GKlib"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"b64.c",
		"blas.c",
		"cache.c",
		"csr.c",
		"error.c",
		"evaluate.c",
		"fkvkselect.c",
		"fs.c",
		"getopt.c",
		"gk_util.c",
		"gkregex.c",
		"graph.c",
		"htable.c",
		"io.c",
		"itemsets.c",
		"mcore.c",
		"memory.c",
		"pqueue.c",
		"random.c",
		"rw.c",
		"seq.c",
		"sort.c",
		"string.c",
		"timers.c",
		"tokenizer.c",
	}

	includedirs
	{
		"%{IncludeDir.GKlib}",
		"%{IncludeDir.GKlib}/win32",
		"%{IncludeDir.GKlib}/test",
	}

	defines
	{
		"WIN32",
		"_WINDOWS",
		"MSC",
		"_CRT_SECURE_NO_DEPRECATE",
		"USE_GKREGEX",
		"NDEBUG",
		"NDEBUG2",
		"__thread=__declspec(thread)",
		"__thread=",
		'CMAKE_INTDIR="Debug"',
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
