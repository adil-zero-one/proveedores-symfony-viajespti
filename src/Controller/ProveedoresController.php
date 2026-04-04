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


final class ProveedoresController extends AbstractController
{
    // controlador ruta que mostra un listado de todos los proveedores
    #[Route('/', name: 'listado_proveedores')]
    public function index(ProveedorRepository $repo): Response
    {
        // cogiendo los proveedores de la base de datos
        $proveedores = $repo->findAll();

        // renderizar el templado y pasar los datos 
        return $this->render('proveedores/index.html.twig',[
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

   
}
