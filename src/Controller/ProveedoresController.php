<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Proveedor;
use App\Form\ProveedorFormType;
use App\Repository\ProveedorRepository;
use SebastianBergmann\CodeCoverage\Test\Target\Method;
use Symfony\Component\Validator\Validator\ValidatorInterface;

final class ProveedoresController extends AbstractController
{
    // controlador ruta que mostra un listado de todos los proveedores
    #[Route('/', name: 'listado_proveedores')]
    public function index(ProveedorRepository $repo): Response
    {
        // cogiendo los proveedores de la base de datos
        $proveedores = $repo->findAll();

        // renderizar el templado y pasar los datos 
        return $this->render('proveedores/index.html.twig', [
            'proveedores' => $proveedores
        ]);
    }


    // guardo la ruta index de abajo para mi, la de arriba es mas facil
    // de encontrar problemas

    // #[Route('/', name: 'lista_proveedores')]
    // public function index(ProveedorRepository $repo): Response
    // {
    //     return $this->render('proveedores/index.html.twig', [
    //         'proveedores' => $repo->findAll(),
    //     ]);
    // }


    // eliminar un proveedor

    #[Route('/eliminar/{id}', name: 'borrar_proveedor', methods: ['POST'])]
    public function delete(Request $request, Proveedor $proveedor, EntityManagerInterface $em): Response
    {
        // proteccion csrf
        if ($this->isCsrfTokenValid('delete' . $proveedor->getId(), $request->request->get('_token'))) {
            $em->remove($proveedor);
            $em->flush();
            $this->addFlash('deleted', 'Proveedor ' .  $proveedor->getNombre() . ' eliminado correctamente');
        }
        return $this->redirectToRoute('listado_proveedores');
    }

    // modificar un proveedor
    #[Route('/proveedor/{id}/modificar', name: 'modificar_proveedor', methods: ['GET', 'POST'])]
    public function edit(Request $request, Proveedor $proveedor, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(ProveedorFormType::class, $proveedor);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $proveedor->setUpdatedAt(new \DateTimeImmutable());
            $em->flush();
            $this->addFlash('modificado', 'Proveedor modificado correctamente!');
            // rederigir para que se vean los cambios de actualizacion
            return $this->redirectToRoute('modificar_proveedor', [
                'id' => $proveedor->getId()
            ]);
        }
        return $this->render('proveedores/edit.html.twig', [
            'form' => $form->createView(),
            'proveedor' => $proveedor,
        ]);
    }

    // crear un nuevo proveedor

    #[Route('nuevo/proveedor', name: 'nuevo_proveedor')]
    public function new(Request $request, EntityManagerInterface $em, ValidatorInterface $validator): Response
    {
        $proveedor = new Proveedor();

        if ($request->isMethod('POST')) {

            $proveedor->setNombre($request->request->get('nombre'));
            $proveedor->setEmail($request->request->get('email'));
            $proveedor->setTelefono($request->request->get('telefono'));
            $proveedor->setTipoProveedor($request->request->get('tipoProveedor'));
            $proveedor->setActivo($request->request->getBoolean('activo'));

            $errors = $validator->validate($proveedor);

            if (count($errors) > 0) {
                return $this->render('proveedores/new.html.twig', [
                    'errors' => $errors,
                    'proveedor' => $proveedor
                ]);
            }

            $em->persist($proveedor);
            $em->flush();

            $this->addFlash('nuevoProveedor', 'Proveedor creado correctamente!');
            return $this->redirectToRoute('listado_proveedores');
        }

        return $this->render('proveedores/new.html.twig', [
            'proveedor' => $proveedor
        ]);
    }

    // aqui una funcion extra que te deja generar 10 proveedores
    // de manera automatica, la he hecho con el faker en command
    // la implemento en el navbar tambien

    #[Route('/generar10', name: 'generar_proveedores')]
    public function seed(EntityManagerInterface $em): Response
    {
        $faker = \Faker\Factory::create('es_ES');

        for ($i = 0; $i < 10; $i++) {
            $proveedor = new Proveedor();
            $proveedor->setNombre($faker->company());
            $proveedor->setEmail($faker->unique()->email());
            $proveedor->setTelefono($faker->phoneNumber());
            $proveedor->setTipoProveedor($faker->randomElement([
                "hotel",
                "crucero",
                "estacion de esqui",
                "parque tematico"
            ]));
            $proveedor->setActivo($faker->boolean());
            $em->persist($proveedor);
            
        }

        $em->flush();
        $this->addFlash('generarProveedores', '10 Proveedores generados correctamente!');
        return $this->redirectToRoute('listado_proveedores');
    }
}
