<?php

namespace App\Entity;

use App\Repository\ProveedorRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Constraints\Length;

#[ORM\Entity(repositoryClass: ProveedorRepository::class)]

#[ORM\HasLifecycleCallbacks] // hace falta para que funcione el updated_at

// override el nombre de la tabla en base de datos
#[ORM\Table(name: "proveedores")]
class Proveedor
{
    // columna id 
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    public function getId(): ?int
    {
        return $this->id;
    }
    // fin columna id


    // COLUMNA NOMBRE
    #[ORM\Column(length: 50, nullable: false)]
    #[Assert\NotBlank(message: "El campo nombre es obligatiorio!")] // obligacion
    #[Assert\Length(
        min: 3,
        max: 50,
        minMessage: "El nombre debe tener al menos 3 characters",
        maxMessage: "El nombre debe tener como maximo 50 characteres!"
    )] // validacion
    private ?string $nombre = null;

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(string $nombre): static
    {
        $this->nombre = $nombre;

        return $this;
    }
    // fin columna nombre


    // columna Correo electrónico
    // probando validaciones y definicion de datos
    // doctrine + symfony validator

    #[ORM\Column(length: 100, unique: true)]
    #[Assert\NotBlank(message: "El email es obligatorio")]
    #[Assert\Email(message: "Debe ser un email valido!")] // tipo columna EMAIL
    // VALIDACION LONGITUD + MENSAJES
    #[Assert\Length(
        min: 5,
        max: 100,
        minMessage: "El Email debe tener al menos 5 characters",
        maxMessage: "El Email debe tener como maximo 100 characteres!"
    )] // validator
    private ?string $email = null;

    public function getEmail(): ?string
    {
        return $this->email;
    }
    public function setEmail(string $email): static
    {
        $this->email = $email;
        return $this;
    }
    // fin columna correo electronico 


    // columna Teléfono de contacto 

    #[ORM\Column(length: 24)]
    // LO PONGO A STRING POR SI HACE FALTA AÑADIR +34..
    private ?string $telefono = null;

    public function getTelefono(): ?string
    {
        return $this->telefono;
    }

    public function setTelefono(string $telefono): static
    {
        $this->telefono = $telefono;
        return $this;
    }

    // columna Tipo de proveedor

    // como igualmente voy a validarlo con los 3 tipos que me habeis dado
    // me gustaria que aparezca tambien en base de datos como tipos
    // asi que utilizare enum para 

    #[ORM\Column(
        type: "string",
        length: 20,
        columnDefinition: "ENUM('hotel','crucero','estacion de esqui','parque tematico')"
    )]

    #[Assert\Choice(choices: [
        "hotel",
        "crucero",
        "estación de esquí",
        "parque temático"
    ])]

    private ?string $tipo_proveedor = null;

    // fin columna tipo proveedor

    // columna activo - default: false

    #[ORM\Column(type: "boolean")]
    private ?bool $activo = false;

    // fin columna activo

    // columna creacion de proveedor a la primera vez

    #[ORM\Column]
    private ?\DateTimeImmutable $created_at = null;

    // fin columna created at

    // columna actualizacion de proveedor,, a la primera vez seria 
    // igual a created_at

    #[ORM\Column]
    private ?\DateTimeImmutable $updated_at = null;

    // fin columna updated at

    /* 
       constructor para created-updated at
       cuando se crea un nuevo proveedor -> la data de creacion = a 
       data de actualizacion
    */

    public function __construct()
    {
        $this->created_at = new \DateTimeImmutable();
        $this->updated_at = new \DateTimeImmutable();
    }

    // cuando se modifica (actualiza) un proveedor solamente
    // cambiamos la data de actualizacion

    #[ORM\PreUpdate]
    public function actualizarProveedor(): void
    {
        $this->updated_at = new \DateTimeImmutable();
    }

    // Getters y Setters automaticos de comando

    public function getTipoProveedor(): ?string
    {
        return $this->tipo_proveedor;
    }

    public function setTipoProveedor(string $tipo_proveedor): static
    {
        $this->tipo_proveedor = $tipo_proveedor;

        return $this;
    }

    public function isActivo(): ?bool
    {
        return $this->activo;
    }

    public function setActivo(bool $activo): static
    {
        $this->activo = $activo;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeImmutable $created_at): static
    {
        $this->created_at = $created_at;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updated_at;
    }

    public function setUpdatedAt(\DateTimeImmutable $updated_at): static
    {
        $this->updated_at = $updated_at;

        return $this;
    }
}
