-> Aitisi_proagogis 10 εγγραφές:

INSERT INTO aitisi_proagogis (cand_usrname, job_id, katastasi)
VALUES
('user7', 1, 'energi'),
('user8', 2, 'olokliromeni'),
('user9', 3, 'akyromeni'),
('user10', 4, 'energi'),
('user11', 5, 'energi'),
('user12', 6, 'olokliromeni'),
('user19', 7, 'akyromeni'),
('user20', 8, 'energi'),
('user21', 9, 'energi'),
('user22', 10, 'olokliromeni');

-> Evaluation 10 εγγραφές:

INSERT INTO evaluation (aitisi_id, evaluator_username, grade)
VALUES
(1, 'user1', 15),
(1, 'user2', 18),
(2, 'user3', 20),
(2, 'user4', 19),
(3, 'user5', 16),
(4, 'user6', 14),
(5, 'user13', 17),
(6, 'user14', 12),
(7, 'user15', 13),
(8, 'user16', 18);

-> Istoriko_aitiseon 10 εγγραφές:


INSERT INTO istoriko_aitiseon (evaluator1_username, evaluator2_username, employee_username, job_id, grade)
VALUES
('user1', 'user2', 'user7', 1, 16),
('user3', 'user4', 'user8', 2, 19),
('user5', 'user6', 'user9', 3, 14),
('user13', 'user14', 'user10', 4, 12),
('user15', 'user16', 'user11', 5, 18),
('user1', 'user3', 'user12', 6, 20),
('user2', 'user4', 'user19', 7, 11),
('user5', 'user7', 'user20', 8, 15),
('user6', 'user8', 'user21', 9, 13),
('user13', 'user15', 'user22', 10, 17);

->Dba 10 εγγραφές:

INSERT INTO dba (username, start_date, end_date)
VALUES
('user1', '2024-01-01', NULL),
('user2', '2024-02-01', '2024-07-01'),
('user3', '2024-03-01', NULL),
('user4', '2024-04-01', '2024-08-01'),
('user5', '2024-05-01', NULL),
('user6', '2024-06-01', NULL),
('user7', '2024-07-01', NULL),
('user8', '2024-08-01', NULL),
('user9', '2024-09-01', NULL),
('user10', '2024-10-01', NULL);

->Dba_log 10 εγγραφές:

INSERT INTO dba_log (username, action_type, table_name)
VALUES
('user1', 'INSERT', 'employee'),
('user2', 'UPDATE', 'job'),
('user3', 'DELETE', 'applies'),
('user4', 'INSERT', 'degree'),
('user5', 'UPDATE', 'requires'),
('user6', 'DELETE', 'has_degree'),
('user7', 'INSERT', 'languages'),
('user8', 'UPDATE', 'subject'),
('user9', 'DELETE', 'project'),
('user10', 'INSERT', 'evaluator');
