INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '41cdc65c-6158-48b0-a8e6-34c0ff8fd74e', true, TIMESTAMP '2024-06-07 18:45:36.429', NULL, NULL, '00000', '318510d2-a904-46a1-bcd4-1540a6ea57d9@anonymous.com', 'Anonymous', TIMESTAMP '2024-06-07 18:45:36.473', NULL, 'Anonymous', 0, '1000000000', false, TIMESTAMP '2024-06-07 18:42:44.361', 'Anonymized', NULL, 'Anonymized', 'Anonymized', 'Anonymized', 'Anonymized', '00000', 1
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '41cdc65c-6158-48b0-a8e6-34c0ff8fd74e');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '6e148bd5-47f6-4022-b9da-07cfaa294f7a', false, NULL, DATE '1991-07-05', NULL, '25508578', 'johndoe@email.com', 'John', TIMESTAMP '2024-06-07 18:47:17.367', NULL, 'Doe', 0, '478-256-2604', true, TIMESTAMP '2024-06-07 18:47:17.262', 'New Orleans', 'Apt. 114', 'North Ville', '1134', 'Louisiana', 'Bourbon Street', '70130', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '6e148bd5-47f6-4022-b9da-07cfaa294f7a');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT 'f6a7b8c9-d0e1-f2a3-b4c5-d6e7f8a9b0c1', false, NULL, DATE '1980-01-22', NULL, '67823456', 'sophia.anderson@email.com', 'Sophia', TIMESTAMP '2024-06-07 18:57:00.000', NULL, 'Anderson', 250, '3125555566', false, TIMESTAMP '2024-06-07 18:57:00.000', 'Chicago', 'Apt 20B', 'Lincoln Park', '123', 'Illinois', 'North Avenue', '60614', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = 'f6a7b8c9-d0e1-f2a3-b4c5-d6e7f8a9b0c1');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '3a4b5c6d-7e8f-9a0b-1c2d-3e4f5a6b7c8d', false, NULL, DATE '1992-07-25', NULL, '78922233', 'jane.smith@email.com', 'Jane', TIMESTAMP '2024-06-07 18:51:00.000', NULL, 'Smith', 50, '3105554321', true, TIMESTAMP '2024-06-07 18:51:00.000', 'New York', NULL, 'Midtown', '150', 'New York', 'Broadway', '10001', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '3a4b5c6d-7e8f-9a0b-1c2d-3e4f5a6b7c8d');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '5f6b7d8e-9c0a-1b2d-3c4a-5f6b7d8e9c0a', false, NULL, DATE '1978-11-01', NULL, '12378901', 'robert.johnson@example.com', 'Robert', TIMESTAMP '2024-06-07 18:52:00.000', NULL, 'Johnson', 200, '2125559876', false, TIMESTAMP '2024-06-07 18:52:00.000', 'Chicago', NULL, 'The Loop', '225', 'Illinois', 'Wacker Drive', '60601', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '5f6b7d8e-9c0a-1b2d-3c4a-5f6b7d8e9c0a');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '7b8d9e0f-1a2b-3c4d-5e6f-7a8b9c0d1e2f', false, NULL, DATE '1995-04-18', NULL, '23489012', 'emily.davis@email.com', 'Emily', TIMESTAMP '2024-06-07 18:53:00.000', NULL, 'Davis', 75, '4045551122', true, TIMESTAMP '2024-06-07 18:53:00.000', 'Atlanta', 'Unit 3B', 'Buckhead', '75', 'Georgia', 'Peachtree Street', '30305', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '7b8d9e0f-1a2b-3c4d-5e6f-7a8b9c0d1e2f');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '9a0b1c2d-3e4f-5a6b-7c8d-9e0f1a2b3c4d', false, NULL, DATE '1988-09-03', NULL, '34590123', 'david.wilson@example.com', 'David', TIMESTAMP '2024-06-07 18:54:00.000', NULL, 'Wilson', 150, '7135552233', true, TIMESTAMP '2024-06-07 18:54:00.000', 'Houston', NULL, 'The Heights', '101', 'Texas', 'Washington Avenue', '77007', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '9a0b1c2d-3e4f-5a6b-7c8d-9e0f1a2b3c4d');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT 'b2c3d4e5-f6a7-8b9c-0d1e-2f3a4b5c6d7e', false, NULL, DATE '1975-02-28', NULL, '45601234', 'olivia.moore@email.com', 'Olivia', TIMESTAMP '2024-06-07 18:55:00.000', NULL, 'Moore', 300, '5035553344', false, TIMESTAMP '2024-06-07 18:55:00.000', 'Portland', 'Suite 20', 'Pearl District', '25', 'Oregon', 'NW 13th Ave', '97209', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = 'b2c3d4e5-f6a7-8b9c-0d1e-2f3a4b5c6d7e');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT 'd4e5f6a7-b8c9-d0e1-f2a3-b4c5d6e7f8a9', false, NULL, DATE '1998-06-14', NULL, '56712345', 'william.taylor@example.com', 'William', TIMESTAMP '2024-06-07 18:56:00.000', NULL, 'Taylor', 80, '6175554455', true, TIMESTAMP '2024-06-07 18:56:00.000', 'Boston', 'Floor 5', 'Beacon Hill', '10', 'Massachusetts', 'Charles Street', '02108', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = 'd4e5f6a7-b8c9-d0e1-f2a3-b4c5d6e7f8a9');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '1c2d3e4f-5a6b-7c8d-9e0f-1a2b3c4d5e6e', false, NULL, DATE '1990-05-30', NULL, '78934567', 'james.thomas@example.com', 'James', TIMESTAMP '2024-06-07 18:58:00.000', NULL, 'Thomas', 120, '4155556677', true, TIMESTAMP '2024-06-07 18:58:00.000', 'San Francisco', NULL, 'Nob Hill', '400', 'California', 'Larkin Street', '94109', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '1c2d3e4f-5a6b-7c8d-9e0f-1a2b3c4d5e6e');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '3a4b5c6d-7e8f-9a0b-1c2d-3e4f5a6b7c8f', false, NULL, DATE '1983-08-07', NULL, '89045678', 'isabella.martin@email.com', 'Isabella', TIMESTAMP '2024-06-07 18:59:00.000', NULL, 'Martin', 180, '5125557788', true, TIMESTAMP '2024-06-07 18:59:00.000', 'Austin', 'Unit 7', 'South Congress', '15', 'Texas', 'South Congress Ave', '78704', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '3a4b5c6d-7e8f-9a0b-1c2d-3e4f5a6b7c8f');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '5f6b7d8e-9c0a-1b2d-3c4a-5f6b7d8e9c0b', false, NULL, DATE '1970-02-14', NULL, '90156789', 'michael.white@example.com', 'Michael', TIMESTAMP '2024-06-07 19:00:00.000', NULL, 'White', 400, '2065558899', false, TIMESTAMP '2024-06-07 19:00:00.000', 'Seattle', NULL, 'Capitol Hill', '300', 'Washington', 'Pike Street', '98122', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '5f6b7d8e-9c0a-1b2d-3c4a-5f6b7d8e9c0b');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '7b8d9e0f-1a2b-3c4d-5e6f-7a8b9c0d1e3a', false, NULL, DATE '1993-06-20', NULL, '01267890', 'chloe.harris@email.com', 'Chloe', TIMESTAMP '2024-06-07 19:01:00.000', NULL, 'Harris', 90, '6025559900', true, TIMESTAMP '2024-06-07 19:01:00.000', 'Phoenix', NULL, 'Camelback East', '20', 'Arizona', 'E Camelback Rd', '85018', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '7b8d9e0f-1a2b-3c4d-5e6f-7a8b9c0d1e3a');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '9a0b1c2d-3e4f-5a6b-7c8d-9e0f1a2b3c4e', false, NULL, DATE '1987-10-10', NULL, '12378901', 'daniel.clark@example.com', 'Daniel', TIMESTAMP '2024-06-07 19:02:00.000', NULL, 'Clark', 110, '8135550011', true, TIMESTAMP '2024-06-07 19:02:00.000', 'Tampa', 'Apt 301', 'Hyde Park', '12', 'Florida', 'S Howard Ave', '33606', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '9a0b1c2d-3e4f-5a6b-7c8d-9e0f1a2b3c4e');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT 'b2c3d4e5-f6a7-8b9c-0d1e-2f3a4b5c6d7f', false, NULL, DATE '1996-12-05', NULL, '23489012', 'ava.lewis@email.com', 'Ava', TIMESTAMP '2024-06-07 19:03:00.000', NULL, 'Lewis', 60, '6195551122', false, TIMESTAMP '2024-06-07 19:03:00.000', 'San Diego', NULL, 'Gaslamp Quarter', '50', 'California', 'Fifth Avenue', '92101', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = 'b2c3d4e5-f6a7-8b9c-0d1e-2f3a4b5c6d7f');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT 'd4e5f6a7-b8c9-d0e1-f2a3-b4c5d6e7f8b0', false, NULL, DATE '1982-04-09', NULL, '34590123', 'matthew.hall@example.com', 'Matthew', TIMESTAMP '2024-06-07 19:04:00.000', NULL, 'Hall', 220, '2145552233', true, TIMESTAMP '2024-06-07 19:04:00.000', 'Dallas', NULL, 'Uptown', '100', 'Texas', 'McKinney Avenue', '75204', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = 'd4e5f6a7-b8c9-d0e1-f2a3-b4c5d6e7f8b0');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT 'f6a7b8c9-d0e1-f2a3-b4c5-d6e7f8a9b0c2', false, NULL, DATE '1973-07-28', NULL, '45601234', 'mia.king@email.com', 'Mia', TIMESTAMP '2024-06-07 19:05:00.000', NULL, 'King', 350, '3055553344', true, TIMESTAMP '2024-06-07 19:05:00.000', 'Miami', 'Suite 10', 'South Beach', '20', 'Florida', 'Ocean Drive', '33139', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = 'f6a7b8c9-d0e1-f2a3-b4c5-d6e7f8a9b0c2');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '3a4b5c6d-7e8f-9a0b-1c2d-3e4f5a6b7c90', false, NULL, DATE '1989-08-15', NULL, '67823456', 'sofia.hill@email.com', 'Sofia', TIMESTAMP '2024-06-07 19:07:00.000', NULL, 'Hill', 190, '8015555566', true, TIMESTAMP '2024-06-07 19:07:00.000', 'Salt Lake City', NULL, 'Capitol Hill', '111', 'Utah', 'Main Street', '84101', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '3a4b5c6d-7e8f-9a0b-1c2d-3e4f5a6b7c90');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '5f6b7d8e-9c0a-1b2d-3c4a-5f6b7d8e9c0c', false, NULL, DATE '1976-11-20', NULL, '78934567', 'henry.green@example.com', 'Henry', TIMESTAMP '2024-06-07 19:08:00.000', NULL, 'Green', 280, '7205556677', false, TIMESTAMP '2024-06-07 19:08:00.000', 'Denver', 'Apt 40A', 'Highlands', '80', 'Colorado', 'W 32nd Ave', '80211', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '5f6b7d8e-9c0a-1b2d-3c4a-5f6b7d8e9c0c');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '7b8d9e0f-1a2b-3c4d-5e6f-7a8b9c0d1e3b', false, NULL, DATE '1997-01-05', NULL, '89045678', 'amelia.adams@email.com', 'Amelia', TIMESTAMP '2024-06-07 19:09:00.000', NULL, 'Adams', 95, '6145557788', true, TIMESTAMP '2024-06-07 19:09:00.000', 'Columbus', NULL, 'Short North', '250', 'Ohio', 'N High St', '43215', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '7b8d9e0f-1a2b-3c4d-5e6f-7a8b9c0d1e3b');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT '9a0b1c2d-3e4f-5a6b-7c8d-9e0f1a2b3c4f', false, NULL, DATE '1984-06-19', NULL, '90156789', 'logan.baker@example.com', 'Logan', TIMESTAMP '2024-06-07 19:10:00.000', NULL, 'Baker', 160, '3175558899', true, TIMESTAMP '2024-06-07 19:10:00.000', 'Indianapolis', NULL, 'Mass Ave', '45', 'Indiana', 'Massachusetts Ave', '46204', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = '9a0b1c2d-3e4f-5a6b-7c8d-9e0f1a2b3c4f');

