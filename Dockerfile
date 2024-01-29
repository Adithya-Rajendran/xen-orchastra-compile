FROM debian:latest

# Install git
RUN apt-get update && apt-get install -y git

# Clone XenOrchestraInstallerUpdater repository
RUN git clone https://github.com/ronivay/XenOrchestraInstallerUpdater.git /XenOrchestraInstallerUpdater

# Change directory to XenOrchestraInstallerUpdater
WORKDIR /XenOrchestraInstallerUpdater

# Copy sample configuration file
RUN cp sample.xo-install.cfg xo-install.cfg

# Expose port 80 (assuming Xen Orchestra will run on this port)
EXPOSE 80

# Run the installation script
RUN ./xo-install.sh --install
