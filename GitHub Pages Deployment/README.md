# GitHub Deployment Workflow

A simple project demonstrating how to use GitHub Actions to automate deployments to GitHub Pages.

## How It Works

This repository is configured with a CI/CD pipeline using GitHub Actions. The workflow is defined in `.github/workflows/deploy.yml`. 

It listens for any `push` events to the `main` branch, but with a specific condition: **it will only run if the `index.html` file has been modified.** If changes are detected, it builds the artifact and deploys it directly to GitHub Pages.

## Setup Instructions

1. Go to your repository **Settings**.
2. Navigate to **Pages** in the left sidebar.
3. Under **Build and deployment**, change the **Source** dropdown from "Deploy from a branch" to **"GitHub Actions"**.
4. Push a change to your `index.html` file to trigger the first automated deployment.
