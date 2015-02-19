#!/usr/bin/env python

from os import path
from yaml import dump, load
from prompter import prompt, yesno

script_path = path.dirname(path.realpath(__file__))

defaults_vars_file = path.join(script_path,'../defaults.yml')
custom_vars_file = path.join(script_path,'../custom.yml')
questions_file = path.join(script_path,'questions.yml')
quickinstall_file = path.join(script_path,'quickinstall.yml')


def load_yaml(path):
    try:
        with open(path, 'r') as file:
            return load(file)
    except IOError, e:
        from errno import ENOENT
        if e.errno == ENOENT:
            return dict()
        raise


def ask_question(question, vars_dict):
    default = vars_dict[question['var_name']]
    prompt_line = question['prompt_line']

    if question['type'] == 'free_text':
        return prompt(prompt_line, default=default, suffix=':')
    elif question['type'] == 'yesno':
        return yesno(prompt_line, default='yes' if default else 'no', suffix=':')


def get_answers():
    questions = load_yaml(questions_file)
    default_vars_dict = load_yaml(defaults_vars_file)
    
    custom_vars_dict = dict()
    if path.exists(custom_vars_file):
        if yesno('Found custom vars file, load it ?', default='yes', suffix=':'):
            custom_vars_dict = load_yaml(custom_vars_file)

    vars_dict = default_vars_dict.copy()
    vars_dict.update(custom_vars_dict)

    result_dict = dict()


    for question in questions:
        question_var_name = question['var_name']
        question_type = question['type']
        result = ask_question(question, vars_dict)
        if question_type == 'free_text' and result != default_vars_dict[question_var_name]:
            result_dict[question_var_name] = result
        elif question_type == 'yesno' and not result:
            result_dict[question_var_name] = not default_vars_dict[question_var_name]

    # Save custom custome configuration file if different from default
    if result_dict:
        try:
            with open(custom_vars_file, 'w') as file:
                file.write(dump(result_dict, default_flow_style=False))
        except:
            pass

# def run_ansible():
#     pass


def main():
    get_answers()
    # run_ansible()


if __name__ == '__main__':
    main()