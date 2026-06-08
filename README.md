# Portfolio Website

This is the source for [michaelgallo.dev](https://michaelgallo.dev). The site is a Rails application with a migrated portfolio home page and a Markdown-backed blog.

## Stack

- Rails
- Propshaft assets
- Markdown posts in `content/posts`
- Docker
- Kamal-ready deployment configuration
- GitLab CI

## Development

Install dependencies:

```sh
make setup
```

Run the Rails app locally:

```sh
make serve
```

Run tests:

```sh
make test
```

Build and run the production Docker image locally:

```sh
make docker-serve
```

## Blog Posts

Create posts as Markdown files in `content/posts`. Each post needs YAML frontmatter:

```md
---
title: Example Post
date: 2026-06-08
description: A short summary for listings and metadata.
tags:
  - Rails
---

Write the post body in Markdown.
```

The filename is used as the slug unless a `slug` field is provided.

## Deployment

The app remains Dockerized and includes Kamal configuration in `config/deploy.yml`.

Required local environment for Kamal:

- `KAMAL_HOST`: server IP or hostname
- `KAMAL_REGISTRY_USERNAME`: GitLab registry username
- `KAMAL_REGISTRY_PASSWORD`: GitLab registry token/password
- `KAMAL_SSH_USER`: SSH user, defaults to `root`

Then run Kamal commands through the binstub:

```sh
bin/kamal setup
bin/kamal deploy
```

`config/master.key` is intentionally ignored by git. Keep it available locally or provide the equivalent `RAILS_MASTER_KEY` secret during deploy.
