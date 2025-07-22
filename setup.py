## ! DO NOT MANUALLY INVOKE THIS setup.py, USE CATKIN INSTEAD

from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup

# fetch values from package.xml
setup_args = generate_distutils_setup(
    packages=['irsl_docker_pkg_sample'],
    package_dir={'irsl_docker_pkg_sample': 'irsl_docker_pkg_sample'},
)

setup(**setup_args)
