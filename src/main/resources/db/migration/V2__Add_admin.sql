insert into usr (id, username, password, cative)
values(1, 'admin', '1234',true);

insert into user_role(user_id, roles)
values(1, 'USER'),(1,'ADMIN');