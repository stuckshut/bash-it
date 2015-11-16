#!/usr/bin/env bash
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

function virtualenv_prompt() {
    if [ ! -z "$VIRTUAL_ENV" ]
    then
        local env=$(basename $VIRTUAL_ENV)
        echo "(${env##*/}~$(py_interp_prompt)) "
    fi
}

function docker_prompt() {
    if [ ! -z "$DOCKER_MACHINE_NAME" ]
    then
        local docker=$DOCKER_MACHINE_NAME
        echo " ${orange}Docker:$DOCKER_MACHINE_NAME ${red}$CLOCK_CHAR "
    fi
}

function prompt_command() {
    PS1="\n$(battery_char) $(clock_char) $(docker_prompt)${purple}\h ${reset_color}in ${green}\w\n"
    PS1="$PS1${yellow}$(virtualenv_prompt)${bold_cyan}$(scm_char)${green}$(scm_prompt_info) ${bold_blue}>${normal} "
}

PROMPT_COMMAND=prompt_command;
