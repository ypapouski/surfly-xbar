#!/usr/bin/env bash
# Add brew path
PATH="$PATH:/opt/homebrew/bin/"

# Set the GitHub username
username=""

# Set the GitHub access token
# You can generate a personal access token at https://github.com/settings/tokens
access_token=""

# Define the repositories to check
repositories=(
    "surfly/cobro"
    "surfly/cmproxy"
    "surfly/meriyah"
)

# Initialize the total number of pull requests to 0
total_pull_requests=0

# Loop through the repositories and add up the number of pending pull request reviews for the specified user
for repository in "${repositories[@]}"; do
    pull_requests=$(curl -s -H "Authorization: token $access_token" "https://api.github.com/repos/$repository/pulls?state=open" | jq --arg username "$username" '.[] | select(.requested_reviewers[].login == $username) | .number' | wc -l)
    total_pull_requests=$((total_pull_requests + pull_requests))
done

if [ "$total_pull_requests" -gt 0 ]; then
    #pending_gh_icon=$(curl -s "https://github.githubassets.com/favicons/favicon-pending.svg" | base64)
    # The image is taken from https://github.githubassets.com/favicons/favicon-pending.svg but re-sized of a half of its size. The xbar doesn't support image size.
    pending_gh_icon=PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/Pgo8IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMC8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9UUi8yMDAxL1JFQy1TVkctMjAwMTA5MDQvRFREL3N2ZzEwLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgaWQ9ImJvZHlfMSIgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2Ij4KCjxnIHRyYW5zZm9ybT0ibWF0cml4KDAuNSAwIDAgMC41IDAgMCkiPgogICAgPHBhdGggZD0iTTAgMTZDIDAgNy4xNiA3LjE2IDAgMTYgMEMgMjQuODQgMCAzMiA3LjE2IDMyIDE2QyAzMiAxNi4zMzU4IDMxLjk4OTYgMTYuNjY5MyAzMS45NjkyIDE3TDMxLjk2OTIgMTdMMjYuMTEyMSAxN0MgMjYuMTk1NyAxNi40NCAyNi4yNCAxNS44MjgzIDI2LjI0IDE1LjE2QyAyNi4yNCAxMy40IDI1LjYyIDExLjk4IDI0LjYgMTAuODZDIDI0Ljc2IDEwLjQ2IDI1LjMyIDguODIgMjQuNDQgNi42MkMgMjQuNDQgNi42MiAyMy4xIDYuMTggMjAuMDQgOC4yNkMgMTguNzYgNy45IDE3LjQgNy43MiAxNi4wNCA3LjcyQyAxNC42OCA3LjcyIDEzLjMyIDcuOSAxMi4wNCA4LjI2QyA4Ljk4IDYuMiA3LjY0IDYuNjIgNy42NCA2LjYyQyA2Ljc2IDguODIgNy4zMiAxMC40NiA3LjQ4IDEwLjg2QyA2LjQ2IDExLjk4IDUuODQgMTMuNDIgNS44NCAxNS4xNkMgNS44NCAyMC42Mzg3IDguODIxMTkgMjIuMzE4NyAxMiAyMi44OTc2TDEyIDIyLjg5NzZMMTIgMjUuMjQ0MkMgMTEuMDIyNCAyNS42NjMyIDguODMwMzUgMjYuMjE2NiA3LjQ0IDIzLjg4QyA3LjE0IDIzLjQgNi4yNCAyMi4yMiA0Ljk4IDIyLjI0QyAzLjY0IDIyLjI2IDQuNDQgMjMgNSAyMy4zQyA1LjY4IDIzLjY4IDYuNDYgMjUuMSA2LjY0IDI1LjU2QyA2Ljk1OTQ3IDI2LjQ1ODUgNy45OTY1NSAyOC4xNzQzIDEyIDI3LjQ0MzdMMTIgMjcuNDQzN0wxMiAzMC42ODE0QyAxMS44OTUxIDMxLjAxMTYgMTEuNTc1MSAzMS4yOTExIDEwLjk0IDMxLjE4QyA0LjU4IDI5LjA2IDAgMjMuMDggMCAxNnoiIHN0cm9rZT0ibm9uZSIgZmlsbD0iIzI0MjkyRSIgZmlsbC1ydWxlPSJub256ZXJvIiAvPgogICAgPHBhdGggZD0iTTMxIDI2QyAzMS4wMDAwMDIgMjcuMzgwNzE0IDMwLjUxMTg0NyAyOC41NTkyMjUgMjkuNTM1NTM0IDI5LjUzNTUzNEMgMjguNTU5MjI1IDMwLjUxMTg0NyAyNy4zODA3MTQgMzEuMDAwMDAyIDI2IDMxQyAyNC42MTkyOSAzMS4wMDAwMDIgMjMuNDQwNzc3IDMwLjUxMTg0NyAyMi40NjQ0NjYgMjkuNTM1NTM0QyAyMS40ODgxNTUgMjguNTU5MjI1IDIxIDI3LjM4MDcxNCAyMSAyNkMgMjEgMjQuNjE5MjkgMjEuNDg4MTU1IDIzLjQ0MDc3NyAyMi40NjQ0NjYgMjIuNDY0NDY2QyAyMy40NDA3NzcgMjEuNDg4MTU1IDI0LjYxOTI5IDIxIDI2IDIxQyAyNy4zODA3MTQgMjEgMjguNTU5MjI1IDIxLjQ4ODE1NSAyOS41MzU1MzQgMjIuNDY0NDY2QyAzMC41MTE4NDcgMjMuNDQwNzc3IDMxLjAwMDAwMiAyNC42MTkyOSAzMSAyNkMgMzEuMDAwMDAyIDI2LjA1ODE4NiAzMC45OTg5ODUgMjYuMTE2MzUgMzAuOTk2OTU0IDI2LjE3NDQ5OCIgc3Ryb2tlPSJub25lIiBmaWxsPSIjQjc4RjA1IiBmaWxsLXJ1bGU9Im5vbnplcm8iIC8+CjwvZz4KPC9zdmc+

    echo "Pending: $total_pull_requests | image=$pending_gh_icon"
