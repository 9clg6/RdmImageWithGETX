
# RdmImageWithGETX
## Présentation

L'objectif de ce projet était d'afficher une image aléatoire provenant de l'API [Picsum.photo](https://picsum.photos/).

Les dimensions des images sont générées aléatoirement.

## Fonctionnalités 

L'utilisateur a la possibilité d'appliquer des filtres sur les images :

 - [x] Filtre Flou
 - [x] Filtre Noir & Blanc

Il peut également définir un pseudo sur la page d'accuei de l'application et changer son pseudo dans l'écran suivant.

Toutes les données visibles, sont affichées dynamiquement via le package [GETX](https://pub.dev/packages/get). ([A propos](https://github.com/jonataslaw/getx/blob/master/README-fr.md#a-propos-de-get))

> GetX est une solution extra-légère et puissante pour Flutter. Il
> combine une gestion d'état (state management) de haute performance,
> une injection de dépendances (dependency injection) intelligente et
> une gestion de route (route management) rapide et pratique.

GETX met en place un ensemble d'outils permettant de se soustraire au state manager natif de Flutter. Notamment avec des observable utilisant RX.
Lorsque les données observées sont modifiées, la vue est automatiquement mise à jour en reconstruisant uniquement les éléments modifiées. Cela permet de gagner du temps lors de la reconstruction de l'arborescence. 
L'API native de Flutter, reconstruit l'intégralité de l'arborescence lors d'un setState(), GetX permet de reconstruire uniquement les widget contenant la donnée observée.

![enter image description here](https://media.discordapp.net/attachments/786644865437270038/951395372712984576/unknown.png?width=2080&height=1047)

![enter image description here](https://media.discordapp.net/attachments/786644865437270038/951395411078299708/unknown.png?width=2080&height=1047)
