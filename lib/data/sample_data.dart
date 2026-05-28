import '../models/movie.dart';
import '../models/trailer.dart';

final List<Movie> movies = [
  Movie(
    id: 1,
    title: 'Conan movie 29',
    posterUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3zdpqPlCzr-Za6Oq6sG3hqQPTyco7TCCcqQ&s',
    overview: 'Nice',
    genres: [
      'Something',
      'Adventure',
      'Horror',
    ],
    rating: 8.7,
    trailers: [
      Trailer(
          title: 'Official Trailer',
          duration: '2m 30s',
      ),
      Trailer(
          title: 'Teaser Trailer',
          duration: '1m 10s',
      ),
    ],
  ),

  Movie(
    id: 2,
    title: 'Asai Narumi',
    posterUrl: 'https://gbaike-image.cdn.bcebos.com/7a899e510fb30f2442a7c96e76cfc643ad4bd113a51e/7a899e510fb30f2442a7c96e76cfc643ad4bd113a51e_url?x-bce-process=image/format,f_auto/resize,m_lfit,w_400,limit_1',
    overview: 'Something i dont know, it just like something',
    genres: [
      'Action',
      'Crime'
    ],
    rating: 8.3,
    trailers: [
      Trailer(
        title: 'Main Trailer',
        duration: '2m 45s',
      ),
    ],
  ),

  Movie(
    id: 3,
    title: 'Something',
    posterUrl: 'https://cdn2.fptshop.com.vn/unsafe/1920x0/filters:format(webp):quality(75)/phim_batman_16_ce1c39a238.png',
    overview:
    'A marine on an alien planet becomes torn between '
        'following orders and protecting the world.',
    genres: [
      'Fantasy',
      'Adventure',
    ],
    rating: 9.0,
    trailers: [
      Trailer(
        title: 'Final Trailer',
        duration: '2m 20s',
      ),
    ],
  ),
];