INSERT INTO public.customer (id, archived, archived_at, birth_date, created_by_user_id, document, email, first_name, last_modified_at, last_modified_by_user_id, last_name, loyalty_points, phone, promotion_notifications_allowed, registered_at, address_city, address_complement, address_neighborhood, address_number, address_state, address_street, address_zip_code, version)
SELECT 'b497c5e5-b7a2-45d3-9ec3-717794ca6fc4', false, NULL, DATE '1991-03-01', NULL, '56712345', 'noah.wright@example.com', 'Noah', TIMESTAMP '2024-06-07 19:06:00.000', NULL, 'Wright', 130, '7025554455', false, TIMESTAMP '2024-06-07 19:06:00.000', 'Las Vegas', 'Apt 7C', 'The Strip', '3500', 'Nevada', 'Las Vegas Blvd S', '89109', 0
WHERE NOT EXISTS (SELECT 1 FROM public.customer WHERE id = 'b497c5e5-b7a2-45d3-9ec3-717794ca6fc4');

INSERT INTO public."order" (id, customer_id, status, total_amount, total_items, canceled_at, created_by_user_id, last_modified_at, last_modified_by_user_id, paid_at, payment_method, placed_at, ready_at, version, shipping_address_city, shipping_address_complement, shipping_address_neighborhood, shipping_address_number, shipping_address_state, shipping_address_street, shipping_address_zip_code, shipping_cost, shipping_expected_date, shipping_recipient_document, shipping_recipient_first_name, shipping_recipient_last_name, shipping_recipient_phone, billing_address_city, billing_address_complement, billing_address_neighborhood, billing_address_number, billing_address_state, billing_address_street, billing_address_zip_code, billing_document, billing_first_name, billing_last_name, billing_phone)
SELECT 1727196000001, '6e148bd5-47f6-4022-b9da-07cfaa294f7a', 'PLACED', 1000.00, 1, NULL, NULL, TIMESTAMP '2025-09-24 14:20:01.000', NULL, NULL, 'Credit Card', TIMESTAMP '2025-09-24 14:20:01.000', NULL, 0, 'North Ville', 'Apt. 114', 'North Ville', '1134', 'New Orleans', 'Bourbon Street', '70130', 25.00, DATE '2025-09-30', '25508578', 'John', 'Doe', '478-256-2604', 'Louisiana', 'Apt. 114', 'New Orleans', '1134', 'Louisiana', 'Bourbon Street', '70130', '25508578', 'John', 'Doe', '478-256-2604'
WHERE NOT EXISTS (SELECT 1 FROM public."order" WHERE id = 1727196000001);

