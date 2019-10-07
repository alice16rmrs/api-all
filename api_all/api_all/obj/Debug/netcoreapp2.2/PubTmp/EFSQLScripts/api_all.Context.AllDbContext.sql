CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(95) NOT NULL,
    `ProductVersion` varchar(32) NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
);


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190920213557_Inicio') THEN

    CREATE TABLE `Lanches` (
        `Id` char(36) NOT NULL,
        `CreateAt` datetime(6) NULL,
        `UpdateAt` datetime(6) NULL,
        `LancheId` int NOT NULL,
        `Nome` varchar(45) NOT NULL,
        `Descricao` varchar(80) NOT NULL,
        `Preco` decimal(65, 30) NOT NULL,
        `ImagemUrl` varchar(200) NULL,
        `ImagemThumbnailUrl` varchar(200) NULL,
        CONSTRAINT `PK_Lanches` PRIMARY KEY (`Id`)
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190920213557_Inicio') THEN

    CREATE TABLE `Usuarios` (
        `Id` char(36) NOT NULL,
        `CreateAt` datetime(6) NULL,
        `UpdateAt` datetime(6) NULL,
        `Cpf` varchar(14) NOT NULL,
        `Nome` varchar(50) NOT NULL,
        `Email` varchar(50) NOT NULL,
        `Telefone` varchar(25) NOT NULL,
        `Login` varchar(45) NOT NULL,
        `Senha` varchar(8) NULL,
        `Cep` int NOT NULL,
        `Cidade` varchar(100) NULL,
        `Bairro` varchar(100) NULL,
        `Rua` varchar(100) NULL,
        `Numero` int NOT NULL,
        CONSTRAINT `PK_Usuarios` PRIMARY KEY (`Id`)
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190920213557_Inicio') THEN

    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20190920213557_Inicio', '2.2.6-servicing-10079');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190921024721_Carrinho') THEN

    CREATE TABLE `CarrinhoCompraItens` (
        `CarrinhoCompraItemId` int NOT NULL AUTO_INCREMENT,
        `LancheId` char(36) NULL,
        `Quantidade` int NOT NULL,
        `CarrinhoCompraId` varchar(200) NULL,
        CONSTRAINT `PK_CarrinhoCompraItens` PRIMARY KEY (`CarrinhoCompraItemId`),
        CONSTRAINT `FK_CarrinhoCompraItens_Lanches_LancheId` FOREIGN KEY (`LancheId`) REFERENCES `Lanches` (`Id`) ON DELETE RESTRICT
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190921024721_Carrinho') THEN

    CREATE INDEX `IX_CarrinhoCompraItens_LancheId` ON `CarrinhoCompraItens` (`LancheId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190921024721_Carrinho') THEN

    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20190921024721_Carrinho', '2.2.6-servicing-10079');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190921132825_alterUser') THEN

    ALTER TABLE `Usuarios` MODIFY COLUMN `Cep` varchar(8) NOT NULL;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190921132825_alterUser') THEN

    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20190921132825_alterUser', '2.2.6-servicing-10079');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190922115414_AlterKey') THEN

    DROP PROCEDURE IF EXISTS POMELO_BEFORE_DROP_PRIMARY_KEY;
    CREATE PROCEDURE POMELO_BEFORE_DROP_PRIMARY_KEY(IN `SCHEMA_NAME_ARGUMENT` VARCHAR(255), IN `TABLE_NAME_ARGUMENT` VARCHAR(255))
    BEGIN
    	DECLARE HAS_AUTO_INCREMENT_ID TINYINT(1);
    	DECLARE PRIMARY_KEY_COLUMN_NAME VARCHAR(255);
    	DECLARE PRIMARY_KEY_TYPE VARCHAR(255);
    	DECLARE SQL_EXP VARCHAR(1000);
    	SELECT COUNT(*)
    		INTO HAS_AUTO_INCREMENT_ID
    		FROM `information_schema`.`COLUMNS`
    		WHERE `TABLE_SCHEMA` = (SELECT IFNULL(SCHEMA_NAME_ARGUMENT, SCHEMA()))
    			AND `TABLE_NAME` = TABLE_NAME_ARGUMENT
    			AND `Extra` = 'auto_increment'
    			AND `COLUMN_KEY` = 'PRI'
    			LIMIT 1;
    	IF HAS_AUTO_INCREMENT_ID THEN
    		SELECT `COLUMN_TYPE`
    			INTO PRIMARY_KEY_TYPE
    			FROM `information_schema`.`COLUMNS`
    			WHERE `TABLE_SCHEMA` = (SELECT IFNULL(SCHEMA_NAME_ARGUMENT, SCHEMA()))
    				AND `TABLE_NAME` = TABLE_NAME_ARGUMENT
    				AND `COLUMN_KEY` = 'PRI'
    			LIMIT 1;
    		SELECT `COLUMN_NAME`
    			INTO PRIMARY_KEY_COLUMN_NAME
    			FROM `information_schema`.`COLUMNS`
    			WHERE `TABLE_SCHEMA` = (SELECT IFNULL(SCHEMA_NAME_ARGUMENT, SCHEMA()))
    				AND `TABLE_NAME` = TABLE_NAME_ARGUMENT
    				AND `COLUMN_KEY` = 'PRI'
    			LIMIT 1;
    		SET SQL_EXP = CONCAT('ALTER TABLE `', (SELECT IFNULL(SCHEMA_NAME_ARGUMENT, SCHEMA())), '`.`', TABLE_NAME_ARGUMENT, '` MODIFY COLUMN `', PRIMARY_KEY_COLUMN_NAME, '` ', PRIMARY_KEY_TYPE, ' NOT NULL;');
    		SET @SQL_EXP = SQL_EXP;
    		PREPARE SQL_EXP_EXECUTE FROM @SQL_EXP;
    		EXECUTE SQL_EXP_EXECUTE;
    		DEALLOCATE PREPARE SQL_EXP_EXECUTE;
    	END IF;
    END;
    CALL POMELO_BEFORE_DROP_PRIMARY_KEY(NULL, 'CarrinhoCompraItens');
    DROP PROCEDURE IF EXISTS POMELO_BEFORE_DROP_PRIMARY_KEY;
    ALTER TABLE `CarrinhoCompraItens` DROP PRIMARY KEY;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190922115414_AlterKey') THEN

    ALTER TABLE `Lanches` DROP COLUMN `LancheId`;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190922115414_AlterKey') THEN

    ALTER TABLE `CarrinhoCompraItens` DROP COLUMN `CarrinhoCompraItemId`;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190922115414_AlterKey') THEN

    ALTER TABLE `CarrinhoCompraItens` ADD `Id` char(36) NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190922115414_AlterKey') THEN

    ALTER TABLE `CarrinhoCompraItens` ADD `CreateAt` datetime(6) NULL;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190922115414_AlterKey') THEN

    ALTER TABLE `CarrinhoCompraItens` ADD `UpdateAt` datetime(6) NULL;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190922115414_AlterKey') THEN

    ALTER TABLE `CarrinhoCompraItens` ADD CONSTRAINT `PK_CarrinhoCompraItens` PRIMARY KEY (`Id`);
    DROP PROCEDURE IF EXISTS POMELO_AFTER_ADD_PRIMARY_KEY;
    CREATE PROCEDURE POMELO_AFTER_ADD_PRIMARY_KEY(IN `SCHEMA_NAME_ARGUMENT` VARCHAR(255), IN `TABLE_NAME_ARGUMENT` VARCHAR(255), IN `COLUMN_NAME_ARGUMENT` VARCHAR(255))
    BEGIN
    	DECLARE HAS_AUTO_INCREMENT_ID INT(11);
    	DECLARE PRIMARY_KEY_COLUMN_NAME VARCHAR(255);
    	DECLARE PRIMARY_KEY_TYPE VARCHAR(255);
    	DECLARE SQL_EXP VARCHAR(1000);
    	SELECT COUNT(*)
    		INTO HAS_AUTO_INCREMENT_ID
    		FROM `information_schema`.`COLUMNS`
    		WHERE `TABLE_SCHEMA` = (SELECT IFNULL(SCHEMA_NAME_ARGUMENT, SCHEMA()))
    			AND `TABLE_NAME` = TABLE_NAME_ARGUMENT
    			AND `COLUMN_NAME` = COLUMN_NAME_ARGUMENT
    			AND `COLUMN_TYPE` LIKE '%int%'
    			AND `COLUMN_KEY` = 'PRI';
    	IF HAS_AUTO_INCREMENT_ID THEN
    		SELECT `COLUMN_TYPE`
    			INTO PRIMARY_KEY_TYPE
    			FROM `information_schema`.`COLUMNS`
    			WHERE `TABLE_SCHEMA` = (SELECT IFNULL(SCHEMA_NAME_ARGUMENT, SCHEMA()))
    				AND `TABLE_NAME` = TABLE_NAME_ARGUMENT
    				AND `COLUMN_NAME` = COLUMN_NAME_ARGUMENT
    				AND `COLUMN_TYPE` LIKE '%int%'
    				AND `COLUMN_KEY` = 'PRI';
    		SELECT `COLUMN_NAME`
    			INTO PRIMARY_KEY_COLUMN_NAME
    			FROM `information_schema`.`COLUMNS`
    			WHERE `TABLE_SCHEMA` = (SELECT IFNULL(SCHEMA_NAME_ARGUMENT, SCHEMA()))
    				AND `TABLE_NAME` = TABLE_NAME_ARGUMENT
    				AND `COLUMN_NAME` = COLUMN_NAME_ARGUMENT
    				AND `COLUMN_TYPE` LIKE '%int%'
    				AND `COLUMN_KEY` = 'PRI';
    		SET SQL_EXP = CONCAT('ALTER TABLE `', (SELECT IFNULL(SCHEMA_NAME_ARGUMENT, SCHEMA())), '`.`', TABLE_NAME_ARGUMENT, '` MODIFY COLUMN `', PRIMARY_KEY_COLUMN_NAME, '` ', PRIMARY_KEY_TYPE, ' NOT NULL AUTO_INCREMENT;');
    		SET @SQL_EXP = SQL_EXP;
    		PREPARE SQL_EXP_EXECUTE FROM @SQL_EXP;
    		EXECUTE SQL_EXP_EXECUTE;
    		DEALLOCATE PREPARE SQL_EXP_EXECUTE;
    	END IF;
    END;
    CALL POMELO_AFTER_ADD_PRIMARY_KEY(NULL, 'CarrinhoCompraItens', 'Id');
    DROP PROCEDURE IF EXISTS POMELO_AFTER_ADD_PRIMARY_KEY;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190922115414_AlterKey') THEN

    CREATE TABLE `Pedidos` (
        `Id` char(36) NOT NULL,
        `CreateAt` datetime(6) NULL,
        `UpdateAt` datetime(6) NULL,
        CONSTRAINT `PK_Pedidos` PRIMARY KEY (`Id`)
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190922115414_AlterKey') THEN

    CREATE TABLE `PedidoDetalhes` (
        `Id` char(36) NOT NULL,
        `CreateAt` datetime(6) NULL,
        `UpdateAt` datetime(6) NULL,
        `PedidoId` char(36) NOT NULL,
        `LancheId` char(36) NOT NULL,
        `Quantidade` int NOT NULL,
        `Preco` decimal(65, 30) NOT NULL,
        CONSTRAINT `PK_PedidoDetalhes` PRIMARY KEY (`Id`),
        CONSTRAINT `FK_PedidoDetalhes_Lanches_LancheId` FOREIGN KEY (`LancheId`) REFERENCES `Lanches` (`Id`) ON DELETE CASCADE,
        CONSTRAINT `FK_PedidoDetalhes_Pedidos_PedidoId` FOREIGN KEY (`PedidoId`) REFERENCES `Pedidos` (`Id`) ON DELETE CASCADE
    );

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190922115414_AlterKey') THEN

    CREATE INDEX `IX_PedidoDetalhes_LancheId` ON `PedidoDetalhes` (`LancheId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190922115414_AlterKey') THEN

    CREATE INDEX `IX_PedidoDetalhes_PedidoId` ON `PedidoDetalhes` (`PedidoId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;


DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20190922115414_AlterKey') THEN

    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20190922115414_AlterKey', '2.2.6-servicing-10079');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

