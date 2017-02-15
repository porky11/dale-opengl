echo '(module gl)' > src/gl.dt
echo '(namespace gl' >> src/gl.dt
c2ffi /usr/include/GL/gl.h | ./dale-autowrap-opengl gl >> src/gl.dt
c2ffi /usr/include/GL/gl.h | ./dale-autowrap-opengl glext >> src/gl.dt
cat /usr/include/GL/gl.h | ./define-dale-opengl GL_ >> src/gl.dt
echo ')' >> src/gl.dt

