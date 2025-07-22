#!/bin/bash

abs_script=$(readlink -f "$0")
abs_dir=$(dirname ${abs_script})

REPO=repo.irsl.eiiris.tut.ac.jp/

(cd ${abs_dir}/..; docker build . --pull --progress=plain -f ${abs_dir}/Dockerfile -t ${REPO}irsl_docker_pkg_sample )
