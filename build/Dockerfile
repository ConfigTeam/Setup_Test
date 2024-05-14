ARG BASE_IMAGE
# Use a base image with Windows and PowerShell support
#FROM mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2022
FROM $BASE_IMAGE
#Using non-root user due to OWASP compliance
#USER ContainerUser
# Use an ARG to pass the parameter during the build
ARG PACKAGE_URL
ARG MANTAINER
ARG VERSION
      
# Build package download URL
ADD "$PACKAGE_URL" C:/CREDIT_APP_PACKAGE.zip

# Unzip the RAR file
RUN powershell -Command Expand-Archive -Path C:/CREDIT_APP_PACKAGE.zip -DestinationPath C:/ -Force

# Copy the pre requisites installation script											 
COPY docker/scripts/powershell/install_prerequisites.ps1 .
COPY docker/scripts/powershell/runtime_configuration.ps1 .
COPY docker/scripts/powershell/entrypoint.ps1 .

# Run PowerShell commands to install prerequisites using the script
RUN powershell -ExecutionPolicy Bypass -File install_prerequisites.ps1 -installPath "C:\\install"

#Image cleanup
RUN powershell -ExecutionPolicy Bypass -Command Remove-Item -Path C:/install -Recurse -Force
RUN powershell -ExecutionPolicy Bypass -Command Remove-Item -Path "C:/Credit_APP_PACKAGE.zip" -Force

# Set the entry point to the executable
ENTRYPOINT powershell.exe C:/entrypoint.ps1

# Metadata as defined in OCI image spec annotations
LABEL maintainer="$MANTAINER" \
      version="$VERSION" \
      description="CoreCard Credit Application Image on Windows Server Core 2022"