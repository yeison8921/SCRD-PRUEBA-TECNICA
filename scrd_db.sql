-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         PostgreSQL 14.2, compiled by Visual C++ build 1914, 64-bit
-- SO del servidor:              
-- HeidiSQL Versión:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla public.conductores
CREATE TABLE IF NOT EXISTS "conductores" (
	"id" BIGINT NOT NULL DEFAULT 'nextval(''conductores_id_seq''::regclass)',
	"identificacion" INTEGER NOT NULL,
	"nombre" VARCHAR(255) NOT NULL,
	"apellido" VARCHAR(255) NOT NULL,
	"telefono" INTEGER NOT NULL,
	"direccion" VARCHAR(255) NOT NULL,
	"created_at" TIMESTAMP NULL DEFAULT NULL,
	"updated_at" TIMESTAMP NULL DEFAULT NULL,
	"deleted_at" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Volcando datos para la tabla public.conductores: 0 rows
DELETE FROM "conductores";
/*!40000 ALTER TABLE "conductores" DISABLE KEYS */;
/*!40000 ALTER TABLE "conductores" ENABLE KEYS */;

-- Volcando estructura para tabla public.failed_jobs
CREATE TABLE IF NOT EXISTS "failed_jobs" (
	"id" BIGINT NOT NULL DEFAULT 'nextval(''failed_jobs_id_seq''::regclass)',
	"uuid" VARCHAR(255) NOT NULL,
	"connection" TEXT NOT NULL,
	"queue" TEXT NOT NULL,
	"payload" TEXT NOT NULL,
	"exception" TEXT NOT NULL,
	"failed_at" TIMESTAMP NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	PRIMARY KEY ("id"),
	UNIQUE INDEX "failed_jobs_uuid_unique" ("uuid")
);

-- Volcando datos para la tabla public.failed_jobs: 0 rows
DELETE FROM "failed_jobs";
/*!40000 ALTER TABLE "failed_jobs" DISABLE KEYS */;
/*!40000 ALTER TABLE "failed_jobs" ENABLE KEYS */;

-- Volcando estructura para tabla public.migrations
CREATE TABLE IF NOT EXISTS "migrations" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''migrations_id_seq''::regclass)',
	"migration" VARCHAR(255) NOT NULL,
	"batch" INTEGER NOT NULL,
	PRIMARY KEY ("id")
);

-- Volcando datos para la tabla public.migrations: 0 rows
DELETE FROM "migrations";
/*!40000 ALTER TABLE "migrations" DISABLE KEYS */;
/*!40000 ALTER TABLE "migrations" ENABLE KEYS */;

-- Volcando estructura para tabla public.password_resets
CREATE TABLE IF NOT EXISTS "password_resets" (
	"email" VARCHAR(255) NOT NULL,
	"token" VARCHAR(255) NOT NULL,
	"created_at" TIMESTAMP NULL DEFAULT NULL,
	INDEX "password_resets_email_index" ("email")
);

-- Volcando datos para la tabla public.password_resets: 0 rows
DELETE FROM "password_resets";
/*!40000 ALTER TABLE "password_resets" DISABLE KEYS */;
/*!40000 ALTER TABLE "password_resets" ENABLE KEYS */;

-- Volcando estructura para tabla public.personal_access_tokens
CREATE TABLE IF NOT EXISTS "personal_access_tokens" (
	"id" BIGINT NOT NULL DEFAULT 'nextval(''personal_access_tokens_id_seq''::regclass)',
	"tokenable_type" VARCHAR(255) NOT NULL,
	"tokenable_id" BIGINT NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"token" VARCHAR(64) NOT NULL,
	"abilities" TEXT NULL DEFAULT NULL,
	"last_used_at" TIMESTAMP NULL DEFAULT NULL,
	"created_at" TIMESTAMP NULL DEFAULT NULL,
	"updated_at" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	INDEX "personal_access_tokens_tokenable_type_tokenable_id_index" ("tokenable_type", "tokenable_id"),
	UNIQUE INDEX "personal_access_tokens_token_unique" ("token")
);

-- Volcando datos para la tabla public.personal_access_tokens: 0 rows
DELETE FROM "personal_access_tokens";
/*!40000 ALTER TABLE "personal_access_tokens" DISABLE KEYS */;
/*!40000 ALTER TABLE "personal_access_tokens" ENABLE KEYS */;

-- Volcando estructura para tabla public.users
CREATE TABLE IF NOT EXISTS "users" (
	"id" BIGINT NOT NULL DEFAULT 'nextval(''users_id_seq''::regclass)',
	"name" VARCHAR(255) NOT NULL,
	"email" VARCHAR(255) NOT NULL,
	"email_verified_at" TIMESTAMP NULL DEFAULT NULL,
	"password" VARCHAR(255) NOT NULL,
	"remember_token" VARCHAR(100) NULL DEFAULT NULL,
	"created_at" TIMESTAMP NULL DEFAULT NULL,
	"updated_at" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	UNIQUE INDEX "users_email_unique" ("email")
);

-- Volcando datos para la tabla public.users: 0 rows
DELETE FROM "users";
/*!40000 ALTER TABLE "users" DISABLE KEYS */;
/*!40000 ALTER TABLE "users" ENABLE KEYS */;

-- Volcando estructura para tabla public.vehiculos
CREATE TABLE IF NOT EXISTS "vehiculos" (
	"id" BIGINT NOT NULL DEFAULT 'nextval(''vehiculos_id_seq''::regclass)',
	"placa" VARCHAR(255) NOT NULL,
	"modelo" INTEGER NOT NULL,
	"capacidad" VARCHAR(255) NOT NULL,
	"conductor_id" BIGINT NULL DEFAULT NULL,
	"created_at" TIMESTAMP NULL DEFAULT NULL,
	"updated_at" TIMESTAMP NULL DEFAULT NULL,
	"deleted_at" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "vehiculos_conductor_id_foreign" FOREIGN KEY ("conductor_id") REFERENCES "conductores" ("id") ON UPDATE NO ACTION ON DELETE RESTRICT
);

-- Volcando datos para la tabla public.vehiculos: 0 rows
DELETE FROM "vehiculos";
/*!40000 ALTER TABLE "vehiculos" DISABLE KEYS */;
/*!40000 ALTER TABLE "vehiculos" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
