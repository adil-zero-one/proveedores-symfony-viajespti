<?php

namespace App\Command;

use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use Doctrine\ORM\EntityManagerInterface;
use Faker\Factory;
use App\Entity\Proveedor;

#[AsCommand(
    name: 'app:seed-proveedores',
    description: 'Add a short description for your command',
)]
class SeedProveedoresCommand extends Command
{
    public function __construct(private EntityManagerInterface $entity_manager)
    {
        parent::__construct();
    }

    protected function configure(): void
    {
        $this;
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
          // entrada informacion a bd en locale Español
        $faker = Factory::create('es_ES');

        // voy a probar entrar 10 proveedores de manera automatica primero
        // a base de datos

        for ($i = 0; $i < 10; $i++) {
            // usamos los atributos que estan en la classe Proveedor
            // nombre, correo, telefono..
            $proveedor = new Proveedor();
            $proveedor->setNombre($faker->company());
            $proveedor->setEmail($faker->unique()->email());
            $proveedor->setTelefono($faker->phoneNumber());
            $proveedor->setTipoProveedor($faker->randomElement(array(
                "hotel",
                "crucero",
                "estacion de esqui",
                "parque tematico"
            )));
            $proveedor->setActivo($faker->boolean());

            $this->entity_manager->persist($proveedor);
        }

        // guardarlo todo
        $this->entity_manager->flush();

        $io->success('10 proveedores generados con Faker.');

        // terminal para generar -> symfony console app:seed-proveedores
        return Command::SUCCESS;
    }
}
