
# trello-cal-sync

Syncs your Trello cards to a Google calendar.

Note that Trello has a Calendar power-up that provides an iCal feed
for each board. It didn't meet my needs but it may work for you.

Here's what I wanted:

- All my cards, across all boards, should be synced to a single calendar
- Only "to be completed" cards should show up in the calendar; completed cards
should be removed to avoid clutter
- What counts as "to be completed," "in progress," and "completed" may vary,
possibly by board, in the future

Though my requirements were very specific, this script is written to be
highly customizable, so you can probably make it work to suit your own needs
fairly easily.

## Requirements

Python >= 3.6

## Installation

Clone this repo in your home directory.

Copy `config.json.sample` to `config.json`. Fill in the fields as you complete
the setup steps below.

### Setting up the Google Parts (using a Service Account for auth):

This is a bit complicated but is the most durable way to set up authentication
and authorization.

Go to the Google APIs Console: https://console.developers.google.com/

- Create a new Project called "Trello Sync" or something
- Enable the Google Calendar API for that project
- Under Credentials, create a Service Account. When generating keys, download
the file in .json format. Copy this to a file named `service-account.json`
in this repo's directory
- Take note of the account's auto-generated email address

Now create a new Google calendar. It's highly recommended that you do NOT
use your existing personal calendar.

- Share it with the Service Account's email address
- Note the calendar's ID in the "Integrate Calendar" section of its settings.
It looks like "blah@group.calendar.google.com"
- Copy the calendar id into the `config.json` file

### Alternative: Setting up the Google Parts (using OAuth):

If you can't get the above to work, try this:

Go to this page: https://developers.google.com/calendar/quickstart/python

Click "Enable the Google Calendar API" and download the `credentials.json` file
into your cloned repo directory.

Put the name of the calendar in the `config.json` and set `auth_type` to
"oauth"

If you use this method, then the first time you run the script, it will open
a browser window for Google authentication and to confirm permission to access
your calendar.

### Setting up the Trello Parts:

Get your Trello API Key from here: https://trello.com/app-key

Click the "Token" link on that page to generate a token.

Copy the api key, secret, and token in the trello section of your `config.json`
file.

## Running this

```
docker build . -t trello-cal-sync-image
./run_docker.sh
```

Run `run_docker.sh` periodically to sync. To automate it, set up a cron job
or something.

## How to use your Google calendar in Outlook

Not directly relevant to this project but sticking this info here anyway.

- go to "Integrate calendar" section of the Google calendar settings
- copy the "Secret address in iCal format" address
- in Outlook, right-click "My Calendars" and select "Add Calendar" -> "From
Internet..." and paste in the address
- sometimes Outlook gets messed up and stops syncing the calendar correctly;
if this happens, remove it from Outlook, go to the Google calendar settings
and click the "Reset" button for the secret address, then re-add the
calendar to Outlook using the new address

## Customization

You can create your own subclasses to selectively override functionality
as it suits you. Just write your custom class and point to it in the
`config.json` file using the trello_class, calendar_class, and
synchronizer_class keys.
