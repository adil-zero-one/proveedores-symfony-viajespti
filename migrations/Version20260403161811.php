<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260403161811 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // necesitaba poner el default a la data actual 

        $this->addSql("ALTER TABLE PROVEEDORES 
        CHANGE created_at created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        CHANGE updated_at updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP");
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE proveedores CHANGE tipo_proveedor tipo_proveedor ENUM(\'hotel\', \'crucero\', \'estacion de esqui\', \'parque tematico\') DEFAULT NULL');
    }
}
