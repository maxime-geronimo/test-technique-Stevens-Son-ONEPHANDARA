<?php
/**
 * Created by IntelliJ IDEA.
 * User: Steve
 * Date: 24/10/2017
 * Time: 14:23
 */

namespace AppBundle\Controller;

use AppBundle\Entity\ArticleLike;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class ArticleController extends Controller
{
    /**
     * @Route("/article/like", name="article_like")
     */
    public function likeAction(Request $request)
    {
        $id = $request->get('article');
        $article = $this->getDoctrine()->getRepository('AppBundle:Article')->find($id);

        $user = $this->getUser();

        $like = new ArticleLike();
        $like->setUser($user);
        $like->setArticle($article);

        $em = $this->getDoctrine()->getManager();
        $em->persist($like);
        $em->flush();

        exit;
    }
}