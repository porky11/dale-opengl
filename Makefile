.RECIPEPREFIX+= 

FLAGS=

all: libgl.dtm libglut.dtm libfreeglut.dtm

libgl.dtm: headers/gl.dt src/gl.dt
  dalec -c src/gl.dt $(FLAGS) -Iheaders

libglut.dtm: headers/glut.dt src/glut.dt
  dalec -c src/glut.dt $(FLAGS) -Iheaders

libfreeglut.dtm: headers/freeglut.dt src/freeglut.dt
  dalec -c src/freeglut.dt $(FLAGS) -Iheaders

sh/%.sh:
  true

src/%.dt:
  true

headers/%.dt: sh/%.sh dale-autowrap-opengl
  $<

test/test: test/test.dt libgl.dtm libglut.dtm
  dalec -lGL -lglut test/test.dt -o test/test

test/test.dt:
  true

.PHONY: all clean test

test: test/test
  test/test

clean:
  rm -f game -f *.so *.bc *.dtm  src/*.o headers/*.dt test/test

