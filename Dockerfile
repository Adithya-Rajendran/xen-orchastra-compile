FROM debian:latest
RUN apt-get update && apt-get install git
RUN git clone https://github.com/ronivay/XenOrchestraInstallerUpdater.git
# COPY certs/xo.pem /cert.pem
# COPY certs/xo.key /cert.key
RUN cd XenOrchestraInstallerUpdater
RUN cp sample.xo-install.cfg xo-install.cfg
EXPOSE 80
RUN ./xo-install.sh --install