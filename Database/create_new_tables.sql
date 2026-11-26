->Πίνακας αιτήσεων προαγωγής:

CREATE TABLE aitisi_proagogis(
aitisi_id INT AUTO_INCREMENT,
cand_usrname VARCHAR(30),
job_id INT,
katastasi ENUM('energi', 'olokliromeni', 'akyromeni') DEFAULT 'energi',
hmerominia_aitisis DATETIME DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (aitisi_id),
CONSTRAINT aitiisi_candusrname FOREIGN KEY (cand_usrname) REFERENCES employee (username),
CONSTRAINT aitisi_jobid FOREIGN KEY (job_id) REFERENCES job (id)
ON DELETE CASCADE
);

->Πίνακας αξιολόγησης αιτήσεων προαγωγής:

CREATE TABLE evaluation (
evaluation_id INT AUTO_INCREMENT,
aitisi_id INT NOT NULL,
evaluator_username VARCHAR(30) NOT NULL,
grade TINYINT NOT NULL CHECK (grade BETWEEN 1 AND 20),
PRIMARY KEY (evaluation_id),
CONSTRAINT fk_evaluation_aitisiid FOREIGN KEY (aitisi_id) REFERENCES aitisi_proagogis (aitisi_id),
CONSTRAINT fk_evaluation_evaluatorusrnm FOREIGN KEY (evaluator_username) REFERENCES evaluator (username)
ON DELETE CASCADE
);

->Πίνακας ιστορικού αιτήσεων:

CREATE TABLE istoriko_aitiseon (
istoriko_id INT AUTO_INCREMENT,
evaluator1_username VARCHAR(30),
evaluator2_username VARCHAR(30),
employee_username VARCHAR(30),
job_id INT,
katastasi ENUM('olokliromeni') DEFAULT 'olokliromeni',
grade INT CHECK (grade BETWEEN 1 AND 20),
PRIMARY KEY (istoriko_id)
);

->Πίνακας διαχειριστών της βάσης:

CREATE TABLE dba (
username VARCHAR(30),
start_date DATE NOT NULL,
end_date DATE DEFAULT NULL,
PRIMARY KEY (username),
CONSTRAINT fk_dbausername FOREIGN KEY (username) REFERENCES user (username) ON DELETE CASCADE
);

->Πίνακας για τις δράσεις του κάθε διαχειριστή:

CREATE TABLE dba_log (
log_id INT AUTO_INCREMENT,
username VARCHAR(30) NOT NULL,
action_type ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
table_name VARCHAR(30) NOT NULL,
action_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (log_id),
CONSTRAINT fk_dba_logusername FOREIGN KEY (username) REFERENCES dba (username) ON DELETE CASCADE
);

->ALTER TABLE user
ADD company char(9),
ADD CONSTRAINT fk_company FOREIGN KEY (company) REFERENCES etaireia(AFM);

->ALTER TABLE job
ADD best_candidate VARCHAR(30);