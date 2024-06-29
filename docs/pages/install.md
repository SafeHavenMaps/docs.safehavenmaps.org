# Deploy SafeHaven

## Prerequisites

For a production environment, there are 2 prerequisites :
- A PostgreSQL server version 14 at least **with the PostGIS extension installed**.
- A reverse proxy set with a correct SSL certificate.

## A sidenote on the database

Once you have your PostgreSQL server up and running, you need to create a database and enable the PostGIS extension. Here is a quick guide to do so :

```sql
CREATE DATABASE safehaven;
```

The first migration will try to create the 3 required extensions:

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "postgis";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";
```
Note that the user should have the right to create extensions on the database.

SafeHaven leverages PostgreSQL's full text search capabilities. You can help the indexer by setting a locale on the database. For instance, if you're going to use SafeHaven in French, you can set it like this:

```sql
ALTER DATABASE safehaven SET default_text_search_config = 'pg_catalog.french';
```

## Docker

You can deploy easily SafeHaven with Docker. Here is the command line you can use to start the container :

```bash
docker run -d \ 
  -e SH__DATABASE__URL="postgresql://user:password@host/safehaven" \  # Set the database path
  -e SH__DATABASE__POOL_SIZE="5" \                                    # Set the number of connections to the database
  -e SH__SECURE_COOKIE="true" \                                       # Activate if you have a reverse proxy with HTTPS.
  -e SH__TOKEN_SECRET="SecretForValidatingAngSigningTokens" \         # Set a secret that will be used to sign sessions
  ghcr.io/safehavenmaps/safehaven:latest                              # Change latest to the latest version, check the releases
```

Tweak the variables to match your environment.

## First login

Once the container is up and running for the first time, an admin user will be automatically created.

You can access the administration interface at `/admin` and login with the credentials given in the logs.