INSERT INTO public."order" (id, customer_id, status, total_amount, total_items, canceled_at, created_by_user_id, last_modified_at, last_modified_by_user_id, paid_at, payment_method, placed_at, ready_at, version, shipping_address_city, shipping_address_complement, shipping_address_neighborhood, shipping_address_number, shipping_address_state, shipping_address_street, shipping_address_zip_code, shipping_cost, shipping_expected_date, shipping_recipient_document, shipping_recipient_first_name, shipping_recipient_last_name, shipping_recipient_phone, billing_address_city, billing_address_complement, billing_address_neighborhood, billing_address_number, billing_address_state, billing_address_street, billing_address_zip_code, billing_document, billing_first_name, billing_last_name, billing_phone)
SELECT 1727196000002, '6e148bd5-47f6-4022-b9da-07cfaa294f7a', 'PLACED', 2000.00, 2, NULL, NULL, TIMESTAMP '2025-09-24 14:21:05.000', NULL, NULL, 'Debit Card', TIMESTAMP '2025-09-24 14:21:05.000', NULL, 0, 'North Ville', 'Apt. 114', 'North Ville', '1134', 'New Orleans', 'Bourbon Street', '70130', 25.00, DATE '2025-09-30', '25508578', 'John', 'Doe', '478-256-2604', 'Louisiana', 'Apt. 114', 'New Orleans', '1134', 'Louisiana', 'Bourbon Street', '70130', '25508578', 'John', 'Doe', '478-256-2604'
WHERE NOT EXISTS (SELECT 1 FROM public."order" WHERE id = 1727196000002);

