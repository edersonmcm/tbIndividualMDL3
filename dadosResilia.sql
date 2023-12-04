create database dadosResilia;
use dadosResilia;

-- Tabela de Tecnologia
CREATE TABLE tecnologia (
id_tecnologia INT NOT NULL PRIMARY KEY,
nomeFerramenta VARCHAR(50) NOT NULL,
informacoes VARCHAR(100) NOT NULL, -- Ajustado para VARCHAR(100)
area VARCHAR(50) NOT NULL,
descArea VARCHAR(255) NOT NULL
);

-- Tabela de Empresa Participante
CREATE TABLE empresaParc (
id_empresaParc INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeFantasia VARCHAR(50) NOT NULL,
razaoSocial VARCHAR(50) NOT NULL,
descricao VARCHAR(255) NOT NULL
);

-- Tabela de Departamento
CREATE TABLE departamento (
id_departamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeDepartamento VARCHAR(50) NOT NULL,
descAtividade VARCHAR(255) NOT NULL, -- Ajustado para VARCHAR(255)
id_empresaParc INT NOT NULL,
FOREIGN KEY (id_empresaParc) REFERENCES empresaParc (id_empresaParc)
);

-- Tabela de Colaboradores

CREATE TABLE colaboradores (
id_colaborador INT NOT NULL PRIMARY KEY,
nomeColab VARCHAR(50) NOT NULL,
cpf VARCHAR(14) NOT NULL,
cargo VARCHAR(50) NOT NULL,
funcao VARCHAR(50) NOT NULL,
tipoContrato VARCHAR(50) NOT NULL,
id_departamento INT NOT NULL,
FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento)
);

-- Tabela de Relacionamento entre Tecnologia e Empresa Participante
CREATE TABLE tech_empresaParc (
id_tech_empresaParc INT NOT NULL PRIMARY KEY,
id_tecnologia INT NOT NULL,
id_empresaParc INT NOT NULL,
FOREIGN KEY (id_tecnologia) REFERENCES tecnologia (id_tecnologia),
FOREIGN KEY (id_empresaParc) REFERENCES empresaParc (id_empresaParc)
);

-- Inserindo dados na tabela tecnologia
INSERT INTO tecnologia (id_tecnologia, nomeFerramenta, informacoes, area, descArea)
VALUES
(1, 'Python', 'Utilizado para full stack, desde criação de sites, até análise de dados',
'Desenvolvimento', 'Prestação de serviços a partir de demandas que são solicitadas pelo
cliente'),
(2, 'Rstudio', 'Utilizado para análises estatísticas, inferências e modelos lineares', 'Estatística',
'Área responsável pelas análises estatísticas para melhor desempenho e otimização geral das
atividades');

-- Inserindo dados na tabela empresaParc
INSERT INTO empresaParc (nomeFantasia, razaoSocial, descricao)

VALUES
('Full TechTime', 'TechTime Soluções Integradas Ltda.', 'Com profissões de diversas áreas, a
TechTime utiliza o Python para prestação de serviços em diversas áreas'),
('Static Info', 'InfoEstática Tecnologia Ltda.', 'Empresa especializada em análises estatísticas
para melhorar o desempenho e otimização de tempo, pois tempo é dinheiro');

-- Inserindo dados na tabela departamento
INSERT INTO departamento (nomeDepartamento, descAtividade, id_empresaParc)
VALUES
('Dep. Desenvolvimento de Sistemas', 'Construção de sistemas para empresas, projetos e
atendimento de demandas tecnológicas', 1),
('Dep. Análises Estatísticas e Mercado', 'Implementações de modelos estatísticas,
amostragens, frequência de ocorrência com finalidade de agregar valor ao cliente', 2);

-- Inserindo dados na tabela colaboradores
INSERT INTO colaboradores (id_colaborador, nomeColab, cpf, cargo, funcao, tipoContrato,
id_departamento)
VALUES
(1, 'Andre Cunha', '155.789.023-32', 'Desenvolvedor(a) de Sistemas', 'Prospecção por IA', 'PJ',
1),
(2, 'Maria Silva', '123.456.789-01', 'Estatístico(a)', 'Análise de dados para tomada de decisão',
'CLT', 2);

-- Inserindo dados na tabela tech_empresaParc;
INSERT INTO tech_empresaParc (id_tech_empresaParc, id_tecnologia, id_empresaParc)
VALUES
(1, 1, 1),
(2, 2, 2);

select * from departamento
