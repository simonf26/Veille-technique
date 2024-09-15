#  C++ Compiler
CXX = g++

# Compiling options
CXXFLAGS = -Wall -Wextra -Werror -pedantic

# Executable name
TARGET = main

# Source files
SRCS = main.cpp

# Object files
OBJS = $(SRCS:.cpp=.o)

# Default rule
all: $(TARGET)

# generate the executable
$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $(TARGET)

# generate the object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# clean generated files
clean:
	rm -f $(OBJS) $(TARGET)

# clean all
distclean: clean
	rm -f Makefile

# execute linter (cppcheck)
lint:
	cppcheck $(SRCS)

# execute AddressSanitizer
asan:
	$(CXX) -fsanitize=address -g $(SRCS) -o $(TARGET)

# execute ThreadSanitizer
tsan:
	$(CXX) -fsanitize=thread -g $(SRCS) -lpthread -o $(TARGET)

# format code using Astyle
format:
	astyle --style=google --indent=spaces=4 --pad-oper --pad-paren $(SRCS)

# Displays all the rules
help:
	@echo "Makefile pour compiler le projet C++"
	@echo "Règles disponibles :"
	@echo "  all       - Compile le projet"
	@echo "  clean     - Supprime les fichiers objets et l'exécutable"
	@echo "  distclean - Supprime les fichiers objets, l'exécutable et le Makefile"
	@echo "  asan - Execute AddressSanitizer"
	@echo "  tsan - Execute ThreadSanitizer"
	@echo "  format - Format code using Astyle with google style"
	@echo "  help      - Affiche cette aide"