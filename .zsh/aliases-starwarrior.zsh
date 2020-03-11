# TASKWARRIOR
function task_gerrit() {
    firefox $(task project:"solutions/" status:pending export $1 | jq -r .gerriturl)
}

function task_jira() {
    firefox $(task project:"MDM" status:pending export $1 | jq -r .jiraurl )
}
