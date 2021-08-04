import codecs
from datetime import date
from glob import glob
import string

DATE = 0
H = 1
A = 2
H_G = 3
A_G = 4


def file_input(file, dictionary):
    d_full = []
    dictionary[str(len(dictionary) + 1)] = d_full
    com = f'{file[:-4]}: (enter {len(dictionary)})'
    status = file_check(file)
    if status == 'alright':
        with open(file, 'r', encoding='utf-8-sig') as f:
            f.readline()
            for f_line in f.readlines():
                d_part = f_line.split(',')
                d_full.append(d_part)
            if column_check(d_full) is False:
                com = 'Not enough columns'
                return d_full, dictionary, com
    elif status == 'bad format':
        com = 'Bad file format'
        dictionary[str(len(dictionary))] = 'failed'
    elif status == 'no such file in directory':
        dictionary[str(len(dictionary))] = 'failed'
        com = 'File not found!'
    return d_full, dictionary, com


def column_check(d_full):
    for elem in d_full:
        if len(elem) < 5:
            return False
        else:
            continue
    return True


def file_check(file):
    status3 = 'no such file in directory'
    direct = glob('*')
    file_format = file.split('.')
    if file_format[1] != 'csv':
        status2 = 'bad format'
        return status2
    for obj in direct:
        if obj.split('.')[0] == file_format[0] and file_format[1] == 'csv':
            status1 = 'alright'
            return status1
        else:
            continue
    return status3


def menu_level_1(req, in_data):
    league_teams = set()
    teams_dictionary = {}
    data_out = []
    if req == '1':
        for match in in_data:
            true_match = match[5:9]
            true_match.insert(0, match[3])
            league_teams.add(true_match[H])
            data_out.append(true_match)
    elif req == '2':
        for match in in_data:
            true_match = match[5:9]
            true_match.insert(0, match[3])
            league_teams.add(true_match[H])
            data_out.append(true_match)
    elif req == '3':
        for match in in_data:
            true_match = match[1:6]
            league_teams.add(true_match[H])
            data_out.append(true_match)
    for number, league_team in enumerate(sorted(list(league_teams))):
        teams_dictionary[str(number + 1)] = league_team
    return data_out, teams_dictionary


def show_all_matches_of_a_given_team(name, in_data):
    matches = []
    for m in in_data:
        if m[H] == name or m[A] == name:
            m.remove(name)
            matches.append(m)
        else:
            continue
    return matches


def show_matches_played_on_a_given_date(in_date, in_data):
    matches = []
    if len(in_date) < 5:
        comment = 'Wrong format. Not enough symbols'
        return comment, matches
    spl = in_date.split('/')
    if len(spl) < 3:
        comment = 'Wrong format. Not enough date parts'
        return comment, matches
    if spl[0].isdigit() is False or spl[1].isdigit() is False or spl[2].isdigit() is False:
        comment = 'Date must be positive integer number'
        return comment, matches
    try:
        requested_date = date(int(spl[2]), int(spl[1]), int(spl[0]))
    except ValueError:
        comment = 'Bad date format'
        return comment, matches
    date_1 = in_data[0][DATE].split('/')
    date_1 = date(int(date_1[2]), int(date_1[1]), int(date_1[0]))
    date_last = in_data[len(in_data) - 1][DATE].split('/')
    date_last = date(int(date_last[2]), int(date_last[1]), int(date_last[0]))
    if requested_date < date_1 or requested_date > date_last:
        comment = 'This date is out of this league time period'
        return comment, matches
    else:
        comment = 'Matches: '
        for d in in_data:
            match_date = d[DATE].split('/')
            if requested_date == date(int(match_date[2]), int(match_date[1]), int(match_date[0])):
                matches.append(d)
            else:
                continue
        if not matches:
            comment = 'There are no matches'
        return comment, matches


