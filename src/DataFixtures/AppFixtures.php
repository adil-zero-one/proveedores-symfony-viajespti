<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;
use App\Entity\Proveedor;

// esto funciona pero cuando lo llevas a bd borra los datos
// que tienes en la table y inserta los nuevos
// entonces mirare alternativa ( faker ) para insertar datos sin borrar nada de bd

class AppFixtures extends Fixture
{
    // protected $faker;

    public function load(ObjectManager $manager): void
    {
        // $faker = \Faker\Factory\::create();
        // $this->faker = Factory::create();

        // entrada informacion a bd en locale Español
        // $faker = Factory::create('es_ES');

        // voy a probar entrar 10 proveedores de manera automatica primero
        // a base de datos

        // for ($i = 0; $i < 10; $i++) {
            // usamos los atributos que estan en la classe Proveedor
            // nombre, correo, telefono..
            // $proveedor = new Proveedor();
            // $proveedor->setNombre($faker->company());
            // $proveedor->setEmail($faker->unique()->email());
            // $proveedor->setTelefono($faker->phoneNumber());
            // $proveedor->setTipoProveedor($faker->randomElement(array(
        //         "hotel",
        //         "crucero",
        //         "estacion de esqui",
        //         "parque tematico"
        //     )));
        //     $proveedor->setActivo($faker->boolean());

        //     $manager->persist($proveedor);
        // }

        // $manager->flush();
    }
}
