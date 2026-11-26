# Corporate Recruitment, Promotion & Evaluation System — Databases Course Project (2024)

A university relational database management system designed to model corporate human resources, internal job/promotion postings, multi-evaluator grading workflows, and database administrator (DBA) auditing, paired with a graphical user interface (`gui/`) for querying and managing records.

## System Overview

* **Role-Based User Model:** Separates core system accounts (`user`) into **Employees/Candidates** (`employee`), **Evaluators** (`evaluator`), and **Database Administrators** (`dba`), linked to registered companies (`etaireia`).
* **Candidate Portfolio Tracking:** Stores each employee's biography, recommendation letters, certificates, spoken languages (`ENG`, `FR`, `SP`, `GE`, `CH`, `GR`), academic degrees (`BSc`, `MSc`, `PhD`), and personal projects.
* **Promotion & Evaluation Pipeline:** Manages open positions (`job`), hierarchical subject requirements (`subject`, `requires`), promotion applications (`aitisi_proagogis`), dual-evaluator scoring (`evaluation` on a `1–20` scale), and archived outcomes (`istoriko_aitiseon`).
* **DBA Activity Auditing:** Tracks active and past administrator tenures (`dba`) alongside an action log (`dba_log`) recording `INSERT`, `UPDATE`, and `DELETE` operations across database tables.

## Database Schema

The relational MySQL schema consists of **17 tables** organized across four functional modules:

### 1. Organizations & Users
* **`etaireia`** — Company profiles (`AFM` primary key, `DOY`, `name`, `tel`, `street`, `num`, `city`, `country`).
* **`user`** — Base user credentials and contact details (`username` primary key, `password`, `name`, `lastname`, `reg_date`, `email`, `company` foreign key).
* **`evaluator`** — Evaluator specialization extending `user` (`username`, `exp_years`, `firm` referencing `etaireia`).
* **`employee`** — Employee/candidate specialization extending `user` (`username`, `bio`, `sistatikes`, `certificates`).

### 2. Candidate Qualifications
* **`degree`** — Academic degree catalog (`titlos`, `idryma`, `bathmida` ENUM: `BSc` | `MSc` | `PhD`).
* **`has_degree`** — Degrees earned by employees (`degr_title`, `degr_idryma`, `cand_usrname`, `etos`, `grade`).
* **`languages`** — Languages spoken by each candidate (`candid`, `lang` SET: `ENG`, `FR`, `SP`, `GE`, `CH`, `GR`).
* **`project`** — Candidate portfolio projects (`candid`, `num`, `descr`, `url`).

### 3. Positions, Applications & Evaluation Workflow
* **`job`** — Open positions and promotion postings (`id`, `start_date`, `salary`, `position`, `edra`, `evaluator`, `announce_date`, `submission_date`, `best_candidate`).
* **`subject`** — Self-referencing hierarchical subject taxonomy (`title`, `description`, `belongsto`).
* **`requires`** — Maps required subjects to job postings (`job_id`, `subject_title`).
* **`applies`** — Standard job applications (`cand_usrname`, `job_id`).
* **`aitisi_proagogis`** — Internal promotion applications (`aitisi_id`, `cand_usrname`, `job_id`, `katastasi` ENUM: `energi` | `olokliromeni` | `akyromeni`, `hmerominia_aitisis`).
* **`evaluation`** — Individual evaluator grades for promotion requests (`evaluation_id`, `aitisi_id`, `evaluator_username`, `grade` constrained between `1` and `20`).

### 4. Historical Archive & Administration
* **`istoriko_aitiseon`** — Completed promotion evaluation records (`istoriko_id`, `evaluator1_username`, `evaluator2_username`, `employee_username`, `job_id`, `katastasi`, `grade` constrained between `1` and `20`).
* **`dba`** — Database administrator terms (`username`, `start_date`, `end_date`).
* **`dba_log`** — Audit trail of DBA table operations (`log_id`, `username`, `action_type` ENUM: `INSERT` | `UPDATE` | `DELETE`, `table_name`, `action_timestamp`).

## Repository Structure

```text
├── db/
│   ├── create_tables.sql                    # Core 12-table relational schema
│   ├── create_new_tables.sql                # Promotion, evaluation, history, and DBA tables + schema alterations
│   ├── insert.sql                           # Initial seed data for companies, users, jobs, degrees, and applications
│   ├── insert_new.sql                       # Seed data for promotion requests, evaluations, history, and DBA logs
│   └── insert_istoriko_aitiseon_60000.sql   # 60,000-row historical evaluation dataset for query/index benchmarking
├── gui/                                     # Graphical user interface source code connected to the database
└── README.md