# Pharmaverse Docker Image
# Based on rocker/tidyverse with additional pharmaverse packages
# 
# Rocker versioning: The tag corresponds to the R version
# Examples: 4.4.2, 4.4.1, 4.3.3, latest
# See: https://rocker-project.org/images/versioned/rstudio.html

FROM rocker/tidyverse:4.5.1

# Build arguments for dynamic labeling
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION=dev

# OCI-compliant labels with dynamic values
LABEL org.opencontainers.image.created="${BUILD_DATE}"
LABEL org.opencontainers.image.authors="Pharmaverse Community"
LABEL org.opencontainers.image.url="https://pharmaverse.org"
LABEL org.opencontainers.image.documentation="https://github.com/pharmaverse/docker_pharmaverse#readme"
LABEL org.opencontainers.image.source="https://github.com/pharmaverse/docker_pharmaverse"
LABEL org.opencontainers.image.version="${VERSION}"
LABEL org.opencontainers.image.revision="${VCS_REF}"
LABEL org.opencontainers.image.vendor="Pharmaverse"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.title="Pharmaverse Docker"
LABEL org.opencontainers.image.description="R environment with tidyverse and pharmaverse packages for clinical trials"

# Set R version for documentation
ENV R_VERSION=4.5.1

# Set working directory
WORKDIR /home/rstudio

# Install pharmaverse packages using install2.r
# This script is included in the rocker image and handles system dependencies
RUN install2.r --error --skipinstalled -n -2 \
    admiral \
    admiralmetabolic \
    admiralneuro \
    admiralonco \
    admiralophtha \
    admiralpeds \
    admiralvaccine \
    cards \
    cardx \
    chevron \
    clinify \
    connector \
    covtracer \
    datacutr \
    datasetjson \
    diffdf \
    ggsurvfit \
    gridify \
    gtsummary \
    logrx \
    metacore \
    metatools \
    pharmaRTF \
    pharmaverseadam \
    pharmaverseraw \
    pharmaversesdtm \
    pkglite \
    rhino \
    riskmetric \
    rlistings \
    rtables \
    sdtmchecks \
    teal \
    teal.modules.clinical \
    teal.modules.general \
    tern \
    tfrmt \
    tfrmtbuilder \
    tidyCDISC \
    tidytlg \
    Tplyr \
    whirl \
    xportr

# Clean up
RUN rm -rf /var/lib/apt/lists/* /tmp/downloaded_packages

# Verify installation
RUN R -e "installed_packages <- installed.packages()[,1]; \
    pharmaverse_packages <- c('admiral', 'admiralmetabolic', 'admiralneuro', 'admiralonco', \
    'admiralophtha', 'admiralpeds', 'admiralvaccine', 'cards', 'cardx', 'chevron', \
    'clinify', 'connector', 'covtracer', 'datacutr', 'datasetjson', 'diffdf', \
    'ggsurvfit', 'gridify', 'gtsummary', 'logrx', 'metacore', 'metatools', \
    'pharmaRTF', 'pharmaverseadam', 'pharmaverseraw', 'pharmaversesdtm', 'pkglite', \
    'rhino', 'riskmetric', 'rlistings', 'rtables', 'sdtmchecks', 'teal', 'teal.modules.clinical', 'teal.modules.general', 'tern', \
    'tfrmt', 'tfrmtbuilder', 'tidyCDISC', 'tidytlg', 'Tplyr', 'whirl', 'xportr'); \
    missing <- setdiff(pharmaverse_packages, installed_packages); \
    if(length(missing) > 0) { \
        cat('Missing packages:', paste(missing, collapse=', '), '\n'); \
        quit(status=1); \
    } else { \
        cat('All pharmaverse packages installed successfully!\n'); \
    }"

# Set default command
CMD ["/init"]
