from PyQt5.QtWidgets import *
from functions import connect_db, disconnect_db, BASIC_QUERY
from PyQt5 import uic
import pyodbc
import datetime as dt


class MainWindow(QMainWindow):
    def __init__(self):
        super(MainWindow, self).__init__()
        uic.loadUi('MainWindow.ui', self)

        self.move_to_center()

        self.setWindowTitle('Инциденты')

        self.fill_listbox_incidents(BASIC_QUERY)

        self.find_button.clicked.connect(self.on_find_click)
        self.incidents_listbox.itemDoubleClicked.connect(self.return_feedback)
        self.add_button.clicked.connect(self.on_add_click)
        self.delete_button.clicked.connect(self.on_delete_click)
        self.persons_button.clicked.connect(self.on_persons_click)

        self.fb_window = FeedbackWindow()

        self.show()

    def move_to_center(self):
        screen_params = self.frameGeometry()
        screen_params.moveCenter(QDesktopWidget().availableGeometry().center())
        self.move(screen_params.topLeft())

    def fill_listbox_incidents(self, instruction):
        conn, cursor = connect_db()
        cursor.execute(instruction)
        incidents = list(
            map(lambda x: f"Инцидент# {x[0]}{(30 - len(str(x[0]))) * ' '}Рейс {x[-2].strip()}-{x[-7]}{(20 - len(str(x[-7]))) * ' '}"+
                          f"{x[15]}{(20 - len(str(x[15]))) * ' '}{x[1]}", cursor.fetchall()))
        disconnect_db(conn)
        self.incidents_listbox.clear()
        if incidents:
            self.incidents_listbox.addItems(incidents)
            self.incidents_listbox.repaint()
        else:
            QMessageBox.information(self, "Не найдено", "Инцедентов не найдено", QMessageBox.Ok)
            self.fill_listbox_incidents(BASIC_QUERY)

    def on_find_click(self):
        request = self.find_lineedit.text().strip()
        if request is not None and request.isdigit():
            instruction = f"{BASIC_QUERY} WHERE Инцидент#={request}"
            self.fill_listbox_incidents(instruction)
        else:
            QMessageBox.critical(self, "Ошибка", "Поиск проходит по целочисленному показателю. Введите число",
                                 QMessageBox.Ok)
            self.fill_listbox_incidents(BASIC_QUERY)

    def return_feedback(self, item):
        number = item.text().split()[1]
        self.fb_window.incident_id = number
        self.fb_window.refresh_window()
        self.fb_window.show()

    def on_add_click(self):
        self.ia_window = IncidentAdditionWindow()
        self.ia_window.show()

    def on_delete_click(self):
        item = self.incidents_listbox.selectedItems()
        if item != []:
            conn, cursor = connect_db()
            number = item[0].text().split()[1]
            cursor.execute(f"DELETE FROM Инцидент WHERE Инцидент#={number}")
            disconnect_db(conn)
            self.fill_listbox_incidents(BASIC_QUERY)

    def on_persons_click(self):
        self.p_window = PersonWindow()
        self.p_window.show()


class FeedbackWindow(QMainWindow):
    incident_id = -1

    def __init__(self):
        super(QMainWindow, self).__init__()
        uic.loadUi('Incident.ui', self)

        self.enter_transaction.clicked.connect(self.on_enter_transaction_click)
        self.show_people.clicked.connect(self.on_show_people_click)

    def refresh_window(self):
        self.setWindowTitle(f'Инцидент# {self.incident_id}')
        self.fill_widgets()

    def fill_widgets(self):
        instruction = f"SELECT * FROM dbo.Feedback WHERE Инцидент#={self.incident_id}"
        conn, cursor = connect_db()
        cursor.execute(instruction)
        data = cursor.fetchall()[0]
        disconnect_db(conn)

        for index in range(31):
            widget = self.lineedits.itemAt(index).widget()
            widget.setText(str(data[index]))
            widget.setReadOnly(True)

        self.description_pt.setPlainText(data[31])
        self.description_pt.setReadOnly(True)

        if data[32]:
            self.explanation_pt.setPlainText(data[32])
        elif data[33]:
            self.explanation_pt.setPlainText(data[33])
        else:
            self.explanation_pt.setPlainText('Инциндент случился в результате непредсказуемого события, ' +
                                             'персонал повлиять не мог')
        self.explanation_pt.setReadOnly(True)
        self.refresh_sum_lbl()

    def refresh_sum_lbl(self):
        conn, cursor = connect_db()
        cursor.execute(f"(SELECT SUM(Возмещение_ущерба) FROM Потерпевший_пассажир WHERE Инцидент#={self.incident_id})")
        summ = cursor.fetchone()[0]
        if summ is not None:
            cursor.execute(
                f"(SELECT SUM(Возмещение_ущерба) FROM Потерпевший_член_экипажа WHERE Инцидент#={self.incident_id})")
            summ += cursor.fetchone()[0]
            self.sum_lbl.setText(str(summ))
        else:
            self.sum_lbl.setText('0')
        disconnect_db(conn)

    def on_enter_transaction_click(self):
        self.uc_window = UpdateCompensationWindow(self.incident_id, self)
        self.uc_window.show()

    def on_show_people_click(self):
        self.sp_window = PassengersCrewWindow(self.incident_id)


