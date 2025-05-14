-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EditoraAtlas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EditoraAtlas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EditoraAtlas` DEFAULT CHARACTER SET utf8 ;
USE `EditoraAtlas` ;

-- -----------------------------------------------------
-- Table `EditoraAtlas`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`Livro` (
  `isbn` VARCHAR(17) NOT NULL,
  `titulo` VARCHAR(70) NOT NULL,
  `genero` VARCHAR(25) NOT NULL,
  `descricao` VARCHAR(140) NULL,
  `numeroPagina` INT NOT NULL,
  `dataPublicacao` DATE NOT NULL,
  `idLivro` VARCHAR(45) NULL,
  PRIMARY KEY (`isbn`),
  UNIQUE INDEX `isbn_UNIQUE` (`isbn` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`PalavraChave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`PalavraChave` (
  `idPalavraChave` INT NOT NULL,
  `descricao` VARCHAR(120) NULL,
  PRIMARY KEY (`idPalavraChave`),
  UNIQUE INDEX `idPalavraChave_UNIQUE` (`idPalavraChave` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`Autor` (
  `idAutor` INT NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `biografia` VARCHAR(140) NULL,
  `nacionalidade` VARCHAR(25) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `obras` VARCHAR(70) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAutor`),
  UNIQUE INDEX `idAutor_UNIQUE` (`idAutor` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`AreaDeConhecimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`AreaDeConhecimento` (
  `codigoArea` INT NOT NULL,
  `descricao` VARCHAR(140) NULL,
  PRIMARY KEY (`codigoArea`),
  UNIQUE INDEX `codigoArea_UNIQUE` (`codigoArea` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`Exemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`Exemplar` (
  `idExemplar` INT NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `localizacao_Fisica` VARCHAR(90) NULL,
  `dataFabricacao` DATETIME NOT NULL,
  `Livro_isbn` VARCHAR(17) NOT NULL,
  PRIMARY KEY (`idExemplar`),
  INDEX `Livro_isbn_idx` (`Livro_isbn` ASC) VISIBLE,
  UNIQUE INDEX `idExemplar_UNIQUE` (`idExemplar` ASC) VISIBLE,
  CONSTRAINT `fk_exemplar_livro`
    FOREIGN KEY (`Livro_isbn`)
    REFERENCES `EditoraAtlas`.`Livro` (`isbn`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`LivroAutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`LivroAutor` (
  `Autor_idAutor` INT NOT NULL,
  `Livro_isbn` VARCHAR(17) NOT NULL,
  PRIMARY KEY (`Livro_isbn`, `Autor_idAutor`),
  INDEX `livro_isbn_idx` (`Livro_isbn` ASC) VISIBLE,
  UNIQUE INDEX `Autor_idAutor_UNIQUE` (`Autor_idAutor` ASC) VISIBLE,
  UNIQUE INDEX `Livro_isbn_UNIQUE` (`Livro_isbn` ASC) VISIBLE,
  CONSTRAINT `fk_livroAutor_autor`
    FOREIGN KEY (`Autor_idAutor`)
    REFERENCES `EditoraAtlas`.`Autor` (`idAutor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_livroAutor_livro`
    FOREIGN KEY (`Livro_isbn`)
    REFERENCES `EditoraAtlas`.`Livro` (`isbn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`LivroArea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`LivroArea` (
  `AreaDeCon_codigoArea` INT NOT NULL,
  `Livro_isbn` VARCHAR(17) NOT NULL,
  PRIMARY KEY (`AreaDeCon_codigoArea`, `Livro_isbn`),
  INDEX `Livro_isbn_idx` (`Livro_isbn` ASC) VISIBLE,
  UNIQUE INDEX `AreaDeCon_codigoArea_UNIQUE` (`AreaDeCon_codigoArea` ASC) VISIBLE,
  UNIQUE INDEX `Livro_isbn_UNIQUE` (`Livro_isbn` ASC) VISIBLE,
  CONSTRAINT `fk_livroArea_areaCon`
    FOREIGN KEY (`Livro_isbn`)
    REFERENCES `EditoraAtlas`.`Livro` (`isbn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_livroArea_livro`
    FOREIGN KEY (`AreaDeCon_codigoArea`)
    REFERENCES `EditoraAtlas`.`AreaDeConhecimento` (`codigoArea`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `nomeFantasia` VARCHAR(60) NULL,
  `tipoCliente` VARCHAR(8) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC) VISIBLE,
  UNIQUE INDEX `telefone_UNIQUE` (`telefone` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`Pedido` (
  `idPedido` INT NOT NULL,
  `dataPedido` DATETIME NOT NULL,
  `statusPedido` VARCHAR(45) NOT NULL,
  `observacao` VARCHAR(90) NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `Cliente_idCliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  UNIQUE INDEX `idPedido_UNIQUE` (`idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `EditoraAtlas`.`Cliente` (`idCliente`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`PessoaFisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`PessoaFisica` (
  `cpf` VARCHAR(14) NOT NULL,
  `genero` VARCHAR(20) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`cpf`, `Cliente_idCliente`),
  INDEX `fk_pessoaFisica_cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  UNIQUE INDEX `Cliente_idCliente_UNIQUE` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_pf_cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `EditoraAtlas`.`Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`EnderecoPf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`EnderecoPf` (
  `PessoaFisica_cpf` VARCHAR(14) NOT NULL,
  `uf` VARCHAR(2) NOT NULL,
  `cidade` VARCHAR(60) NOT NULL,
  `bairro` VARCHAR(60) NOT NULL,
  `rua` VARCHAR(70) NOT NULL,
  `numero` INT(11) NULL,
  `complemento` VARCHAR(45) NULL,
  `cep` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`PessoaFisica_cpf`),
  UNIQUE INDEX `PessoaFisica_cpf_UNIQUE` (`PessoaFisica_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_endereco_pf`
    FOREIGN KEY (`PessoaFisica_cpf`)
    REFERENCES `EditoraAtlas`.`PessoaFisica` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`PessoaJuridica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`PessoaJuridica` (
  `cnpj` VARCHAR(18) NOT NULL,
  `razaoSocial` VARCHAR(45) NOT NULL,
  `dataFundacao` DATE NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`cnpj`, `Cliente_idCliente`),
  INDEX `fk_pj_cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) VISIBLE,
  UNIQUE INDEX `Cliente_idCliente_UNIQUE` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_pj_cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `EditoraAtlas`.`Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`EnderecoPj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`EnderecoPj` (
  `PessoaJuri_cnpj` VARCHAR(18) NOT NULL,
  `uf` VARCHAR(2) NOT NULL,
  `cidade` VARCHAR(60) NOT NULL,
  `bairro` VARCHAR(60) NOT NULL,
  `rua` VARCHAR(70) NOT NULL,
  `numero` INT(11) NULL,
  `complemento` VARCHAR(45) NULL,
  `cep` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`PessoaJuri_cnpj`),
  UNIQUE INDEX `PessoaJuri_cnpj_UNIQUE` (`PessoaJuri_cnpj` ASC) VISIBLE,
  CONSTRAINT `fk_endereco_pj`
    FOREIGN KEY (`PessoaJuri_cnpj`)
    REFERENCES `EditoraAtlas`.`PessoaJuridica` (`cnpj`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`Funcionario` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `genero` VARCHAR(20) NOT NULL,
  `estadoCivil` VARCHAR(15) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `salario` DECIMAL(7,2) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `dataAdm` DATETIME NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  UNIQUE INDEX `telefone_UNIQUE` (`telefone` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`Venda` (
  `idVenda` INT NOT NULL,
  `data` DATETIME NOT NULL,
  `valor` DECIMAL(6,2) NOT NULL,
  `desconto` DECIMAL(4,2) NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idVenda`),
  INDEX `fk_venda_pedido_idx` (`Pedido_idPedido` ASC) VISIBLE,
  INDEX `fk_venda_funcionario_idx` (`Funcionario_cpf` ASC) VISIBLE,
  INDEX `fk_venda_cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  UNIQUE INDEX `idVenda_UNIQUE` (`idVenda` ASC) VISIBLE,
  CONSTRAINT `fk_venda_pedido`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `EditoraAtlas`.`Pedido` (`idPedido`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_venda_funcionario`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `EditoraAtlas`.`Funcionario` (`cpf`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_venda_cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `EditoraAtlas`.`Cliente` (`idCliente`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`Departamento` (
  `idDepartamento` INT NOT NULL,
  `nomeDepartamento` VARCHAR(45) NOT NULL,
  `responsavel` VARCHAR(60) NOT NULL,
  `descricaoAtv` VARCHAR(140) NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NULL,
  PRIMARY KEY (`idDepartamento`),
  INDEX `fk_departamento_funcionario_idx` (`Funcionario_cpf` ASC) VISIBLE,
  UNIQUE INDEX `idDepartamento_UNIQUE` (`idDepartamento` ASC) VISIBLE,
  UNIQUE INDEX `telefone_UNIQUE` (`telefone` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_departamento_funcionario`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `EditoraAtlas`.`Funcionario` (`cpf`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`FormaDePag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`FormaDePag` (
  `idPagamento` INT NOT NULL,
  `tipoPagamento` VARCHAR(45) NOT NULL,
  `parcelas` INT NULL,
  `valorPago` DECIMAL(6,2) NOT NULL,
  `Venda_idVenda` INT NOT NULL,
  PRIMARY KEY (`idPagamento`),
  INDEX `Venda_idVenda_idx` (`Venda_idVenda` ASC) VISIBLE,
  UNIQUE INDEX `idPagamento_UNIQUE` (`idPagamento` ASC) VISIBLE,
  CONSTRAINT `fk_formaPag_venda`
    FOREIGN KEY (`Venda_idVenda`)
    REFERENCES `EditoraAtlas`.`Venda` (`idVenda`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`EnderecoFunc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`EnderecoFunc` (
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  `uf` VARCHAR(2) NOT NULL,
  `cidade` VARCHAR(60) NOT NULL,
  `bairro` VARCHAR(60) NOT NULL,
  `rua` VARCHAR(70) NOT NULL,
  `numero` INT(11) NULL,
  `complemento` VARCHAR(45) NULL,
  `cep` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`Funcionario_cpf`),
  UNIQUE INDEX `Funcionario_cpf_UNIQUE` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_endereco_funcionario`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `EditoraAtlas`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`PalavraLivro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`PalavraLivro` (
  `PalavraChave_idPalavraChave` INT NOT NULL,
  `Livro_isbn` VARCHAR(17) NOT NULL,
  PRIMARY KEY (`PalavraChave_idPalavraChave`, `Livro_isbn`),
  INDEX `fk_palavraLivro_livro_idx` (`Livro_isbn` ASC) VISIBLE,
  UNIQUE INDEX `PalavraChave_idPalavraChave_UNIQUE` (`PalavraChave_idPalavraChave` ASC) VISIBLE,
  UNIQUE INDEX `Livro_isbn_UNIQUE` (`Livro_isbn` ASC) VISIBLE,
  CONSTRAINT `fk_palavraLivro_palavraChave`
    FOREIGN KEY (`PalavraChave_idPalavraChave`)
    REFERENCES `EditoraAtlas`.`PalavraChave` (`idPalavraChave`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_palavraLivro_livro`
    FOREIGN KEY (`Livro_isbn`)
    REFERENCES `EditoraAtlas`.`Livro` (`isbn`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EditoraAtlas`.`ExemplarPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EditoraAtlas`.`ExemplarPedido` (
  `idExemplarPedido` INT NOT NULL,
  `Exemplar_idExemplar` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  INDEX `fk_pedido_exemplarPed_idx` (`Pedido_idPedido` ASC) VISIBLE,
  PRIMARY KEY (`idExemplarPedido`),
  UNIQUE INDEX `idExemplarPedido_UNIQUE` (`idExemplarPedido` ASC) VISIBLE,
  CONSTRAINT `fk_exemplar_exemplarPed`
    FOREIGN KEY (`Exemplar_idExemplar`)
    REFERENCES `EditoraAtlas`.`Exemplar` (`idExemplar`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_exemplarPed`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `EditoraAtlas`.`Pedido` (`idPedido`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