INSERT INTO public."order" (id, customer_id, status, total_amount, total_items, canceled_at, created_by_user_id, last_modified_at, last_modified_by_user_id, paid_at, payment_method, placed_at, ready_at, version, shipping_address_city, shipping_address_complement, shipping_address_neighborhood, shipping_address_number, shipping_address_state, shipping_address_street, shipping_address_zip_code, shipping_cost, shipping_expected_date, shipping_recipient_document, shipping_recipient_first_name, shipping_recipient_last_name, shipping_recipient_phone, billing_address_city, billing_address_complement, billing_address_neighborhood, billing_address_number, billing_address_state, billing_address_street, billing_address_zip_code, billing_document, billing_first_name, billing_last_name, billing_phone)
SELECT 1727196000003, '6e148bd5-47f6-4022-b9da-07cfaa294f7a', 'PLACED', 3000.00, 3, NULL, NULL, TIMESTAMP '2025-09-24 14:22:10.000', NULL, NULL, 'PIX', TIMESTAMP '2025-09-24 14:22:10.000', NULL, 0, 'North Ville', 'Apt. 114', 'New Orleans', '1134', 'North Ville', 'Bourbon Street', '70130', 25.00, DATE '2025-09-30', '25508578', 'John', 'Doe', '478-256-2604', 'Louisiana', 'Apt. 114', 'New Orleans', '1134', 'Louisiana', 'Bourbon Street', '70130', '25508578', 'John', 'Doe', '478-256-2604'
WHERE NOT EXISTS (SELECT 1 FROM public."order" WHERE id = 1727196000003);