class UpdateCompensationWindow(QWidget):
    def __init__(self, incident_id, fb_window):
        super(QWidget, self).__init__()
        uic.loadUi('Update_compensation.ui', self)
        self.setWindowTitle('Внесение компенсации')

        self.incident_id = incident_id
        self.fb_window = fb_window

        self.enter_button.clicked.connect(self.on_enter_click)

    def on_enter_click(self):
        summ = self.sum_le.text().strip()
        self.sum_le.clear()

        flag = True
        x = None

        try:
            x = float(summ)
        except ValueError:
            flag = False

        if flag:
            if x > 0:
                instruction = f"EXEC UpdateCompensations {self.incident_id}, {summ}"
                conn, cursor = connect_db()
                cursor.execute(instruction)
                disconnect_db(conn)
                self.fb_window.refresh_sum_lbl()
                self.close()
            else:
                QMessageBox.critical(self, "Ошибка",
                                     "Сумма выплаты может быть только положительным числом. Введите число большее 0.",
                                     QMessageBox.Ok)
        else:
            QMessageBox.critical(self, "Ошибка", "Сумма выплаты может быть только числом. Введите число.",
                                 QMessageBox.Ok)


class PassengersCrewWindow(QWidget):
    def __init__(self, incident_id):
        super(QWidget, self).__init__()
        uic.loadUi('Crew_and_Passengers.ui', self)
        self.setWindowTitle('Пассажиры и Экипаж')

        self.incident_id = incident_id

        self.fill_people(0)
        self.fill_people(1)

        self.show()

    def fill_people(self, mode):
        conn, cursor = connect_db()
        instruction = f"EXEC dbo.FindCrewAndPassengers {self.incident_id}, {mode}"
        cursor.execute(instruction)
        for i in cursor.fetchall():
            if mode == 0:
                string = f"{i[0]} {i[1]} {i[2] if i[2] != '-' else ''} ({i[3]}) {(40 - len(i[0] + i[1] + i[2] + i[3])) * ' '} - Дата рождения: {i[4]},\tТелефон: {i[5]},\tКласс: {i[6].strip()},\tМесто: {i[7]},\tГражданство: {i[8]},\tСтатус:  {i[9]},\tНевозмещённый ущерб: {i[10]}"
                self.passengers_list.addItem(string)
            else:
                string = f"{i[0]} {i[1]} {i[2] if i[2] != '-' else ''} ({i[3]}) {(40 - len(i[0] + i[1] + i[2] + i[3])) * ' '} - Дата рождения: {i[4]},\tГражданство: {i[5]},\tДолжность: {i[6]},\tСтатус:  {i[7]},\tНевозмещённый ущерб: {i[8]}"
                self.crew_list.addItem(string)
        disconnect_db(conn)

    def fill_passengers(self):
        conn, cursor = connect_db()
        instruction = f"EXEC dbo.FindCrewAndPassengers {self.incident_id}, 0"
        cursor.execute(instruction)
        strings = []
        for i in cursor.fetchall():
            string = f"{i[0]} {i[1]} {i[2] if i[2] != '-' else ''} ({i[3]}) - Дата рождения: {i[4]}, Телефон: {i[5]}, Класс: {i[6].strip()}, Место: {i[7]}, Гражданство: {i[8]}, Статус:  {i[9]}, Невозмещённый ущерб: {i[10]}"
            strings.append(string)
        self.passengers_list.addItems(strings)
        disconnect_db(conn)

    def fill_crew(self):
        conn, cursor = connect_db()
        instruction = f"EXEC dbo.FindCrewAndPassengers {self.incident_id}, 1"
        cursor.execute(instruction)
        strings = []
        for i in cursor.fetchall():
            string = f"{i[0]} {i[1]} {i[2] if i[2] != '-' else ''} ({i[3]}) - Дата рождения: {i[4]}, Гражданство: {i[5]}, Должность: {i[6]}, Статус:  {i[7]}, Невозмещённый ущерб: {i[8]}"
            strings.append(string)
        self.crew_list.addItems(strings)
        disconnect_db(conn)


