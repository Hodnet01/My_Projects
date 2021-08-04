import pyodbc


SERVER = 'LAPTOP-QA1BAK30'
DATABASE = 'AirIncident'
BASIC_QUERY = "SELECT * FROM Инцидент INNER JOIN Перелёт ON Инцидент.Перелёт#=Перелёт.Перелёт# INNER JOIN Рейс " \
              "ON Перелёт.Рейс#=Рейс.Рейс# INNER JOIN Авиакомпания ON Авиакомпания.Авиакомпания#=Рейс.Авиакомпания#"


def connect_db():
    conn = pyodbc.connect('Trusted_Connection=yes',
                          driver='ODBC Driver 17 for SQL Server',
                          server='localhost',
                          database=DATABASE)

    cursor = conn.cursor()
    return conn, cursor


def disconnect_db(conn):
    conn.commit()


def create_countries() -> list:
    with open("db_countries.csv", 'r', encoding='utf-8') as f:
        countries = f.readlines()
        countries = list(map(lambda x: x[:-1], countries))
    return countries


def create_airports() -> (dict, list):
    country_dict = dict()
    for ind, country in enumerate(create_countries()):
        country_dict[country] = ind + 1
    with open('apinfo.ru.csv', 'r', encoding='utf-8') as f:
        f.readline()
        airports = list(map(lambda x: x[:-1], f.readlines()))
    airports = list(filter(lambda x: x[0], list(map(lambda x: x.split(','), airports))))
    icao_set = set()
    airports_real = airports[:]
    for airport in airports:
        if airport[0] in icao_set:
            airports_real.remove(airport)
        icao_set.add(airport[0])
    return country_dict, airports_real


def create_aircompanies() -> list:
    with open("db_aircompanies.csv", 'r', encoding='utf-8') as f:
        companies = f.readlines()
        companies = list(map(lambda x: [x.split(',')[0], x.split(',')[1][:-1]], companies))
        companies[0][0] = companies[0][0][-2:]
        companies[0][-1] = companies[0][-1]
    return companies


def fill_countries(countries: list, cursor) -> None:
    for country in countries:
        cursor.execute(rf"INSERT INTO dbo.Страна (Наименование) VALUES ('{country}')")


def fill_aircompanies(aircompanies: list, cursor) -> None:
    for company in aircompanies:
        cursor.execute(rf"INSERT INTO dbo.Авиакомпания (ИАТА_код, Наименование) VALUES {company[0], company[1]}")


def fill_positions(cursor) -> None:
    positions = ['Командир воздушного судна',
                 'Инспектор',
                 'Пилот',
                 'Летчик-наблюдатель',
                 'Бортовой штурман',
                 'Бортовой инженер',
                 'Бортовой механик',
                 'Бортовой радист',
                 'Борт-проводник']

    for position in positions:
        cursor.execute(rf"INSERT INTO dbo.Должность (Наименование) VALUES ('{position}')")


def fill_airports(country_dict: dict, airports: list, cursor):
    for airport in airports:
        cursor.execute(rf"INSERT INTO dbo.Аэропорт (ИКАО_код, Город, Наименование, Страна#) VALUES ('{airport[0]}', '{airport[4]}', '{airport[2]}', {country_dict[airport[-1]]})")


def fill_models(cursor) -> None:
    with open("db_models.csv", 'r', encoding='utf-8') as f:
        f.read(1)
        models = f.readlines()
    for model in models:
        cursor.execute(rf"INSERT INTO dbo.Модель (Наименование) VALUES ('{model}')")


def reset_identity(table: str, cursor) -> None:
    cursor.execute(f'DELETE FROM {table}')
    cursor.execute(f'DBCC CHECKIDENT ({table}, RESEED, 0)')
