set_project("velvet")

add_rules("mode.debug", "mode.release")

set_languages("c++17")

add_requires("cuda", { system = true })
add_cugencodes("native")

add_requires("fmt")
add_requires("assimp")
add_requires("glm", { system = false })
add_requires("glad", "glfw")

add_requires("imgui", { configs = { glfw_opengl3 = true } })

target("main")
set_kind("binary")
set_rundir("./Velvet")

add_includedirs("./Velvet/", { public = true })
add_includedirs("./Velvet/External/", { public = true })
add_includedirs("./Velvet/External/cuda/", { public = true })
add_includedirs("/opt/cuda/include/cccl", { public = true })

add_packages("fmt", "assimp")
add_packages("glad", "glfw", "imgui", "glm", { public = true })
add_files("./Velvet/*.cpp|test.cpp")
add_files("./Velvet/**.cu")

add_packages("cuda", { public = true })
add_cuflags("--extended-lambda", "--allow-unsupported-compiler", "--expt-relaxed-constexpr", { public = true })

if is_plat("linux") then
	add_cxflags("-march=native", { public = true })
end
target_end()
