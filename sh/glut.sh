echo '(module glut)' > src/glut.dt
echo '(import gl)' >> src/glut.dt
echo '(namespace glut' >> src/glut.dt
#  echo '(import "glu")' >> src/glut.dt
c2ffi /usr/include/GL/freeglut.h | ./dale-autowrap-opengl freeglut_std >> src/glut.dt
cat /usr/include/GL/freeglut_std.h | ./define-dale-opengl GLUT_ >> src/glut.dt
echo ')' >> src/glut.dt

