# Contributing to This project

1. [**Getting Involved**](#getting-involved)
1. [**How To Report Bugs**](#how-to-report-bugs)
1. [**Tips For Submitting Code**](#tips-for-submitting-code)

## Getting Involved

There are a number of ways to get involved and help out here. Even if you've
never contributed code to an open source project before, we're always looking
for help identifying bugs, cleaning up code, writing documentation and testing
new packages.

The goal of this guide is to familiarize you with some of the best ways to
help with the work of maintaining the packages here. Please read through the
full guide, especially the part below that describes
[how to properly report bugs](#how-to-report-bugs).

## How to Report Bugs

If you think you've found an unreported bug, please
[open an issue for it](#how-to-report-bugs).

### Make sure the issue is related to this project

The best way to do this is from a PowerShell session.

### Verify that you have the latest version installed

All testing must be done using the latest versions of the packaging files.

### Reporting the issue

If the steps above are producing an error and you are sure that the issue is
with the Chocolatey package (i.e. manually downloading and installing the
software completes successfully),
[open an issue about it](/../../../chocolatey-ps-validator/issues).

## Tips For Submitting Code

### Always check first if someone has already reported it

As this script is shared on Git, another user may already have seen the error
and created a report. Creating an unnecessary duplicate is counter-productive
and leads to wasted time in responding to and closing it.

#### If an issue already exists

If you find an issue describing the same problem, you can subscribe to be
notified to updates on it and share your thoughts and observations about it
there. If the original issue description is incomplete, don't hesitate to add
what you can; it may help us to find the solution quicker!

### Code

Anyone can help us enhance this script by submitting a Pull Request; we always
respond to them as soon as we can.

#### Reporting

Please follow these guidelines before reporting a bug:

1. [ ] **Update to the latest version** Ensure that you can reproduce the issue
       with the latest version.
1. [ ] **Search this repository** See if the issue has already been reported. If
       so, please comment on the existing issue.
1. [ ] **Describe how to reproduce the problem** Please provide as many details
       as possible on the steps needed to reproduce the problem.

### Pull requests

[Pull requests](https://help.github.com/articles/using-pull-requests) are always
welcome and the preferred way of submitting code contributions.

Please follow these guidelines before sending a pull request:

1. [ ] Update your fork to this repository's `master` branch.
1. [ ] Make your changes in a new branch named for the issue you're fixing. We
       prefer short, unambiguous branch names related the work they contain.
1. [ ] Keep your commits as atomic as possible. The word _atom_ comes to us from
       the ancient Greeks and roughly means "without a knife," referring to the
       belief that the atom was the smallest quantity of matter in existence and
       that it could not be split into anything smaller. In the same way, make
       your code changes as tightly focused and cohesive as you can, creating a
       new commit for every distinct issue being fixed or feature added.
1. [ ] Always add meaningful commit messages. We should not have to guess at what your code is supposed to do.

5. One pull request per feature. If you want multiple features, send multiple PR's

Please follow this process; it's the best way to get your work included in the project:

- [Fork](http://help.github.com/fork-a-repo/) the project, clone your fork,
   and configure the remotes:

```bash
   # clone your fork of the repo into the current directory in terminal
   git clone git@github.com:<your username>/chocolatey-ps-validator.git
   # navigate to the newly cloned directory
   cd chocolatey-ps-validator
   # assign the original repo to a remote called "upstream"
   git remote add upstream https://github.com/tunisiano187/chocolatey-ps-validator.git
   ```

- If you cloned a while ago, get the latest changes from upstream:

   ```bash
   # fetch upstream changes
   git fetch upstream
   # make sure you are on your 'master' branch
   git checkout master
   # merge upstream changes
   git merge upstream/master
   ```

- Make sure that your branch is up to date:

   ```bash
   # Switch to the master branch
   git checkout master
   # Pull down any updates
   git pull
   ```

- Create a new topic branch to contain your feature, change, or fix:

   ```bash
   git checkout -b <topic-branch-name> master
   ```

- Commit your changes in logical chunks. or your pull request is unlikely
   be merged into the main project. Use git's
   [interactive rebase](https://help.github.com/articles/interactive-rebase)
   feature to tidy up your commits before making them public.

- Push your topic branch up to your fork:

   ```bash
   git push origin <topic-branch-name>
   ```

- [Open a Pull Request](https://help.github.com/articles/using-pull-requests) with a
    clear title and description.

## Code guidelines

I currently haven't set standarts for coding, but i'll try to add them as soon as they exists...
