FROM ghcr.io/ublue-os/ucore-minimal:stable

### 3. MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

COPY build.sh /tmp/build.sh
COPY adguard /tmp/adguard

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
