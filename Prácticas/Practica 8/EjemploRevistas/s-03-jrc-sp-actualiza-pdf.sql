--@Autor:           Jorge A. Rodriguez C
--@Fecha creación:  29/04/2017
--@Descripción:     Procedimiento para acualizar un dato blob empleando 
--                  transparencia de actualizacion.

create or replace procedure actualiza_pdf(v_revista_id in number, v_pdf in blob ) is
	
begin
	--en este caso todos los blobs se van al sitio 2.
	delete from t_update_revista_3 where revista_id = v_revista_id;
	insert into t_update_revista_3 (revista_id,pdf) 
		values(v_revista_id,v_pdf);
	update t_update_revista_3 
	set  pdf = (
		select pdf 
		from t_update_revista_3 
		where revista_id = v_revista_id
	) where revista_id = v_revista_id;
			
end;
/