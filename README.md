# Xbar Surfly PR review integration

## Installation instructions

1. Download and install xbar.
[https://github.com/matryer/xbar#get-started](https://github.com/matryer/xbar/releases)https://github.com/matryer/xbar/releases
2. Install `jq` tool using `brew`, i.e. `brew install jq`.
3. Copy `surfly-review-prs.5m.sh` into the `~/Library/Application Support/xbar/plugins` folder.
4. Give the file permission to execute
    ```bash
    chmod +x surfly-review-prs.5m.sh
    ```
5. Create a GitHub token. https://github.com/settings/tokens and put it into `surfly-review-prs.5m.sh`.
    <p>The token should have the following permissions</p>
    <p align="left">
      <img width="300" src="https://github.com/ypapouski/surfly-xbar/assets/3298016/452a333b-75cd-4144-870b-833311b6db4f">
    </p>
    <p>Authorize the token to Surfly organisation</p>
    <p align="left">
      <img width="400" src="https://github.com/ypapouski/surfly-xbar/assets/3298016/65c4844c-ebe8-43e8-87d1-8c7bdf825ef8">
    </p>
    
7. Put your GitHub account into `surfly-review-prs.5m.sh`.
8. Start `xbar.app`.
9. Done!

## Troubleshooting

You can verify that the script is working fine by jsut executing it

```bash
./surfly-review-prs.5m.sh
```

You should see an output like this

```
image=PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/Pgo8IURPQ1RZUEUlasnn7474bvggtwa638rjdbsdm9yZy9UUi8yMDAxL1JFQy1TVkctMjAwMTA5MDQvRFREL3N2ZzEwLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgaWQ9ImJvZHlfMSIgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2Ij4KCjxnIHRyYW5zZm9ybT0ibWF0cml4KDAuNSAwIDAgMC41IDAgMCkiPgogICAgPHBhdGggZD0iTTAgMTZDIDAgNy4xNiA3LjE2IDAgMTYgMEMgMjMuMDM3IDAgMjkuMDA5NCA0LjUzNzEyIDMxLjE1MjkgMTAuODQ3MUwzMS4xNTI5IDEwLjg0NzFMMjYuMjI3MSAxNS43NzNDIDI2LjIzNTYgMTUuNTc0MSAyNi4yNCAxNS4zNjk4IDI2LjI0IDE1LjE2QyAyNi4yNCAxMy40IDI1LjYyIDExLjk4IDI0LjYgMTAuODZDIDI0Ljc2IDEwLjQ2IDI1LjMyIDguODIgMjQuNDQgNi42MkMgMjQuNDQgNi42MiAyMy4xIDYuMTggMjAuMDQgOC4yNkMgMTguNzYgNy45IDE3Ljl48fjsabsd7db,n,mnas6aLjI2QyA4Ljk4IDYuMiA3LjY0IDYuNjIgNy42NCA2LjYyQyA2Ljc2IDguODIgNy4zMiAxMC40NiA3LjQ4IDEwLjg2QyA2LjQ2IDExLjk4IDUuODQgMTMuNDIgNS44NCAxNS4xNkMgNS44NCAyMC42Mzg3IDguODIxMTkgMjIuMzE4NyAxMiAyMi44OTc2TDEyIDIyLjg5NzZMMTIgMjUuMjQ0MkMgMTEuMDIyNCAyNS42NjMyIDguODMwMzUgMjYuMjE2NiA3LjQ0IDIzLjg4QyA3LjE0IDIzLjQgNi4yNCAyMi4yMiA0Ljk4IDIyLjI0QyAzLjY0IDIyLjI2IDQuNDQgMjMgNSAyMy4zQyA1LjY4IDIzLjY4IDYuNDYmasndhasud884632bab0d8mcbasyy45OTY1NSAyOC4xNzQzIDEyIDI3LjQ0MzdMMTIgMjcuNDQzN0wxMiAzMC42ODE0QyAxMS44OTUxIDMxLjAxMTYgMTEuNTc1MSAzMS4yOTExIDEwLjk0IDMxLjE4QyA0LjU4IDI5LjA2IDAgMjMuMDggMCAxNnoiIHN0cm9rZT0ibm9uZSIgZmlsbD0iIzI0MjkyRSIgZmlsbC1ydWxlPSJub256ZXJvIiAvPgogICAgPHBhdGggZD0iTTMwLjcwNzEgMjEuMjA3MUwyMC41IDMxLjQxNDJMMTUuMjkyOSAyNi4yMDcxTDE2LjcwNzEgMjQuNzkyOUwyMC41IDI4LjU4NThMMjkuMjkyOSAxOS43OTI5TDMwLjcwNzEgMjEuMjA3MXoiIHN0cm9rZT0ibm9uZSIgZmlsbD0iIzAwNzkxQyIgZmlsbC1ydWxlPSJub256ZXJvIiAvPgo8L2c+Cjwvc3ZnPg==
---
View Pull Requests | href=https://github.com/pulls/review-requested
```

If you don't see the github icon on your menu bar you can try killing the xbar process using the activity monitor and launching the app again
