# vue-jenkins-pipeline

This template should help get you started developing with Vue 3 in Vite.

## Recommended IDE Setup

[VS Code](https://code.visualstudio.com/) + [Vue (Official)](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur).

## Recommended Browser Setup

- Chromium-based browsers (Chrome, Edge, Brave, etc.):
  - [Vue.js devtools](https://chromewebstore.google.com/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd)
  - [Turn on Custom Object Formatter in Chrome DevTools](http://bit.ly/object-formatters)
- Firefox:
  - [Vue.js devtools](https://addons.mozilla.org/en-US/firefox/addon/vue-js-devtools/)
  - [Turn on Custom Object Formatter in Firefox DevTools](https://fxdx.dev/firefox-devtools-custom-object-formatters/)

## Customize configuration

See [Vite Configuration Reference](https://vite.dev/config/).

## Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Compile and Minify for Production

```sh
# vue-jenkins-pipeline

A minimal Vue 3 + Vite starter configured for quick development and a simple Jenkins pipeline (see `Jenkinsfile`).

**Quick links**

- Project: Vue 3 + Vite
- CI: Jenkins pipeline defined in the repository root (`Jenkinsfile`)

## Features

- Vite dev server and build (`vite`)
- Minimal example components under `src/components`

## Prerequisites

- Node: see `engines` in `package.json` (tested with Node 20+)
- npm (or pnpm/yarn)

## Install

Install dependencies:

```bash
npm install
```

## Development

Start the dev server with hot-reload:

```bash
npm run dev
```

Open http://localhost:5173 in your browser.

## Build

Create a production build:

```bash
npm run build
```

Preview the production build locally:

```bash
npm run preview
```

## Docker

### Prerequisites

- Docker & Docker Compose installed

### Development with Docker

Start the dev environment:

```bash
docker-compose up
```

The app will be available at http://localhost:5173 with hot-reload enabled.

### Production Docker Build

Build the Docker image:

```bash
docker build -t vue-jenkins-pipeline:latest .
```

Run the production container:

```bash
docker run -p 3000:3000 vue-jenkins-pipeline:latest
```

Access the app at http://localhost:3000.

## CI (Jenkins)

This repository includes a `Jenkinsfile` at the project root with support for both **local** and **Docker** builds:

- **Local build**: Runs npm install/build using Node.js installed on the Jenkins agent
- **Docker build**: Builds the Docker image on the Jenkins agent (requires Docker daemon access)

Use the `BUILD_TYPE` parameter to choose the build method when triggering the pipeline.

To customize the pipeline:

1. Update the Node version in the `tools` block (currently `node22`)
2. Modify environment variables in the `environment` block
3. Add credentials or artifact handling as needed for your Jenkins instance

## Project structure

- `index.html` — app entry
- `src/` — Vue app source
- `public/` — static assets
- `Dockerfile` — Docker image definition
- `docker-compose.yml` — Docker Compose configuration
- `Jenkinsfile` — CI pipeline with local & Docker build options

## Contributing

Contributions are welcome. Open an issue or submit a pull request.

## License

This project has no explicit license. Add a LICENSE file if needed.
