c2ffi /usr/include/GL/freeglut.h | ./dale-autowrap-opengl freeglut_std >> headers/glut.dt
cat /usr/include/GL/freeglut_std.h | ./define-dale-opengl GLUT_ >> headers/glut.dt

