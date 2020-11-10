FROM ubuntu:focal-20200423

COPY bazel.sh /bazel.sh

RUN apt-get update \
  && apt-get install -y \
    curl \
    gnupg2 \
    wget

RUN curl https://bazel.build/bazel-release.pub.gpg | apt-key add - \
  && echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" > /etc/apt/sources.list.d/bazel.list \
  && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
  && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list

RUN apt-get update

ENTRYPOINT ["/bazel.sh"]
