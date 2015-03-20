from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

ext_module = Extension(
    "para2",
    ["para2.pyx"],
    extra_compile_args=['-fopenmp'],
    extra_link_args=['-fopenmp'],
)

setup(
    name='para2',
    cmdclass={'build_ext': build_ext},
    ext_modules=[ext_module],
)