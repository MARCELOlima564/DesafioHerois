CREATE DATABASE desafioherios;

CREATE TABLE herois(
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
poder VARCHAR(100) NOT NULL,
nivel INT NOT NULL,
hp INT NOT NULL 
);

CREATE TABLE batalhas(
    id SERIAL PRIMARY KEY,
    heroi1_id INT NOT NULL,
    heroi2_id INT NOT NULL,
    ganhardor_id INT NOT NULL,
    FOREING KEY (heroi1_id) REFERENCES herois(id),
    FOREING KEY (heroi2_id) REFERENCES herois(id),
    FOREING KEY (ganhador_id) REFERENCES herois(id)
);

INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Homem de Ferro', 'Armadura Tecnológica', 10, 100);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Homem-Aranha', 'Sentido Aranha', 10, 90);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Thor', 'Mjolnir', 10, 95);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Capitão América', 'Escudo Indestrutível', 10, 85);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Hulk', 'Força Descomunal', 10, 85);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Viúva Negra', 'Habilidades de Espionagem', 10, 90);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Pantera Negra', 'Traje de Vibranium', 10, 95);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Doutor Estranho', 'Magia das Artes Místicas', 10, 85);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Capitã Marvel', 'Poderes Cósmicos', 10, 85);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Gavião Arqueiro', 'Precisão de Tiro', 10, 90);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Feiticeira Escarlate', 'Manipulação de Realidade', 10, 95);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Homem-Formiga', 'Encolhimento', 10, 85);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Vespa', 'Voo e Ataques de Energia', 10, 85);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Doutor Destino', 'Magia Negra', 10, 90);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Falcão', 'Asas e Habilidades de Voo', 10, 95);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Máquina de Combate', 'Armadura de Combate', 10, 85);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Mercúrio', 'Super Velocidade', 10, 85);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Noturno', 'Teleportação e Agilidade', 10, 90);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Colossus', 'Força e Resistência Sobre-Humanas', 10, 95);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Gambit', 'Carga Cinética', 10, 85);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Ciclope', 'Visão de Raio-X', 10, 85);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Jean Grey', 'Telepatia e Telecinese', 10, 90);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Tempestade', 'Controle do Clima', 10, 95);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Wolverine', 'Fator de Cura e Garras de Adamantium', 10, 85);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Senhor das Estrelas', 'Líder dos Guardiões da Galáxia', 10, 85);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Rocket Raccoon', 'Engenhocas e Armas', 10, 90);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Groot', 'Regeneração e Manipulação de Plantas', 10, 95);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Gamora', 'Habilidades de Combate', 10, 85);
INSERT INTO herois (nome, poder, nivel, hp) VALUES ('Drax, o Destruidor', 'Força e Habilidades de Combate', 10, 85);