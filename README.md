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

### Images

Blog images live in `public/blog-images/<post-slug>/` and are served at `/blog-images/<post-slug>/...`.

Cursor's built-in image paste is unreliable on Linux, so use the project scripts instead.

**Paste an image**

1. Copy an image to your clipboard (screenshot, etc.)
2. With the post open, run **Tasks: Run Task** → **Paste Blog Image**  
   Or from the project root: `bin/paste-blog-image content/posts/hello-rails-blog.md`
3. The image is saved under `public/blog-images/<slug>/` and the markdown link is copied to your clipboard
4. **Ctrl+V** in the post to insert the link

Optional custom filename:

```sh
bin/paste-blog-image content/posts/hello-rails-blog.md --name proton-recurring-event-weirdness "Alt text"
```

**Rename a post**

After renaming a post file in Cursor, run **Tasks: Run Task** → **Sync Blog Post**  
Or:

```sh
bin/sync-blog-post content/posts/new-filename.md
```

That moves `public/blog-images/<old-slug>/` to match the current slug and rewrites image paths in the post.

To rename the file and sync in one step:

```sh
bin/rename-blog-post content/posts/hello-rails-blog.md why-i-left-proton
```

The slug comes from the `slug:` frontmatter field when present, otherwise from the filename.

You can also reference images directly:

```md
![Alt text](/blog-images/hello-rails-blog/screenshot.png)
```

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
