USE CtrlSabor;

-- Inserir alergias
INSERT INTO Alergia (nome) VALUES
('Glúten'),('Frutos do Mar'),('Amendoim'),('Lactose'),('Ovos'),
('Soja'),('Peixes'),('Nozes'),('Sésamo'),('Mariscos'),('Aipo'),('Mostarda');

-- Inserir preferências
INSERT INTO Preferencia (nome) VALUES
('Vegetariano'),('Vegano'),('Sem Açúcar'),('Low Carb'),('Paleo'),('Keto'),
('Halal'),('Kosher'),('Picante'),('Orgânico'),('Sem Sal'),('Sem Conservantes'),
('Cru'),('Celíaco'),('Baixo Teor de Gordura'),('Sem Soja'),('Sem Ovos'),
('Sem Amendoim');

-- Inserir funcionários
INSERT INTO Funcionario (nome, cargo) VALUES
('Rodolfo Coelho', 'Chef'),
('Sílvio Rocha', 'Gerente'),
('Álvaro Machado', 'Responsavel Marketing'),
('Rui Gomes', 'Responsavel Atendimento'),
('Carlos Silva', 'Colaborador Sala'),
('Ana Pereira', 'Colaborador Sala'),
('Miguel Santos', 'Colaborador Cozinha'),
('Sofia Costa', 'Colaborador Cozinha'),
('Luís Fernandes', 'Colaborador Sala'),
('Marta Oliveira', 'Colaborador Cozinha');

-- Inserir fornecedores
INSERT INTO Fornecedor (nome, tipo, contato,telefone) VALUES
('Marisqueira Atlântico', 'Peixe', 'marisqueira@gmail.com','214587896'),
('Carnes Premium', 'Carne', 'carnespremium@gmail.com','213585256'),
('Hortifruti Fresco', 'Legumes', 'hortifruti@gmail.com','215586890'),
('Confeitaria Doce', 'Confeccao', 'doceconfeite@gmail.com','215975896'),
('Pescaria Norte', 'Peixe', 'pescarianorte@gmail.com','305265874'),
('Talho Nobre', 'Carne', 'nobretalho@gmail.com','255265874'),
('Legumes Ecológicos', 'Legumes', 'ecolegumes@gmail.com','963877243'),
('Pastelaria Bijou', 'Confeccao', 'bijou@gmail.com','458214698'),
('Peixaria Charroco', 'Peixe', 'chocofrrrito@gmail.com','256452110'),
('Carnes Primor', 'Carne', 'carnes_shakira@gmail.com','265478741');

-- Inserir categorias
INSERT INTO Categoria (nome) VALUES
('Entradas Tech'),('Pratos Hacker'),('Sobremesas Código'),
('Pizzas Binárias'),('Sushi Sem Lag'),('Francesinhas Digitais'),
('Pratos Cloud'),('Especiais IoT'),('Vegetarianos 4.0'),
('Veganos Blockchain'),('Low Carb AI'),('Kids Edition');