INSERT INTO public."order" (id, customer_id, status, total_amount, total_items, canceled_at, created_by_user_id, last_modified_at, last_modified_by_user_id, paid_at, payment_method, placed_at, ready_at, version, shipping_address_city, shipping_address_complement, shipping_address_neighborhood, shipping_address_number, shipping_address_state, shipping_address_street, shipping_address_zip_code, shipping_cost, shipping_expected_date, shipping_recipient_document, shipping_recipient_first_name, shipping_recipient_last_name, shipping_recipient_phone, billing_address_city, billing_address_complement, billing_address_neighborhood, billing_address_number, billing_address_state, billing_address_street, billing_address_zip_code, billing_document, billing_first_name, billing_last_name, billing_phone)
SELECT 1727196000004, 'f6a7b8c9-d0e1-f2a3-b4c5-d6e7f8a9b0c1', 'PLACED', 1000.00, 1, NULL, NULL, TIMESTAMP '2025-09-24 14:23:15.000', NULL, NULL, 'Credit Card', TIMESTAMP '2025-09-24 14:23:15.000', NULL, 0, 'Chicago', 'Apt 20B', 'Lincoln Park', '123', 'Illinois', 'North Avenue', '60614', 30.00, DATE '2025-09-30', '67823456', 'Sophia', 'Anderson', '3125555566', 'Chicago', 'Apt 20B', 'Lincoln Park', '123', 'Illinois', 'North Avenue', '60614', '67823456', 'Sophia', 'Anderson', '3125555566'
WHERE NOT EXISTS (SELECT 1 FROM public."order" WHERE id = 1727196000004);

