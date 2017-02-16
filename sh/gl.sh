c2ffi /usr/include/GL/gl.h | ./dale-autowrap-opengl gl >> headers/gl.dt
c2ffi /usr/include/GL/gl.h | ./dale-autowrap-opengl glext >> headers/gl.dt
cat /usr/include/GL/gl.h | ./define-dale-opengl GL_ >> headers/gl.dt

