c2ffi /usr/include/GL/freeglut.h | ./dale-autowrap-opengl freeglut_ext >> headers/freeglut.dt
cat /usr/include/GL/freeglut_ext.h | ./define-dale-opengl GLUT_ >> headers/freeglut.dt

