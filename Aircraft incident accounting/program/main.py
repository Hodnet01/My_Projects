from classes import *
import sys


def main():
    app = QApplication(sys.argv)
    app.setStyle('Fusion')
    w = MainWindow()
    sys.exit(app.exec_())


    # reset_identity('Аэропорт', cursor)
    # reset_identity('Модель', cursor)
    # reset_identity('Авиакомпания', cursor)

    # fill_countries(create_countries(), cursor)
    # fill_aircompanies(create_aircompanies(), cursor)
    # fill_positions(cursor)
    # fill_airports(*create_airports(), cursor)
    # fill_models(cursor)

    # create_airports()
    # cursor.execute("INSERT INTO dbo.Страна (Наименование) VALUES ('СССР')")
    # cursor.execute('SELECT * FROM dbo.Страна')
    # print(cursor.fetchall())


if __name__ == "__main__":
    main()
