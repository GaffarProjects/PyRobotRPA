# PyRobotRPA – Robot Framework Web & DB Demo

[![Robot Framework Tests](https://github.com/GaffarProjects/PyRobotRPA/actions/workflows/robot-tests.yml/badge.svg)](https://github.com/GaffarProjects/PyRobotRPA/actions/workflows/robot-tests.yml)

End‑to‑end test automation demo using **Robot** Framework, SeleniumLibrary, and MySQL database validation for multiple demo sites (SauceDemo, The Internet, Automation Practice, Quotes to Scrape).

---

## Features

- Web UI automation for login, checkout, file upload and smoke flows.  
- MySQL database validation using Robot Framework DatabaseLibrary and `pymysql`.  
- Reusable keywords and test data under `config/` and `resources/`.  
- GitHub Actions workflow to run Robot tests on each push and upload HTML reports as artifacts.
​

#Project structure
Adapt this to your exact tree if needed:

text
PyRobotRPA/
├── config/
│   └── browsers.robot          # Browser setup, SeleniumLibrary, default URL & browser
├── resources/
│   ├── common_keywords.robot   # Reusable UI keywords
│   ├── database.robot          # DB connection + SQL keywords for orders table
│   ├── test_data.robot         # Legacy test data (optional)
│   └── test_data.py            # Python variable file for URLs, users, etc.
├── tests/
│   ├── checkout/
│   │   └── checkout_test.robot # E2E checkout + DB validation for SauceDemo
│   ├── login/
│   │   └── login_test.robot    # Login scenarios
│   └── smoke/
│       ├── saucedemo_tests.robot
│       ├── automationpractice_tests.robot
│       ├── demoqa_tests.robot
│       ├── heroku_internet_tests.robot
│       ├── quotes_tests.robot
│       └── smoke_test.robot
├── .github/
│   └── workflows/
│       └── robot-tests.yml     # GitHub Actions workflow for Robot tests
└── README.md
This layout follows common Robot Framework example projects.
​

#Getting started
#Prerequisites
Python 3.10+ installed.​

#Google Chrome or Firefox installed locally.​

#MySQL server running with an orders table for the checkout DB tests.​

Setup
From project root:

bash
python -m venv .venv
source .venv/bin/activate          # Windows: .venv\Scripts\activate

pip install --upgrade pip
pip install robotframework robotframework-seleniumlibrary robotframework-databaselibrary pymysql
If you use Chrome, ensure matching ChromeDriver or use Selenium’s built‑in driver management depending on your SeleniumLibrary version.​

Configure DB connection in resources/database.robot (DB name, user, password, host, port).​

Running the tests locally
From project root with the virtualenv activated:

bash
# Run all tests
robot -d results tests

# Run only checkout suite
robot -d results tests/checkout/checkout_test.robot

# Run only smoke suite
robot -d results tests/smoke

# Run tests with a specific tag (for example: checkout)
robot -d results -i checkout tests
HTML reports (report.html, log.html) will be written into the results/ directory.​

The checkout_test.robot suite performs the SauceDemo checkout flow and verifies the inserted order row in the MySQL orders table.
​

#GitHub Actions (CI)
This repository includes a GitHub Actions workflow to run Robot tests on each push / PR and publish results as artifacts.
​

You can add a status badge like:

text
![Robot Framework Tests](https://github.com/<your-user>/<your-repo>/actions/workflows/robot-tests.yml/badge.svg)
Replace <your-user> and <your-repo> with your GitHub account and repository name.
​

Workflow file
.github/workflows/robot-tests.yml:

text
name: Robot Framework Tests

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.12"

      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install robotframework robotframework-seleniumlibrary robotframework-databaselibrary pymysql

      - name: Run Robot tests
        run: |
          robot -d results tests

      - name: Upload Robot reports
        uses: actions/upload-artifact@v4
        if: success() || failure()
        with:
          name: robot-results
          path: results
The workflow runs all tests in the tests/ folder and stores the reports as downloadable artifacts in the Actions tab




Practice UI automation project using Robot Framework and Selenium for demo web applications (e.g. SauceDemo, DemoQA, The Internet Herokuapp).  
It is designed to showcase keyword-driven tests, good project structure, and Git/GitHub usage.
## Tech Stack

- Robot Framework
- SeleniumLibrary
- Python 3
- Git & GitHub# Project Structure

- `tests/` – Robot test suites (SauceDemo login/cart/checkout, DemoQA, Herokuapp flows)
- `resources/` – Shared keywords and test data (e.g. `common_keywords.robot`, `test_data.py`)
- `config/` – Browser and environment configuration
- `requirements.txt` – Python dependencies

## Features

- Login, add-to-cart, and start-checkout flow on SauceDemo with reusable keywords
- Common navigation/login keywords in resource files
- Test data/credentials externalized into variable files
- Tags like `smoke`, `regression`, `login`, `checkout` to filter execution

# How to Run
Optional) create virtual environment
python -m venv .venv

Linux/macOS
source .venv/bin/activate

Windows
.venv\Scripts\activate
Install dependencies
pip install -r requirements.txt

Run all tests
robot tests

Run only SauceDemo smoke tests
robot --include smoke tests

## What I Practiced / Learned

- Writing keyword-driven tests in Robot Framework
- Organizing suites, resource files, and Python variable files
- Using tags to separate smoke and regression scenarios
- Managing automation work with Git & GitHub as a public portfolio project
- Backend Validations
