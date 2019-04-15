SELECT 
tipo_veiculo.*, 
modelo_veiculo.nome_modelo,
marca_veiculo.nome_marca

FROM 
tbl_tipo_veiculo as tipo_veiculo ,
tbl_modelo_veiculo as modelo_veiculo,
tbl_marca_veiculo as marca_veiculo,
tbl_marca_veiculo_tipo_veiculo as marca_tipo_veiculo

WHERE tipo_veiculo.id_tipo_veiculo = marca_tipo_veiculo.id_tipo_veiculo 
AND marca_veiculo.id_marca_veiculo = marca_tipo_veiculo.id_marca_veiculo 
AND modelo_veiculo.id_marca_tipo = id_tipo_marca;


