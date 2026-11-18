-- Wards and ambulances every installation starts with; patients, donors and staff are entered in the app.
INSERT INTO room (room_number, floor, room_type, daily_rate) VALUES
  ('101', 1, 'GENERAL', 120.00), ('102', 1, 'GENERAL', 120.00),
  ('201', 2, 'SEMI_PRIVATE', 220.00), ('202', 2, 'PRIVATE', 350.00),
  ('301', 3, 'ICU', 900.00);
INSERT INTO bed (room_id, label) SELECT id, 'A' FROM room;
INSERT INTO bed (room_id, label) SELECT id, 'B' FROM room WHERE room_type IN ('GENERAL', 'SEMI_PRIVATE', 'ICU');
INSERT INTO bed (room_id, label) SELECT id, 'C' FROM room WHERE room_type = 'GENERAL';
INSERT INTO ambulance (registration, kind, status) VALUES
  ('AMB-01', 'BASIC', 'AVAILABLE'), ('AMB-02', 'BASIC', 'AVAILABLE'), ('AMB-03', 'ADVANCED', 'AVAILABLE');
