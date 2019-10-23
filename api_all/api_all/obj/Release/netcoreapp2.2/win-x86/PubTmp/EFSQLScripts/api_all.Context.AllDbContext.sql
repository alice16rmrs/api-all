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

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191020132847_AddIdentity')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191020132847_AddIdentity', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191021225711_role')
BEGIN
    ALTER TABLE [Usuarios] ADD [Role] nvarchar(max) NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191021225711_role')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191021225711_role', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191023001211_ajustecarrinho')
BEGIN
    ALTER TABLE [CarrinhoCompraItens] DROP CONSTRAINT [PK_CarrinhoCompraItens];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191023001211_ajustecarrinho')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CarrinhoCompraItens]') AND [c].[name] = N'Id');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [CarrinhoCompraItens] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [CarrinhoCompraItens] DROP COLUMN [Id];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191023001211_ajustecarrinho')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CarrinhoCompraItens]') AND [c].[name] = N'CreateAt');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [CarrinhoCompraItens] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [CarrinhoCompraItens] DROP COLUMN [CreateAt];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191023001211_ajustecarrinho')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CarrinhoCompraItens]') AND [c].[name] = N'UpdateAt');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [CarrinhoCompraItens] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [CarrinhoCompraItens] DROP COLUMN [UpdateAt];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191023001211_ajustecarrinho')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[CarrinhoCompraItens]') AND [c].[name] = N'CarrinhoCompraId');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [CarrinhoCompraItens] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [CarrinhoCompraItens] ALTER COLUMN [CarrinhoCompraId] nvarchar(100) NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191023001211_ajustecarrinho')
BEGIN
    ALTER TABLE [CarrinhoCompraItens] ADD [CarrinhoCompraItemId] int NOT NULL IDENTITY;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191023001211_ajustecarrinho')
BEGIN
    ALTER TABLE [CarrinhoCompraItens] ADD CONSTRAINT [PK_CarrinhoCompraItens] PRIMARY KEY ([CarrinhoCompraItemId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191023001211_ajustecarrinho')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191023001211_ajustecarrinho', N'2.2.6-servicing-10079');
END;

GO

