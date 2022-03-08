import 'package:get/get.dart';

///Déclaration du contrôleur, contient les variables observables de notre controller
///OBS renvoie un RxObject, ce qui rend la variable observable via un widget comme
///OBX.
///Pour mettre à jour la valeur il suffit de récupérer la variable et faire .value
///
/// L'avantage majeur d'un contrôleur GETX c'est de pouvoir actualiser des données en temps
/// réels sans avoir à faire des setState qui peuvent être très couteux.
/// Le Widget OBX permet de reconstruire - sur l'interface - uniquement
/// la donnée qui change.
/// Nous pouvons donc nous soustraire à l'API native de Flutter pour le state
/// management et utiliser GETX pour obtenir une application moins coûteuse en ressource.
class ExoController extends GetxController {
  var nickname = "".obs;
  var imageUrl = "https://picsum.photos/300/300".obs;
  var isBlurActivated = false.obs;
  var isGreyActivated = false.obs;
}