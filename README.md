# Blitzboard

A Blitzball league tracker. Log match results, view live standings, manage rosters.

Built with Rails 8, PostgreSQL, Hotwire, and Action Cable.

---

## Stack

- Rails 8 with Propshaft
- PostgreSQL
- Tailwind CSS
- Hotwire (Turbo + Stimulus)
- Action Cable for live standings updates
- Minitest

---

## Setup

```bash
bundle install
rails db:create db:migrate db:seed
bin/dev
```

Create a `.env` file in the project root:

```
ADMIN_PASSWORD=your_password_here
```

---

## Features

**Public**

- League standings, updated live when a match is logged
- Match history
- Team pages with full rosters and player stats
- Player profiles with stat bars
- Free agent pool with search

**Admin** — requires login at `/admin/login`

- Log individual matches
- Bulk import matches via CSV
- Manage teams and players

---

## Bulk import

Visit `/admin/matches/bulk_new` and paste a CSV with this format:

```
home_team,away_team,home_score,away_score,date
Besaid Aurochs,Luca Goers,3,1,2024-04-01
Ronso Fangs,Kilika Beasts,1,0,2024-04-01
Al Bhed Psyches,Guado Glories,2,2,2024-04-01
Besaid Aurochs,Ronso Fangs,2,1,2024-04-08
Luca Goers,Al Bhed Psyches,0,3,2024-04-08
Guado Glories,Kilika Beasts,4,1,2024-04-08
```

The import shows a preview before writing anything to the database. Invalid rows are highlighted and skipped — only
valid rows are imported. To test the validation:

```
home_team,away_team,home_score,away_score,date
Besaid Aurochs,Luca Goers,3,1,2024-04-15
Unknown Team,Kilika Beasts,1,0,2024-04-15
Al Bhed Psyches,Guado Glories,three,2,2024-04-15
Ronso Fangs,Ronso Fangs,1,0,2024-04-15
Besaid Aurochs,Guado Glories,2,1,not-a-date
```

---

## Seed data

The seed file includes all 6 canon Blitzball teams from Final Fantasy X with their full rosters, a set of free agents,
and 10 matches to populate the standings.

```bash
rails db:seed
```

Safe to run multiple times.

---
