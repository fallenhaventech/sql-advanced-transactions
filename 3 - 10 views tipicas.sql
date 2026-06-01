USE CtrlSabor;

-- 1. View de Pratos Disponíveis Hoje
CREATE OR REPLACE VIEW vw_pratos_disponiveis_hoje AS
SELECT 
    p.prato_id,
    p.nome AS prato_nome,
    p.descricao,
    p.preco,
    c.nome AS categoria,
    p.em_rotacao
FROM 
    Prato p
JOIN 
    Categoria c ON p.categoria_id = c.categoria_id
WHERE 
    p.descontinuado = FALSE
    AND (
        (DAYNAME(CURRENT_DATE()) = 'Monday' AND FIND_IN_SET('Mon', p.dias_disponivel))
        OR (DAYNAME(CURRENT_DATE()) = 'Tuesday' AND FIND_IN_SET('Tue', p.dias_disponivel))
        OR (DAYNAME(CURRENT_DATE()) = 'Wednesday' AND FIND_IN_SET('Wed', p.dias_disponivel))
        OR (DAYNAME(CURRENT_DATE()) = 'Thursday' AND FIND_IN_SET('Thu', p.dias_disponivel))
        OR (DAYNAME(CURRENT_DATE()) = 'Friday' AND FIND_IN_SET('Fri', p.dias_disponivel))
        OR (DAYNAME(CURRENT_DATE()) = 'Saturday' AND FIND_IN_SET('Sat', p.dias_disponivel))
        OR (DAYNAME(CURRENT_DATE()) = 'Sunday' AND FIND_IN_SET('Sun', p.dias_disponivel))
    );

-- 2. View de Pedidos por Cliente
CREATE OR REPLACE VIEW vw_pedidos_por_cliente AS
SELECT 
    c.cliente_id,
    c.nome AS cliente,
    c.email,
    COUNT(p.pedido_id) AS total_pedidos,
    SUM(pi.quantidade) AS total_itens,
    SUM(pr.preco * pi.quantidade) AS valor_total_gasto
FROM 
    Cliente c
LEFT JOIN 
    Pedido p ON c.cliente_id = p.cliente_id
LEFT JOIN 
    Pedido_Item pi ON p.pedido_id = pi.pedido_id
LEFT JOIN 
    Prato pr ON pi.prato_id = pr.prato_id
GROUP BY 
    c.cliente_id, c.nome, c.email
ORDER BY 
    total_pedidos DESC;

-- 3. View de Pratos Mais Populares (por votação)
CREATE OR REPLACE VIEW vw_pratos_mais_populares AS
SELECT 
    p.prato_id,
    p.nome AS prato_nome,
    c.nome AS categoria,
    COUNT(v.votacao_id) AS total_votos,
    AVG(v.pontuacao) AS media_avaliacao,
    ROUND((COUNT(v.votacao_id) * AVG(v.pontuacao)), 2) AS score_popularidade
FROM 
    Prato p
JOIN 
    Categoria c ON p.categoria_id = c.categoria_id
LEFT JOIN 
    Votacao v ON p.prato_id = v.prato_id
GROUP BY 
    p.prato_id, p.nome, c.nome
ORDER BY 
    score_popularidade DESC;

-- 4. View de Reservas para Hoje
CREATE OR REPLACE VIEW vw_reservas_hoje AS
SELECT 
    r.reserva_id,
    c.nome AS cliente,
    c.telefone,
    r.data_hora,
    r.num_pessoas
FROM 
    Reserva r
JOIN 
    Cliente c ON r.cliente_id = c.cliente_id
WHERE 
    DATE(r.data_hora) = CURRENT_DATE()
ORDER BY 
    r.data_hora;

-- 5. View de Estoque Crítico (produtos abaixo do mínimo)
CREATE OR REPLACE VIEW vw_estoque_critico AS
SELECT 
    produto_id,
    nome AS produto,
    quantidade,
    unidade_medida,
    stock_minimo,
    CONCAT(ROUND((quantidade/stock_minimo)*100, 2), '%') AS percentual_estoque
FROM 
    Produto
WHERE 
    quantidade < stock_minimo
ORDER BY 
    percentual_estoque ASC;