else
    #success_gh_icon=$(curl -s "https://github.githubassets.com/favicons/favicon-success.svg" | base64)
    # The image is taken from https://github.githubassets.com/favicons/favicon-success.svg but re-sized of a half of its size. The xbar doesn't support image size. 
    success_gh_icon=PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/Pgo8IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMC8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9UUi8yMDAxL1JFQy1TVkctMjAwMTA5MDQvRFREL3N2ZzEwLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgaWQ9ImJvZHlfMSIgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2Ij4KCjxnIHRyYW5zZm9ybT0ibWF0cml4KDAuNSAwIDAgMC41IDAgMCkiPgogICAgPHBhdGggZD0iTTAgMTZDIDAgNy4xNiA3LjE2IDAgMTYgMEMgMjMuMDM3IDAgMjkuMDA5NCA0LjUzNzEyIDMxLjE1MjkgMTAuODQ3MUwzMS4xNTI5IDEwLjg0NzFMMjYuMjI3MSAxNS43NzNDIDI2LjIzNTYgMTUuNTc0MSAyNi4yNCAxNS4zNjk4IDI2LjI0IDE1LjE2QyAyNi4yNCAxMy40IDI1LjYyIDExLjk4IDI0LjYgMTAuODZDIDI0Ljc2IDEwLjQ2IDI1LjMyIDguODIgMjQuNDQgNi42MkMgMjQuNDQgNi42MiAyMy4xIDYuMTggMjAuMDQgOC4yNkMgMTguNzYgNy45IDE3LjQgNy43MiAxNi4wNCA3LjcyQyAxNC42OCA3LjcyIDEzLjMyIDcuOSAxMi4wNCA4LjI2QyA4Ljk4IDYuMiA3LjY0IDYuNjIgNy42NCA2LjYyQyA2Ljc2IDguODIgNy4zMiAxMC40NiA3LjQ4IDEwLjg2QyA2LjQ2IDExLjk4IDUuODQgMTMuNDIgNS44NCAxNS4xNkMgNS44NCAyMC42Mzg3IDguODIxMTkgMjIuMzE4NyAxMiAyMi44OTc2TDEyIDIyLjg5NzZMMTIgMjUuMjQ0MkMgMTEuMDIyNCAyNS42NjMyIDguODMwMzUgMjYuMjE2NiA3LjQ0IDIzLjg4QyA3LjE0IDIzLjQgNi4yNCAyMi4yMiA0Ljk4IDIyLjI0QyAzLjY0IDIyLjI2IDQuNDQgMjMgNSAyMy4zQyA1LjY4IDIzLjY4IDYuNDYgMjUuMSA2LjY0IDI1LjU2QyA2Ljk1OTQ3IDI2LjQ1ODUgNy45OTY1NSAyOC4xNzQzIDEyIDI3LjQ0MzdMMTIgMjcuNDQzN0wxMiAzMC42ODE0QyAxMS44OTUxIDMxLjAxMTYgMTEuNTc1MSAzMS4yOTExIDEwLjk0IDMxLjE4QyA0LjU4IDI5LjA2IDAgMjMuMDggMCAxNnoiIHN0cm9rZT0ibm9uZSIgZmlsbD0iIzI0MjkyRSIgZmlsbC1ydWxlPSJub256ZXJvIiAvPgogICAgPHBhdGggZD0iTTMwLjcwNzEgMjEuMjA3MUwyMC41IDMxLjQxNDJMMTUuMjkyOSAyNi4yMDcxTDE2LjcwNzEgMjQuNzkyOUwyMC41IDI4LjU4NThMMjkuMjkyOSAxOS43OTI5TDMwLjcwNzEgMjEuMjA3MXoiIHN0cm9rZT0ibm9uZSIgZmlsbD0iIzAwNzkxQyIgZmlsbC1ydWxlPSJub256ZXJvIiAvPgo8L2c+Cjwvc3ZnPg==
    echo "| image=$success_gh_icon"
fi

echo "---"
echo "View Pull Requests | href=https://github.com/pulls/review-requested"
