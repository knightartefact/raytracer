##
## EPITECH PROJECT, 2023
## Raytracer
## File description:
## Makefile
##

CXX	=	g++

SRC_DIRS	=	source\
				source/Maths\
				source/Primitives\
				source/Utils\
				source/Lights\
				source/Parsing\

SRC	=	source/main.cpp\
		source/Renderer.cpp\
		source/Ray.cpp\
		source/Camera.cpp\
		source/World.cpp\
		source/Primitives/Sphere.cpp\
		source/Primitives/Plane.cpp\
		source/Primitives/Cylinder.cpp\
		source/Primitives/APrimitive.cpp\
		source/Maths/Vector3D.cpp\
		source/Maths/Point3D.cpp\
		source/Utils/Color.cpp\
		source/Lights/ALight.cpp\
		source/Lights/DirectionalLight.cpp\
		source/Lights/PointLight.cpp\
		source/Parsing/Parsing.cpp\

OBJ	=	$(SRC:%.cpp=%.o)

EXEC	=	raytracer

LDFLAGS	=	-lconfig++

CPPFLAGS	=	-I source/libs/OBJLoader $(SRC_DIRS:%=-I%)

CFLAGS	=	-Wall -Wextra

all: $(EXEC)

%.o: %.cpp
	$(CXX) -c -o $@ $< $(CPPFLAGS) $(CFLAGS)

$(EXEC): OBJLoader $(OBJ)
	$(CXX) -o $@ $(OBJ) $(CFLAGS) $(LDFLAGS)

debug: CFLAGS += -g3
debug: OBJLoader_debug maths_debug $(EXEC)

## OBJ loader
OBJLoader:
	make -C source/libs/OBJLoader

OBJLoader_debug:
	make -C source/libs/OBJLoader debug

OBJLoader_clean:
	make -C source/libs/OBJLoader clean

OBJLoader_fclean:
	make -C source/libs/OBJLoader fclean

clean: OBJLoader_clean
	$(RM) $(OBJ)

fclean: clean OBJLoader_fclean
	$(RM) $(EXEC)

re: fclean all

.PHONY: all re fclean clean OBJLoader_clean OBJLoader_fclean OBJLoader


