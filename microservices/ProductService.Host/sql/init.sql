IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [PmProducts] (
    [Id] uniqueidentifier NOT NULL,
    [ExtraProperties] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [CreationTime] datetime2 NOT NULL,
    [CreatorId] uniqueidentifier NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierId] uniqueidentifier NULL,
    [Code] nvarchar(32) NOT NULL,
    [Name] nvarchar(256) NOT NULL,
    [Price] real NOT NULL,
    [StockCount] int NOT NULL,
    [ImageName] nvarchar(128) NULL,
    CONSTRAINT [PK_PmProducts] PRIMARY KEY ([Id])
);

GO

CREATE INDEX [IX_PmProducts_Code] ON [PmProducts] ([Code]);

GO

CREATE INDEX [IX_PmProducts_Name] ON [PmProducts] ([Name]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20190408114353_Initial', N'3.1.2');

GO

