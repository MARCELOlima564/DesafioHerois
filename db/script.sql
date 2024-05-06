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
    FOREING KEY (heroi2_id) REFERENCES herois(id)
);