import dbus
import os
import sys

from bs4 import BeautifulSoup
import requests


# Check if user has exported GENIUS_API_KEY
api_key = os.getenv("GENIUS_API_KEY")
if api_key is None:
    print("GENIUS_API_KEY not in the environment")
    sys.exit()

try:
    session = dbus.SessionBus()
    spotify_dbus = session.get_object(
        "org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2"
    )
    spotify_interface = dbus.Interface(
        spotify_dbus, "org.freedesktop.DBus.Properties"
    )
    metadata = spotify_interface.Get(
        "org.mpris.MediaPlayer2.Player", "Metadata"
    )
except Exception:
    print("Spotify is not running")

song_artist, song_title = (
    metadata['xesam:artist'][0], metadata['xesam:title']
)

# Call Genius API to search Artist + Song Title
headers = {"Authorization": f"Bearer {api_key}"}
response = requests.get(
    f"https://api.genius.com/search?q={song_artist} {song_title}",
    headers=headers,
).json()

if 'error' in response.keys():
    if response['error'] == 'invalid_token':
        print("Invalid GENIUS_API_KEY")
        sys.exit()
    else:
        print(f"Genius replied with this error: '{response['error']}'")
        sys.exit()

songs = response['response']['hits']

# Go through API results to find correct Artist + Song Title
remote_song_info = None

for hit in songs:
    if song_artist.lower() in hit['result']['primary_artist']['name'].lower():
        remote_song_info = hit
        break

if remote_song_info is None:
    print("Song not found on Genius")
    sys.exit()

song_url = None

try:
    song_url = remote_song_info['result']['url']
except KeyError:
    print("Song URL not found")
    sys.exit()

# Fetch Genius page and grab only the lyrics section
if song_url is not None:
    page = requests.get(song_url)
    html = BeautifulSoup(page.text, 'html.parser')
    lyrics_containers = html.find_all('div', {"data-lyrics-container": True})
    if lyrics_containers is None:
        print("Can't find the lyrics container")
    else:
        print(f"\n{song_artist} - {song_title}\n")
        for container in lyrics_containers:
            lyrics_lines = [text for text in container.stripped_strings]
            for line in lyrics_lines:
                print(line)
