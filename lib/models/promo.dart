part of 'models.dart';

class Promo extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  Promo(
      {@required this.title, @required this.subtitle, @required this.discount});

  @override
  // TODO: implement props
  List<Object> get props => [title, subtitle, discount];

}

List<Promo> dummyPromo = [
  Promo(title: "Student Holiday", subtitle: 'Maximal only for 2 people', discount: 50),
  Promo(title: "Student Holiday", subtitle: 'Maximal only for 2 people', discount: 50),
  Promo(title: "Student Holiday", subtitle: 'Maximal only for 2 people', discount: 50)
];
