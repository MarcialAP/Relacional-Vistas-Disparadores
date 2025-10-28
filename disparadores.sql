create table inserciones (
    id serial primary key,
    fecha_insercion timestamp
);

create table eliminaciones (
    id serial primary key,
    fecha_eliminacion timestamp
);

create or replace function fecha_insercion()
returns trigger as $$
begin
    insert into inserciones(fecha_insercion) values (now());
    return new;
end;
$$ language plpgsql;

create or replace function fecha_eliminacion()
returns trigger as $$
begin
    insert into eliminaciones(fecha_eliminacion) values (now());
    return old;
end;
$$ language plpgsql;

create trigger fecha_insercion
after insert on film
for each row
execute procedure fecha_insercion();

create trigger fecha_eliminacion
after delete on film
for each row
execute procedure fecha_eliminacion();

-- prueba:
-- insert into film(title, language_id) values ('prueba', 1);