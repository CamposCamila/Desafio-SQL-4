-- Criação de banco de dados para o cenário de Oficina Mecânica
CREATE DATABASE oficina;
USE oficina;

-- Criar tabela cliente
CREATE TABLE cliente (
    idcliente INT AUTO_INCREMENT PRIMARY KEY,
    Pnome VARCHAR(10) NOT NULL,
    CPF CHAR(11) NOT NULL,
    endereço VARCHAR(45),
    dnascimento DATE,
    contato VARCHAR(45),
    constraint unique_cpf_cliente unique (cpf)
);

-- Criar tabela conserto
CREATE TABLE conserto (
    idconserto INT AUTO_INCREMENT PRIMARY KEY,
    Mcarro VARCHAR(255) NOT NULL,
    problema VARCHAR(255),
    FOREIGN KEY (idcliente) REFERENCES cliente(idcliente)
);

-- Criar tabela revisão periódica
CREATE TABLE rperiodica (
    idrperiodica INT AUTO_INCREMENT PRIMARY KEY,
    Mcarro VARCHAR(255) NOT NULL,
    problema VARCHAR(255),
    FOREIGN KEY (idcliente) REFERENCES cliente(idcliente)
);

-- Criar tabela mecânico
CREATE TABLE mecanico (
    idmecanico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    código VARCHAR(45),
    endereço VARCHAR(45),
    especialidade VARCHAR(45),
	constraint unique_mecanico unique (código),
    FOREIGN KEY (idconserto) REFERENCES conserto(idconserto),
    FOREIGN KEY (idrperiodica) REFERENCES rperiodica(idrperiodica)
);

-- Criar tabela serviço 
CREATE TABLE serviço (
    idserviço INT AUTO_INCREMENT PRIMARY KEY,
    Problema VARCHAR(255) NOT NULL,
    Mobra VARCHAR(45),
    Vpeça VARCHAR(45),
    Vserviço VARCHAR(45) NOT NULL,
    FOREIGN KEY (idmecanico) REFERENCES mecanico(idmecanico)
);

-- Criar tabela ordem de serviço
CREATE TABLE os (
    idos INT AUTO_INCREMENT PRIMARY KEY,
    idcliente INT NOT NULL,
    numero VARCHAR(45),
    dataemissão DATE NOT NULL,
    formapagamento ENUM('cartão','dinheiro') DEFAULT 'Aberta',
    status VARCHAR(45),
    dataconclusão DATE,
	constraint unique_os unique (numero),
    FOREIGN KEY (idserviço) REFERENCES serviço(idserviço)
);

-- Criar tabela equipe executa serviço 
CREATE TABLE equipeES (
    idequipeES INT AUTO_INCREMENT PRIMARY KEY,
    idos INT NOT NULL,
    idmecanico INT NOT NULL,
    FOREIGN KEY (idos) REFERENCES ordemdeserviço(idos)
);

-- Criar tabela de finalizado
CREATE TABLE finalizado (
    idfinalizado INT AUTO_INCREMENT PRIMARY KEY,
    idos INT NOT NULL,
    FOREIGN KEY (idserviço) REFERENCES servico(idserviço),
    FOREIGN KEY (idEquipeES) REFERENCES equipeES(idEquipeES)
);

show databases;
use oficina;
show tables;
select * from mecânico;
