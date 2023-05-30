select * from grupoartisticoinstitucional;
select * from cursocultural;

# index para facilitar las busquedas por el nombre del curso
create index idx_cucNombre on cursocultural(cucNombre);
# Index para facilitar las busquedas por categoria del curso
create index idx_cucCategoria on cursocultural(cucCategoria);
# Index para facilitar las busquedas por nombre del grupo artistico
create index idx_gaiNombre on grupoartisticoinstitucional(gaiNombre);
# Index para facilitar las busquedas por disciplina del grupo artistico
create index idx_gaiDisciplina on grupoartisticoinstitucional(gaiDisciplina);

describe grupoartisticoinstitucional;
describe cursocultural;

drop index idx_cucNombre on cursocultural;
drop index idx_cucCategoria on cursocultural;
drop index idx_gaiDisciplina on grupoartisticoinstitucional;
drop index idx_gaiNombre on grupoartisticoinstitucional;