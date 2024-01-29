FROM debian:12
RUN apt-get update && apt-get install git
RUN git clone https://github.com/ronivay/XenOrchestraInstallerUpdater.git
COPY certs/xo.pem /cert.pem
COPY certs/xo.key /cert.key
COPY xo-install.cfg XenOrchestraInstallerUpdater/
EXPOSE 80
RUN cd XenOrchestraInstallerUpdater/ && ./xo-install.sh --install