ARG BASE_IMAGE=repo.irsl.eiiris.tut.ac.jp/irsl_base:noetic_opengl

FROM ${BASE_IMAGE}

ENV IRSL_WS=/irsl_catkin_ws
ENV IRSL_PROJECT=irsl_docker_pkg_sample

WORKDIR ${IRSL_WS}

RUN apt update -q -qq && \
    apt install -q -qq -y python3-catkin-tools git && \
    apt clean && \
    rm -rf /var/lib/apt/lists/

#### making a workspace
## COPY version
RUN mkdir -p ${IRSL_WS}/src/${IRSL_PROJECT}
COPY . ${IRSL_WS}/src/${IRSL_PROJECT}
RUN ( cd src; vcs import --recursive < ${IRSL_PROJECT}/dot.rosinstall )

## vcs version(recommended)
#RUN wget https://raw.githubusercontent.com/IRSL-tut/${IRSL_PROJECT}/refs/heads/main/dot.rosintsall
#RUN ( mkdir -p src; cd src; vcs import --recursive < ../dot.rosinstall )
#RUN ( cd src; git clone https://IRSL-tut/irsl_docker_pkg_sample.git )

## rosdep ...

#### building a workspace
RUN bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash && catkin config --install && IRSL_BUILD_LOCAL=true catkin build"

CMD [ "bash", "-c", "source ${IRSL_WS}/install/setup.bash && roslaunch ${IRSL_PROJECT} run.launch" ]
