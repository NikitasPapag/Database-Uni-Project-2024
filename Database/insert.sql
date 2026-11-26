->Etaireia 3x2=6 εγγραφές:

INSERT INTO etaireia (AFM, DOY, name, tel, street, num, city, country) VALUES
('123456789', 'DOY Athinon', 'Etairia A', '2101234567', 'Odos A', 10, 'Athina', 'Ellada'),
('987654321', 'DOY Peiraios', 'Etairia B', '2109876543', 'Odos B', 20, 'Peiraias', 'Ellada'),
('112233445', 'DOY Thessalonikis', 'Etairia C', '2310123456', 'Odos C', 30, 'Thessaloniki', 'Ellada'),
('223344556', 'DOY Kritis', 'Etairia D', '2810123456', 'Odos D', 40, 'Irakleio', 'Ellada'),
('334455667', 'DOY Patron', 'Etairia E', '2610123456', 'Odos E', 50, 'Patra', 'Ellada'),
('445566778', 'DOY Larisis', 'Etairia F', '2410123456', 'Odos F', 60, 'Larisa', 'Ellada');


->User 12x2=24 εγγραφές:

INSERT INTO user (username, password, name, lastname, reg_date, email) VALUES
('user1', 'password1', 'Nikos', 'Papadopoulos', CURRENT_TIMESTAMP, 'user1@example.com'),
('user2', 'password2', 'Maria', 'Ioannou', CURRENT_TIMESTAMP, 'user2@example.com'),
('user3', 'password3', 'Giorgos', 'Petrou', CURRENT_TIMESTAMP, 'user3@example.com'),
('user4', 'password4', 'Eleni', 'Nikolaou', CURRENT_TIMESTAMP, 'user4@example.com'),
('user5', 'password5', 'Kostas', 'Georgiou', CURRENT_TIMESTAMP, 'user5@example.com'),
('user6', 'password6', 'Anna', 'Pavlou', CURRENT_TIMESTAMP, 'user6@example.com'),
('user7', 'password7', 'Giannis', 'Papadakis', CURRENT_TIMESTAMP, 'user7@example.com'),
('user8', 'password8', 'Dimitris', 'Konstantinou', CURRENT_TIMESTAMP, 'user8@example.com'),
('user9', 'password9', 'Vasilis', 'Theodorou', CURRENT_TIMESTAMP, 'user9@example.com'),
('user10', 'password10', 'Katerina', 'Christou', CURRENT_TIMESTAMP, 'user10@example.com'),
('user11', 'password11', 'Alexandros', 'Oikonomou', CURRENT_TIMESTAMP, 'user11@example.com'),
('user12', 'password12', 'Sofia', 'Papagianni', CURRENT_TIMESTAMP, 'user12@example.com'),
('user13', 'password13', 'Michalis', 'Rousos', CURRENT_TIMESTAMP, 'user13@example.com'),
('user14', 'password14', 'Irene', 'Matsouka', CURRENT_TIMESTAMP, 'user14@example.com'),
('user15', 'password15', 'Panos', 'Alexiou', CURRENT_TIMESTAMP, 'user15@example.com'),
('user16', 'password16', 'Eirini', 'Stamou', CURRENT_TIMESTAMP, 'user16@example.com'),
('user17', 'password17', 'Manos', 'Kalogeropoulos', CURRENT_TIMESTAMP, 'user17@example.com'),
('user18', 'password18', 'Olga', 'Triantafyllou', CURRENT_TIMESTAMP, 'user18@example.com'),
('user19', 'password19', 'Spyros', 'Lambrou', CURRENT_TIMESTAMP, 'user19@example.com'),
('user20', 'password20', 'Rania', 'Xanthopoulou', CURRENT_TIMESTAMP, 'user20@example.com'),
('user21', 'password21', 'Andreas', 'Foukas', CURRENT_TIMESTAMP, 'user21@example.com'),
('user22', 'password22', 'Margarita', 'Vassilaki', CURRENT_TIMESTAMP, 'user22@example.com'),
('user23', 'password23', 'Achilleas', 'Demetriou', CURRENT_TIMESTAMP, 'user23@example.com'),
('user24', 'password24', 'Vicky', 'Kyrkou', CURRENT_TIMESTAMP, 'user24@example.com');


->Evaluator 6x2=12 εγγραφές:

INSERT INTO evaluator (username, exp_years, firm) VALUES
('user1', 5, '123456789'),
('user2', 3, '987654321'),
('user3', 8, '112233445'),
('user4', 4, '223344556'),
('user5', 2, '334455667'),
('user6', 10, '445566778'),
('user13', 6, '123456789'),
('user14', 7, '987654321'),
('user15', 1, '112233445'),
('user16', 9, '223344556'),
('user17', 11, '334455667'),
('user18', 12, '445566778');


