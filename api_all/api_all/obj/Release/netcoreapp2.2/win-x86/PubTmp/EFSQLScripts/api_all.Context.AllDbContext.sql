IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004220928_azure')
BEGIN
    CREATE TABLE [Lanches] (
        [Id] uniqueidentifier NOT NULL,
        [CreateAt] datetime2 NULL,
        [UpdateAt] datetime2 NULL,
        [Nome] nvarchar(45) NOT NULL,
        [Descricao] nvarchar(80) NOT NULL,
        [Preco] decimal(18,2) NOT NULL,
        [ImagemUrl] nvarchar(200) NULL,
        [ImagemThumbnailUrl] nvarchar(200) NULL,
        CONSTRAINT [PK_Lanches] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004220928_azure')
BEGIN
    CREATE TABLE [Pedidos] (
        [Id] uniqueidentifier NOT NULL,
        [CreateAt] datetime2 NULL,
        [UpdateAt] datetime2 NULL,
        CONSTRAINT [PK_Pedidos] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004220928_azure')
BEGIN
    CREATE TABLE [Usuarios] (
        [Id] uniqueidentifier NOT NULL,
        [CreateAt] datetime2 NULL,
        [UpdateAt] datetime2 NULL,
        [Cpf] nvarchar(14) NOT NULL,
        [Nome] nvarchar(50) NOT NULL,
        [Email] nvarchar(50) NOT NULL,
        [Telefone] nvarchar(25) NOT NULL,
        [Login] nvarchar(45) NOT NULL,
        [Senha] nvarchar(8) NULL,
        [Cep] nvarchar(8) NOT NULL,
        [Cidade] nvarchar(100) NULL,
        [Bairro] nvarchar(100) NULL,
        [Rua] nvarchar(100) NULL,
        [Numero] int NOT NULL,
        CONSTRAINT [PK_Usuarios] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004220928_azure')
BEGIN
    CREATE TABLE [CarrinhoCompraItens] (
        [Id] uniqueidentifier NOT NULL,
        [CreateAt] datetime2 NULL,
        [UpdateAt] datetime2 NULL,
        [LancheId] uniqueidentifier NULL,
        [Quantidade] int NOT NULL,
        [CarrinhoCompraId] nvarchar(200) NULL,
        CONSTRAINT [PK_CarrinhoCompraItens] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_CarrinhoCompraItens_Lanches_LancheId] FOREIGN KEY ([LancheId]) REFERENCES [Lanches] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004220928_azure')
BEGIN
    CREATE TABLE [PedidoDetalhes] (
        [Id] uniqueidentifier NOT NULL,
        [CreateAt] datetime2 NULL,
        [UpdateAt] datetime2 NULL,
        [PedidoId] uniqueidentifier NOT NULL,
        [LancheId] uniqueidentifier NOT NULL,
        [Quantidade] int NOT NULL,
        [Preco] decimal(18,2) NOT NULL,
        CONSTRAINT [PK_PedidoDetalhes] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_PedidoDetalhes_Lanches_LancheId] FOREIGN KEY ([LancheId]) REFERENCES [Lanches] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_PedidoDetalhes_Pedidos_PedidoId] FOREIGN KEY ([PedidoId]) REFERENCES [Pedidos] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004220928_azure')
BEGIN
    CREATE INDEX [IX_CarrinhoCompraItens_LancheId] ON [CarrinhoCompraItens] ([LancheId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004220928_azure')
BEGIN
    CREATE INDEX [IX_PedidoDetalhes_LancheId] ON [PedidoDetalhes] ([LancheId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004220928_azure')
BEGIN
    CREATE INDEX [IX_PedidoDetalhes_PedidoId] ON [PedidoDetalhes] ([PedidoId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004220928_azure')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191004220928_azure', N'2.2.6-servicing-10079');
END;

GO

