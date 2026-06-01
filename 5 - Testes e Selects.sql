-- Listar todas as tabelas
SHOW TABLES;

-- Contar número de clientes (deve ser 45)
SELECT COUNT(*) AS total_clientes FROM Cliente;

-- Pratos em rotação
SELECT prato_id, nome, descricao, preco 
FROM Prato 
WHERE em_rotacao = TRUE;

-- Testar disponibilidade de pratos por dia (com dias em inglês)
SELECT 
    prato_id AS 'Num Prato',
    nome AS Nome,
    dias_disponivel AS 'Dias Disponiveis',
    CASE 
        WHEN FIND_IN_SET('Sat', dias_disponivel) > 0 THEN 'Disponivel Sabado'
        ELSE 'Não Disponivel Sabado'
    END AS Sabado,
    CASE 
        WHEN FIND_IN_SET('Tue', dias_disponivel) > 0 THEN 'Disponivel 3a Feira'
        ELSE 'Não Disponivel 3a feira'
    END AS '3a Feira'
FROM Prato
LIMIT 10;

-- Produtos abaixo do stock mínimo
SELECT produto_id, nome, quantidade, unidade_medida, stock_minimo
FROM Produto
WHERE quantidade < stock_minimo;

-- Verificar pedidos e itens
SELECT 
    p.pedido_id AS 'Num Pedido',
    c.nome AS Cliente,
    p.data_hora,
    pr.nome AS Prato,
    pdi.quantidade,
    pr.preco,
    (pdi.quantidade * pr.preco) AS Subtotal
FROM Pedido p
INNER JOIN Cliente c ON p.cliente_id = c.cliente_id
INNER JOIN Pedido_Item pdi ON p.pedido_id = pdi.pedido_id
INNER JOIN Prato pr ON pdi.prato_id = pr.prato_id
WHERE pr.descontinuado = FALSE
ORDER BY p.data_hora DESC
LIMIT 10;

-- Pagamentos e métodos
SELECT 
    pg.pagamento_id,
    p.pedido_id,
    tp.nome AS metodo_pagamento,
    ep.nome AS entidade,
    pg.valor,
    pg.data_hora
FROM Pagamento pg
INNER JOIN Pedido p ON pg.pedido_id = p.pedido_id
JOIN TipoPagamento tp ON pg.tipo_pagamento_id = tp.tipo_pagamento_id
LEFT JOIN EntidadePagamento ep ON pg.entidade_pagamento_id = ep.entidade_pagamento_id;

-- Votações de pratos
SELECT 
    v.votacao_id,
    pr.nome AS prato,
    c.nome AS cliente,
    v.pontuacao,
    v.data
FROM Votacao v
JOIN Prato pr ON v.prato_id = pr.prato_id
JOIN Cliente c ON v.cliente_id = c.cliente_id
LIMIT 10;

-- Incidentes não resolvidos
SELECT * 
FROM Incidente 
WHERE resolvido = FALSE;

-- Eventos futuros
SELECT * 
FROM Evento 
WHERE data >= CURDATE();

-- Relação cliente-alergias
SELECT 
    ca.cliente_alergia_id,
    c.nome AS cliente,
    a.nome AS alergia
FROM Cliente_Alergia ca
JOIN Cliente c ON ca.cliente_id = c.cliente_id
JOIN Alergia a ON ca.alergia_id = a.alergia_id;

-- Pratos por categoria
SELECT 
    cat.nome AS categoria,
    pr.nome AS prato,
    pr.preco
FROM Prato pr
JOIN Categoria cat ON pr.categoria_id = cat.categoria_id
ORDER BY cat.nome, pr.nome;

-- Reservas com detalhes de clientes
SELECT 
    r.reserva_id,
    c.nome AS cliente,
    r.data_hora,
    r.num_pessoas
FROM Reserva r
JOIN Cliente c ON r.cliente_id = c.cliente_id;

-- Fornecedores por tipo
SELECT 
    tipo,
    COUNT(*) AS total,
    GROUP_CONCAT(nome SEPARATOR ', ') AS fornecedores
FROM Fornecedor
GROUP BY tipo;

-- Funcionários por cargo
SELECT 
    cargo,
    COUNT(*) AS total_funcionarios,
    GROUP_CONCAT(nome SEPARATOR ', ') AS nomes
FROM Funcionario
GROUP BY cargo;

-- Total de vendas por tipo de pedido
SELECT 
    tipo,
    COUNT(*) AS total_pedidos,
    SUM(pg.valor) AS total_vendas
FROM Pedido p
JOIN Pagamento pg ON p.pedido_id = pg.pedido_id
GROUP BY tipo;

-- Produtos mais utilizados em pratos (exemplo ilustrativo)
SELECT 
    pr.nome AS produto,
    COUNT(*) AS usado_em_pratos
FROM Produto pr
GROUP BY pr.nome
ORDER BY usado_em_pratos DESC
LIMIT 10;

-- Clientes com mais pontos
SELECT 
    cliente_id,
    nome,
    pontos
FROM Cliente
ORDER BY pontos DESC
LIMIT 5;

-- Detalhes completos de um pedido específico
SELECT 
    p.pedido_id,
    c.nome AS cliente,
    p.data_hora,
    p.tipo,
    pr.nome AS prato,
    pi.quantidade,
    pr.preco,
    (pi.quantidade * pr.preco) AS subtotal,
    pg.valor AS total_pago,
    tp.nome AS metodo_pagamento
FROM Pedido p
JOIN Cliente c ON p.cliente_id = c.cliente_id
JOIN Pedido_Item pi ON p.pedido_id = pi.pedido_id
JOIN Prato pr ON pi.prato_id = pr.prato_id
JOIN Pagamento pg ON p.pedido_id = pg.pedido_id
JOIN TipoPagamento tp ON pg.tipo_pagamento_id = tp.tipo_pagamento_id
WHERE p.pedido_id = 1;