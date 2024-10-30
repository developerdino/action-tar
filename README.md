# Tar Files Action

This GitHub action exposes the tar command for use in building/archiving. It is important to note that this action currently only supports Linux.

## Usage

Tar the directory `dir` into `dir.tar.gz`:

```yaml
- uses: developerdino/action-tar@v1
  with:
    args: tar -czf dir.tar.gz dir
```

Untar a `dir.tar` file:

```yaml
- uses: developerdino/action-tar@v1
  with:
    args: tar -xzf dir.tar
```

Tar a folder from a different work dir

```yaml
- uses: developerdino/action-tar@v1
  with:
    args: tar -C dir -czf dir.tar.gz .
```

Reusing the same tar between steps in a `PHP` CI with unit and mutation tests:

```yaml
name: Continuous Integration
on:
  push:
  pull_request:
jobs:
  composer-install:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - run: composer install --ansi --no-progress --no-interaction --prefer-dist
      - uses: developerdino/action-tar@v1
        with:
          args: tar xzf vendor.tar.gz vendor
      - uses: actions/upload-artifact@v2
        with:
          name: vendor.tar.gz
  tests:
    needs: composer-install
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: actions/download-artifact@v2
        with:
          name: vendor.tar.gz
      - uses: developerdino/action-tar@v1
        with:
          args: tar -xzf vendor.tar.gz vendor
      - run: ./vendor/bin/phpunit
  mutation:
    needs: composer-install
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: actions/download-artifact@v2
        with:
          name: vendor.tar.gz
      - uses: developerdino/action-tar@v1
        with:
          args: tar -xjf vendor.tar.gz vendor
      - run: ./vendor/bin/infection
```

# Attribution

This action is based on the [montudor/action-zip](https://github.com/montudor/action-zip) action by [@montudor](https://github.com/montudor).