INSERT INTO public."order" (id, customer_id, status, total_amount, total_items, canceled_at, created_by_user_id, last_modified_at, last_modified_by_user_id, paid_at, payment_method, placed_at, ready_at, version, shipping_address_city, shipping_address_complement, shipping_address_neighborhood, shipping_address_number, shipping_address_state, shipping_address_street, shipping_address_zip_code, shipping_cost, shipping_expected_date, shipping_recipient_document, shipping_recipient_first_name, shipping_recipient_last_name, shipping_recipient_phone, billing_address_city, billing_address_complement, billing_address_neighborhood, billing_address_number, billing_address_state, billing_address_street, billing_address_zip_code, billing_document, billing_first_name, billing_last_name, billing_phone)
SELECT 1727196000005, 'f6a7b8c9-d0e1-f2a3-b4c5-d6e7f8a9b0c1', 'PLACED', 2000.00, 2, NULL, NULL, TIMESTAMP '2025-09-24 14:24:20.000', NULL, NULL, 'PIX', TIMESTAMP '2025-09-24 14:24:20.000', NULL, 0, 'Chicago', 'Apt 20B', 'Lincoln Park', '123', 'Illinois', 'North Avenue', '60614', 30.00, DATE '2025-09-30', '67823456', 'Sophia', 'Anderson', '3125555566', 'Chicago', 'Apt 20B', 'Lincoln Park', '123', 'Illinois', 'North Avenue', '60614', '67823456', 'Sophia', 'Anderson', '3125555566'
WHERE NOT EXISTS (SELECT 1 FROM public."order" WHERE id = 1727196000005);

INSERT INTO public."order" (id, customer_id, status, total_amount, total_items, canceled_at, created_by_user_id, last_modified_at, last_modified_by_user_id, paid_at, payment_method, placed_at, ready_at, version, shipping_address_city, shipping_address_complement, shipping_address_neighborhood, shipping_address_number, shipping_address_state, shipping_address_street, shipping_address_zip_code, shipping_cost, shipping_expected_date, shipping_recipient_document, shipping_recipient_first_name, shipping_recipient_last_name, shipping_recipient_phone, billing_address_city, billing_address_complement, billing_address_neighborhood, billing_address_number, billing_address_state, billing_address_street, billing_address_zip_code, billing_document, billing_first_name, billing_last_name, billing_phone)
SELECT 1727196000006, 'f6a7b8c9-d0e1-f2a3-b4c5-d6e7f8a9b0c1', 'PLACED', 3000.00, 3, NULL, NULL, TIMESTAMP '2025-09-24 14:25:30.000', NULL, NULL, 'Credit Card', TIMESTAMP '2025-09-24 14:25:30.000', NULL, 0, 'Chicago', 'Apt 20B', 'Lincoln Park', '123', 'Illinois', 'North Avenue', '60614', 30.00, DATE '2025-09-30', '67823456', 'Sophia', 'Anderson', '3125555566', 'Chicago', 'Apt 20B', 'Lincoln Park', '123', 'Illinois', 'North Avenue', '60614', '67823456', 'Sophia', 'Anderson', '3125555566'
WHERE NOT EXISTS (SELECT 1 FROM public."order" WHERE id = 1727196000006);

INSERT INTO public.order_item (id, order_id, price, product_id, product_name, quantity, total_amount)
SELECT 1727196000101, 1727196000001, 1000.00, 'fffe6ec2-7103-48b3-8e4f-3b58e43fb75a', 'Notebook X11', 1, 1000.00
WHERE NOT EXISTS (SELECT 1 FROM public.order_item WHERE id = 1727196000101);

INSERT INTO public.order_item (id, order_id, price, product_id, product_name, quantity, total_amount)
SELECT 1727196000102, 1727196000002, 1000.00, 'fffe6ec2-7103-48b3-8e4f-3b58e43fb75a', 'Notebook X11', 2, 2000.00
WHERE NOT EXISTS (SELECT 1 FROM public.order_item WHERE id = 1727196000102);

INSERT INTO public.order_item (id, order_id, price, product_id, product_name, quantity, total_amount)
SELECT 1727196000103, 1727196000003, 1000.00, 'fffe6ec2-7103-48b3-8e4f-3b58e43fb75a', 'Notebook X11', 3, 3000.00
WHERE NOT EXISTS (SELECT 1 FROM public.order_item WHERE id = 1727196000103);