class IncidentAdditionWindow(QWidget):
    def __init__(self):
        super(QWidget, self).__init__()
        uic.loadUi('Incident_addition.ui', self)
        self.setWindowTitle('Добавление инцидента')

        self.flight_parts = {'Взлёт': 1,
                             'Полёт': 2,
                             'Посадка': 3}

        self.flight_part.addItem('Взлёт')
        self.flight_part.addItem('Полёт')
        self.flight_part.addItem('Посадка')

        self.types_of_mistakes = {'Ошибка экипажа': 0,
                                  'Ошибка техника': 1,
                                  'Неисправность борта': 2}

        self.type_of_mistake.addItem('Ошибка экипажа')
        self.type_of_mistake.addItem('Ошибка техника')
        self.type_of_mistake.addItem('Неисправность борта')

        self.flight.currentTextChanged.connect(self.on_flight_change)
        self.airline.currentTextChanged.connect(self.on_airline_change)
        self.technician.currentTextChanged.connect(self.on_technician_change)
        self.board.currentTextChanged.connect(self.on_board_change)

        conn, cursor = connect_db()

        cursor.execute("SELECT * FROM Модель")
        self.models = dict(map(lambda x: (x[1].strip(), x[0]), cursor.fetchall()))

        cursor.execute("SELECT * FROM Страна")
        self.countries = dict(map(lambda x: (x[1].strip(), x[0]), cursor.fetchall()))

        cursor.execute("SELECT Аэропорт#, CONCAT(ИКАО_код, ' ', Город) FROM Аэропорт ORDER BY ИКАО_код")
        self.airports = dict(map(lambda x: (x[1].strip(), x[0]), cursor.fetchall()))

        cursor.execute("SELECT Авиакомпания#, Наименование FROM Авиакомпания")
        self.aircompanies = dict(map(lambda x: (x[1].strip(), x[0]), cursor.fetchall()))

        cursor.execute("SELECT Перелёт#, CONCAT(ИАТА_код, ' ', Цифровой_код, ' - ', A.ИКАО_код, ' - ', B.ИКАО_код, " +
                       "' - ', Дата, ' ', Время) " +
                       "FROM Перелёт " +
                       "INNER JOIN Рейс " +
                       "ON Перелёт.Рейс#=Рейс.Рейс# " +
                       "INNER JOIN Авиакомпания " +
                       "ON Авиакомпания.Авиакомпания#=Рейс.Авиакомпания# " +
                       "INNER JOIN Аэропорт AS A " +
                       "ON A.Аэропорт#=Аэропорт_отправления# " +
                       "INNER JOIN Аэропорт AS B " +
                       "ON B.Аэропорт#=Аэропорт_назначения#")
        self.flights = dict(map(lambda x: (x[1].strip(), x[0]), cursor.fetchall()))
        self.flight.addItem('Не выбрано')
        self.flight.addItems(self.flights.keys())

        cursor.execute("SELECT Рейс#, CONCAT(ИАТА_код, ' ', Цифровой_код, ' - ', A.ИКАО_код, ' - ', B.ИКАО_код) " +
                       "FROM Рейс " +
                       "INNER JOIN Авиакомпания " +
                       "ON Авиакомпания.Авиакомпания#=Рейс.Авиакомпания# " +
                       "INNER JOIN Аэропорт AS A " +
                       "ON A.Аэропорт#=Аэропорт_отправления# " +
                       "INNER JOIN Аэропорт AS B " +
                       "ON B.Аэропорт#=Аэропорт_назначения#")
        self.airlines = dict(map(lambda x: (x[1].strip(), x[0]), cursor.fetchall()))
        self.airline.addItem('Не выбрано')
        self.airline.addItems(self.airlines.keys())

        cursor.execute("SELECT Техник# , CONCAT(Фамилия, ' ', Имя, ' ', Отчество, '(', Серия_и_номер_паспорта, ')') " +
                       "FROM Наземный_техник")
        self.technicians = dict(map(lambda x: (x[1].strip(), x[0]), cursor.fetchall()))
        self.technician.addItem('Не выбрано')
        self.technician.addItems(self.technicians.keys())

        cursor.execute("SELECT Борт#, Бортовой_номер FROM Борт")
        self.boards = dict(map(lambda x: (x[1].strip(), x[0]), cursor.fetchall()))
        self.board.addItem('Не выбрано')
        self.board.addItems(self.boards.keys())

        disconnect_db(conn)

        self.model.addItems(self.models.keys())
        self.country.addItems(self.countries.keys())
        self.out_airport.addItems(self.airports.keys())
        self.to_airport.addItems(self.airports.keys())
        self.aircompany.addItems(self.aircompanies)

        self.ok_button.clicked.connect(self.on_ok_click)
        self.cancel_button.clicked.connect(self.on_cancel_click)

    def on_ok_click(self):
        self.allow_insertion = 1

        i_time, latitude, longitude, flight_part, injured_on_ground = self.incident_addition()
        i_time = map(int, i_time.split(':'))
        i_time = dt.time(*i_time)

        reason, description, type_of_mistake, explanation = self.reason_addition()

        flight = self.flight.currentText()
        if flight != 'Не выбрано':
            flight = self.flights[flight]
        else:
            flightdate, flighttime = self.flight_addition()
            flighttime = map(int, flighttime.split(':'))
            flighttime = dt.time(*flighttime)

            airline = self.airline.currentText()
            if airline == 'Не выбрано':
                out_airport, to_airport, digital_code, aircompany = self.airline_addition()
            else:
                airline = self.airlines[airline]

            technician = self.technician.currentText()
            if technician == 'Не выбрано':
                passport_number, second_name, first_name, patronymic, birthdate = self.technician_addition()
            else:
                technician = self.technicians[technician]

            board = self.board.currentText()
            if board == 'Не выбрано':
                board_number, model, date_commission, country = self.board_addition()
            else:
                board = self.boards[board]

        if self.allow_insertion:
            conn, cursor = connect_db()
            print(0)
            try:
                if flight != 'Не выбрано':
                    cursor.execute(f"INSERT INTO Причина_инцидента VALUES ('{reason}', '{description}')")
                    reason_id = cursor.execute(f"SELECT TOP(1) Причина# FROM Причина_инцидента ORDER BY Причина# DESC").fetchone()[0]
                    print(f"{reason_id=}")

                    if type_of_mistake == 0:
                        cursor.execute(f"INSERT INTO Ошибка_экипажа VALUES ({reason_id}, '{explanation}')")
                        print(6.1)
                    elif type_of_mistake == 1:
                        cursor.execute(f"INSERT INTO Ошибка_техника VALUES ({reason_id}, '{explanation}')")
                        print(6.2)
                    else:
                        cursor.execute(f"INSERT INTO Неисправность_борта VALUES ({reason_id})")
                        print(6.3)
                    cursor.execute(
                        f"INSERT INTO Инцидент (Время, Широта, Долгота, Этап_полёта#, Число_пострадавших_на_земле, " +
                        f"Перелёт#, Причина#) VALUES ('{i_time}', {latitude}, {longitude}, {flight_part}, " +
                        f"{injured_on_ground}, {flight}, {reason_id})")

                else:
                    if board == 'Не выбрано':
                        cursor.execute(f"INSERT INTO Борт VALUES ('{board_number}', {model}, '{date_commission}', {country})")
                        board = cursor.execute(f"SELECT TOP(1) Борт# FROM Борт ORDER BY Борт# DESC").fetchone()[0]
                        print(f"{board=}")

                    if technician == 'Не выбрано':
                        cursor.execute(f"INSERT INTO Наземный_техник VALUES ('{passport_number}', '{second_name}', '{first_name}', '{patronymic}', '{birthdate}', {out_airport})")
                        technician = cursor.execute(f"SELECT TOP(1) Техник# FROM Наземный_техник ORDER BY Техник# DESC").fetchone()[0]
                        print(f"{technician=}")

                    if airline == 'Не выбрано':
                        cursor.execute(f"INSERT INTO Рейс VALUES ('{digital_code}', {out_airport}, {to_airport}, {aircompany})")
                        airline = cursor.execute(f"SELECT TOP(1) Рейс# FROM Рейс ORDER BY Рейс# DESC").fetchone()[0]
                        print(f"{airline=}")

                    cursor.execute(f"INSERT INTO Перелёт VALUES ({airline}, {technician}, {board}, '{flightdate}', '{flighttime}')")
                    flight = cursor.execute(f"SELECT TOP(1) Перелёт# FROM Перелёт ORDER BY Перелёт# DESC").fetchone()[0]
                    print(f"{flight=}")

                    print(description, reason)
                    print(f"INSERT INTO Причина_инцидента VALUES ('{reason}', '{description}')")

                    cursor.execute(f"INSERT INTO Причина_инцидента VALUES ('{reason}', '{description}')")
                    print(1)
                    reason_id = cursor.execute(f"SELECT TOP(1) Причина# FROM Причина_инцидента ORDER BY Причина# DESC").fetchone()[0]
                    print(f"{reason_id=}")

                    if type_of_mistake == 0:
                        cursor.execute(f"INSERT INTO Ошибка_экипажа VALUES ({reason_id}, '{explanation}')")
                        print(6.1)
                    elif type_of_mistake == 1:
                        cursor.execute(f"INSERT INTO Ошибка_техника VALUES ({reason_id}, '{explanation}')")
                        print(6.2)
                    else:
                        cursor.execute(f"INSERT INTO Неисправность_борта VALUES ({reason_id})")
                        print(6.3)

                    cursor.execute(f"INSERT INTO Инцидент (Время, Широта, Долгота, Этап_полёта#, Число_пострадавших_на_земле, Перелёт#, Причина#) " +
                                   f"VALUES ('{i_time}', {latitude}, {longitude}, {flight_part}, {injured_on_ground}, {flight}, {reason_id})")
                    print(7)
            except pyodbc.DatabaseError:
                print('went wrong')
                conn.rollback()
            disconnect_db(conn)

    def on_cancel_click(self):
        self.close()

    def check_date(self, date, widget):
        try:
            dt.date(*map(int, date.split('-')))
        except (ValueError, TypeError):
            QMessageBox.critical(self, "Формат даты некорректен", "Введите дату в формате ГГГГ-ММ-ДД", QMessageBox.Ok)
            widget.clear()
            self.allow_insertion = 0

    def check_time(self, time, widget):
        try:
            dt.time(*map(int, time.split(':')))
        except (ValueError, TypeError):
            QMessageBox.critical(self, "Формат времени некорректен", "Введите время в формате ЧЧ-ММ-СС", QMessageBox.Ok)
            widget.clear()
            self.allow_insertion = 0

    def board_addition(self):
        board_number = self.board_number.text().strip()
        if (5 > len(board_number)) or (len(board_number) > 8):
            QMessageBox.critical(self, "Бортовой номер некорректен", "Введите значение длины от 5 до 7 символов",
                                 QMessageBox.Ok)
            self.board_number.clear()
            self.allow_insertion = 0
        if not board_number[:2].isalpha() or not board_number[2:].isdigit():
            QMessageBox.critical(self, "Бортовой номер некорректен", "Введите значение из 2 символов и 3-5 цифр",
                                 QMessageBox.Ok)
            self.board_number.clear()
            self.allow_insertion = 0
        board_number = board_number[:2].upper() + board_number[2:]

        model = self.models[self.model.currentText()]

        date_commission = self.date_comission.text().strip()
        self.check_date(date_commission, self.date_comission)

        country = self.countries[self.country.currentText()]

        return board_number, model, date_commission, country

    def technician_addition(self):
        passport_number = self.passport_number.text().strip()
        if len(passport_number) > 10 or len(passport_number) == 0:
            QMessageBox.critical(self, "Номер паспорта некорректен",
                                 "Введите значение длинной до 10 символов включительно",
                                 QMessageBox.Ok)
            self.passport_number.clear()
            self.allow_insertion = 0

        second_name = self.second_name.text().strip()
        if len(second_name) > 24 or len(second_name) == 0 or not second_name.isalpha():
            QMessageBox.critical(self, "Фамилия некорректна",
                                 "Введите значение из букв длинной до 24 символов включительно",
                                 QMessageBox.Ok)
            self.second_name.clear()
            self.allow_insertion = 0

        first_name = self.first_name.text().strip()
        if len(first_name) > 24 or len(first_name) == 0 or not first_name.isalpha():
            QMessageBox.critical(self, "Имя некорректно",
                                 "Введите значение из букв длинной до 24 символов включительно",
                                 QMessageBox.Ok)
            self.first_name.clear()
            self.allow_insertion = 0

        patronymic = self.patronymic.text().strip()
        if len(patronymic) > 24 or len(patronymic) == 0 or not patronymic.isalpha() and patronymic != '-':
            QMessageBox.critical(self, "Имя некорректно",
                                 "Введите значение из букв длинной до 24 символов включительно",
                                 QMessageBox.Ok)
            self.patronymic.clear()
            self.allow_insertion = 0

        birthdate = self.birthdate.text().strip()
        self.check_date(birthdate, self.birthdate)

        return passport_number, second_name, first_name, patronymic, birthdate

    def airline_addition(self):
        out_airport = self.airports[self.out_airport.currentText()]
        to_airport = self.airports[self.to_airport.currentText()]
        digital_code = self.digital_code.text().strip()
        if len(digital_code) > 6 or not digital_code.isdigit():
            QMessageBox.critical(self, "Код рейса некорректен",
                                 "Введите значение длины от 1 до 6 символов включительно",
                                 QMessageBox.Ok)
            self.digital_code.clear()
            self.allow_insertion = 0

        aircompany = self.aircompanies[self.aircompany.currentText()]

        return out_airport, to_airport, digital_code, aircompany

    def incident_addition(self):
        time = self.time.text().strip()
        self.check_time(time, self.time)

        latitude = self.latitude.text().strip()
        try:
            float(latitude)
            if float(latitude) < -90 or float(latitude) > 90:
                raise ValueError
        except ValueError:
            QMessageBox.critical(self, "Широта некорректна", "Введите значение от -90 до 90", QMessageBox.Ok)
            self.latitude.clear()
            self.allow_insertion = 0

        longitude = self.longitude.text().strip()
        try:
            float(longitude)
            if float(longitude) < -180 or float(longitude) > 180:
                raise ValueError
        except ValueError:
            QMessageBox.critical(self, "Долгота некорректна", "Введите значение от -180 до 180", QMessageBox.Ok)
            self.longitude.clear()
            self.allow_insertion = 0

        flight_part = self.flight_parts[self.flight_part.currentText()]

        injured_on_ground = self.injured_on_ground.text().strip()
        try:
            int(float(injured_on_ground))
            if int(injured_on_ground) < 0 or float(injured_on_ground) > int(float(injured_on_ground)):
                raise ValueError
        except ValueError:
            QMessageBox.critical(self, "Количество пострадавших на земле некорректно",
                                 "Введите положительное целочисленное значение",
                                 QMessageBox.Ok)
            self.injured_on_ground.clear()
            self.allow_insertion = 0

        return time, latitude, longitude, flight_part, injured_on_ground

    def flight_addition(self):
        flightdate = self.flightdate.text().strip()
        self.check_date(flightdate, self.flightdate)
        # time = self.time.text().strip()
        # self.check_time(time, self.time)
        print(self.flighttime)
        flighttime = self.flighttime.text().strip()
        self.check_time(flighttime, self.flighttime)

        return flightdate, flighttime

    def reason_addition(self):
        reason = self.reason.text().strip()
        if len(reason) == 0:
            QMessageBox.critical(self, "Заполните название причины инцидента", "Введите краткое описание инцидента",
                                 QMessageBox.Ok)
            self.reason.clear()
            self.allow_insertion = 0

        description = self.description.toPlainText()
        if len(description) == 0:
            QMessageBox.critical(self, "Заполните описание причины инцидента", "Введите полное описание инцидента",
                                 QMessageBox.Ok)
            self.description.clear()
            self.allow_insertion = 0

        type_of_mistake = self.types_of_mistakes[self.type_of_mistake.currentText()]

        explanation = self.explanation.toPlainText()
        if len(explanation) == 0:
            QMessageBox.critical(self, "Заполните объяснительную виновного лица", "Если его нет, поставьте в поле '-'",
                                 QMessageBox.Ok)
            self.explanation.clear()
            self.allow_insertion = 0

        return reason, description, type_of_mistake, explanation

    def on_flight_change(self):
        if self.flight.currentText() != 'Не выбрано':
            self.flightdate.setReadOnly(True)
            self.flighttime.setReadOnly(True)
            self.digital_code.setReadOnly(True)
            self.passport_number.setReadOnly(True)
            self.second_name.setReadOnly(True)
            self.first_name.setReadOnly(True)
            self.patronymic.setReadOnly(True)
            self.birthdate.setReadOnly(True)
            self.digital_code.setReadOnly(True)
            self.board_number.setReadOnly(True)
            self.date_comission.setReadOnly(True)
            self.board.setDisabled(True)
            self.country.setDisabled(True)
            self.airline.setDisabled(True)
            self.technician.setDisabled(True)
            self.out_airport.setDisabled(True)
            self.to_airport.setDisabled(True)
            self.aircompany.setDisabled(True)
            self.model.setDisabled(True)
        else:
            self.flightdate.setReadOnly(False)
            self.flighttime.setReadOnly(False)
            self.digital_code.setReadOnly(False)
            self.passport_number.setReadOnly(False)
            self.second_name.setReadOnly(False)
            self.first_name.setReadOnly(False)
            self.patronymic.setReadOnly(False)
            self.birthdate.setReadOnly(False)
            self.digital_code.setReadOnly(False)
            self.board_number.setReadOnly(False)
            self.date_comission.setReadOnly(False)
            self.board.setDisabled(False)
            self.country.setDisabled(False)
            self.airline.setDisabled(False)
            self.technician.setDisabled(False)
            self.out_airport.setDisabled(False)
            self.to_airport.setDisabled(False)
            self.aircompany.setDisabled(False)
            self.model.setDisabled(False)

    def on_airline_change(self):
        if self.airline.currentText() != 'Не выбрано':
            self.digital_code.setReadOnly(True)
            self.out_airport.setDisabled(True)
            self.to_airport.setDisabled(True)
            self.aircompany.setDisabled(True)
        else:
            self.digital_code.setReadOnly(False)
            self.out_airport.setDisabled(False)
            self.to_airport.setDisabled(False)
            self.aircompany.setDisabled(False)

    def on_technician_change(self):
        if self.technician.currentText() != 'Не выбрано':
            self.passport_number.setReadOnly(True)
            self.second_name.setReadOnly(True)
            self.first_name.setReadOnly(True)
            self.patronymic.setReadOnly(True)
            self.birthdate.setReadOnly(True)
        else:
            self.passport_number.setReadOnly(False)
            self.second_name.setReadOnly(False)
            self.first_name.setReadOnly(False)
            self.patronymic.setReadOnly(False)
            self.birthdate.setReadOnly(False)

    def on_board_change(self):
        if self.board.currentText() != 'Не выбрано':
            self.board_number.setReadOnly(True)
            self.date_comission.setReadOnly(True)
            self.country.setDisabled(True)
            self.model.setDisabled(True)
        else:
            self.board_number.setReadOnly(False)
            self.date_comission.setReadOnly(False)
            self.country.setDisabled(False)
            self.model.setDisabled(False)


