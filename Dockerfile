# Hugo Extended Docker Image for Local Development
# Uses hugomods/hugo image which includes latest Hugo Extended with all features
FROM hugomods/hugo:exts

# Set working directory
WORKDIR /src

# Expose Hugo server port
EXPOSE 1313

# Default command: run Hugo server with draft support and bind to all interfaces
# Use --bind 0.0.0.0 to allow access from host machine
# Use --poll 1s for better file watching across Docker volumes (especially on Windows)
CMD ["server", "--bind", "0.0.0.0", "--buildDrafts", "--buildFuture", "--disableFastRender", "--poll", "1s"]
