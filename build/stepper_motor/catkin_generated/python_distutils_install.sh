#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/ubuntu/test/src/stepper_motor"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/ubuntu/test/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/ubuntu/test/install/lib/python3/dist-packages:/home/ubuntu/test/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/ubuntu/test/build" \
    "/usr/bin/python3" \
    "/home/ubuntu/test/src/stepper_motor/setup.py" \
     \
    build --build-base "/home/ubuntu/test/build/stepper_motor" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/ubuntu/test/install" --install-scripts="/home/ubuntu/test/install/bin"
