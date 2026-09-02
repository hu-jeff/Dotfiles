import argparse
import requests
import random
import threading

USERNAME = 'ranting'
NUM_QUESTIONS = 1
LOWER, UPPER = 1500, 1900

parser = argparse.ArgumentParser()
parser.add_argument('-c', '--count', help="number of questions to return")

args = parser.parse_args()
if args.count:
    NUM_QUESTIONS = int(args.count)

def get_problems():
    try:
        response = requests.get('https://codeforces.com/api/problemset.problems')
        response.raise_for_status()
    except:
        print(f'Error {response.status_code}: {response.reason[:100]} {response.text[:100]}')
        return

    try:
        json = response.json()
        for problem in json['result']['problems']:
            if LOWER <= problem.get('rating', -1) <= UPPER:
                valid_problems.append(problem)

    except e:
        print('Failed to parse response json', e)
        return

def get_solved_problems():
    try:
        response = requests.get('https://codeforces.com/api/user.status', {'handle': USERNAME})
        response.raise_for_status()
    except:
        print(f'Error {response.status_code}: {response.reason[:100]} {response.text[:100]}')
        return

    try:
        json = response.json()
        
        for submission in json['result']:
            problem = submission['problem']
            if LOWER <= problem.get('rating', -1) <= UPPER and \
                    submission.get('verdict', '') == "OK":
                solved_problems.add(problem['index'] + str(problem['contestId']))
    except e:
        print('Failed to parse response json', e)
        return

if __name__ == '__main__':
    valid_problems = []
    solved_problems = set()

    problems = threading.Thread(target=get_problems)
    solved = threading.Thread(target=get_solved_problems)
    problems.start()
    solved.start()

    solved.join()
    problems.join()

    random.shuffle(valid_problems)
    
    n = i = 0
    while n < NUM_QUESTIONS and i < len(valid_problems):
        problem = valid_problems[i]
        if problem['index'] + str(problem['contestId']) not in solved_problems:
            print(f'{problem["name"]}: ' + 
                  f'https://codeforces.com/problemset/problem/' +
                  f'{problem["contestId"]}/{problem["index"]}')
            n += 1

        i += 1

