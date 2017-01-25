.RECIPEPREFIX+= 

FLAGS=

all: libgl.dtm libglut.dtm libfreeglut.dtm 

libgl.dtm: src/gl.dt
  dalec -c src/gl.dt $(FLAGS) -Igl

libglut.dtm: src/glut.dt
  dalec -c src/glut.dt $(FLAGS)

libfreeglut.dtm: src/freeglut.dt
  dalec -c src/freeglut.dt $(FLAGS)

#gl
src/gl.dt:
  echo '(module gl)' > src/gl.dt
  c2ffi /usr/include/GL/gl.h | ./dale-autowrap.pl gl namespaces=gl >> src/gl.dt
  c2ffi /usr/include/GL/gl.h | ./dale-autowrap.pl glext namespaces=gl >> src/gl.dt
  cat /usr/include/GL/gl.h | ./define-dale.pl GL_ >> src/gl.dt

#glu
#TODO

src/glut.dt:
  echo '(module glut)' > src/glut.dt
  echo '(import gl)' >> src/glut.dt
#  echo '(import "glu")' >> src/glut.dt
  c2ffi /usr/include/GL/freeglut.h | ./dale-autowrap.pl freeglut_std >> src/glut.dt
  cat /usr/include/GL/freeglut_std.h | ./define-dale.pl GLUT_ >> src/glut.dt

src/freeglut.dt:
  echo '(module freeglut)' > src/freeglut.dt
  echo '(import gl)' >> src/freeglut.dt
#  echo '(import "glu")' >> src/glut.dt
  echo '(import glut)' >> src/freeglut.dt
  c2ffi /usr/include/GL/freeglut.h | ./dale-autowrap.pl freeglut_ext >> src/freeglut.dt
  cat /usr/include/GL/freeglut_ext.h | ./define-dale.pl GLUT_ >> src/freeglut.dt

test: test/test.dt
  dalec -lGL -lglut test/test.dt -o test

test/test.dt:
  true

.PHONY: all clean


clean:
  rm -f game && rm -f *.so && rm -f *.bc && rm -f *.dtm && rm -f src/*.o src/*.dt

