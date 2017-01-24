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
  c2ffi /usr/include/GL/gl.h | ./dale-autowrap.pl gl >> src/gl.dt
  c2ffi /usr/include/GL/gl.h | ./dale-autowrap.pl glext >> src/gl.dt
  ./define-dale.pl /usr/include/GL/gl.h >> src/gl.dt

#glu
#TODO

#glut/freeglut
src/glut.dt: libgl.dtm
  echo '(module glut)' > src/glut.dt
  echo '(import gl)' >> src/glut.dt
#  echo '(import "glu")' >> src/glut.dt
  c2ffi /usr/include/GL/freeglut.h | ./dale-autowrap.pl freeglut_std >> src/glut.dt
  ./define-dale.pl /usr/include/GL/freeglut_std.h >> src/glut.dt

src/freeglut.dt: libglut.dtm
  echo '(module freeglut)' > src/freeglut.dt
  echo '(import gl)' >> src/freeglut.dt
#  echo '(import "glu")' >> src/glut.dt
  echo '(import glut)' >> src/freeglut.dt
  c2ffi /usr/include/GL/freeglut.h | ./dale-autowrap.pl freeglut_ext >> src/freeglut.dt


.PHONY: all clean


clean:
  rm -f game && rm -f *.so && rm -f *.bc && rm -f *.dtm && rm -f src/*.o src/*.dt

