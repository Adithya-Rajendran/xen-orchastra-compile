FROM debian:latest
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/ronivay/XenOrchestraInstallerUpdater.git /XenOrchestraInstallerUpdater
WORKDIR /XenOrchestraInstallerUpdater
RUN cp sample.xo-install.cfg xo-install.cfg
EXPOSE 80
RUN ./xo-install.sh --install
