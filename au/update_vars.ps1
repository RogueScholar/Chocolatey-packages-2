# SPDX-FileCopyrightText: © 2020–2022, Fabian Clerbois <fabian@bowlman.org>
# SPDX-FileCopyrightText: 🄯 2025, Peter J. Mello <admin@petermello.net>
#
# SPDX-License-Identifier: AGPL-3.0-or-later
# ---------------------------------------------------------------------------- #
# AU Packages Template: <https://github.com/majkinetor/au-packages-template>
# Copy this file to update_vars.ps1 and set variables there; do not include it
#   in the repository.

if (-not (Test-Path -Path "${Env:mail_user}")) {
  ${Env:mail_user}              = $Mail_user
  ${Env:mail_pass}              = $Mail_pass
}
if (-not (Test-Path -Path "${Env:chocoApiKey}")) {
  ${Env:chocoApiKey}            = $choco_api              # Chocolatey api key
  ${Env:au_Push}                = 'true'                  # Push to chocolatey
}
if (-not (Test-Path -Path "${Env:gist_id}")) {
  ${Env:gist_id}                = $Gist_id                # Specify your gist id or leave empty for anonymous gist
}
if (-not (Test-Path -Path "${Env:github_user_repo}")) {
  ${Env:github_user_repo}       = $Github_user_repo       # {github_user>/{repo}
}
if (-not (Test-Path -Path "${Env:github_api_key}")) {
  ${Env:github_api_key}         = $Github_personal_token  # Github personal access token
}
if (-not (Test-Path -Path "${Env:gitlab_user}")) {
  ${Env:gitlab_user}            = $GITLAB_USER_LOGIN      # GitLab username to use for the push
}
if (-not (Test-Path -Path "${Env:gitlab_api_key}")) {
  ${Env:gitlab_api_key}         = $Gitlab_api             # GitLab API key associated with gitlab_user
}
if (-not (Test-Path -Path "${Env:gitlab_push_url}")) {
  ${Env:gitlab_push_url}        = $Gitlab_PushURL         # GitLab URL to push to, HTTP/HTTPS required, e.g. https://git.example.org/jekotia/au.git
}
if (-not (Test-Path -Path "${Env:gitlab_commit_strategy}")) {
  ${Env:gitlab_commit_strategy} = 'atomictag'             # Same values as the Git plugin: single, atomic, or atomictag.
}
