# Magnolia CMS Travel Demo

Magnolia 6.4.0 Community Edition with Travel Demo, running in Docker.

## Quick Start

### First Time Setup

1. Run the interactive setup (one-time only):
   ```bash
   docker compose run --rm magnolia-cli mgnl jumpstart
   ```

2. When prompted, select:
   - **Choose a template**: Option `2` (demo-webapps)
   - **Choose a template**: Option `1` (magnolia-community-demo-webapp)

3. Wait 2-3 minutes for download and extraction

4. Start Magnolia:
   ```bash
   docker compose up -d
   ```

### Subsequent Runs

After the first setup, simply run:
```bash
docker compose up -d
```

## Access Magnolia

Access the instance at:

- **Admin Central**: http://localhost:8080/magnoliaAuthor/.magnolia/admincentral
- **Author Instance**: http://localhost:8080/magnoliaAuthor

### Default Credentials

- **Username**: `superuser`
- **Password**: `superuser`

## Managing the Instance

### Stop Magnolia
```bash
docker compose down
```

### View logs
```bash
docker compose logs -f
```

### Access shell
```bash
docker compose exec magnolia-cli bash
```

### Clean restart
To completely reset (removes all data):
```bash
docker compose down
sudo rm -rf apache-tomcat node_modules
# Then run first time setup again
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

- `Dockerfile` - Docker image with Node 22, Java 17, and Magnolia CLI
- `docker-compose.yml` - Docker Compose service configuration
- `entrypoint.sh` - Container startup script
- `package.json` - Pre-generated NPM configuration
- `mgnl.config.js` - Pre-generated Magnolia CLI configuration
- `.gitignore` - Git ignore rules

Generated during setup (not in git):
- `apache-tomcat/` - Tomcat server with Magnolia webapp
- `node_modules/` - NPM dependencies
- `package-lock.json` - NPM lock file

## Notes

- Uses embedded H2 database (data persists in `apache-tomcat` directory)
- Development mode enabled for hot-reloading
- Light modules directory available at `light-modules/`
- First startup after setup takes 2-3 minutes to initialize database
