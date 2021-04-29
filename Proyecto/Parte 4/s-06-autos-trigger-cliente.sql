--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   05/02/2021
--@Descripcion:         Instead of trigger empleado para implementar DML en la tabla cliente (insert, delete)
create or replace trigger t_dml_cliente
    instead of insert or update or delete on cliente
declare
    v_count number;
begin
    case
        ---------------------------------------------------------------------------
        --En el caso de insertar
        ---------------------------------------------------------------------------            
        when inserting then
            ---Cliente f1
            if upper(substr(:new.ap_paterno,1,1)) between 'A' and 'I' THEN
                insert into cliente_f1( cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email) 
                values( :new.cliente_id, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.num_identificacion, :new.email);
            ---Cliente f2
            elsif upper(substr(:new.ap_paterno,1,1)) between 'J' and 'Q' THEN
                insert into cliente_f2( cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email) 
                values( :new.cliente_id, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.num_identificacion, :new.email);            
            ---Cliente f3
            elsif upper(substr(:new.ap_paterno,1,1)) between 'R' and 'Z' THEN
                insert into cliente_f3( cliente_id, nombre, ap_paterno, ap_materno, num_identificacion, email) 
                values( :new.cliente_id, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.num_identificacion, :new.email);
            ---Error
            else
                raise_application_error(-20010,'ap_paterno invalido: ');
            end if;
        ---------------------------------------------------------------------------
        --En el caso de Actualizar
        ---------------------------------------------------------------------------        
        when updating then
            raise_application_error(-20030, 
            'La instruccion update no se encuentra implementada');
        ---------------------------------------------------------------------------
        --En el caso de eliminar
        ---------------------------------------------------------------------------        
        when deleting then
            ---Cliente f1
            if upper(substr(:old.ap_paterno,1,1)) between 'A' and 'I' THEN
                delete from cliente_f1 where cliente_id = :old.cliente_id;
            ---Cliente f2
            elsif upper(substr(:old.ap_paterno,1,1)) between 'J' and 'Q' THEN
                delete from cliente_f2 where cliente_id = :old.cliente_id;
            ---Cliente f3
            elsif upper(substr(:old.ap_paterno,1,1)) between 'R' and 'Z' THEN
                delete from cliente_f3 where cliente_id = :old.cliente_id;
            ---Error
            end if;
    end case;
end;
/
show errors;