def match_results(in_data, req1):
    # dictionary indexes: 0 - points, 1 - wins, 2 - draws, 3 - losses, 4 - difference, 5 - goals, 6 - rivals side,
    # 7 - games, 8 - tie rating place (not final)

    # russian sorting rules (req1 in ('1', '2')): points(ind - 0), tie rating place(ind - 8),
    # wins(ind - 1), difference(ind - 4), goals(ind - 5), away goals(ind - 6)

    # german sorting rule (req1 == '3'): points(ind - 0), difference(ind - 4), goals(ind - 5),
    # tie rating place(ind - 8), away goals(ind - 6)
    r_d = {}
    fin = []
    for line in in_data:
        r_d[line[H]] = r_d.get(line[H], [0, 0, 0, 0, 0, 0, 0, 0, 0])
        r_d[line[A]] = r_d.get(line[A], [0, 0, 0, 0, 0, 0, 0, 0, 0])
        if int(line[H_G]) > int(line[A_G]):
            r_d[line[H]][1] += 1
            r_d[line[A]][3] += 1
            r_d[line[H]][0] += 3
        elif int(line[H_G]) == int(line[A_G]):
            r_d[line[H]][2] += 1
            r_d[line[H]][0] += 1
            r_d[line[A]][2] += 1
            r_d[line[A]][0] += 1
        elif int(line[H_G]) < int(line[A_G]):
            r_d[line[A]][1] += 1
            r_d[line[A]][0] += 3
            r_d[line[H]][3] += 1
        r_d[line[H]][4] += int(line[H_G]) - int(line[A_G])
        r_d[line[A]][4] += int(line[A_G]) - int(line[H_G])
        r_d[line[H]][5] += int(line[H_G])
        r_d[line[A]][5] += int(line[A_G])
        r_d[line[H]][7] += 1
        r_d[line[A]][7] += 1
        r_d[line[A]][6] += int(line[A_G])
    if req1 in ('1', '2'):
        r_t = sorted(r_d.items(), key=lambda results: results[1][0], reverse=True)
        r_d = ties_check(r_d, r_t, in_data, req1)
        fin = sorted(r_d.items(), key=lambda r: (r[1][0], -r[1][8], r[1][1], r[1][4],  r[1][5], r[1][6]), reverse=True)
    elif req1 == '3':
        r_t = sorted(r_d.items(), key=lambda results: (results[1][0], results[1][4]), reverse=True)
        r_d = ties_check(r_d, r_t, in_data, req1)
        fin = sorted(r_d.items(), key=lambda r: (r[1][0],  r[1][4], r[1][5], -r[1][8], r[1][6]), reverse=True)
    return fin


def ties_check(r_d, r_t, in_data, req1):
    # rus untie sorting: points(ind 0), wins(ind 1), difference(ind 2), goals(ind 3), goals away(ind 4)
    # de untie sorting: points(ind 0), difference(ind 2), goals away(ind 4)
    points_set = set()
    rate = 1
    for place in r_t:
        points_set.add(place[1][0])
    p_s = sorted(list(points_set), reverse=True)
    for points in p_s:
        teams = []
        for name in r_d.keys():
            if r_d[name][0] == points:
                teams.append(name)
            else:
                continue
        if len(teams) == 1:
            r_d[teams[0]][8] = rate
        elif len(teams) > 1:
            t_d = {}
            for name in teams:
                t_d[name] = t_d.get(name, [0, 0, 0, 0, 0])
                r_d[name][8] = rate
            for sub_line in in_data:
                if sub_line[H] in teams and sub_line[A] in teams:
                    if int(sub_line[H_G]) > int(sub_line[A_G]):
                        t_d[sub_line[H]][0] += 3
                        if req1 in ('1', '2'):
                            t_d[sub_line[A]][1] += 1
                    elif int(sub_line[H_G]) == int(sub_line[A_G]):
                        t_d[sub_line[H]][0] += 1
                        t_d[sub_line[A]][0] += 1
                    elif int(sub_line[H_G]) < int(sub_line[A_G]):
                        t_d[sub_line[A]][0] += 3
                        if req1 in ('1', '2'):
                            t_d[sub_line[H]][1] += 1
                    t_d[sub_line[H]][2] += int(sub_line[H_G]) - int(sub_line[A_G])
                    t_d[sub_line[A]][2] += int(sub_line[A_G]) - int(sub_line[H_G])
                    if req1 in ('1', '2'):
                        t_d[sub_line[H]][3] += int(sub_line[H_G])
                        t_d[sub_line[A]][3] += int(sub_line[A_G])
                    t_d[sub_line[A]][4] += int(sub_line[A_G])
            ties = list(t_d.items())
            if req1 in ('1', '2'):
                ties.sort(key=lambda x: (x[1][0], x[1][1], x[1][2], x[1][3], x[1][4]), reverse=True)
            elif req1 == '3':
                ties.sort(key=lambda x: (x[1][0], x[1][2], x[1][4]), reverse=True)
            for ind in range(len(ties) - 1):
                if ties[ind][1] != ties[ind + 1][1]:
                    r_d[ties[ind + 1][0]][8] += len(ties) - len(ties[ind + 1:])
                    rate += 1
                else:
                    continue
        rate += 1
    return r_d


