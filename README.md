# Student Portal

## Run Locally

Please make sure to install ruby version `3.2.2` prior to installing dependencies.

```bash
bundle install
```

Copy environment variables file and modify accordingly.

```bash
cp .env.example .env
```

Setup database, which will also populate admin profile.

```bash
bin/rails db:setup
```

Start the server

```bash
bin/rails server
```

## Additional Data

Please find the [CSV file](public/students-1970-01-01.csv) as a reference of upload file for import functionality.
