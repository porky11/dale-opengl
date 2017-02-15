echo '(module freeglut)' > src/freeglut.dt
echo '(import gl)' >> src/freeglut.dt
#  echo '(import "glu")' >> src/glut.dt
echo '(import glut)' >> src/freeglut.dt
echo '(namespace glut' >> src/freeglut.dt
c2ffi /usr/include/GL/freeglut.h | ./dale-autowrap-opengl freeglut_ext >> src/freeglut.dt
cat /usr/include/GL/freeglut_ext.h | ./define-dale-opengl GLUT_ >> src/freeglut.dt
echo ')' >> src/freeglut.dt

