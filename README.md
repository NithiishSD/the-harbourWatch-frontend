# HarbourWatch Frontend

The interactive real-time dashboard for HarbourWatch.

Visualizes live ship traffic, port geofences, anchorage areas, weather overlays, voyage histories, and queue KPIs on a Leaflet map.

## Structure

```
frontend/
├── src/
│   ├── index.html       # Single-page application entry point
│   ├── app.js           # Core map, UI, state, and API integration logic
│   ├── app.css          # Styling & dark-mode theme
│   └── sky.js           # Marine weather canvas renderers
├── Dockerfile           # Standalone Nginx Alpine container
├── nginx.conf           # Reverse proxy configuration (/api → backend)
├── docker-compose.yml   # Standalone compose runner
└── .github/workflows/   # CI/CD image build and push
```

## Quick Start (Docker)

1. Build and run with Docker:
   ```bash
   docker compose up -d --build
   ```

2. Open [http://localhost](http://localhost) in your browser.

## Running Locally Without Docker

Because the frontend is pure HTML, CSS, and vanilla JS, you can run it using any static file server:

```bash
# Using Python
cd src && python3 -m http.server 3000

# Using Node (npx)
npx serve src -p 3000
```

> **Note**: When running directly against a separate backend host, ensure your backend has CORS enabled or use the provided Nginx reverse proxy.

## Deployment Options

- **Docker / Nginx**: Build with `docker build -t harbourwatch-frontend .` and deploy to any container platform (ECS, Cloud Run, Kubernetes, VPS).
- **Static Hosting (Vercel, Netlify, Cloudflare Pages, S3)**: Deploy the `src/` directory directly, configuring API rewrites for `/api/*` pointing to your backend endpoint.
