-- TRIGGERS PARA REGRAS DE NEGÓCIO --

-- Verificar disponibilidade do prato
DELIMITER $$
CREATE TRIGGER VerificarDisponibilidadePrato
BEFORE INSERT ON Pedido_Item
FOR EACH ROW
BEGIN
    DECLARE dia_semana CHAR(3);
    DECLARE dias_disponivel VARCHAR(20);
    DECLARE prato_disponivel BOOLEAN;
    DECLARE data_pedido DATETIME;
    DECLARE dia_num INT;
    
    SELECT data_hora INTO data_pedido 
    FROM Pedido 
    WHERE pedido_id = NEW.pedido_id;
    
    SET dia_num = DAYOFWEEK(data_pedido);
    SET dia_semana = CASE dia_num
        WHEN 1 THEN 'Sun'
        WHEN 2 THEN 'Mon'
        WHEN 3 THEN 'Tue'
        WHEN 4 THEN 'Wed'
        WHEN 5 THEN 'Thu'
        WHEN 6 THEN 'Fri'
        WHEN 7 THEN 'Sat'
    END;
    
    SELECT dias_disponivel INTO dias_disponivel 
    FROM Prato 
    WHERE prato_id = NEW.prato_id;
    
    IF dias_disponivel IS NULL THEN
        SET prato_disponivel = FALSE;
    ELSE
        SET prato_disponivel = (FIND_IN_SET(dia_semana, dias_disponivel) > 0);
    END IF;
    
    IF NOT prato_disponivel THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Prato não disponível neste dia da semana';
    END IF;
END$$
DELIMITER ;

-- Verificar stock mínimo
DELIMITER $$
CREATE TRIGGER VerificarStockMinimo
AFTER INSERT ON Pedido_Item
FOR EACH ROW
BEGIN
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE cur_produto_id INT;
    DECLARE cur_quantidade DECIMAL(6,2);
    DECLARE cur_min_stock DECIMAL(6,2);
    
    DECLARE cur CURSOR FOR 
        SELECT produto_id, quantidade, stock_minimo 
        FROM Produto 
        WHERE quantidade <= stock_minimo;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO cur_produto_id, cur_quantidade, cur_min_stock;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        INSERT INTO Incidente (descricao, data_hora, resolvido)
        VALUES (
            CONCAT('ALERTA STOCK: Produto ID ', cur_produto_id, 
                   ' - ', (SELECT nome FROM Produto WHERE produto_id = cur_produto_id),
                   ' abaixo do mínimo (', cur_quantidade, ' ', 
                   (SELECT unidade_medida FROM Produto WHERE produto_id = cur_produto_id),
                   ' / Mín: ', cur_min_stock, ')'),
            NOW(),
            FALSE
        );
    END LOOP;
    
    CLOSE cur;
END$$
DELIMITER ;

-- Limite de incidentes por dia
DELIMITER $$
CREATE TRIGGER LimiteIncidentesPorDia
BEFORE INSERT ON Incidente
FOR EACH ROW
BEGIN
    DECLARE incidentes_hoje INT;
    
    SELECT COUNT(*) INTO incidentes_hoje
    FROM Incidente
    WHERE DATE(data_hora) = DATE(NEW.data_hora);
    
    IF incidentes_hoje >= 3 THEN
        SIGNAL SQLSTATE '01000'
        SET MESSAGE_TEXT = 'Limite máximo de 3 incidentes reportados por dia';
    END IF;
END$$
DELIMITER ;