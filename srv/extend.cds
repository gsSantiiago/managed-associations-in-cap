using bookshop from '../db/schema';
using from './main';

extend bookshop.Books with {
    author: Association to many Books_Authors on author.book = $self;
}

extend bookshop.Authors with {
    books: Association to many Books_Authors on books.author = $self;
}

entity Books_Authors {
    book: Association to bookshop.Books;
    author: Association to bookshop.Authors;
}

extend service Z with {
    entity LinkEntity as projection on Books_Authors;
}