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

This repository includes a `Jenkinsfile` at the project root that builds the Vue application using npm.

### Prerequisites for Jenkins

The Jenkins agent running the pipeline **must have Node.js 20+ and npm installed** (see `engines` in `package.json`).

**To install Node.js on the Jenkins agent:**

```bash
# Option 1: Using a package manager (Linux)
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt-get install -y nodejs

# Option 2: Using Homebrew (macOS)
brew install node@22

# Option 3: Download from nodejs.org
# https://nodejs.org/en/download/
```

Verify installation on the Jenkins agent:

```bash
node --version  # Should be v20+
npm --version   # Should be 9+
```

### Pipeline Flow

1. **Checkout** — Clones the repository and logs the commit
2. **Install Dependencies** — Runs `npm install`
3. **Build** — Runs `npm run build` to generate the `dist/` folder
4. **Post-Build** — Archives artifacts and reports status

### Troubleshooting

- **`npm: not found`** — Node.js is not installed on the Jenkins agent. Install it using the steps above.
- **Build timeout** — Increase the timeout in `Jenkinsfile` options block (currently 30 minutes).
- **Permission denied** — Ensure the Jenkins user has permission to write to the workspace.

## Project structure

- `index.html` — app entry
- `src/` — Vue app source
- `public/` — static assets
- `Dockerfile` — Docker image definition
- `docker-compose.yml` — Docker Compose configuration
- `Jenkinsfile` — CI pipeline

## Contributing

Contributions are welcome. Open an issue or submit a pull request.

## License

This project has no explicit license. Add a LICENSE file if needed.