-- Inserir clientes
INSERT INTO Cliente (nome, email, telefone, data_registro) VALUES
('João Silva', 'joao@gmail.com', '912345678', '2025-01-15'),
('Maria Santos', 'maria@gmail.com', '923456789', '2025-02-20'),
('Carlos Oliveira', 'carlos@gmail.com', '934567890', '2025-02-25'),
('Ana Pereira', 'ana@gmail.com', '945678901', '2025-03-05'),
('Pedro Costa', 'pedro@gmail.com', '956789012', '2025-03-10'),
('Sofia Martins', 'sofia@gmail.com', '967890123', '2025-03-15'),
('Luís Fernandes', 'luis@gmail.com', '978901234', '2025-03-20'),
('Marta Oliveira', 'marta@gmail.com', '989012345', '2025-04-01'),
('Rui Gomes', 'rui@gmail.com', '990123456', '2025-04-05'),
('Inês Sousa', 'ines@gmail.com', '901234567', '2025-04-10'),
('Tiago Marques', 'tiago@gmail.com', '912345670', '2025-04-15'),
('Catarina Lima', 'catarina@gmail.com', '923456781', '2025-04-20'),
('José Pinto', 'jose@gmail.com', '934567892', '2025-05-01'),
('Beatriz Carvalho', 'beatriz@gmail.com', '945678903', '2025-05-05'),
('Miguel Rocha', 'miguel@gmail.com', '956789014', '2025-05-10'),
('Sara Dias', 'sara@gmail.com', '967890125', '2025-05-15'),
('António Almeida', 'antonio@gmail.com', '978901236', '2025-05-20'),
('Laura Ribeiro', 'laura@gmail.com', '989012347', '2025-06-01'),
('Francisco Neves', 'francisco@gmail.com', '990123458', '2025-06-05'),
('Helena Monteiro', 'helena@gmail.com', '901234569', '2025-06-10'),
('Bruno Lopes', 'bruno@gmail.com', '912345671', '2025-06-15'),
('Patrícia Teixeira', 'patricia@gmail.com', '923456782', '2025-06-20'),
('Ricardo Cardoso', 'ricardo@gmail.com', '934567893', '2025-07-01'),
('Diana Fonseca', 'diana@gmail.com', '945678904', '2025-07-05'),
('André Morais', 'andre@gmail.com', '956789015', '2025-07-10'),
('Liliana Castro', 'liliana@gmail.com', '967890126', '2025-01-18'),
('Paulo Vieira', 'paulo@gmail.com', '978901237', '2025-02-22'),
('Tânia Correia', 'tania@gmail.com', '989012348', '2025-02-27'),
('Hugo Moreira', 'hugo@gmail.com', '990123459', '2025-03-07'),
('Cristina Guimarães', 'cristina@gmail.com', '901234570', '2025-03-12'),
('Daniel Abreu', 'daniel@gmail.com', '912345672', '2025-03-17'),
('Irina Matos', 'irina@gmail.com', '923456783', '2025-03-22'),
('Vítor Tavares', 'vitor@gmail.com', '934567894', '2025-04-03'),
('Eduarda Nunes', 'eduarda@gmail.com', '945678905', '2025-04-07'),
('Gonçalo Pires', 'goncalo@gmail.com', '956789016', '2025-04-12'),
('Mónica Esteves', 'monica@gmail.com', '967890127', '2025-04-17'),
('Nuno Batista', 'nuno@gmail.com', '978901238', '2025-05-03'),
('Olívia Andrade', 'olivia@gmail.com', '989012349', '2025-05-07'),
('Alexandre Borges', 'alexandre@gmail.com', '990123460', '2025-05-12'),
('Leonor Barros', 'leonor@gmail.com', '901234571', '2025-05-17'),
('Filipe Camacho', 'filipe@gmail.com', '912345673', '2025-05-22'),
('Simão Vasconcelos', 'simao@gmail.com', '923456784', '2025-06-03'),
('Bianca Faria', 'bianca@gmail.com', '934567895', '2025-06-07'),
('Raul Miranda', 'raul@gmail.com', '945678906', '2025-06-12'),
('Vitória Domingues', 'vitoria@gmail.com', '956789017', '2025-06-17');

-- Inserir alergias de clientes
INSERT INTO Cliente_Alergia (cliente_id, alergia_id) VALUES
(1, 4), (1, 8), (3, 2), (5, 1), (7, 3),
(9, 5), (11, 6), (13, 7), (15, 9), (17, 10),
(19, 11), (21, 12), (23, 1), (25, 3), (27, 5),
(29, 7), (31, 9), (33, 11);

-- Inserir preferências de clientes
INSERT INTO Cliente_Preferencia (cliente_id, preferencia_id) VALUES
(2, 1), (4, 2), (6, 3), (8, 4), (10, 5),
(12, 6), (14, 7), (16, 8), (18, 9), (20, 10),
(22, 1), (24, 2);

