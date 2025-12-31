# Docker Setup Guide

This project includes Docker support for easy local development without installing Hugo.

## Quick Start with Docker

### Prerequisites
- Docker Desktop 20.10+ installed
- Git for cloning the repository

### Run Development Server

**Option 1: PowerShell Helper (Windows)**
```powershell
.\run.ps1
```
Select option 1 from the menu.

**Option 2: Docker Compose**
```bash
# Build the Docker image
docker-compose build

# Start the development server
docker-compose up

# Stop the server (in another terminal)
docker-compose down
```

The site will be available at http://localhost:1313

### How It Works

The Docker setup includes:
- **Dockerfile**: Uses `klakegg/hugo:0.120.4-ext-alpine` base image with Hugo Extended
- **docker-compose.yml**: Configures ports, volumes, and environment
- **.dockerignore**: Excludes build artifacts from Docker context

### File Watching

Changes to content files are automatically detected and trigger a rebuild. Just save your file and refresh the browser.

### Advantages of Docker

✅ **No Hugo Installation**: No need to install Hugo, Go, or manage versions  
✅ **Consistent Environment**: Same Hugo version across all developers  
✅ **Cross-Platform**: Works identically on Windows, macOS, and Linux  
✅ **Isolated**: No conflicts with other Hugo versions on your system  

### When to Use Native Hugo Instead

- Faster build times (no Docker overhead)
- Lower resource usage
- You're already comfortable with Hugo CLI
- CI/CD pipelines (GitHub Actions uses native Hugo)

## Troubleshooting

### Port Already in Use

If port 1313 is occupied, change the port mapping in docker-compose.yml:
```yaml
ports:
  - "3000:1313"  # Use http://localhost:3000 instead
```

### Files Not Updating

If live reload isn't working:
```bash
# Rebuild with no cache
docker-compose down
docker-compose build --no-cache
docker-compose up
```

### Permission Issues (Linux/macOS)

If you encounter permission issues with generated files:
```bash
# Files in public/ and resources/ directories
sudo chown -R $USER:$USER public resources
```

### View Container Logs

```bash
docker-compose logs -f
```

## Docker Commands Reference

```bash
# Build image
docker-compose build

# Start server (foreground)
docker-compose up

# Start server (background)
docker-compose up -d

# Stop server
docker-compose down

# View logs
docker-compose logs -f

# Rebuild from scratch
docker-compose down
docker-compose build --no-cache
docker-compose up

# Remove all containers and volumes
docker-compose down -v

# Execute command in running container
docker-compose exec hugo hugo version
```

## Switching Between Docker and Native

Both methods use the same source files. You can switch freely:

**Docker:**
```bash
docker-compose up
```

**Native:**
```bash
hugo server --buildDrafts
```

Both will serve the site at http://localhost:1313

## Next Steps

See [quickstart.md](specs/001-site-setup/quickstart.md) for complete development guide including content creation, testing, and deployment.
