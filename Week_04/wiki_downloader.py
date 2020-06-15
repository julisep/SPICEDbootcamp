
import requests
import re
from collections import Counter


def download_wikipedia_page(keyword, show_status=False):
    """retrieves the Wikipedia page and returns an HTML string""" #docstring 
    url = f"https://en.wikipedia.org/wiki/{keyword}"
    response = requests.get(url)
    # 2. check the status code
    if show_status:
        print(response.status_code)
    # 3. store the html contents of the page
    return response.text


def write_page(content, keyword, mode='w'):
    """write html contents to a file"""
    filename = f'{keyword}.html'
    with open (filename, mode) as f:
        f.write(content)


def clean_html(content):
    """removes html tags and returns a count of words"""
    tags = "</?\w+[^>]*>"
    text = re.sub(tags, " ", content, re.IGNORECASE)
    words = re.findall('[a-z]{5,}', text, re.IGNORECASE)
    return words


def count_words(content):
    """removes html tags and returns a count of words"""
    words = clean_html(content)
    count = len(words)
    return count


def get_top_words(content, n_words=20):
    words = clean_html(content)
    c = Counter(words)
    return c.most_common(n_words)

import sys

commandline_arguments = sys.argv
city = commandline_arguments[-2]
n_words = int(commandline_arguments[-1])

html = download_wikipedia_page(city, show_status=True)
write_page(html, city)
c = count_words(html)
print(city, c)
print(get_top_words(html, n_words=n_words))
