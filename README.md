# Portfolio Website

Static site for [michaelgallo.dev](https://michaelgallo.dev), built with [Hugo](https://gohugo.io) and deployed on Cloudflare Pages.

## Development

```sh
hugo server
```

Site is at `http://localhost:1313`.

## Build

```sh
hugo --minify --gc
```

Output goes to `public/`. Run `bin/smoke` to build and verify key pages.

## Blog Posts

Create a post:

```sh
hugo new blog/my-post.md
```

Each post needs frontmatter:

```md
---
title: Example Post
date: 2026-06-08
description: A short summary for listings and metadata.
tags:
  - Go
---
```

The filename is used as the URL slug unless a `slug` field is provided.

### Images

Blog images live in `static/blog-images/<post-slug>/` and are served at `/blog-images/<post-slug>/...`:

```md
![Alt text](/blog-images/my-post/screenshot.png)
```

## Deployment (Cloudflare Pages)

Connect this repo to Cloudflare Pages with:

- **Build command:** `hugo --minify --gc`
- **Output directory:** `public`
- **Environment variable:** `HUGO_VERSION = 0.163.3`
- **Branch:** `master`
