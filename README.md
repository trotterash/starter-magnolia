# Magnolia CMS Travel Demo

This is a Magnolia 6.4.0 Community Edition instance with the Travel Demo content.

## Quick Start

Simply run:

```bash
docker compose up -d
```

On first run, it will automatically:
1. Install dependencies
2. Download Magnolia 6.4.0 with the travel demo
3. Start the Magnolia server

Wait about 2-3 minutes for the initial setup and startup.

Access the instance at:

- **Admin Central**: http://localhost:8080/magnoliaAuthor/.magnolia/admincentral
- **Author Instance**: http://localhost:8080/magnoliaAuthor

### Default Credentials

- **Username**: `superuser`
- **Password**: `superuser`

## Managing the Instance

### Stop and start
```bash
docker compose down
docker compose up -d
```

### View logs
```bash
docker logs -f magnolia-cli
```

### Access shell
```bash
docker exec -it magnolia-cli bash
```

## CLI Commands

The Magnolia CLI is available inside the container:

```bash
# Create a new light module
docker exec -it magnolia-cli bash -c "cd /magnolia && npm run mgnl -- create-light-module my-module"

# Create a new page
docker exec -it magnolia-cli bash -c "cd /magnolia && npm run mgnl -- create-page"

# Create a new component
docker exec -it magnolia-cli bash -c "cd /magnolia && npm run mgnl -- create-component"
```

## Project Structure

- `Dockerfile` - Docker image configuration
- `docker-compose.yml` - Docker Compose configuration
- `entrypoint.sh` - Container startup script with auto-setup
- `.gitignore` - Git ignore rules

Generated files (not in git):
- `apache-tomcat/` - Tomcat server with Magnolia webapp
- `light-modules/` - Custom light modules directory
- `node_modules/` - NPM dependencies
- `package.json` - NPM configuration

## Notes

- The instance uses an embedded H2 database (data persists in container volumes)
- Development mode is enabled (`magnolia.develop=true`)
- Auto-update is enabled (`magnolia.update.auto=true`)
- Light modules directory is configured and watched for changes
