<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20231220141232 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE lesson ADD teacher_id INT NOT NULL, ADD student_id INT NOT NULL');
        $this->addSql('ALTER TABLE lesson ADD CONSTRAINT FK_F87474F341807E1D FOREIGN KEY (teacher_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE lesson ADD CONSTRAINT FK_F87474F3CB944F1A FOREIGN KEY (student_id) REFERENCES user (id)');
        $this->addSql('CREATE INDEX IDX_F87474F341807E1D ON lesson (teacher_id)');
        $this->addSql('CREATE INDEX IDX_F87474F3CB944F1A ON lesson (student_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE lesson DROP FOREIGN KEY FK_F87474F341807E1D');
        $this->addSql('ALTER TABLE lesson DROP FOREIGN KEY FK_F87474F3CB944F1A');
        $this->addSql('DROP INDEX IDX_F87474F341807E1D ON lesson');
        $this->addSql('DROP INDEX IDX_F87474F3CB944F1A ON lesson');
        $this->addSql('ALTER TABLE lesson DROP teacher_id, DROP student_id');
    }
}
