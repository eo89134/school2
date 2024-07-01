<?php

namespace App\Form;

use App\Entity\Lesson;
use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class LessonType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('schoolles')
            ->add('doelles')
            ->add('time')
            ->add('date')
            ->add('student',EntityType::class, [
                'class'=> User::class,
                'query_builder'=> function (UserRepository $userRepository){
                return $userRepository->createQueryBuilder('u')
                    ->where('u.roles LIKE :roles')
                    ->setParameter('roles', '%STUDENT%');
                },
                'choice_label'=>'name'
            ])
            ->add('toevooegen', SubmitType::class);
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Lesson::class,
        ]);
    }
}
