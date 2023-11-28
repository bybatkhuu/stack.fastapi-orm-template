# Stack {{cookiecutter.project_name}}

This is a Stack {{cookiecutter.project_name}} project.

## Features

- Stack
- FastAPI
- REST API
- PostgreSQL
- ORM (SQLAlchemy)
- Web service
- Microservice
- Template
- CI/CD
- Docker and docker compose

---

## Getting started

### 1. Prerequisites

- Install **docker** and **docker-compose** - <https://docs.docker.com/engine/install>

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
```

**2.2.** Follow one of the below options **[A]**, **[B]** or **[C]**:

**A.** Clone the repository (for **public**: git + https):

```sh
git clone https://github.com/bybatkhuu/stack.{{cookiecutter.project_slug}}.git && \
    cd stack.{{cookiecutter.project_slug}}

# Or clone with all submodules:
git clone --recursive https://github.com/bybatkhuu/stack.{{cookiecutter.project_slug}}.git && \
    cd stack.{{cookiecutter.project_slug}} && \
    git submodule update --init --recursive && \
    git submodule foreach --recursive git checkout main
```

**B.** Clone the repository (for **development**: git + ssh key):

```sh
git clone git@github.com:bybatkhuu/stack.{{cookiecutter.project_slug}}.git && \
    cd stack.{{cookiecutter.project_slug}}

# Or clone with all submodules:
git clone --recursive git@github.com:bybatkhuu/stack.{{cookiecutter.project_slug}}.git && \
    cd stack.{{cookiecutter.project_slug}} && \
    git submodule update --init --recursive && \
    git submodule foreach --recursive git checkout main
```

**C.** Download source code: <https://github.com/bybatkhuu/stack.{{cookiecutter.project_slug}}/releases>

### 3. Configure environment

**TIP:** Skip this step, if you've already configured environment.

**3.1.** Configure **`.env`** file:

**IMPORTANT:** Please, check **[environment variables](#environment-variables)**!

```sh
# Copy '.env.example' file to '.env' file:
cp -v ./.env.example ./.env

# Edit environment variables to fit in your environment:
nano ./.env
```

**3.2.** Configure **`docker-compose.override.yml`** file:

**IMPORTANT:** Please, check **[arguments](#arguments)**!

```sh
# Set environment:
export _ENV=[ENV]
# For example for development environment:
export _ENV=dev

# Copy 'docker-compose.override.[ENV].yml' file to 'docker-compose.override.yml' file:
cp -v ./templates/docker-compose/docker-compose.override.${_ENV}.yml ./docker-compose.override.yml

# Edit 'docker-compose.override.yml' file to fit in your environment:
nano ./docker-compose.override.yml
```

**3.3.** Validate docker compose configuration:

**NOTICE:** If you get an error or warning, check your configuration files (**`.env`** or **`docker-compose.override.yml`**).

```sh
./compose.sh validate
# Or:
docker compose config
```

### 4. Run docker compose

```sh
./compose.sh start -l
# Or:
docker compose up -d && \
    docker compose logs -f --tail 100
```

### 5. Stop docker compose

```sh
./compose.sh stop
# Or:
docker compose down
```

:thumbsup: :sparkles:

---

## Environment Variables

You can use the following environment variables to configure:

[**`.env.example`**](.env.example)

```sh
## --- Environment variable --- ##
ENV=local
DEBUG=false


## --- DB configs --- ##
{{cookiecutter.env_prefix}}DB_HOST=db
{{cookiecutter.env_prefix}}DB_PORT=5432
{{cookiecutter.env_prefix}}DB_USERNAME={{cookiecutter.project_abbr}}_user
{{cookiecutter.env_prefix}}DB_PASSWORD="{{cookiecutter.project_abbr}}_password1"
{{cookiecutter.env_prefix}}DB_DATABASE={{cookiecutter.project_abbr}}_db
# {{cookiecutter.env_prefix}}DB_DSN_URL="postgresql+psycopg://{{cookiecutter.project_abbr}}_user:{{cookiecutter.project_abbr}}_password1@db:5432/{{cookiecutter.project_abbr}}_db"

# {{cookiecutter.env_prefix}}DB_READ_HOST=db
# {{cookiecutter.env_prefix}}DB_READ_PORT=5432
# {{cookiecutter.env_prefix}}DB_READ_USERNAME={{cookiecutter.project_abbr}}_user
# {{cookiecutter.env_prefix}}DB_READ_PASSWORD="{{cookiecutter.project_abbr}}_password1"
# {{cookiecutter.env_prefix}}DB_READ_DATABASE={{cookiecutter.project_abbr}}_db
# {{cookiecutter.env_prefix}}DB_READ_DSN_URL="postgresql+psycopg://{{cookiecutter.project_abbr}}_user:{{cookiecutter.project_abbr}}_password1@db:5432/{{cookiecutter.project_abbr}}_db"


## -- APP configs -- ##
{{cookiecutter.env_prefix}}APP_PORT=8000
{{cookiecutter.env_prefix}}APP_LOGS_DIR="/var/log/rest.{{cookiecutter.project_slug}}"
{{cookiecutter.env_prefix}}APP_DATA_DIR="/var/lib/rest.{{cookiecutter.project_slug}}"
```

## Arguments

You can use the following arguments to configure:

For **api** service:

```txt
-b, --bash, bash, /bin/bash
    Run only bash shell.
```

For example as in [**`docker-compose.override.yml`**](templates/docker-compose/docker-compose.override.dev.yml) file:

```yml
    command: ["/bin/bash"]
    command: ["-b", "pwd && ls -al && /bin/bash"]
    command: ["-b", "sleep 3 && uvicorn main:app --host=0.0.0.0 --port={% raw %}${{% endraw %}{{cookiecutter.env_prefix}}APP_PORT:-8000} --no-server-header --proxy-headers --forwarded-allow-ips='*' --no-access-log"]
```

## Roadmap

...

---

## References

- FastAPI - <https://fastapi.tiangolo.com>
- PostgreSQL - <https://www.postgresql.org>
- SQLAlchemy - <https://www.sqlalchemy.org>
- Docker - <https://www.docker.com>
- Docker Compose - <https://docs.docker.com/compose>
