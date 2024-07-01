<?php

namespace App\Controller;

use App\Entity\Announcement;
use App\Entity\Lesson;
use App\Form\LessonType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class StudentController extends AbstractController
{
    #[Route('/student', name: 'app_student')]
    public function index(): Response
    {
        return $this->render('student/index.html.twig', [
            'controller_name' => 'StudentController',
        ]);
    }
    #[Route('/student/showannounce', name: 'app_showannouncement')]
    public function showannouncement(EntityManagerInterface $entityManager): Response
    {
        $announcement = $entityManager->getRepository(Announcement::class)->findby(['role' =>'ROLE_STUDENT']);
        return $this->render('student/show-announcement.html.twig', [
            'announcements' => $announcement,
        ]);
    }
    #[Route('/student/dashboard', name: 'app_dashboard_student')]
    public function dashboard(EntityManagerInterface $entityManager): Response
    {
        $lessons = $entityManager->getRepository(Lesson::class)->findBy(['student' => $this->getUser()]);
        return $this->render('student/dashboard.html.twig', [
            'lessons' => $lessons,
        ]);
    }
    #[Route('/student/docent', name: 'app_deletelesson')]
    public function updatelesson( EntityManagerInterface $entityManager,int $id): Response
    {
        $lesson = $entityManager->getRepository(Lesson::class)->find($id);
        $entityManager->remove($lesson);
        $entityManager->flush();


        $this->addFlash('success', 'ik heb de announcement Delete');
        return $this->redirectToRoute('app_dashboard');
    }
}