-- Inserir pratos (com dias disponíveis em formato inglês)
INSERT INTO Prato (nome, descricao, preco, categoria_id, em_rotacao, descontinuado, dias_disponivel) VALUES
('Bug Burger', 'Hambúrguer com molho de código', 12.99, 2, TRUE, FALSE, 'Mon,Wed,Fri'),
('Loop Linguini', 'Massa em laço infinito', 14.50, 6, FALSE, FALSE, 'Tue,Thu,Sat'),
('Array de Açai', 'Tigela com frutas indexadas', 8.99, 3, TRUE, FALSE, 'Mon,Tue,Wed,Thu,Fri,Sat,Sun'),
('Sushi SQL', 'Rolls com queries frescas', 18.99, 5, FALSE, FALSE, 'Wed,Sat,Sun'),
('Pizza Binária', 'Base 0 e 1 com toppings de bytes', 15.99, 4, TRUE, FALSE, 'Fri,Sat,Sun'),
('Francesinha Hacker', 'Francesinha com algoritmo secreto', 16.50, 6, TRUE, FALSE, 'Mon,Wed,Fri'),
('Nuvem de Batata', 'Puré de batata com espuma tecnológica', 9.99, 7, FALSE, FALSE, 'Tue,Thu,Sat'),
('IoT Costeleta', 'Costeleta inteligente com sensores de ponto', 17.99, 8, TRUE, FALSE, 'Wed,Fri,Sun'),
('Vegetariano 4.0', 'Pratão de legumes com upgrade', 13.99, 9, FALSE, FALSE, 'Mon,Wed,Fri'),
('Blockchain Tofu', 'Tofu distribuído e imutável', 11.99, 10, FALSE, FALSE, 'Tue,Thu,Sat'),
('AI Bife', 'Bife com inteligência artificial', 19.99, 2, TRUE, FALSE, 'Mon,Wed,Fri'),
('Kids Nuggets', 'Nuggets em forma de emoji', 10.99, 12, FALSE, FALSE, 'Sat,Sun'),
('Código de Barras', 'Posta de peixe com riscas de molho', 20.99, 2, FALSE, FALSE, 'Thu,Fri,Sat'),
('Java Lamen', 'Lamen com sabor a café', 14.99, 1, TRUE, FALSE, 'Mon,Wed,Fri'),
('Python Poke', 'Poke bowl com várias versões', 16.99, 5, FALSE, FALSE, 'Tue,Thu,Sat'),
('C# Curry', 'Curry com acento agudo', 15.50, 8, FALSE, FALSE, 'Wed,Fri,Sun'),
('Rust Risotto', 'Risotto com segurança de memória', 13.50, 9, TRUE, FALSE, 'Mon,Wed,Fri'),
('Go Gyoza', 'Gyoza concorrente', 12.50, 1, FALSE, FALSE, 'Tue,Thu,Sat'),
('Swift Sashimi', 'Sashimi que corta rápido', 22.99, 5, FALSE, FALSE, 'Wed,Sat,Sun'),
('Kotlin Kebab', 'Kebab multiplataforma', 11.50, 2, FALSE, FALSE, 'Fri,Sat,Sun'),
('HTML Hotdog', 'Hotdog com tags crocantes', 8.50, 1, FALSE, FALSE, 'Mon,Wed,Fri'),
('CSS Croissant', 'Croissant com estilo', 4.99, 3, FALSE, FALSE, 'Tue,Thu,Sat'),
('JavaScript Jelly', 'Gelatina assíncrona', 5.99, 3, TRUE, FALSE, 'Wed,Fri,Sun'),
('TypeScript Tiramisu', 'Tiramisu tipado', 7.50, 3, FALSE, FALSE, 'Mon,Thu,Sat'),
('Node Nachos', 'Nachos não bloqueantes', 10.50, 1, TRUE, FALSE, 'Fri,Sat,Sun'),
('React Ratatouille', 'Ratatouille reativa', 12.99, 9, FALSE, FALSE, 'Tue,Thu,Sat'),
('Vue Vegetables', 'Vegetais reativos', 11.99, 9, FALSE, FALSE, 'Mon,Wed,Fri'),
('Angular Arroz', 'Arroz com dependências injetadas', 9.99, 7, FALSE, FALSE, 'Wed,Fri,Sun'),
('Django Duck', 'Pato assado com ORM', 18.50, 8, FALSE, FALSE, 'Sat,Sun'),
('404 Pudim', 'Sobremesa não encontrada', 6.50, 3, FALSE, TRUE, 'Mon,Tue,Wed,Thu,Fri,Sat,Sun');

