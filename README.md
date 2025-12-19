# PyRobotRPA

Practice UI automation project using Robot Framework and Selenium for demo web applications (e.g. SauceDemo, DemoQA, The Internet Herokuapp).  
It is designed to showcase keyword-driven tests, good project structure, and Git/GitHub usage.

## Tech Stack

- Robot Framework
- SeleniumLibrary
- Python 3
- Git & GitHub

## Project Structure

- `tests/` – Robot test suites (SauceDemo login/cart/checkout, DemoQA, Herokuapp flows)
- `resources/` – Shared keywords and test data (e.g. `common_keywords.robot`, `test_data.py`)
- `config/` – Browser and environment configuration
- `requirements.txt` – Python dependencies

## Features

- Login, add-to-cart, and start-checkout flow on SauceDemo with reusable keywords
- Common navigation/login keywords in resource files
- Test data/credentials externalized into variable files
- Tags like `smoke`, `regression`, `login`, `checkout` to filter execution

## How to Run


(Optional) create virtual environment
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
