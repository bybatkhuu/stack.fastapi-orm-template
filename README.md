# Stack Template

This is a template repo for a stack services.

## Features

- Template
- CI/CD
- Docker and docker-compose

---

## Getting started

### 1. Prerequisites

- Install **docker** and **docker-compose** in **server** - <https://docs.docker.com/engine/install>

For **development**:

- Install **git** - <https://git-scm.com/downloads>
- Setup an **SSH key** - <https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh>

### 2. Download or clone the repository

**2.1.** Prepare projects directory (if not exists):

```sh
# Create projects directory:
mkdir -pv ~/workspaces/projects

# Enter into projects directory:
cd ~/workspaces/projects

# Set repository owner:
export _REPO_OWNER=[REPO_OWNER]
# For example:
export _REPO_OWNER=username
```

**2.2.** Follow one of the below options **[A]**, **[B]** or **[C]**:

**A.** Download source code from releases page:

- Releases - <https://github.com/[REPO_OWNER]/stack.template/releases>

```sh
# Set to downloaded version:
export _VERSION=[VERSION]
# For example:
export _VERSION=1.0.0

# Move downloaded archive file to current projects directory:
mv -v ~/Downloads/stack.template-${_VERSION}.zip .

# Extract downloaded archive file:
unzip stack.template-${_VERSION}.zip

# Remove downloaded archive file:
rm -v stack.template-${_VERSION}.zip

# Rename extracted directory into project name:
mv -v stack.template-${_VERSION} stack.template && cd stack.template
```

**B.** Or clone the repository (git + ssh key):

```sh
git clone git@github.com:${_REPO_OWNER}/stack.template.git && cd stack.template
```

**C.** **[For development]** Or clone with all submodules (git + ssh key):

```sh
git clone --recursive git@github.com:${_REPO_OWNER}/stack.template.git && cd stack.template && \
    git submodule update --init --recursive && git submodule foreach --recursive git checkout main
```

### 3. Configure environment

**TIP:** Skip this step, if you've already configured environment.

**3.1.** Configure **`.env`** file:

**IMPORTANT:** Please, check **[environment variables](#environment-variables)**!

```sh
# Copy .env.example file into .env file:
cp -v .env.example .env

# Edit environment variables to fit in your environment:
nano .env
```

**3.2.** Configure **`docker-compose.override.yml`** file:

**IMPORTANT:** Please, check **[arguments](#arguments)**!

```sh
# Set environment:
export _ENV=[ENV]
# For example for development environment:
export _ENV=dev

# Copy docker-compose.override.[ENV].yml into docker-compose.override.yml file:
cp -v ./templates/docker-compose/docker-compose.override.${_ENV}.yml docker-compose.override.yml

# Edit docker-compose.override.yml file to fit in your environment:
nano docker-compose.override.yml
```

**3.3.** Validate docker compose configuration:

**NOTICE:** If you get an error or warning, check your configuration files (**`.env`** or **`docker-compose.override.yml`**).

```sh
./stack.template-compose.sh validate

# Or:
docker compose config
```

### 4. Run docker compose

```sh
./stack.template-compose.sh start -l

# Or:
docker compose up -d && docker compose logs -f --tail 100
```

### 5. Stop docker compose

```sh
./stack.template-compose.sh stop

# Or:
docker compose down
```

:thumbsup: :sparkles:

---

## Environment Variables

You can use the following environment variables to configure:

[**`.env.example`**](.env.example)

```sh
## Docker image namespace:
IMG_NAMESCAPE=username

## Template port:
TEMPLATE_PORT=8000
```

## Arguments

You can use the following arguments to configure:

**template**:

```txt
-b, --bash, bash, /bin/bash
    Run only bash shell.
```

For example as in [**`docker-compose.override.yml`**](templates/docker-compose/docker-compose.override.dev.yml) file:

```yml
    command: ["/bin/bash"]
```

## Roadmap

...

---

## References

- Docker - <https://www.docker.com>
- Docker Compose - <https://docs.docker.com/compose>