->Employee 6x2=12 εγγραφές:

INSERT INTO employee (username, bio, sistatikes, certificates) VALUES
('user7', 'Bio1', 'Sistatikes1', 'Cert1'),
('user8', 'Bio2', 'Sistatikes2', 'Cert2'),
('user9', 'Bio3', 'Sistatikes3', 'Cert3'),
('user10', 'Bio4', 'Sistatikes4', 'Cert4'),
('user11', 'Bio5', 'Sistatikes5', 'Cert5'),
('user12', 'Bio6', 'Sistatikes6', 'Cert6'),
('user19', 'Bio7', 'Sistatikes7', 'Cert7'),
('user20', 'Bio8', 'Sistatikes8', 'Cert8'),
('user21', 'Bio9', 'Sistatikes9', 'Cert9'),
('user22', 'Bio10', 'Sistatikes10', 'Cert10'),
('user23', 'Bio11', 'Sistatikes11', 'Cert11'),
('user24', 'Bio12', 'Sistatikes12', 'Cert12');


->Languages 4x2=8 εγγραφές:

INSERT INTO languages (candid, lang) VALUES
('user7', 'ENG'),
('user8', 'FR'),
('user9', 'SP'),
('user10', 'GE'),
('user19', 'CH'),
('user20', 'GR'),
('user21', 'ENG'),
('user22', 'FR');


->Project 7x2=14 εγγραφές:

INSERT INTO project (candid, num, descr, url) VALUES
('user7', 1, 'Project1', 'http://project1.com'),
('user8', 2, 'Project2', 'http://project2.com'),
('user9', 3, 'Project3', 'http://project3.com'),
('user10', 4, 'Project4', 'http://project4.com'),
('user11', 5, 'Project5', 'http://project5.com'),
('user12', 6, 'Project6', 'http://project6.com'),
('user19', 7, 'Project7', 'http://project7.com'),
('user20', 8, 'Project8', 'http://project8.com'),
('user21', 9, 'Project9', 'http://project9.com'),
('user22', 10, 'Project10', 'http://project10.com'),
('user23', 11, 'Project11', 'http://project11.com'),
('user24', 12, 'Project12', 'http://project12.com'),
('user7', 13, 'Project13', 'http://project13.com'),
('user8', 14, 'Project14', 'http://project14.com');


->Job 8x2=16 εγγραφές:

INSERT INTO job (id, start_date, salary, position, edra, evaluator, announce_date, submission_date) VALUES
(1, '2024-01-01', 1500.00, 'Position1', 'Athens', 'user1', CURRENT_TIMESTAMP, '2024-01-15'),
(2, '2024-01-02', 1800.00, 'Position2', 'Peiraias', 'user2', CURRENT_TIMESTAMP, '2024-01-16'),
(3, '2024-01-03', 1700.00, 'Position3', 'Thessaloniki', 'user3', CURRENT_TIMESTAMP, '2024-01-17'),
(4, '2024-01-04', 1600.00, 'Position4', 'Heraklion', 'user4', CURRENT_TIMESTAMP, '2024-01-18'),
(5, '2024-01-05', 1400.00, 'Position5', 'Patra', 'user5', CURRENT_TIMESTAMP, '2024-01-19'),
(6, '2024-01-06', 1900.00, 'Position6', 'Larisa', 'user6', CURRENT_TIMESTAMP, '2024-01-20'),
(7, '2024-01-07', 2000.00, 'Position7', 'Volos', 'user13', CURRENT_TIMESTAMP, '2024-01-21'),
(8, '2024-01-08', 2200.00, 'Position8', 'Ioannina', 'user14', CURRENT_TIMESTAMP, '2024-01-22'),
(9, '2024-01-09', 2300.00, 'Position9', 'Athens', 'user15', CURRENT_TIMESTAMP, '2024-01-23'),
(10, '2024-01-10', 2100.00, 'Position10', 'Peiraias', 'user16', CURRENT_TIMESTAMP, '2024-01-24'),
(11, '2024-01-11', 2500.00, 'Position11', 'Thessaloniki', 'user17', CURRENT_TIMESTAMP, '2024-01-25'),
(12, '2024-01-12', 2400.00, 'Position12', 'Heraklion', 'user18', CURRENT_TIMESTAMP, '2024-01-26'),
(13, '2024-01-13', 2600.00, 'Position13', 'Patra', 'user1', CURRENT_TIMESTAMP, '2024-01-27'),
(14, '2024-01-14', 2800.00, 'Position14', 'Larisa', 'user2', CURRENT_TIMESTAMP, '2024-01-28'),
(15, '2024-01-15', 2700.00, 'Position15', 'Volos', 'user3', CURRENT_TIMESTAMP, '2024-01-29'),
(16, '2024-01-16', 2900.00, 'Position16', 'Ioannina', 'user4', CURRENT_TIMESTAMP, '2024-01-30');


