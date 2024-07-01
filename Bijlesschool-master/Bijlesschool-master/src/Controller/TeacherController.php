<?php

namespace App\Controller;

use App\Entity\Announcement;
use App\Entity\Lesson;
use App\Form\AnnouncementType;
use App\Form\LessonType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TeacherController extends AbstractController
{
    #[Route('/teacher', name: 'app_teacher')]
    public function index(): Response
    {
        return $this->render('teacher/index.html.twig', [
            'controller_name' => 'TeacherController',
        ]);
    }
    #[Route('/teacher/announcement', name: 'app_announce')]
    public function announcements(EntityManagerInterface  $entityManager): Response
    {
        $announcement = $entityManager->getRepository(Announcement::class)->findby(['role' =>'ROLE_TEACHER']);
        return $this->render('teacher/announces.html.twig', [
            'announcements' => $announcement,
        ]);
    }
    #[Route('/teacher/addlesson', name: 'app_addlesson')]
    public function addlesson(Request $request, EntityManagerInterface $entityManager): Response
    {
        $lesson = new Lesson();
        $form = $this->createForm(LessonType::class, $lesson);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $lesson= $form->getData();
            $lesson->setTeacher($this->getUser());
            $entityManager->persist($lesson);
            $entityManager->flush();

            $this->addFlash('success', 'ik heb de announcement toegevoegd');
            return $this->redirectToRoute('app_dashboard');
        }
        return $this->renderForm('teacher/makelesson.html.twig', [
            'form' => $form,
        ]);
    }
    #[Route('/teacher/dashboard', name: 'app_dashboard')]
    public function dashboard(EntityManagerInterface $entityManager): Response
    {
        $lesson = $entityManager->getRepository(Lesson::class)->findAll();
        return $this->render('teacher/dashboard.html.twig', [
            'lessons' => $lesson,
        ]);
    }
    #[Route('/teacher/updatelesson/{id}', name: 'app_updatelesson')]
    public function updatelesson(Request $request, EntityManagerInterface $entityManager,int $id): Response
    {
        $lesson = $entityManager->getRepository(Lesson::class)->find($id);
        $form = $this->createForm(LessonType::class, $lesson);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $lesson= $form->getData();
            $lesson->setTeacher($this->getUser());
            $entityManager->persist($lesson);
            $entityManager->flush();

            $this->addFlash('success', 'ik heb de announcement GEUPDATE');
            return $this->redirectToRoute('app_dashboard');
        }
        return $this->renderForm('teacher/makelesson.html.twig', [
            'form' => $form,
        ]);
    }
    #[Route('/teacher/deletelesson/{id}', name: 'app_deletelesson')]
    public function deletelesson( EntityManagerInterface $entityManager,int $id): Response
    {
        $lesson = $entityManager->getRepository(Lesson::class)->find($id);
        $entityManager->remove($lesson);
        $entityManager->flush();

        $this->addFlash('success', 'ik heb de announcement gedelete');
        return $this->redirectToRoute('app_dashboard');

    }
}