class PersonWindow(QWidget):
    def __init__(self):
        super(QWidget, self).__init__()
        uic.loadUi('Person_addition.ui', self)
        self.setWindowTitle('Манипуляции с персонами')

        self.allow_insertion = 0

        self.roles = {'Пассажир': 1, 'Член экипажа': 2}
        self.role.addItems(self.roles.keys())

        self.place_classes = ('Эконом', 'Бизнес', 'Первый')
        self.place_class.addItems(self.place_classes)

        self.statuses = {'Не пострадал': 0, 'Понёс травмы': 1, 'Погиб': 2}
        self.status.addItems(self.statuses.keys())

        conn, cursor = connect_db()

        cursor.execute("SELECT *, CONCAT(Фамилия, ' ', Имя, ' ', Отчество, ' ', '(', Серия_и_номер_паспорта, ')') " +
                       "FROM Пассажир INNER JOIN Потерпевший_пассажир " +
                       "ON Пассажир.Пассажир#=Потерпевший_пассажир.Пассажир#")
        self.persons = dict(map(lambda x: (x[-1].strip(), (x[:-1])), cursor.fetchall()))

        cursor.execute("SELECT *, CONCAT(Наименование, ' - ', Фамилия, ' ', Имя, ' ', Отчество, ' (', " +
                       "Серия_и_номер_паспорта, ')') FROM Член_экипажа " +
                       "INNER JOIN Потерпевший_член_экипажа " +
                       "ON Член_экипажа.Член_экипажа#=Потерпевший_член_экипажа.Член_экипажа# " +
                       "INNER JOIN Должность ON Должность.Должность#=Член_экипажа.Должность#")
        # print(dict(map(lambda x: (x[-1].strip(), (*x[:6], *x[7:])), cursor.fetchall())).values())
        self.persons.update(dict(map(lambda x: (x[-1].strip(), (*x[:6], *x[7:])), cursor.fetchall())))

        cursor.execute("SELECT * FROM Страна")
        self.countries = dict(map(lambda x: (x[1].strip(), x[0]), cursor.fetchall()))

        cursor.execute("SELECT * FROM Должность")
        self.positions = dict(map(lambda x: (x[1].strip(), x[0]), cursor.fetchall()))

        cursor.execute("SELECT Инцидент# FROM Инцидент")
        self.incident.addItems([str(x[0]) for x in cursor.fetchall()])

        disconnect_db(conn)

        self.person.addItem("Не выбрано")
        self.person.addItems(self.persons.keys())
        self.country.addItems(self.countries.keys())
        self.position.addItems(self.positions.keys())

        self.position.setDisabled(True)

        self.ok_button.clicked.connect(self.on_ok_click)
        self.person.currentTextChanged.connect(self.on_person_change)
        self.role.currentTextChanged.connect(self.on_role_change)

    def on_ok_click(self):
        passport_number, second_name, first_name, patronymic, birthdate, phone_number, payment = self.person_addition()
        country = self.countries[self.country.currentText()]
        incident = self.incident.currentText()
        status = self.status.currentText()

        if self.allow_insertion:
            conn, cursor = connect_db()
            try:
                if self.person.currentText() == 'Не выбрано':
                    if self.role.currentText() == 'Пассажир':
                        instruction = "INSERT INTO Пассажир (Серия_и_номер_паспорта, Фамилия, Имя, Отчество, " \
                                      f"Дата_рождения, Страна#, Номер_телефона) VALUES ('{passport_number}', " \
                                      f"'{second_name}', '{first_name}', '{patronymic}', '{birthdate}', " \
                                      f"{country}, '{phone_number}')"
                        print(instruction)
                        cursor.execute(instruction)
                        cursor.execute("SELECT TOP(1) Пассажир# FROM Пассажир ORDER BY Пассажир# DESC")
                        person = cursor.fetchone()[0]
                        print(person)
                        instruction_2 = f"INSERT INTO Потерпевший_пассажир VALUES ({incident}, {person}, '{status}', {payment})"
                        cursor.execute(instruction_2)
                        print(instruction_2)
                        cursor.execute(f"SELECT Перелёт.Перелёт# FROM Перелёт INNER JOIN Инцидент " +
                                       f"ON Инцидент.Перелёт#=Перелёт.Перелёт# WHERE Инцидент#={incident}")
                        print()
                        flight = cursor.fetchall()[0][0]
                        print(flight)
                        place_class = self.place_class.currentText()
                        print(place_class)
                        place = self.place.text()
                        print(place)
                        int(place)
                        print(place)
                        cursor.execute(f"INSERT INTO Билет VALUES ({person}, {flight}, '{place_class}', {place})")
                    else:
                        position = self.positions[self.position.currentText()]
                        instruction = "INSERT INTO Член_экипажа (Серия_и_номер_паспорта, Фамилия, Имя, Отчество, " \
                                      f"Дата_рождения, Должность#, Страна#, Номер_телефона) VALUES ('{passport_number}', " \
                                      f"'{second_name}', '{first_name}', '{patronymic}', '{birthdate}', " \
                                      f"{position}, {country}, '{phone_number}')"
                        cursor.execute(instruction)
                        print(instruction)
                        cursor.execute("SELECT TOP(1) Член_экипажа# FROM Член_экипажа ORDER BY Член_экипажа# DESC")
                        person = cursor.fetchone()[0]
                        print(person)
                        instruction_2 = f"INSERT INTO Потерпевший_член_экипажа VALUES ({incident}, {person}, '{status}', {payment})"
                        cursor.execute(instruction_2)
                        print(instruction_2)
                        cursor.execute(f"SELECT Дата, Перелёт.Время FROM Перелёт INNER JOIN Инцидент " +
                                       f"ON Инцидент.Перелёт#=Перелёт.Перелёт# WHERE Инцидент#={incident}")
                        data = cursor.fetchall()
                        flight_date, flight_time = data[0][0], data[0][1]
                        print(flight_date, flight_time)
                        cursor.execute(f"SELECT Борт# FROM Перелёт INNER JOIN Инцидент " +
                                       f"ON Инцидент.Перелёт#=Перелёт.Перелёт# WHERE Инцидент#={incident}")
                        board = cursor.fetchall()[0][0]
                        print(board)
                        cursor.execute(f"INSERT INTO Экипаж VALUES ({person}, {board}, '{flight_date}', '{flight_time}')")
                else:
                    person = self.persons[self.person.currentText()][0]
                    if self.role.currentText() == 'Пассажир':
                        print(f"l{person}l")
                        instruction = f"UPDATE Пассажир SET Серия_и_номер_паспорта='{passport_number}', " \
                                      f"Фамилия='{second_name}', Имя='{first_name}', Отчество='{patronymic}', " \
                                      f"Дата_рождения='{birthdate}', Страна#={country}, " \
                                      f"Номер_телефона='{phone_number}' WHERE Пассажир#={person}"
                        cursor.execute(instruction)
                        print(instruction)
                    else:
                        print(person)
                        position = self.positions[self.position.currentText()]
                        instruction = f"UPDATE Член_экипажа SET Серия_и_номер_паспорта='{passport_number}', " \
                                      f"Фамилия='{second_name}', Имя='{first_name}', Отчество='{patronymic}', " \
                                      f"Дата_рождения='{birthdate}', Должность#={position}, Страна#={country}, " \
                                      f"Номер_телефона='{phone_number}' WHERE Член_экипажа#={person}"
                        cursor.execute(instruction)
                        print(instruction)
            except (pyodbc.DatabaseError, ValueError):
                QMessageBox.critical(self, "Транзакция не прошла.",
                                     "Проверьте поля.",
                                     QMessageBox.Ok)
                conn.rollback()
                print('went wrong')
            disconnect_db(conn)

    def person_addition(self):
        self.allow_insertion = 1
        passport_number = self.passport_number.text().strip()
        if len(passport_number) > 10 or len(passport_number) == 0:
            QMessageBox.critical(self, "Номер паспорта некорректен",
                                 "Введите значение длинной до 10 символов включительно",
                                 QMessageBox.Ok)
            self.passport_number.clear()
            self.allow_insertion = 0

        second_name = self.second_name.text().strip()
        self.check_letter_string(second_name, self.second_name, 'Фамилия')

        first_name = self.first_name.text().strip()
        self.check_letter_string(first_name, self.first_name, 'Имя')

        patronymic = self.patronymic.text().strip()
        self.check_letter_string(patronymic, self.patronymic, 'Отчество')

        birthdate = self.birthdate.text().strip()
        self.check_date(birthdate, self.birthdate)

        phone_number = self.phone_number.text().strip()
        if len(phone_number) > 18 or len(phone_number) == 0 or not phone_number[1:].isdigit() or (phone_number[0] != '+' and  not phone_number[0].isdigit()):
            QMessageBox.critical(self, "Номер телефона некорректен",
                                 "Введите значение длинной до 18 цифр включительно",
                                 QMessageBox.Ok)
            self.phone_number.clear()
            self.allow_insertion = 0

        payment = self.payment.text().strip()
        try:
            float(payment)
            if float(payment) < 0:
                raise ValueError
        except ValueError:
            self.allow_insertion = 0
            QMessageBox.critical(self, "Сумма к возмещению некорректна",
                                 "Введите положительное числовое значение",
                                 QMessageBox.Ok)
            self.payment.clear()

        return passport_number, second_name, first_name, patronymic, birthdate, phone_number, payment

    def check_letter_string(self, string, widget, filler):
        if len(string) > 25 or len(string) == 0 or not string.isalpha() and string != '-' and filler == 'Отчество':
            QMessageBox.critical(self, f"Поле {filler} некорректно",
                                 "Введите значение из букв длинной до 25 символов включительно",
                                 QMessageBox.Ok)
            widget.clear()
            self.allow_insertion = 0

    def check_date(self, date, widget):
        try:
            dt.date(*map(int, date.split('-')))
        except (ValueError, TypeError):
            QMessageBox.critical(self, "Формат даты некорректен", "Введите дату в формате ГГГГ-ММ-ДД", QMessageBox.Ok)
            widget.clear()
            self.allow_insertion = 0

    def on_person_change(self):
        if self.person.currentText() == 'Не выбрано':
            self.role.setDisabled(False)
            self.incident.setDisabled(False)
            self.status.setDisabled(False)
            self.position.setDisabled(False)
            self.place_class.setDisabled(False)
            self.passport_number.setText('')
            self.second_name.setText('')
            self.first_name.setText('')
            self.patronymic.setText('')
            self.birthdate.setText('')
            self.phone_number.setText('')
            self.payment.setText('0')
            self.country.setCurrentIndex(0)
            self.position.setCurrentIndex(0)
        else:
            self.role.setDisabled(True)
            self.incident.setDisabled(True)
            self.status.setDisabled(True)
            self.place_class.setDisabled(True)
            self.place.setReadOnly(True)
            data = self.persons[self.person.currentText()]
            # print(data)
            self.passport_number.setText(data[1])
            self.second_name.setText(data[2])
            self.first_name.setText(data[3])
            self.patronymic.setText(data[4])
            self.birthdate.setText(str(data[5]))
            self.country.setCurrentIndex(data[6] - 1)
            self.phone_number.setText(data[7])
            self.incident.setCurrentText(str(data[8]))
            self.status.setCurrentIndex(self.statuses[data[10]])
            self.payment.setText(str(data[11]))
            if len(data) > 13:
                self.position.setCurrentIndex(data[-3] - 1)
                self.role.setCurrentIndex(1)
            else:
                self.position.setDisabled(True)
                self.role.setCurrentIndex(0)

    def on_role_change(self):
        if self.role.currentText() == "Пассажир":
            self.position.setDisabled(True)
            self.place_class.setDisabled(False)
            self.place.setReadOnly(False)
        else:
            self.position.setDisabled(False)
            self.place_class.setDisabled(True)
            self.place.setReadOnly(True)
