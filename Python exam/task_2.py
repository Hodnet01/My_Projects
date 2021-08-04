FILE = 'telrecords.csv'
SENDER = 0
RECIPIENT = 1


def file_input(file_name):
    massive = {}
    calling_numbers = set()
    recipient_set = set()
    with open(file_name, 'r', encoding='utf-8') as f:
        f.readline()
        for line in f.readlines():
            splitted = line.split(';')
            # print(splitted)
            splitted[-1] = splitted[-1][:-1]
            recipient_set.add(splitted[RECIPIENT])
            key = splitted[SENDER]
            calling_numbers.add(key)
            if key not in massive.keys():
                massive[key] = []
                massive[key].append(splitted[RECIPIENT:])
            else:
                massive[key].append(splitted[RECIPIENT:])
            # print(splitted)
        # print(massive)
        # print(len(massive))
        # print(len(calling_numbers))
    return massive, calling_numbers, recipient_set


def call_statistics(in_data, sender):
    print(f'Count of outgoing calls: {len(in_data[sender])}')
    out_call_len = 0
    count = 0
    missed = 0
    blocked = 0
    for call in in_data[sender]:
        if call[2] not in ('-1', '-2'):
            out_call_len += int(call[2])
            count += 1
        elif call[2] == '-1':
            blocked += 1
        elif call[2] == '-2':
            missed += 1
    print(f'Average length of outgoing calls: {int((out_call_len / count) // 60)}:{int((out_call_len / count) % 60)}')
    print(f'Number of blocked calls: {blocked}')
    print(f'Number of missed calls: {missed}')


def call_history(in_data, sender, recipient):
    calls_from_sender = []
    calls_from_recipient = []
    for call in in_data[sender]:
        # print(call)
        if call[0] == recipient:
            calls_from_sender.append(call)
    for call in in_data[recipient]:
        if call[0] == sender:
            calls_from_recipient.append(call)
    calls_from_sender = sorted(calls_from_sender, key=lambda call: call[1], reverse=True)
    calls_from_recipient = sorted(calls_from_recipient, key=lambda call: call[1], reverse=True)
    # print(calls)
    print('Outgoin: ')
    print(*calls_from_sender, sep='\n')
    print('Incoming: ')
    print(*calls_from_recipient, sep='\n')
    file_name = sender + '-' + recipient
    data_write(calls_from_sender, calls_from_recipient, file_name)


def data_write(call_list_in, call_list_out, file):
    with open(f'{file}.txt', 'w', encoding='utf-8') as f:
        f.write("Outcoming calls:" + '\n')
        for line in call_list_in:
            call_dat = line[1:]
            in_line = file + ', ' + ', '.join(call_dat) + '\n'
            f.write(in_line)
        f.write("Incoming calls:" + '\n')
        for line in call_list_out:
            call_dat = line[1:]
            in_line = file + ', ' + ', '.join(call_dat) + '\n'
            f.write(in_line)


data, calling, recipients = file_input(FILE)
# print(calling)
# print(recipients)
request_sender = input('Enter the sender number: ').strip()
while request_sender:
    if request_sender is None:
        break
    elif request_sender not in calling:
        print('No such sender')
        request_sender = input('Enter the sender number: ')

    print('Choose one of given functions: ')
    print('1) Call statistics')
    print('2) Call history with other contact')
    print('3) Exit')
    request_menu = input('Enter 1, 2 or 3: ').strip()
    while request_menu not in ('1', '2', '3'):
        print('Wrong input')
        print('Choose one of given functions: ')
        print('1) Call statistics')
        print('2) Call history with other contact')
        print('3) Exit')
        request_menu = input('Enter 1, 2 or 3: ')
    if request_menu == '1':
        call_statistics(data, request_sender)
    elif request_menu == '2':
        request_recipient = input('Enter recipient number: ')
        while request_recipient not in recipients:
            print('No such recipient')
            request_recipient = input('Enter recipient number: ')
        call_history(data, request_sender, request_recipient)
    elif request_menu == '3':
        print('Turning off :)')
        break
    print()
    request_sender = input('Enter the sender number: ')