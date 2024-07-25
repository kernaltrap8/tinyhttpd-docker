FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    libssl-dev \
	wget \
    && rm -rf /var/lib/apt/lists/*

# Download the release binary
RUN wget https://github.com/kernaltrap8/tinyhttpd/releases/download/v0.13.0/tinyhttpd-0.13.0.tar.gz \
	&& tar -xvf tinyhttpd-0.13.0.tar.gz

# Copy the HTTP server executable into the container
RUN cp /builddir/tinyhttpd /usr/bin/tinyhttpd

# Expose the port the HTTP server will run on
EXPOSE 8080

# Run the HTTP server by default when the container starts
ENTRYPOINT ["/usr/bin/tinyhttpd"]
