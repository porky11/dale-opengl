.RECIPEPREFIX+= 

FLAGS=

all: libgl.dtm libglut.dtm libfreeglut.dtm

libgl.dtm: src/gl.dt
  dalec -c src/gl.dt $(FLAGS) -Igl

libglut.dtm: src/glut.dt
  dalec -c src/glut.dt $(FLAGS)

libfreeglut.dtm: src/freeglut.dt
  dalec -c src/freeglut.dt $(FLAGS)

sh/%.sh:
  true

src/%.dt: sh/%.sh dale-autowrap-opengl
  $<

src/freeglut.dt:

test/test: test/test.dt libgl.dtm libglut.dtm
  dalec -lGL -lglut test/test.dt -o test/test

test/test.dt:
  true

.PHONY: all clean test

test: test/test
  test/test

clean:
  rm -f game -f *.so *.bc *.dtm  src/*.o src/*.dt test/test

