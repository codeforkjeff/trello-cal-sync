
# trello-cal-sync

Syncs your Trello cards to a Google calendar.

Note that Trello has a Calendar power-up that provides an iCal feed.
It didn't meet my needs but it may work for you.

Here's what I wanted:

- All my cards should be synced to a single calendar
- Only "to be completed" cards should show up in the calendar
- Completed cards should be removed to avoid clutter
- What counts as "to be completed" and "completed" may vary, possibly across
boards, in the future

Though my requirements were very specific, this script is written to be
highly customizable, so you can probably make it work to suit your own needs
fairly easily.

## Installation

```
# assumes repo has been cloned into your home dir
cd ~
python -m venv ./trello-cal-sync-env
. ./trello-cal-sync-env/Scripts/activate
pip install -r ./trello-cal-sync/requirements.txt
```

Copy `config.json.sample` to `config.json`. Fill in the fields as you complete
the steps below.

### The Google Parts:

Go to this page: https://developers.google.com/calendar/quickstart/python

Click "Enable the Google Calendar API" and download the `credentials.json` file
into your cloned repo directory.

It's highly recommended you create a separate Google calendar for your Trello
cards. Create one and put the name of it in your `config.json` file.

### The Trello Parts:

Get your Trello API Key from here: https://trello.com/app-key

Click the "Token" link on that page to generate a token.

Copy the api key, secret, and token in the trello section of your `config.json`
file.

## Running the Script

You need to run this periodically to sync. To automate it, set up a cron job
or something.

```
. ~/trello-cal-sync-env/Scripts/activate
python trello_cal_sync.py
```

The first time you run the script, it will open a browser window for Google
authentication and to confirm permission to access your calendar.

## Customization

You can create your own subclasses to selectively override functionality
as it suits you. Just write your custom class and point to it in the
`config.json` file using the trello_class, calendar_class, and
synchronizer_class keys.