def fancy_table(r_t, d_t):
    maxl = len(max(d_t.values(), key=len))
    fancy = []
    r_num = 1
    for elem in r_t:
        str_line = [str(x) for x in elem[1]]
        fin_line = str(r_num).ljust(7, ' ') + elem[0].ljust(maxl + 3, ' ') + str_line[7].ljust(6, ' ') \
            + str_line[1].ljust(5, ' ') + str_line[2].ljust(6, ' ') + str_line[3].ljust(7, ' ') + \
            str_line[4].ljust(11, ' ') + str_line[0].ljust(6, ' ')
        fancy.append(fin_line)
        if elem != r_t[-1] and elem[1] == r_t[r_t.index(elem) + 1][1]:
            r_num -= 1
        r_num += 1
    return fancy, maxl


def main():
    data_dict = {}
    data_rus_1, data_dict, fb_1 = file_input('Russian_premier_league_2012-2013.csv', data_dict)
    data_rus_2, data_dict, fb_2 = file_input('Russian_premier_league_2018-2019.csv', data_dict)
    data_de_2, data_dict, fb_3 = file_input('German_Bundesliga_2018-2019.csv', data_dict)
    print("Choose the tournament: ")
    print(fb_1)
    print(fb_2)
    print(fb_3)
    request_1 = input('Your request: ')
    while request_1 not in data_dict.keys() or data_dict[request_1] == 'failed':
        request_1 = input('Choose one of given options: ')
    dataset = data_dict[request_1]
    data, d_teams = menu_level_1(request_1, dataset)
    print()
    print('Choose the function: ')
    print('- Show all matches of a given team (enter 1)')
    print('- Show matches played on a given date (enter 2)')
    print('- Show the ranking table (enter 3)')
    request_2 = input('Enter your request: ')
    while request_2 not in ('1', '2', '3'):
        request_2 = input('Choose one of given functions: ')
    print()
    if request_2 == '1':
        print('Choose the team:')
        for num, team in d_teams.items():
            print(f"{num}) {team}")
        team = input('Enter team number: ')
        while team not in d_teams.keys():
            team = input('Choose one of given teams: ')
        requested_data = show_all_matches_of_a_given_team(d_teams[team], data)
        print(f'Matches of {d_teams[team]}:')
        for num, game in enumerate(requested_data):
            print(f'{num + 1}) Date: {game[0]}, rival: {game[1]}, score (home/away): {game[2]}/{game[3]}')
    elif request_2 == '2':
        print(f'Enter the date: (from {data[0][DATE]} to {data[len(data) - 1][DATE]})')
        req_date = input('dd/mm/yyyy - ')
        feedback, dates = show_matches_played_on_a_given_date(req_date, data)
        print(feedback)
        while feedback != 'Matches: ' and feedback != 'There are no matches':
            req_date = input('Enter date: ')
            feedback, dates = show_matches_played_on_a_given_date(req_date, data)
            print(feedback)
        for g in dates:
            print(f'Home: {g[H]}, away: {g[A]}, score(home/away): {g[H_G]}/{g[A_G]}')
    elif request_2 == '3':
        rating = []
        if request_1 in ('1', '2'):
            rating = match_results(data, request_1)
        elif request_2 == '3':
            rating = match_results(data, request_1)
        print('Rating table: \n')
        f_t, m_l = fancy_table(rating, d_teams)
        print('place ' + ' team'.ljust(m_l + 4, ' ') + 'games ' + 'wins ' + 'draws ' + 'losses ' + 'difference ' + 'points')
        for table_line in f_t:
            print(table_line)


if __name__ == "__main__":
    main()
