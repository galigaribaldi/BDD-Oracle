--@Author:              Rodrigo Francisco Pablo 
--@Fecha de creacion:   14/01/2021
--@Descripcion:         Eliminacion y creacion de usuarios

clear screen
whenever sqlerror exit rollback;
Prompt ============================
Prompt Creando ligas en hgcg_s1
Prompt ============================

--Ligas en la pdb hgcg_s1
Prompt Creando ligas en hgcg_s1
connect autos_bdd/autos_bdd@hgcg_s1
-- PDB local
create database link hgcg_s2.fi.unam using 'HGCG_S2';
--PDB remotas
create database link igcg_s1.fi.unam using 'IGCG_S1';
Create database link igcg_s2.fi.unam using 'IGCG_S2';

Prompt ============================
Prompt Creando ligas en hgcg_s2
Prompt ============================

--Ligas en la pdb hgcg_s2
Prompt Creando ligas en hgcg_s2
connect autos_bdd/autos_bdd@hgcg_s2
-- PDB local
create database link hgcg_s1.fi.unam using 'HGCG_S1';
--PDB remotas
create database link igcg_s1.fi.unam using 'IGCG_S1';
Create database link igcg_s2.fi.unam using 'IGCG_S2';

Prompt ============================
Prompt Creando ligas en igcg_s1
Prompt ============================

--Ligas en la pdb igcg_s1
Prompt Creando ligas en igcg_s1
connect autos_bdd/autos_bdd@igcg_s1
-- PDB local
Create database link igcg_s2.fi.unam using 'IGCG_S2';
--PDB remotas
create database link hgcg_s1.fi.unam using 'HGCG_S1';
create database link hgcg_s2.fi.unam using 'HGCG_S2';

Prompt ============================
Prompt Creando ligas en igcg_s2
Prompt ============================
--Ligas en la pdb igcg_s2
Prompt Creando ligas en igcg_s2
connect autos_bdd/autos_bdd@igcg_s2
-- PDB local
Create database link igcg_s1.fi.unam using 'IGCG_S1';
--PDB remotas
create database link hgcg_s1.fi.unam using 'HGCG_S1';
create database link hgcg_s2.fi.unam using 'HGCG_S2';

prompt Listo!
disconnect