INSERT INTO public.order_item (id, order_id, price, product_id, product_name, quantity, total_amount)
SELECT 1727196000104, 1727196000004, 1000.00, 'fffe6ec2-7103-48b3-8e4f-3b58e43fb75a', 'Notebook X11', 1, 1000.00
WHERE NOT EXISTS (SELECT 1 FROM public.order_item WHERE id = 1727196000104);

INSERT INTO public.order_item (id, order_id, price, product_id, product_name, quantity, total_amount)
SELECT 1727196000105, 1727196000005, 1000.00, 'fffe6ec2-7103-48b3-8e4f-3b58e43fb75a', 'Notebook X11', 2, 2000.00
WHERE NOT EXISTS (SELECT 1 FROM public.order_item WHERE id = 1727196000105);

INSERT INTO public.order_item (id, order_id, price, product_id, product_name, quantity, total_amount)
SELECT 1727196000106, 1727196000006, 1000.00, 'fffe6ec2-7103-48b3-8e4f-3b58e43fb75a', 'Notebook X11', 3, 3000.00
WHERE NOT EXISTS (SELECT 1 FROM public.order_item WHERE id = 1727196000106);

INSERT INTO public.shopping_cart (id, created_at, created_by_user_id, last_modified_at, last_modified_by_user_id, total_amount, total_items, version, customer_id)
SELECT '9c8d7e6f-5a4b-3c2d-1e0f-9d8c7b6a5f4e', TIMESTAMP '2025-09-24 14:26:00.000', NULL, TIMESTAMP '2025-09-24 14:26:00.000', NULL, 2000.00, 2, 0, '6e148bd5-47f6-4022-b9da-07cfaa294f7a'
WHERE NOT EXISTS (SELECT 1 FROM public.shopping_cart WHERE id = '9c8d7e6f-5a4b-3c2d-1e0f-9d8c7b6a5f4e');

INSERT INTO public.shopping_cart (id, created_at, created_by_user_id, last_modified_at, last_modified_by_user_id, total_amount, total_items, version, customer_id)
SELECT '1b2c3d4e-5a6b-7c8d-9e0f-1a2b3c4d5e6f', TIMESTAMP '2025-09-24 14:26:00.000', NULL, TIMESTAMP '2025-09-24 14:26:00.000', NULL, 1000.00, 1, 0, 'f6a7b8c9-d0e1-f2a3-b4c5-d6e7f8a9b0c1'
WHERE NOT EXISTS (SELECT 1 FROM public.shopping_cart WHERE id = '1b2c3d4e-5a6b-7c8d-9e0f-1a2b3c4d5e6f');

INSERT INTO public.shopping_cart_item (id, available, created_at, created_by_user_id, last_modified_at, last_modified_by_user_id, name, price, product_id, quantity, total_amount, version, shopping_cart_id)
SELECT '8c9a7d6e-5f4c-3b2a-1c0b-9d8e7f6a5b4c', true, TIMESTAMP '2025-09-24 14:27:00.000', NULL, TIMESTAMP '2025-09-24 14:27:00.000', NULL, 'Notebook X11', 1000.00, 'fffe6ec2-7103-48b3-8e4f-3b58e43fb75a', 2, 2000.00, 0, '9c8d7e6f-5a4b-3c2d-1e0f-9d8c7b6a5f4e'
WHERE NOT EXISTS (SELECT 1 FROM public.shopping_cart_item WHERE id = '8c9a7d6e-5f4c-3b2a-1c0b-9d8e7f6a5b4c');

INSERT INTO public.shopping_cart_item (id, available, created_at, created_by_user_id, last_modified_at, last_modified_by_user_id, name, price, product_id, quantity, total_amount, version, shopping_cart_id)
SELECT '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', true, TIMESTAMP '2025-09-24 14:27:00.000', NULL, TIMESTAMP '2025-09-24 14:27:00.000', NULL, 'Notebook X11', 1000.00, 'fffe6ec2-7103-48b3-8e4f-3b58e43fb75a', 1, 1000.00, 0, '1b2c3d4e-5a6b-7c8d-9e0f-1a2b3c4d5e6f'
WHERE NOT EXISTS (SELECT 1 FROM public.shopping_cart_item WHERE id = '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e');
