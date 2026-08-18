# Day Tripper Production Guide

A single-page, mobile-friendly production guide for the Krowne × Day Tripper shoot.

## Turn on shared checklist syncing

1. Open the Supabase project.
2. Open **SQL Editor** and create a new query.
3. Paste the complete contents of `supabase-setup.sql` and run it once.
4. Reload the production guide. The status at the top will change from **Local backup** to **Live sync**.

The page still saves checks locally if the internet connection drops.

## Put it online with GitHub Pages

1. Create a new GitHub repository.
2. Upload `index.html`, `supabase-setup.sql`, and the `assets` folder to the top level of the repository.
3. Open **Settings → Pages**.
4. Under **Build and deployment**, choose **Deploy from a branch**.
5. Select your main branch and the `/ (root)` folder, then save.

GitHub will provide the live link after the first deployment finishes.

## Editing

The page itself—copy, colors, layout, and checklist behavior—is contained in `index.html`. The `assets` folder contains the Vessel Archive logos. No build tools are required.