-- 6. View de Faturamento por Dia
CREATE OR REPLACE VIEW vw_faturamento_diario AS
SELECT 
    DATE(p.data_hora) AS data_pedido,
    COUNT(DISTINCT p.pedido_id) AS total_pedidos,
    SUM(pi.quantidade) AS total_itens_vendidos,
    SUM(pr.preco * pi.quantidade) AS faturamento_bruto,
    AVG(pr.preco * pi.quantidade) AS ticket_medio
FROM 
    Pedido p
JOIN 
    Pedido_Item pi ON p.pedido_id = pi.pedido_id
JOIN 
    Prato pr ON pi.prato_id = pr.prato_id
GROUP BY 
    DATE(p.data_hora)
ORDER BY 
    data_pedido DESC;

-- 7. View de Preferências dos Clientes
CREATE OR REPLACE VIEW vw_preferencias_clientes AS
SELECT 
    pr.nome AS preferencia,
    COUNT(cp.cliente_id) AS total_clientes,
    GROUP_CONCAT(DISTINCT c.nome ORDER BY c.nome SEPARATOR ', ') AS clientes
FROM 
    Preferencia pr
LEFT JOIN 
    Cliente_Preferencia cp ON pr.preferencia_id = cp.preferencia_id
LEFT JOIN 
    Cliente c ON cp.cliente_id = c.cliente_id
GROUP BY 
    pr.nome
ORDER BY 
    total_clientes DESC;

-- 8. View de Alergias dos Clientes
CREATE OR REPLACE VIEW vw_alergias_clientes AS
SELECT 
    a.nome AS alergia,
    COUNT(ca.cliente_id) AS total_clientes,
    GROUP_CONCAT(DISTINCT c.nome ORDER BY c.nome SEPARATOR ', ') AS clientes
FROM 
    Alergia a
LEFT JOIN 
    Cliente_Alergia ca ON a.alergia_id = ca.alergia_id
LEFT JOIN 
    Cliente c ON ca.cliente_id = c.cliente_id
GROUP BY 
    a.nome
ORDER BY 
    total_clientes DESC;

-- 9. View de Métodos de Pagamento Mais Utilizados
CREATE OR REPLACE VIEW vw_metodos_pagamento AS
SELECT 
    tp.nome AS metodo_pagamento,
    COUNT(pa.pagamento_id) AS total_utilizacoes,
    SUM(pa.valor) AS valor_total,
    ep.nome AS entidade_pagamento,
    ep.comissao
FROM 
    Pagamento pa
JOIN 
    TipoPagamento tp ON pa.tipo_pagamento_id = tp.tipo_pagamento_id
LEFT JOIN 
    EntidadePagamento ep ON pa.entidade_pagamento_id = ep.entidade_pagamento_id
GROUP BY 
    tp.nome, ep.nome, ep.comissao
ORDER BY 
    total_utilizacoes DESC;

-- 10. View de Eventos Futuros
CREATE OR REPLACE VIEW vw_eventos_futuros AS
SELECT 
    evento_id,
    nome AS evento,
    data,
    DATEDIFF(data, CURRENT_DATE()) AS dias_restantes,
    descricao
FROM 
    Evento
WHERE 
    data >= CURRENT_DATE()
ORDER BY 
    data ASC;
	
/*Explicação das Views:
vw_pratos_disponiveis_hoje: Mostra os pratos disponíveis no dia atual, considerando os dias de disponibilidade de cada prato.

vw_pedidos_por_cliente: Lista todos os clientes com informações agregadas sobre seus pedidos (total de pedidos, itens e valor gasto).

vw_pratos_mais_populares: Classifica os pratos por popularidade baseada nas avaliações dos clientes.

vw_reservas_hoje: Exibe todas as reservas marcadas para o dia atual.

vw_estoque_critico: Identifica produtos com estoque abaixo do nível mínimo definido.

vw_faturamento_diario: Mostra o faturamento agregado por dia, incluindo ticket médio.

vw_preferencias_clientes: Agrupa clientes por suas preferências alimentares.

vw_alergias_clientes: Agrupa clientes por suas alergias alimentares.

vw_metodos_pagamento: Analisa os métodos de pagamento mais utilizados pelos clientes.

vw_eventos_futuros: Lista os eventos futuros do restaurante com dias restantes até a data.*/