-- Inserir reservas
INSERT INTO Reserva (cliente_id, data_hora, num_pessoas) VALUES
(1, '2025-08-01 19:00:00', 4),
(3, '2025-08-02 20:30:00', 2),
(5, '2025-08-03 19:30:00', 3),
(7, '2025-08-04 20:00:00', 5),
(9, '2025-08-05 19:00:00', 2),
(11, '2025-08-06 20:30:00', 4),
(13, '2025-08-07 19:30:00', 6),
(15, '2025-08-08 20:00:00', 3),
(17, '2025-08-09 19:00:00', 2),
(19, '2025-08-10 20:30:00', 4),
(21, '2025-08-11 19:30:00', 3),
(23, '2025-08-12 20:00:00', 5),
(25, '2025-08-13 19:00:00', 2),
(27, '2025-08-14 20:30:00', 4),
(29, '2025-08-15 19:30:00', 3);

-- Inserir produtos
INSERT INTO Produto (nome, quantidade, unidade_medida, stock_minimo) VALUES
('Salmão', 15.5, 'kg', 5.0),
('Filet Mignon', 22.0, 'kg', 8.0),
('Beringela', 30.0, 'kg', 10.0),
('Farinha', 50.0, 'kg', 20.0),
('Açúcar', 40.0, 'kg', 15.0),
('Arroz', 60.0, 'kg', 25.0),
('Massa', 30.0, 'kg', 15.0),
('Tomate', 25.0, 'kg', 10.0),
('Cebola', 20.0, 'kg', 8.0),
('Alho', 5.0, 'kg', 2.0),
('Azeite', 30.0, 'L', 10.0),
('Vinagre', 15.0, 'L', 5.0),
('Leite', 40.0, 'L', 20.0),
('Ovos', 200.0, 'un', 100.0),
('Queijo', 18.0, 'kg', 8.0),
('Fiambre', 12.0, 'kg', 5.0),
('Chouriço', 8.0, 'kg', 3.0),
('Pão', 30.0, 'un', 15.0),
('Batata', 50.0, 'kg', 20.0),
('Cenoura', 15.0, 'kg', 5.0),
('Brócolos', 10.0, 'kg', 4.0),
('Espinafre', 7.0, 'kg', 3.0),
('Limonada', 20.0, 'L', 10.0),
('Coca-Cola', 30.0, 'L', 15.0),
('Água', 50.0, 'L', 20.0),
('Café', 8.0, 'kg', 3.0),
('Chá', 2.0, 'kg', 1.0),
('Chocolate', 5.0, 'kg', 2.0),
('Baunilha', 1.0, 'kg', 0.5),
('Canela', 0.5, 'kg', 0.2),
('Pimenta', 0.3, 'kg', 0.1),
('Sal', 4.0, 'kg', 2.0),
('Atum', 12.0, 'kg', 5.0),
('Sardinha', 10.0, 'kg', 4.0),
('Camarão', 8.0, 'kg', 3.0),
('Lula', 6.0, 'kg', 2.0),
('Polvo', 5.0, 'kg', 2.0),
('Pernil', 15.0, 'kg', 6.0),
('Coxa de Frango', 20.0, 'kg', 8.0),
('Peito de Frango', 25.0, 'kg', 10.0),
('Tofu', 10.0, 'kg', 4.0),
('Seitan', 5.0, 'kg', 2.0),
('Quinoa', 7.0, 'kg', 3.0),
('Aveia', 8.0, 'kg', 3.0),
('Amêndoa', 3.0, 'kg', 1.0),
('Noz', 3.0, 'kg', 1.0),
('Castanha', 2.0, 'kg', 1.0),
('Manteiga', 15.0, 'kg', 6.0),
('Margarina', 10.0, 'kg', 4.0),
('Iogurte', 25.0, 'L', 10.0),
('Natas', 15.0, 'L', 6.0),
('Mel', 4.0, 'kg', 1.5),
('Maionese', 8.0, 'kg', 3.0),
('Mostarda', 3.0, 'kg', 1.0),
('Ketchup', 5.0, 'kg', 2.0),
('Molho de Soja', 6.0, 'L', 2.0),
('Vinho Tinto', 20.0, 'L', 8.0),
('Vinho Branco', 15.0, 'L', 6.0),
('Cerveja', 40.0, 'L', 15.0),
('Sumo de Laranja', 25.0, 'L', 10.0),
('Sumo de Maçã', 20.0, 'L', 8.0),
('Limão', 10.0, 'kg', 4.0),
('Laranja', 15.0, 'kg', 6.0),
('Maçã', 20.0, 'kg', 8.0),
('Pêra', 12.0, 'kg', 5.0),
('Banana', 18.0, 'kg', 7.0),
('Uva', 9.0, 'kg', 3.0),
('Morango', 6.0, 'kg', 2.0),
('Mirtilo', 4.0, 'kg', 1.5),
('Framboesa', 3.0, 'kg', 1.0),
('Manga', 7.0, 'kg', 3.0),
('Ananás', 5.0, 'kg', 2.0);