->Subject 8x2=16 εγγραφές:

INSERT INTO subject (title, description, belongsto) VALUES
('Subject1', 'Description1', NULL),
('Subject2', 'Description2', 'Subject1'),
('Subject3', 'Description3', 'Subject2'),
('Subject4', 'Description4', 'Subject3'),
('Subject5', 'Description5', 'Subject4'),
('Subject6', 'Description6', 'Subject5'),
('Subject7', 'Description7', 'Subject6'),
('Subject8', 'Description8', 'Subject7'),
('Subject9', 'Description9', 'Subject8'),
('Subject10', 'Description10', 'Subject9'),
('Subject11', 'Description11', 'Subject10'),
('Subject12', 'Description12', 'Subject11'),
('Subject13', 'Description13', 'Subject12'),
('Subject14', 'Description14', 'Subject13'),
('Subject15', 'Description15', 'Subject14'),
('Subject16', 'Description16', 'Subject15');


->Requires 8x2=16 εγγραφές:

INSERT INTO requires (job_id, subject_title) VALUES
(1, 'Subject1'),
(2, 'Subject2'),
(3, 'Subject3'),
(4, 'Subject4'),
(5, 'Subject5'),
(6, 'Subject6'),
(7, 'Subject7'),
(8, 'Subject8'),
(9, 'Subject9'),
(10, 'Subject10'),
(11, 'Subject11'),
(12, 'Subject12'),
(13, 'Subject13'),
(14, 'Subject14'),
(15, 'Subject15'),
(16, 'Subject16');

->Applies 6x2=12 εγγραφές:

INSERT INTO applies (cand_usrname, job_id) VALUES
('user7', 1),
('user8', 2),
('user9', 3),
('user10', 4),
('user11', 5),
('user12', 6),
('user19', 7),
('user20', 8),
('user21', 9),
('user22', 10),
('user23', 11),
('user24', 12);


->Degree 6x2=12 εγγραφές:
 
INSERT INTO degree (titlos, idryma, bathmida) VALUES
('Plhroforikh', 'Ethniko Metsobio Polytexneio', 'BSc'),
('Mhchanikh Logismikou', 'Panepisthmio Athhnwn', 'MSc'),
('Hlektrologos Mhchanikos', 'Panepisthmio Patron', 'BSc'),
('Viomixanikh', 'Panepisthmio Thessalias', 'PhD'),
('Xhmeia', 'Panepisthmio Krhths', 'BSc'),
('Mhxanikos Ypologistwn', 'Panepisthmio Thessalonikhs', 'MSc'),
('Nomo8esia', 'Panepisthmio Dhmosias Dioikhsis', 'BSc'),
('Biotexnologia', 'Panepisthmio Iwanninwn', 'PhD'),
('Oikonomika', 'Oikonomiko Panepisthmio Athhnwn', 'BSc'),
('Iatrikh', 'Panepisthmio Krhths', 'PhD'),
('Geoponia', 'Panepisthmio Thessalias', 'BSc'),
('Plhroforiaka Systhmata', 'Texniko Panepisthmio Kreta', 'MSc');
 
 
->Has_degree 4x2=8 εγγραφές:
 
INSERT INTO has_degree (degr_title, degr_idryma, cand_usrname, etos, grade) VALUES
('Plhroforikh', 'Ethniko Metsobio Polytexneio', 'user7', 2010, 8.5),
('Mhchanikh Logismikou', 'Panepisthmio Athhnwn', 'user8', 2012, 9.0),
('Hlektrologos Mhchanikos', 'Panepisthmio Patron', 'user9', 2008, 7.8),
('Viomixanikh', 'Panepisthmio Thessalias', 'user10', 2015, 8.3),
('Xhmeia', 'Panepisthmio Krhths', 'user11', 2011, 8.1),
('Mhxanikos Ypologistwn', 'Panepisthmio Thessalonikhs', 'user12', 2016, 9.2),
('Nomo8esia', 'Panepisthmio Dhmosias Dioikhsis', 'user19', 2009, 7.5),
('Biotexnologia', 'Panepisthmio Iwanninwn', 'user20', 2013, 8.7);
