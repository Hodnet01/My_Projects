from bs4 import BeautifulSoup
import requests


URL = 'https://aviakompaniya.info/kody-aviakompanij-rossii-mira-iata-icao'
response = requests.get(URL)
soup = BeautifulSoup(response.text, 'lxml')

names = soup.find_all('td', class_='views-field views-field-field-company-value')
iatas = soup.find_all('td', class_='views-field views-field-field-iata-value')
# iata = map(lambda x: x.split(), list(soup.find_all('td', class_='views-field views-field-field-iata-value')))

with open('db_airlines.xlsx', 'w', encoding='utf-8') as f:
    for iata, name in zip(iatas, names):
        f.write(iata.text.strip() + ',' + name.text.strip().split('(')[1][:-1] + '\n')
