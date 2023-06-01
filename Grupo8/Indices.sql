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
-- Creamos un indice sobre la tabla Infante ya que muchos procedimientos implican buscar sobre esta teniendo en cuenta este id
CREATE INDEX idx_idPersona ON infante (IdInfante);

-- También creamos un un indice sobre el atributo idPadre_o_Madre ya que lo utilizamos en 
-- varios procedimientos para relacionar al infante con sus padres
CREATE INDEX idx_idPadre ON infante (idPadre_o_Madre);


drop INDEX idx_idPadre on infante;
drop INDEX idx_idPersona on infante;
drop index idx_cucNombre on cursocultural;
drop index idx_cucCategoria on cursocultural;
drop index idx_gaiDisciplina on grupoartisticoinstitucional;
drop index idx_gaiNombre on grupoartisticoinstitucional;