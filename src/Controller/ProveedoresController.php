<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class ProveedoresController extends AbstractController
{
    #[Route('/proveedores', name: 'app_proveedores')]
    public function index(): Response
    {
        return $this->render('proveedores/index.html.twig', [
            'controller_name' => 'ProveedoresController',
        ]);
    }
}
