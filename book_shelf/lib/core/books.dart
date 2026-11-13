import 'package:book_shelf/models/book.dart';
import 'package:book_shelf/models/genre.dart';

final List<Book> initialBooks = [
  const Book(id: 1, title: 'Խաչագողի հիշատակարանը', author: 'Րաֆֆի', genre: Genre.novel),
  const Book(id: 2, title: 'Վերք Հայաստանի', author: 'Խաչատուր Աբովյան', genre: Genre.novel),
  const Book(id: 3, title: 'Քաոս', author: 'Ալեքսանդր Շիրվանզադե', genre: Genre.novel),
  const Book(id: 4, title: 'Հայոց պատմություն', author: 'Մովսես Խորենացի', genre: Genre.history),
  const Book(id: 5, title: 'Վարդանի և հայոց պատերազմի մասին', author: 'Եղիշե', genre: Genre.history),
  const Book(id: 6, title: 'Սասնա ծռեր', author: 'Ժողովրդական էպոս', genre: Genre.fantasy),
  const Book(id: 7, title: 'Հեքիաթներ', author: 'Հովհաննես Թումանյան', genre: Genre.fantasy),
  const Book(id: 8, title: 'Մատյան ողբերգության', author: 'Գրիգոր Նարեկացի', genre: Genre.poetry),
  const Book(id: 9, title: 'Գիրք ճանապարհի', author: 'Եղիշե Չարենց', genre: Genre.poetry),
  const Book(id: 10, title: 'Աբու-Լալա Մահարի', author: 'Ավետիք Իսահակյան', genre: Genre.poetry),
];