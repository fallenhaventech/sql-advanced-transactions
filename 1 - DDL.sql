-- Criação da base de dados
CREATE DATABASE IF NOT EXISTS CtrlSabor
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE CtrlSabor;

-- Tabela de Alergias
CREATE TABLE IF NOT EXISTS Alergia (
    alergia_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

-- Tabela de Preferências
CREATE TABLE IF NOT EXISTS Preferencia (
    preferencia_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

-- Tabela de Clientes
CREATE TABLE IF NOT EXISTS Cliente (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    data_registro DATE NOT NULL,
    pontos INT DEFAULT 0
);

-- Tabela de Alergias dos Clientes
CREATE TABLE IF NOT EXISTS Cliente_Alergia (
    cliente_alergia_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT, FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id) ON DELETE SET NULL,
    alergia_id INT, FOREIGN KEY (alergia_id) REFERENCES Alergia(alergia_id) ON DELETE SET NULL    
);

-- Tabela de Preferências dos Clientes
CREATE TABLE IF NOT EXISTS Cliente_Preferencia (
    cliente_preferencia_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT, FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id) ON DELETE SET NULL,
    preferencia_id INT, FOREIGN KEY (preferencia_id) REFERENCES Preferencia(preferencia_id) ON DELETE SET NULL   
);

-- Tabela de Funcionários
CREATE TABLE IF NOT EXISTS Funcionario (
    funcionario_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo ENUM('Chef', 'Gerente', 'Responsavel Marketing', 'Responsavel Atendimento', 'Colaborador Sala', 'Colaborador Cozinha') NOT NULL
);

-- Tabela de Fornecedores
CREATE TABLE IF NOT EXISTS Fornecedor (
    fornecedor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo ENUM('Peixe', 'Carne', 'Legumes', 'Confeccao') NOT NULL,
    contato VARCHAR(100),
	telefone INT NOT NULL CHECK(telefone BETWEEN 200000000 AND 999999999)
);

-- Tabela de Categorias de Pratos
CREATE TABLE IF NOT EXISTS Categoria (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

-- Tabela de Pratos
CREATE TABLE IF NOT EXISTS Prato (
    prato_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(6,2) NOT NULL CHECK (preco > 0),
    categoria_id INT, FOREIGN KEY (categoria_id) REFERENCES Categoria(categoria_id) ON DELETE SET NULL,
    em_rotacao BOOLEAN DEFAULT FALSE,
    descontinuado BOOLEAN DEFAULT FALSE,
    dias_disponivel SET('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun')
);

-- Tabela de Reservas
CREATE TABLE IF NOT EXISTS Reserva (
    reserva_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT, FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id) ON DELETE SET NULL,
    data_hora DATETIME NOT NULL,
    num_pessoas INT CHECK (num_pessoas BETWEEN 1 AND 20)    
);

-- Tabela de Produtos em Stock
CREATE TABLE IF NOT EXISTS Produto (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    quantidade DECIMAL(6,2) NOT NULL CHECK (quantidade >= 0), 
    unidade_medida VARCHAR(20) NOT NULL,
    stock_minimo DECIMAL(6,2) NOT NULL DEFAULT 0
);

-- Tabela de Pedidos
CREATE TABLE IF NOT EXISTS Pedido (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT, FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    data_hora DATETIME NOT NULL,
    tipo ENUM('App', 'DriveIn', 'Mesa') NOT NULL
);

-- Tabela de Itens de Pedido
CREATE TABLE IF NOT EXISTS Pedido_Item (
    pedido_item_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT, FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id) ON DELETE SET NULL,
    prato_id INT, FOREIGN KEY (prato_id) REFERENCES Prato(prato_id) ON DELETE SET NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    UNIQUE (pedido_id, prato_id)
);

-- Tabela de Votações
CREATE TABLE IF NOT EXISTS Votacao (
    votacao_id INT AUTO_INCREMENT PRIMARY KEY,
    prato_id INT NOT NULL, FOREIGN KEY (prato_id) REFERENCES Prato(prato_id),
    cliente_id INT NOT NULL, FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    data DATE NOT NULL,
    pontuacao INT CHECK (pontuacao BETWEEN 1 AND 5),
    UNIQUE (prato_id, cliente_id, data)
);

-- Tabela de Incidentes Técnicos
CREATE TABLE IF NOT EXISTS Incidente (
    incidente_id INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT NOT NULL,
    data_hora DATETIME NOT NULL,
    resolvido BOOLEAN DEFAULT FALSE
);

-- Tabela de Eventos Temáticos
CREATE TABLE IF NOT EXISTS Evento (
    evento_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data DATE NOT NULL,
    descricao TEXT
);

-- Tabela de Tipos de Pagamento
CREATE TABLE IF NOT EXISTS TipoPagamento (
    tipo_pagamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    emlinha BOOLEAN DEFAULT FALSE
);

-- Tabela de Entidades de Pagamento
CREATE TABLE IF NOT EXISTS EntidadePagamento (
    entidade_pagamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    comissao DECIMAL(5,2) DEFAULT 0
);

-- Tabela de Pagamentos
CREATE TABLE IF NOT EXISTS Pagamento (
    pagamento_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL, FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
    tipo_pagamento_id INT NOT NULL, FOREIGN KEY (tipo_pagamento_id) REFERENCES TipoPagamento(tipo_pagamento_id),
    entidade_pagamento_id INT, FOREIGN KEY (entidade_pagamento_id) REFERENCES EntidadePagamento(entidade_pagamento_id),
    valor DECIMAL(6,2) NOT NULL CHECK (valor > 0),
    data_hora DATETIME NOT NULL,
    referencia VARCHAR(100)
);

