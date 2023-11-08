#!/usr/bin/python3
"""Function that prints hot posts for given subreddit"""
import requests


def top_ten(subreddit):
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=10"
    headers = {'User-Agent': 'stevejobs/1.0'}

    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code == 404:
        print("None")
        return

    data = response.json()

    for post in data['data']['children']:
        post_title = post['data']['title']
        print(post_title)
