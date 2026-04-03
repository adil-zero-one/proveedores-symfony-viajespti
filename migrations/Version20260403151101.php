<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260403151101 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE proveedores ADD created_at DATETIME NOT NULL, ADD updated_at DATETIME NOT NULL, CHANGE tipo_proveedor tipo_proveedor ENUM(\'hotel\',\'crucero\',\'estacion de esqui\',\'parque tematico\')');
        
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE proveedores DROP created_at, DROP updated_at, CHANGE tipo_proveedor tipo_proveedor ENUM(\'hotel\', \'crucero\', \'estacion de esqui\', \'parque tematico\') DEFAULT NULL');
    }
}
