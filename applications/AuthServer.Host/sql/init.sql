IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [AbpAuditLogs] (
    [Id] uniqueidentifier NOT NULL,
    [ExtraProperties] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [ApplicationName] nvarchar(96) NULL,
    [UserId] uniqueidentifier NULL,
    [UserName] nvarchar(256) NULL,
    [TenantId] uniqueidentifier NULL,
    [TenantName] nvarchar(max) NULL,
    [ImpersonatorUserId] uniqueidentifier NULL,
    [ImpersonatorTenantId] uniqueidentifier NULL,
    [ExecutionTime] datetime2 NOT NULL,
    [ExecutionDuration] int NOT NULL,
    [ClientIpAddress] nvarchar(64) NULL,
    [ClientName] nvarchar(128) NULL,
    [ClientId] nvarchar(64) NULL,
    [CorrelationId] nvarchar(64) NULL,
    [BrowserInfo] nvarchar(512) NULL,
    [HttpMethod] nvarchar(16) NULL,
    [Url] nvarchar(256) NULL,
    [Exceptions] nvarchar(4000) NULL,
    [Comments] nvarchar(256) NULL,
    [HttpStatusCode] int NULL,
    CONSTRAINT [PK_AbpAuditLogs] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpClaimTypes] (
    [Id] uniqueidentifier NOT NULL,
    [ExtraProperties] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(256) NOT NULL,
    [Name] nvarchar(256) NOT NULL,
    [Required] bit NOT NULL,
    [IsStatic] bit NOT NULL,
    [Regex] nvarchar(512) NULL,
    [RegexDescription] nvarchar(128) NULL,
    [Description] nvarchar(256) NULL,
    [ValueType] int NOT NULL,
    CONSTRAINT [PK_AbpClaimTypes] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpPermissionGrants] (
    [Id] uniqueidentifier NOT NULL,
    [TenantId] uniqueidentifier NULL,
    [Name] nvarchar(128) NOT NULL,
    [ProviderName] nvarchar(64) NOT NULL,
    [ProviderKey] nvarchar(64) NOT NULL,
    CONSTRAINT [PK_AbpPermissionGrants] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpRoles] (
    [Id] uniqueidentifier NOT NULL,
    [ExtraProperties] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(256) NOT NULL,
    [TenantId] uniqueidentifier NULL,
    [Name] nvarchar(256) NOT NULL,
    [NormalizedName] nvarchar(256) NOT NULL,
    [IsDefault] bit NOT NULL,
    [IsStatic] bit NOT NULL,
    [IsPublic] bit NOT NULL,
    CONSTRAINT [PK_AbpRoles] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpSettings] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(128) NOT NULL,
    [Value] nvarchar(2048) NOT NULL,
    [ProviderName] nvarchar(64) NULL,
    [ProviderKey] nvarchar(64) NULL,
    CONSTRAINT [PK_AbpSettings] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpUsers] (
    [Id] uniqueidentifier NOT NULL,
    [ExtraProperties] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [CreationTime] datetime2 NOT NULL,
    [CreatorId] uniqueidentifier NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierId] uniqueidentifier NULL,
    [IsDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
    [DeleterId] uniqueidentifier NULL,
    [DeletionTime] datetime2 NULL,
    [TenantId] uniqueidentifier NULL,
    [UserName] nvarchar(256) NOT NULL,
    [NormalizedUserName] nvarchar(256) NOT NULL,
    [Name] nvarchar(64) NULL,
    [Surname] nvarchar(64) NULL,
    [Email] nvarchar(256) NOT NULL,
    [NormalizedEmail] nvarchar(256) NOT NULL,
    [EmailConfirmed] bit NOT NULL DEFAULT CAST(0 AS bit),
    [PasswordHash] nvarchar(256) NULL,
    [SecurityStamp] nvarchar(256) NOT NULL,
    [PhoneNumber] nvarchar(16) NULL,
    [PhoneNumberConfirmed] bit NOT NULL DEFAULT CAST(0 AS bit),
    [TwoFactorEnabled] bit NOT NULL DEFAULT CAST(0 AS bit),
    [LockoutEnd] datetimeoffset NULL,
    [LockoutEnabled] bit NOT NULL DEFAULT CAST(0 AS bit),
    [AccessFailedCount] int NOT NULL DEFAULT 0,
    CONSTRAINT [PK_AbpUsers] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [IdentityServerApiResources] (
    [Id] uniqueidentifier NOT NULL,
    [ExtraProperties] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [CreationTime] datetime2 NOT NULL,
    [CreatorId] uniqueidentifier NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierId] uniqueidentifier NULL,
    [IsDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
    [DeleterId] uniqueidentifier NULL,
    [DeletionTime] datetime2 NULL,
    [Name] nvarchar(200) NOT NULL,
    [DisplayName] nvarchar(200) NULL,
    [Description] nvarchar(1000) NULL,
    [Enabled] bit NOT NULL,
    [Properties] nvarchar(max) NULL,
    CONSTRAINT [PK_IdentityServerApiResources] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [IdentityServerClients] (
    [Id] uniqueidentifier NOT NULL,
    [ExtraProperties] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [CreationTime] datetime2 NOT NULL,
    [CreatorId] uniqueidentifier NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierId] uniqueidentifier NULL,
    [IsDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
    [DeleterId] uniqueidentifier NULL,
    [DeletionTime] datetime2 NULL,
    [ClientId] nvarchar(200) NOT NULL,
    [ClientName] nvarchar(200) NULL,
    [Description] nvarchar(1000) NULL,
    [ClientUri] nvarchar(2000) NULL,
    [LogoUri] nvarchar(2000) NULL,
    [Enabled] bit NOT NULL,
    [ProtocolType] nvarchar(200) NOT NULL,
    [RequireClientSecret] bit NOT NULL,
    [RequireConsent] bit NOT NULL,
    [AllowRememberConsent] bit NOT NULL,
    [AlwaysIncludeUserClaimsInIdToken] bit NOT NULL,
    [RequirePkce] bit NOT NULL,
    [AllowPlainTextPkce] bit NOT NULL,
    [AllowAccessTokensViaBrowser] bit NOT NULL,
    [FrontChannelLogoutUri] nvarchar(2000) NULL,
    [FrontChannelLogoutSessionRequired] bit NOT NULL,
    [BackChannelLogoutUri] nvarchar(2000) NULL,
    [BackChannelLogoutSessionRequired] bit NOT NULL,
    [AllowOfflineAccess] bit NOT NULL,
    [IdentityTokenLifetime] int NOT NULL,
    [AccessTokenLifetime] int NOT NULL,
    [AuthorizationCodeLifetime] int NOT NULL,
    [ConsentLifetime] int NULL,
    [AbsoluteRefreshTokenLifetime] int NOT NULL,
    [SlidingRefreshTokenLifetime] int NOT NULL,
    [RefreshTokenUsage] int NOT NULL,
    [UpdateAccessTokenClaimsOnRefresh] bit NOT NULL,
    [RefreshTokenExpiration] int NOT NULL,
    [AccessTokenType] int NOT NULL,
    [EnableLocalLogin] bit NOT NULL,
    [IncludeJwtId] bit NOT NULL,
    [AlwaysSendClientClaims] bit NOT NULL,
    [ClientClaimsPrefix] nvarchar(200) NULL,
    [PairWiseSubjectSalt] nvarchar(200) NULL,
    [UserSsoLifetime] int NULL,
    [UserCodeType] nvarchar(100) NULL,
    [DeviceCodeLifetime] int NOT NULL,
    CONSTRAINT [PK_IdentityServerClients] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [IdentityServerDeviceFlowCodes] (
    [Id] uniqueidentifier NOT NULL,
    [ExtraProperties] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [CreationTime] datetime2 NOT NULL,
    [CreatorId] uniqueidentifier NULL,
    [DeviceCode] nvarchar(200) NOT NULL,
    [UserCode] nvarchar(200) NOT NULL,
    [SubjectId] nvarchar(200) NULL,
    [ClientId] nvarchar(200) NOT NULL,
    [Expiration] datetime2 NOT NULL,
    [Data] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_IdentityServerDeviceFlowCodes] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [IdentityServerIdentityResources] (
    [Id] uniqueidentifier NOT NULL,
    [ExtraProperties] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [CreationTime] datetime2 NOT NULL,
    [CreatorId] uniqueidentifier NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierId] uniqueidentifier NULL,
    [IsDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
    [DeleterId] uniqueidentifier NULL,
    [DeletionTime] datetime2 NULL,
    [Name] nvarchar(200) NOT NULL,
    [DisplayName] nvarchar(200) NULL,
    [Description] nvarchar(1000) NULL,
    [Enabled] bit NOT NULL,
    [Required] bit NOT NULL,
    [Emphasize] bit NOT NULL,
    [ShowInDiscoveryDocument] bit NOT NULL,
    [Properties] nvarchar(max) NULL,
    CONSTRAINT [PK_IdentityServerIdentityResources] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [IdentityServerPersistedGrants] (
    [Key] nvarchar(200) NOT NULL,
    [Id] uniqueidentifier NOT NULL,
    [ExtraProperties] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [Type] nvarchar(50) NOT NULL,
    [SubjectId] nvarchar(200) NULL,
    [ClientId] nvarchar(200) NOT NULL,
    [CreationTime] datetime2 NOT NULL,
    [Expiration] datetime2 NULL,
    [Data] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_IdentityServerPersistedGrants] PRIMARY KEY ([Key])
);

GO

CREATE TABLE [AbpAuditLogActions] (
    [Id] uniqueidentifier NOT NULL,
    [TenantId] uniqueidentifier NULL,
    [AuditLogId] uniqueidentifier NOT NULL,
    [ServiceName] nvarchar(256) NULL,
    [MethodName] nvarchar(128) NULL,
    [Parameters] nvarchar(2000) NULL,
    [ExecutionTime] datetime2 NOT NULL,
    [ExecutionDuration] int NOT NULL,
    [ExtraProperties] nvarchar(max) NULL,
    CONSTRAINT [PK_AbpAuditLogActions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpAuditLogActions_AbpAuditLogs_AuditLogId] FOREIGN KEY ([AuditLogId]) REFERENCES [AbpAuditLogs] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpEntityChanges] (
    [Id] uniqueidentifier NOT NULL,
    [AuditLogId] uniqueidentifier NOT NULL,
    [TenantId] uniqueidentifier NULL,
    [ChangeTime] datetime2 NOT NULL,
    [ChangeType] tinyint NOT NULL,
    [EntityTenantId] uniqueidentifier NULL,
    [EntityId] nvarchar(128) NOT NULL,
    [EntityTypeFullName] nvarchar(128) NOT NULL,
    [ExtraProperties] nvarchar(max) NULL,
    CONSTRAINT [PK_AbpEntityChanges] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpEntityChanges_AbpAuditLogs_AuditLogId] FOREIGN KEY ([AuditLogId]) REFERENCES [AbpAuditLogs] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpRoleClaims] (
    [Id] uniqueidentifier NOT NULL,
    [TenantId] uniqueidentifier NULL,
    [ClaimType] nvarchar(256) NOT NULL,
    [ClaimValue] nvarchar(1024) NULL,
    [RoleId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_AbpRoleClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpRoleClaims_AbpRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AbpRoles] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpUserClaims] (
    [Id] uniqueidentifier NOT NULL,
    [TenantId] uniqueidentifier NULL,
    [ClaimType] nvarchar(256) NOT NULL,
    [ClaimValue] nvarchar(1024) NULL,
    [UserId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_AbpUserClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpUserClaims_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpUserLogins] (
    [UserId] uniqueidentifier NOT NULL,
    [LoginProvider] nvarchar(64) NOT NULL,
    [TenantId] uniqueidentifier NULL,
    [ProviderKey] nvarchar(196) NOT NULL,
    [ProviderDisplayName] nvarchar(128) NULL,
    CONSTRAINT [PK_AbpUserLogins] PRIMARY KEY ([UserId], [LoginProvider]),
    CONSTRAINT [FK_AbpUserLogins_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpUserRoles] (
    [UserId] uniqueidentifier NOT NULL,
    [RoleId] uniqueidentifier NOT NULL,
    [TenantId] uniqueidentifier NULL,
    CONSTRAINT [PK_AbpUserRoles] PRIMARY KEY ([UserId], [RoleId]),
    CONSTRAINT [FK_AbpUserRoles_AbpRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AbpRoles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_AbpUserRoles_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpUserTokens] (
    [UserId] uniqueidentifier NOT NULL,
    [LoginProvider] nvarchar(64) NOT NULL,
    [Name] nvarchar(128) NOT NULL,
    [TenantId] uniqueidentifier NULL,
    [Value] nvarchar(max) NULL,
    CONSTRAINT [PK_AbpUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
    CONSTRAINT [FK_AbpUserTokens_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [IdentityServerApiClaims] (
    [Type] nvarchar(200) NOT NULL,
    [ApiResourceId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_IdentityServerApiClaims] PRIMARY KEY ([ApiResourceId], [Type]),
    CONSTRAINT [FK_IdentityServerApiClaims_IdentityServerApiResources_ApiResourceId] FOREIGN KEY ([ApiResourceId]) REFERENCES [IdentityServerApiResources] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [IdentityServerApiScopes] (
    [ApiResourceId] uniqueidentifier NOT NULL,
    [Name] nvarchar(200) NOT NULL,
    [DisplayName] nvarchar(200) NULL,
    [Description] nvarchar(1000) NULL,
    [Required] bit NOT NULL,
    [Emphasize] bit NOT NULL,
    [ShowInDiscoveryDocument] bit NOT NULL,
    CONSTRAINT [PK_IdentityServerApiScopes] PRIMARY KEY ([ApiResourceId], [Name]),
    CONSTRAINT [FK_IdentityServerApiScopes_IdentityServerApiResources_ApiResourceId] FOREIGN KEY ([ApiResourceId]) REFERENCES [IdentityServerApiResources] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [IdentityServerApiSecrets] (
    [Type] nvarchar(250) NOT NULL,
    [Value] nvarchar(4000) NOT NULL,
    [ApiResourceId] uniqueidentifier NOT NULL,
    [Description] nvarchar(2000) NULL,
    [Expiration] datetime2 NULL,
    CONSTRAINT [PK_IdentityServerApiSecrets] PRIMARY KEY ([ApiResourceId], [Type], [Value]),
    CONSTRAINT [FK_IdentityServerApiSecrets_IdentityServerApiResources_ApiResourceId] FOREIGN KEY ([ApiResourceId]) REFERENCES [IdentityServerApiResources] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [IdentityServerClientClaims] (
    [ClientId] uniqueidentifier NOT NULL,
    [Type] nvarchar(250) NOT NULL,
    [Value] nvarchar(250) NOT NULL,
    CONSTRAINT [PK_IdentityServerClientClaims] PRIMARY KEY ([ClientId], [Type], [Value]),
    CONSTRAINT [FK_IdentityServerClientClaims_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [IdentityServerClientCorsOrigins] (
    [ClientId] uniqueidentifier NOT NULL,
    [Origin] nvarchar(150) NOT NULL,
    CONSTRAINT [PK_IdentityServerClientCorsOrigins] PRIMARY KEY ([ClientId], [Origin]),
    CONSTRAINT [FK_IdentityServerClientCorsOrigins_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [IdentityServerClientGrantTypes] (
    [ClientId] uniqueidentifier NOT NULL,
    [GrantType] nvarchar(250) NOT NULL,
    CONSTRAINT [PK_IdentityServerClientGrantTypes] PRIMARY KEY ([ClientId], [GrantType]),
    CONSTRAINT [FK_IdentityServerClientGrantTypes_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [IdentityServerClientIdPRestrictions] (
    [ClientId] uniqueidentifier NOT NULL,
    [Provider] nvarchar(200) NOT NULL,
    CONSTRAINT [PK_IdentityServerClientIdPRestrictions] PRIMARY KEY ([ClientId], [Provider]),
    CONSTRAINT [FK_IdentityServerClientIdPRestrictions_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [IdentityServerClientPostLogoutRedirectUris] (
    [ClientId] uniqueidentifier NOT NULL,
    [PostLogoutRedirectUri] nvarchar(2000) NOT NULL,
    CONSTRAINT [PK_IdentityServerClientPostLogoutRedirectUris] PRIMARY KEY ([ClientId], [PostLogoutRedirectUri]),
    CONSTRAINT [FK_IdentityServerClientPostLogoutRedirectUris_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [IdentityServerClientProperties] (
    [ClientId] uniqueidentifier NOT NULL,
    [Key] nvarchar(250) NOT NULL,
    [Value] nvarchar(2000) NOT NULL,
    CONSTRAINT [PK_IdentityServerClientProperties] PRIMARY KEY ([ClientId], [Key]),
    CONSTRAINT [FK_IdentityServerClientProperties_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [IdentityServerClientRedirectUris] (
    [ClientId] uniqueidentifier NOT NULL,
    [RedirectUri] nvarchar(2000) NOT NULL,
    CONSTRAINT [PK_IdentityServerClientRedirectUris] PRIMARY KEY ([ClientId], [RedirectUri]),
    CONSTRAINT [FK_IdentityServerClientRedirectUris_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [IdentityServerClientScopes] (
    [ClientId] uniqueidentifier NOT NULL,
    [Scope] nvarchar(200) NOT NULL,
    CONSTRAINT [PK_IdentityServerClientScopes] PRIMARY KEY ([ClientId], [Scope]),
    CONSTRAINT [FK_IdentityServerClientScopes_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [IdentityServerClientSecrets] (
    [Type] nvarchar(250) NOT NULL,
    [Value] nvarchar(4000) NOT NULL,
    [ClientId] uniqueidentifier NOT NULL,
    [Description] nvarchar(2000) NULL,
    [Expiration] datetime2 NULL,
    CONSTRAINT [PK_IdentityServerClientSecrets] PRIMARY KEY ([ClientId], [Type], [Value]),
    CONSTRAINT [FK_IdentityServerClientSecrets_IdentityServerClients_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [IdentityServerClients] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [IdentityServerIdentityClaims] (
    [Type] nvarchar(200) NOT NULL,
    [IdentityResourceId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_IdentityServerIdentityClaims] PRIMARY KEY ([IdentityResourceId], [Type]),
    CONSTRAINT [FK_IdentityServerIdentityClaims_IdentityServerIdentityResources_IdentityResourceId] FOREIGN KEY ([IdentityResourceId]) REFERENCES [IdentityServerIdentityResources] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpEntityPropertyChanges] (
    [Id] uniqueidentifier NOT NULL,
    [TenantId] uniqueidentifier NULL,
    [EntityChangeId] uniqueidentifier NOT NULL,
    [NewValue] nvarchar(512) NULL,
    [OriginalValue] nvarchar(512) NULL,
    [PropertyName] nvarchar(128) NOT NULL,
    [PropertyTypeFullName] nvarchar(64) NOT NULL,
    CONSTRAINT [PK_AbpEntityPropertyChanges] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpEntityPropertyChanges_AbpEntityChanges_EntityChangeId] FOREIGN KEY ([EntityChangeId]) REFERENCES [AbpEntityChanges] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [IdentityServerApiScopeClaims] (
    [Type] nvarchar(200) NOT NULL,
    [ApiResourceId] uniqueidentifier NOT NULL,
    [Name] nvarchar(200) NOT NULL,
    CONSTRAINT [PK_IdentityServerApiScopeClaims] PRIMARY KEY ([ApiResourceId], [Name], [Type]),
    CONSTRAINT [FK_IdentityServerApiScopeClaims_IdentityServerApiScopes_ApiResourceId_Name] FOREIGN KEY ([ApiResourceId], [Name]) REFERENCES [IdentityServerApiScopes] ([ApiResourceId], [Name]) ON DELETE CASCADE
);

GO

CREATE INDEX [IX_AbpAuditLogActions_AuditLogId] ON [AbpAuditLogActions] ([AuditLogId]);

GO

CREATE INDEX [IX_AbpAuditLogActions_TenantId_ServiceName_MethodName_ExecutionTime] ON [AbpAuditLogActions] ([TenantId], [ServiceName], [MethodName], [ExecutionTime]);

GO

CREATE INDEX [IX_AbpAuditLogs_TenantId_ExecutionTime] ON [AbpAuditLogs] ([TenantId], [ExecutionTime]);

GO

CREATE INDEX [IX_AbpAuditLogs_TenantId_UserId_ExecutionTime] ON [AbpAuditLogs] ([TenantId], [UserId], [ExecutionTime]);

GO

CREATE INDEX [IX_AbpEntityChanges_AuditLogId] ON [AbpEntityChanges] ([AuditLogId]);

GO

CREATE INDEX [IX_AbpEntityChanges_TenantId_EntityTypeFullName_EntityId] ON [AbpEntityChanges] ([TenantId], [EntityTypeFullName], [EntityId]);

GO

CREATE INDEX [IX_AbpEntityPropertyChanges_EntityChangeId] ON [AbpEntityPropertyChanges] ([EntityChangeId]);

GO

CREATE INDEX [IX_AbpPermissionGrants_Name_ProviderName_ProviderKey] ON [AbpPermissionGrants] ([Name], [ProviderName], [ProviderKey]);

GO

CREATE INDEX [IX_AbpRoleClaims_RoleId] ON [AbpRoleClaims] ([RoleId]);

GO

CREATE INDEX [IX_AbpRoles_NormalizedName] ON [AbpRoles] ([NormalizedName]);

GO

CREATE INDEX [IX_AbpSettings_Name_ProviderName_ProviderKey] ON [AbpSettings] ([Name], [ProviderName], [ProviderKey]);

GO

CREATE INDEX [IX_AbpUserClaims_UserId] ON [AbpUserClaims] ([UserId]);

GO

CREATE INDEX [IX_AbpUserLogins_LoginProvider_ProviderKey] ON [AbpUserLogins] ([LoginProvider], [ProviderKey]);

GO

CREATE INDEX [IX_AbpUserRoles_RoleId_UserId] ON [AbpUserRoles] ([RoleId], [UserId]);

GO

CREATE INDEX [IX_AbpUsers_Email] ON [AbpUsers] ([Email]);

GO

CREATE INDEX [IX_AbpUsers_NormalizedEmail] ON [AbpUsers] ([NormalizedEmail]);

GO

CREATE INDEX [IX_AbpUsers_NormalizedUserName] ON [AbpUsers] ([NormalizedUserName]);

GO

CREATE INDEX [IX_AbpUsers_UserName] ON [AbpUsers] ([UserName]);

GO

CREATE INDEX [IX_IdentityServerClients_ClientId] ON [IdentityServerClients] ([ClientId]);

GO

CREATE UNIQUE INDEX [IX_IdentityServerDeviceFlowCodes_DeviceCode] ON [IdentityServerDeviceFlowCodes] ([DeviceCode]);

GO

CREATE INDEX [IX_IdentityServerDeviceFlowCodes_Expiration] ON [IdentityServerDeviceFlowCodes] ([Expiration]);

GO

CREATE UNIQUE INDEX [IX_IdentityServerDeviceFlowCodes_UserCode] ON [IdentityServerDeviceFlowCodes] ([UserCode]);

GO

CREATE INDEX [IX_IdentityServerPersistedGrants_Expiration] ON [IdentityServerPersistedGrants] ([Expiration]);

GO

CREATE INDEX [IX_IdentityServerPersistedGrants_SubjectId_ClientId_Type] ON [IdentityServerPersistedGrants] ([SubjectId], [ClientId], [Type]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200106080946_Initial', N'3.1.2');

GO

CREATE TABLE [AbpTenants] (
    [Id] uniqueidentifier NOT NULL,
    [ExtraProperties] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [CreationTime] datetime2 NOT NULL,
    [CreatorId] uniqueidentifier NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierId] uniqueidentifier NULL,
    [IsDeleted] bit NOT NULL DEFAULT CAST(0 AS bit),
    [DeleterId] uniqueidentifier NULL,
    [DeletionTime] datetime2 NULL,
    [Name] nvarchar(64) NOT NULL,
    CONSTRAINT [PK_AbpTenants] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpTenantConnectionStrings] (
    [TenantId] uniqueidentifier NOT NULL,
    [Name] nvarchar(64) NOT NULL,
    [Value] nvarchar(1024) NOT NULL,
    CONSTRAINT [PK_AbpTenantConnectionStrings] PRIMARY KEY ([TenantId], [Name]),
    CONSTRAINT [FK_AbpTenantConnectionStrings_AbpTenants_TenantId] FOREIGN KEY ([TenantId]) REFERENCES [AbpTenants] ([Id]) ON DELETE CASCADE
);

GO

CREATE INDEX [IX_AbpTenants_Name] ON [AbpTenants] ([Name]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200304125631_Added_Tenant_Management', N'3.1.2');

GO

CREATE TABLE [AbpFeatureValues] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(128) NOT NULL,
    [Value] nvarchar(128) NOT NULL,
    [ProviderName] nvarchar(64) NULL,
    [ProviderKey] nvarchar(64) NULL,
    CONSTRAINT [PK_AbpFeatureValues] PRIMARY KEY ([Id])
);

GO

CREATE INDEX [IX_AbpFeatureValues_Name_ProviderName_ProviderKey] ON [AbpFeatureValues] ([Name], [ProviderName], [ProviderKey]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200304155131_Added_Feature_Management', N'3.1.2');

GO

