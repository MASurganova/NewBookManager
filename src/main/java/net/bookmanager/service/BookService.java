package net.bookmanager.service;



import net.bookmanager.model.Book;

import java.util.List;

public interface BookService {
    public void addBook(Book book);

    public void updateBook(Book book);

    public void removeBook(int id);

    public Book getBookById(int id);

    public List<Book> getBookByTitle(String Title);

    public List<Book> listBooks();

    List<Book> listUnreadBooks();

    List<Book> listBooksByYear(int printYear);

}
