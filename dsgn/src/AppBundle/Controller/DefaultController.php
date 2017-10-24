<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        $articles = $this->getDoctrine()->getRepository('AppBundle:Article')->findBy(array(), array('date_creation' => 'desc'), 6);

        return $this->render('AppBundle::index.html.twig', ['articles' => $articles]);
    }
}
