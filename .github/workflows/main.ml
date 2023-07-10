name: CI
on: [push]

jobs:
  linters:
    name: Markdown linting
    runs-on: ubuntu-20.04

    steps:
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Setup Node.js
      uses: actions/setup-node@v2
      with:
        node-version: '14'

    - name: Install dependencies
      run: npm install markdownlint-cli

    - name: Install spellcheck
      run: npm install markdown-spellcheck

    - name: Run markdownlint
      run: npx markdownlint *.md --config="config/lint.json"

    - name: Run spell check
      run: npx mdspell *.md --en-us --ignore-numbers --ignore-acronyms --report
