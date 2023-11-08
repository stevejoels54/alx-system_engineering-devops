#!/usr/bin/python3
"""Function that queries subscribers on a given Reddit subreddit"""
import requests


def number_of_subscribers(subreddit):
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {'User-Agent': 'stevejobs/1.0'}

    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code == 404:
        return 0

    data = response.json()
    subscribers = data['data']['subscribers']

    return subscribers
