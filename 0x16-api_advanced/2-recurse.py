#!/usr/bin/python3
"""Function that queries list of all hot post for a subreddit"""
import requests


def recurse(subreddit, hot_list=None, after=None):
    if hot_list is None:
        hot_list = []

    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=100"
    headers = {'User-Agent': 'stevejobs/1.0'}
    params = {'after': after} if after else {}

    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)

    if response.status_code == 404:
        return None

    data = response.json()

    for post in data['data']['children']:
        hot_list.append(post['data']['title'])

    after = data['data']['after']

    if after:
        recurse(subreddit, hot_list, after)

    return hot_list
