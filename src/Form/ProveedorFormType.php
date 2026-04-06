<?php

namespace App\Form;

use App\Entity\Proveedor;
// use Doctrine\DBAL\Types\TextType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Email;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class ProveedorFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nombre', TextType::class)
            ->add('email', EmailType::class)
            ->add('telefono', TextType::class)
            ->add('tipo_proveedor', ChoiceType::class, [
                'choices' => [
                    'Hotel' => 'hotel',
                    'Crucero' => 'crucero',
                    'Estación de esquí' => 'estación de esquí',
                    'Parque temático' => 'parque temático'
                ]
            ])
            ->add('activo')
            ->add('created_at', null, [
                'widget' => 'single_text',
                // datas de creacion i actualizacion(modificacion)
                // los pondre como incambiables
                'disabled' => true,
            ])
            ->add('updated_at', null, [
                'widget' => 'single_text',
                'disabled' => true
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Proveedor::class,
        ]);
    }
}