-- Inserir pedidos (datas corrigidas)
INSERT INTO Pedido (cliente_id, data_hora, tipo) VALUES
(1, '2025-08-05 19:30:00', 'Mesa'),    -- Terça
(3, '2025-08-06 20:45:00', 'App'),     -- Quarta
(5, '2025-08-07 19:45:00', 'Mesa'),    -- Quinta
(7, '2025-08-08 20:15:00', 'App'),     -- Sexta
(9, '2025-08-09 19:15:00', 'DriveIn'), -- Sábado
(11, '2025-08-10 20:45:00', 'App'),    -- Domingo
(13, '2025-08-11 19:45:00', 'Mesa'),   -- Segunda
(15, '2025-08-12 20:15:00', 'DriveIn'),-- Terça
(17, '2025-08-13 19:15:00', 'App'),    -- Quarta
(19, '2025-08-14 20:45:00', 'Mesa'),   -- Quinta
(21, '2025-08-15 19:45:00', 'App'),    -- Sexta
(23, '2025-08-16 20:15:00', 'DriveIn');-- Sábado

-- Inserir itens de pedido (datas corrigidas)
INSERT INTO Pedido_Item (pedido_id, prato_id, quantidade) VALUES
(1, 2, 2),   -- Terça: Loop Linguini
(1, 10, 1),  -- Terça: Blockchain Tofu
(2, 4, 3),   -- Quarta: Sushi SQL
(2, 5, 1),   -- Quarta: Pizza Binária
(3, 2, 2),   -- Quinta: Loop Linguini
(3, 10, 1),  -- Quinta: Blockchain Tofu
(4, 6, 2),   -- Sexta: Francesinha Hacker
(4, 17, 2),  -- Sexta: Rust Risotto
(5, 3, 1),   -- Sábado: Array de Açai 
(5, 30, 3),   -- Sábado: Pudim 404
(6, 4, 2),   -- Domingo: Sushi SQL
(6, 29, 1),  -- Domingo: Django Duck
(7, 1, 3),   -- Segunda: Bug Burger
(7, 21, 1),  -- Segunda: HTML Hotdog
(8, 2, 3),   -- Terça: Loop Linguini
(8, 15, 1),  -- Terça: Python Poke
(9, 4, 2),   -- Quarta: Sushi SQL
(9, 8, 1),   -- Quarta: IoT Costeleta
(10, 10, 2), -- Quinta: Blockchain Tofu
(10, 15, 1), -- Quinta: Python Poke
(11, 6, 3),  -- Sexta: Francesinha Hacker
(11, 8, 1),  -- Sexta: IoT Costeleta
(12, 5, 2),  -- Sábado: Pizza Binária
(12, 29, 1); -- Sábado: Django Duck

-- Inserir votações
INSERT INTO Votacao (prato_id, cliente_id, data, pontuacao) VALUES
(1, 5, '2025-08-01', 5),
(3, 8, '2025-08-02', 4),
(5, 10, '2025-08-03', 5),
(7, 12, '2025-08-04', 3),
(9, 14, '2025-08-05', 4),
(11, 16, '2025-08-06', 5),
(13, 18, '2025-08-07', 2),
(15, 20, '2025-08-08', 5),
(17, 22, '2025-08-09', 4),
(19, 24, '2025-08-10', 3),
(21, 26, '2025-08-11', 4),
(23, 28, '2025-08-12', 5),
(25, 30, '2025-08-13', 4),
(2, 32, '2025-08-14', 3),
(4, 34, '2025-08-15', 5),
(6, 36, '2025-08-16', 4),
(8, 38, '2025-08-17', 5),
(10, 40, '2025-08-18', 3),
(12, 42, '2025-08-19', 4),
(14, 44, '2025-08-20', 5),
(16, 1, '2025-08-21', 4),
(18, 3, '2025-08-22', 3),
(20, 5, '2025-08-23', 5),
(22, 7, '2025-08-24', 4),
(24, 9, '2025-08-25', 3);

