SELECT 
cliente.*,
tipo_veiculo.nome_tipo_veiculo as tipo_veiculo, 
marca_veiculo.nome_marca,
modelo_veiculo.nome_modelo,
veiculo.ano,
veiculo.placa,
veiculo.quilometragem,
veiculo.renavam


FROM
tbl_cliente as cliente,
tbl_veiculo as veiculo, 
tbl_tipo_veiculo as tipo_veiculo ,
tbl_modelo_veiculo as modelo_veiculo,
tbl_marca_veiculo as marca_veiculo,
tbl_marca_veiculo_tipo_veiculo as marca_tipo_veiculo

WHERE veiculo.id_cliente = cliente.id_cliente 
AND veiculo.id_tipo_veiculo = tipo_veiculo.id_tipo_veiculo
AND veiculo.id_marca_veiculo = marca_veiculo.id_marca_veiculo
AND veiculo.id_modelo_veiculo = modelo_veiculo.id_modelo
AND tipo_veiculo.id_tipo_veiculo = marca_tipo_veiculo.id_tipo_veiculo 
AND marca_veiculo.id_marca_veiculo = marca_tipo_veiculo.id_marca_veiculo 
AND modelo_veiculo.id_marca_tipo = id_tipo_marca;


