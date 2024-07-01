<?php

namespace App\Controller;

use App\Entity\Announcement;
use App\Entity\Lesson;
use App\Entity\User;
use App\Form\AnnouncementType;
use App\Form\UserType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    #[Route('/admin', name: 'app_admin')]
    public function index(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'AdminController',
        ]);
    }
    #[Route('/admin/announcement', name: 'app_announcement_admin')]
    public function announcement(Request $request, EntityManagerInterface $entityManager): Response
    {
        $announce = new Announcement();
        $form = $this->createForm(AnnouncementType::class, $announce);
        $form->handleRequest($request);
        // last username entered by the user
        if ($form->isSubmitted() && $form->isValid()) {
            $announce= $form->getData();
            $announce->setAdmin($this->getUser());
            $entityManager->persist($announce);
            $entityManager->flush();

            $this->addFlash('success', 'ik heb de announcement toegevoegd');
            return $this->redirectToRoute('app_admin');
        }
        return $this->renderForm('admin/announcement.html.twig', [
            'form' => $form,
        ]);
    }
    #[Route('/admin/dashboard', name: 'app_dashboard_admin')]
    public function dashboard(EntityManagerInterface $entityManager): Response
    {
        $lesson = $entityManager->getRepository(Lesson::class)->findAll();

        return $this->render('admin/dashboard.html.twig', [
            'lessons' => $lesson,
        ]);
    }
    #[Route('/admin/registerteacher', name: 'app_registerteacher')]
    public function registerteacher(Request $request, EntityManagerInterface $entityManager, UserPasswordHasherInterface $userPasswordHasher): Response
    {
        $user = new user();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);
        // last username entered by the user
        if ($form->isSubmitted() && $form->isValid()) {
            $user->setRoles(["ROLE_TEACHER"]);
            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
            $entityManager->persist($user);
            $entityManager->flush();

            return $this->redirectToRoute('app_admin');
        }
        return $this->renderForm('admin/registerteacher.html.twig', [
            'form' => $form,
        ]);
    }
    #[Route('/admin/contact', name: 'app_contact')]
    public function contact(): Response
    {
        return $this->render('admin/contact.html.twig', [
            'controller_name' => 'AdminController',
        ]);
    }
}