-- Inserir incidentes
INSERT INTO Incidente (descricao, data_hora, resolvido) VALUES
('Torradeira offline', '2025-08-05 10:30:00', TRUE),
('Menu digital congelou', '2025-08-06 19:45:00', TRUE),
('POS não imprime', '2025-08-07 12:15:00', TRUE),
('Luzes da cozinha piscando', '2025-08-08 18:00:00', FALSE),
('Wi-Fi lento', '2025-08-09 14:20:00', TRUE),
('Sistema de som com ruído', '2025-08-10 19:00:00', TRUE),
('Forno elétrico desregulado', '2025-08-11 11:45:00', FALSE),
('Display da cozinha quebrado', '2025-08-12 09:30:00', TRUE),
('Sistema de pontos bugado', '2025-08-13 14:20:00', FALSE),
('Máquina de café offline', '2025-08-14 16:40:00', TRUE);

-- Inserir eventos
INSERT INTO Evento (nome, data, descricao) VALUES
('Noite da Francesinha Hacker', '2025-08-29', 'Francesinhas com algoritmos secretos'),
('Festival de Sushi Sem Lag', '2025-09-27', 'Sushi com tempo de resposta < 100ms'),
('Jantar Cloud Computing', '2025-10-24', 'Pratos flutuando em espumas tecnológicas'),
('Noite de Pratos Descontinuados', '2025-11-10', 'Recriação de pratos antigos favoritos'),
('Festival Vegetariano 4.0', '2025-12-17', 'Novidades da cozinha vegetariana high-tech'),
('Jantar IoT', '2026-01-31', 'Pratos conectados e interativos Para a Passagem');

-- Inserir tipos de pagamento
INSERT INTO TipoPagamento (nome, emlinha) VALUES
('Multibanco', TRUE),
('MB Way', TRUE),
('Cartão Crédito', TRUE),
('Cartão Débito', TRUE),
('Dinheiro', FALSE),
('Cheque', FALSE),
('PayPal', TRUE),
('Transferência', TRUE);

-- Inserir entidades de pagamento
INSERT INTO EntidadePagamento (nome, comissao) VALUES
('Visa', 1.5),
('Mastercard', 1.6),
('American Express', 2.2),
('SIBS', 0.8),
('PayPal', 2.5),
('Apple Pay', 1.2),
('Google Pay', 1.1),
('Revolut', 0.9),
('Cliente',0);

-- Inserir pagamentos
INSERT INTO Pagamento (pedido_id, tipo_pagamento_id, entidade_pagamento_id, valor, data_hora, referencia) VALUES
(1, 3, 1, 36.97, '2025-08-05 20:15:00', 'AUTH123456'),
(2, 2, 4, 55.47, '2025-08-06 21:00:00', 'MBREF789012'),
(3, 4, 2, 45.98, '2025-08-07 20:15:00', 'AUTH654321'),
(4, 1, 4, 60.00, '2025-08-08 20:45:00', 'REF987654'),
(5, 5, 9, 35.50, '2025-08-09 19:45:00','Dinheiro'),
(6, 7, 5, 42.50, '2025-08-10 21:00:00', 'PYPLREF123'),
(7, 3, 3, 50.00, '2025-08-11 20:30:00', 'AUTHAMEX456'),
(8, 6, 9, 55.00, '2025-08-12 20:45:00', 'CHQ789456'),
(9, 8, 8, 38.50, '2025-08-13 19:45:00', 'TRFREV123'),
(10, 4, 1, 45.00, '2025-08-14 21:15:00', 'AUTHVISA789'),
(11, 3, 2, 48.00, '2025-08-15 20:15:00', 'AUTHMC1234'),
(12, 5, 9, 60.50, '2025-08-16 20:45:00', 'Dinheiro');