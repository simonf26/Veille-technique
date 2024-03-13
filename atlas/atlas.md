# Atlas

Atlas is a language-independent tool for managing and migrating database schemas
using modern DevOps principles. It offers two workflows:

- Declarative: Similar to Terraform, Atlas compares the current state of the
database to the desired state, as defined in an HCL, SQL, or ORM schema. Based
on this comparison, it generates and executes a migration plan to transition
the database to its desired state.

- Versioned: Unlike other tools, Atlas automatically plans schema migrations
for you. Users can describe their desired database schema in HCL, SQL, or
their chosen ORM, and by utilizing Atlas, they can plan, lint, and apply the
necessary migrations to the database.

## Inspect a database

Inspecting a database is reading the database *description* provided by a
URL and outputting it in three different formats: HCL, SQL, and JSON.

```shell
atlas schema inspect -u "<database_url>" > schema.hcl
# or in SQL format
atlas schema inspect -u "<database_url>" --format '{{ sql . }}' > schema.sql
# or in JSON format
atlas schema inspect -u "<database_url>" --format '{{ json . }}' > schema.json
```

## Declarative Migrations

The declarative approach requires the user to **define the desired end schema**,
and Atlas **provides a safe way to alter the database to get there**. Let's see
this in action.

### Applying changes

```shell
atlas schema apply -u "<database_url>" --to "file://schema.hcl"
# or using SQL file
atlas schema apply -u "<database_url>" --to "file://schema.sql" \
--dev-url "docker://postgres/15"
# or using env file as argument
atlas schema apply --env "<env_name>" --var "destructive=true"
```

Database URLs used can select:

- a database `"postgres://localhost:5432/<database>"`
- a schema `"postgres://localhost:5432/database?search_path=public"`
- multiple schemas `"postgres://localhost:5432/database" -s schema1,schema2`.

It can also exclude:

- schemas: `atlas schema inspect -u "postgres://localhost" --exclude "schema1"`
- tables: `atlas schema inspect -u "postgres://localhost" --exclude "schema1.table2"`

### Database comparison

```shell
# compare 2 databases / database schemas
atlas schema diff --from "postgres://<current_database_URL>" \
--to "postgres://<desired_database_URL>"
# compare 2 HCL/SQL schemas
atlas schema diff --from "file://<current_schema>" --to "file://<desired_schema>" \
--dev-url "docker://postgres/15"
# compare migration directories
atlas schema diff --from "file://<current_migrations>" \
--to "file://<desired_migrations>" --dev-url "docker://postgres/15"
# compare a migration directory to a database
atlas schema diff \
  --from "file://<current_migrations>" --to "postgres://<desired_database_URL>" \
  --dev-url "docker://postgres/15"
```

## Versioned Migrations

Alternatively, the versioned migration workflow, sometimes called "change-based
migrations", **allows each change to the database schema to be checked-in
to source control and reviewed during code-review**. Users can still benefit
from Atlas intelligently planning migrations for them, however they are not
automatically applied.

### Creating the first migration

One of Atlas's most popular features is its ability to automatically generate
SQL migration scripts based on a desired schema. A schema can be defined in
several ways: through Atlas's HCL language, standard SQL, external ORMs or
programs.

```shell
atlas migrate diff initial --to "file://<desired_schema_file>" \
  --dev-url "docker://postgres/15/dev?search_path=public" \
  --format '{{ sql . "  " }}'
```

### Applying migrations

```shell
atlas migrate apply --dir <migration_folder_name> --url "postgres://<database_url>"
```

### Create new migrations

To start, we will calculate the difference between the *desired* and *current*
state of the database by running the atlas migrate diff command.

```shell
# Using a URL as desired state (-to)
atlas migrate diff <migration_name> --dir "file://<migration_folder>" \
--to "postgres://<database_url>" --dev-url "docker://postgres/15"
# Using a file (HCL or SQL)
atlas migrate diff <migration_name> --dir "file://<migration_folder>" \
--to "file://<schema_file>" --dev-url "docker://postgres/15"
# Using a migration directory
atlas migrate diff <migration_name> --dir "file://<migration_folder>" \
--to "file://<desired_migration_folder>" --dev-url "docker://postgres/15"
```

## Github issues

- Postgres domain: https://github.com/ariga/atlas/issues/2214
- Postgres extension: https://github.com/ariga/atlas/issues/2248
- Postgres sequence: https://github.com/ariga/atlas/issues/2192,
https://github.com/ariga/atlas/issues/2089,