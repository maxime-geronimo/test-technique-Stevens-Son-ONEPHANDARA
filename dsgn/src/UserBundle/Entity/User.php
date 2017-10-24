<?php
/**
 * Created by IntelliJ IDEA.
 * User: Steve
 * Date: 24/10/2017
 * Time: 05:17
 */

namespace UserBundle\Entity;

use FOS\UserBundle\Model\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="user")
 */
class User extends BaseUser
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=255, nullable=true)
     */
    private $nom;

    /**
     * @var string
     *
     * @ORM\Column(name="prenom", type="string", length=255, nullable=true)
     */
    private $prenom;

    /**
     * @ORM\OneToMany(targetEntity="User", mappedBy="auteur")
     */
    private $commentaires;

    /**
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\ArticleLike", mappedBy="user")
     */
    private $likes;

    public function __construct()
    {
        parent::__construct();
        // your own logic
    }

    public function getLikedArticles() {
        $likedArticles = array();
        foreach($this->likes as $likedArticle) {
            $likedArticles[] = $likedArticle->getArticle();
        }

        return $likedArticles;
    }

    /**
     * Add commentaire
     *
     * @param \UserBundle\Entity\User $commentaire
     *
     * @return User
     */
    public function addCommentaire(\UserBundle\Entity\User $commentaire)
    {
        $this->commentaires[] = $commentaire;

        return $this;
    }

    /**
     * Remove commentaire
     *
     * @param \UserBundle\Entity\User $commentaire
     */
    public function removeCommentaire(\UserBundle\Entity\User $commentaire)
    {
        $this->commentaires->removeElement($commentaire);
    }

    /**
     * Get commentaires
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getCommentaires()
    {
        return $this->commentaires;
    }

    /**
     * Add like
     *
     * @param \UserBundle\Entity\User $like
     *
     * @return User
     */
    public function addLike(\UserBundle\Entity\User $like)
    {
        $this->likes[] = $like;

        return $this;
    }

    /**
     * Remove like
     *
     * @param \UserBundle\Entity\User $like
     */
    public function removeLike(\UserBundle\Entity\User $like)
    {
        $this->likes->removeElement($like);
    }

    /**
     * Get likes
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getLikes()
    {
        return $this->likes;
    }

    /**
     * Set nom
     *
     * @param string $nom
     *
     * @return User
     */
    public function setNom($nom)
    {
        $this->nom = $nom;

        return $this;
    }

    /**
     * Get nom
     *
     * @return string
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * Set prenom
     *
     * @param string $prenom
     *
     * @return User
     */
    public function setPrenom($prenom)
    {
        $this->prenom = $prenom;

        return $this;
    }

    /**
     * Get prenom
     *
     * @return string
     */
    public function getPrenom()
    {
        return $this->prenom;
    }
}
