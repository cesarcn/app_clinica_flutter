import 'package:flutter/material.dart';
import '../widgets/menu_lateral.dart';

class PrincipalScreen extends StatelessWidget {
  // Es la clase principal de la pantalla principal
  List<_Photo> _photos() {
    return [
      // Lista de fotos
      _Photo(
          imageUrl:
              'https://cdn.pixabay.com/photo/2019/07/30/15/57/dentist-4373290_960_720.jpg',
          title: 'Especialidades',
          subtitle: 'Lo que necesites'),
      _Photo(
          imageUrl:
              'https://cdn.pixabay.com/photo/2017/01/29/21/16/nurse-2019420_960_720.jpg',
          title: 'Médicos',
          subtitle: 'Médicos a tu disposición'),
      _Photo(
          imageUrl:
              'https://cdn.pixabay.com/photo/2014/12/10/20/56/medical-563427_960_720.jpg',
          title: 'Citas',
          subtitle: 'Realiza tu cita'),
      _Photo(
          imageUrl:
              'https://cdn.pixabay.com/photo/2019/10/21/12/01/newspapers-4565916_960_720.jpg',
          title: 'Noticias',
          subtitle: 'Todo sobre medicina'),
      _Photo(
          imageUrl:
              'https://media.istockphoto.com/photos/about-us-text-on-card-held-by-physician-picture-id1133571870?s=612x612',
          title: 'Sobre nosotros',
          subtitle: '¿Quiénes sómos?'),
      _Photo(
          imageUrl:
              'https://cdn.pixabay.com/photo/2016/05/29/16/42/speech-bubble-1423322_960_720.jpg',
          title: 'Contáctanos',
          subtitle: 'Shame ahora, shame sha!!'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Es la función que se ejecuta cuando se crea la pantalla
    return Scaffold(
      appBar: AppBar(
        title: Text('Clinica Acoba'),
        backgroundColor: Colors.lightBlue[400],
      ),
      drawer: MenuLateral(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background2.jpg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              padding: const EdgeInsets.all(8),
              childAspectRatio: 1,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: _photos().map<Widget>((photo) {
                return _GridDemoPhotoItem(
                  photo: photo,
                );
              }).toList()),
        ),
      ),
    );
  }
}

class _Photo {
  // Clase que representa una foto
  _Photo({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  final String imageUrl;
  final String title;
  final String subtitle;
}

class GridSubject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        'Normal List',
        style: TextStyle(
            fontFamily: 'ConcertOne-Regular',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  _GridDemoPhotoItem({Key? key, required this.photo}) : super(key: key);

  final _Photo photo;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        photo.imageUrl,
        fit: BoxFit.cover,
      ),
    );

    return GridTile(
      footer: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: _GridTitleText(photo.title),
          subtitle: _GridTitleText(photo.subtitle),
        ),
      ),
      child: image,
    );
  }
}
