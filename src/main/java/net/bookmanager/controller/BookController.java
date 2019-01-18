package net.bookmanager.controller;


import net.bookmanager.model.Book;
import net.bookmanager.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class BookController {
    private BookService bookService;
    private int pageSize = 10;

    @Autowired(required = true)
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = "books", method = RequestMethod.GET)
    public ModelAndView listUsers(@RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("books");

        List<Book> books = bookService.listBooks();
        PagedListHolder<Book> pagedListHolder = new PagedListHolder<Book>(books);
        pagedListHolder.setPageSize(pageSize);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if(page==null || page < 1 || page > pagedListHolder.getPageCount())
            page=1;

        modelAndView.addObject("page", page);

        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("listBooks", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject("listBooks", pagedListHolder.getPageList());
        }

        modelAndView.addObject("book", new Book());
        modelAndView.addObject("printYearForList");
        modelAndView.addObject("bookTitleForList");

        return modelAndView;
    }

//    @RequestMapping(value = "books", method = RequestMethod.GET)
//    public String listBooks(Model model){
//        model.addAttribute("book", new Book());
//        model.addAttribute("listBooks", this.bookService.listBooks());
//        model.addAttribute("printYearForList");
//        model.addAttribute("bookTitleForList");
//        return "books";
//    }

    @RequestMapping(value = "unreadList", method = RequestMethod.POST)
    public String listUnreadBooks(Model model){
        model.addAttribute("listUnreadBooks", this.bookService.listUnreadBooks());

        return "unreadList";
    }

    @RequestMapping(value = "bookListByTitle", method = RequestMethod.POST)
    public String listByTitle(@ModelAttribute("bookTitleForList") String title, Model model){
        model.addAttribute("listByTitle", this.bookService.getBookByTitle(title));

        return "bookListByTitle";
    }

    @RequestMapping(value = "bookListByYear", method = RequestMethod.POST)
    public String listByYear(@ModelAttribute("printYearForList") int printYear, Model model){
        model.addAttribute("listByYear", this.bookService.listBooksByYear(printYear));

        return "bookListByYear";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book){
        if(book.getId() == 0){
            this.bookService.addBook(book);
        }else {
            book.setReadAlready(false);
            this.bookService.updateBook(book);
        }

        return "redirect:/books";
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id){
        this.bookService.removeBook(id);

        return "redirect:/books";
    }

    @RequestMapping("edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model){
        model.addAttribute("book", this.bookService.getBookById(id));
        model.addAttribute("listBooks", this.bookService.listBooks());

        return "books";
    }

    @RequestMapping("readAlready/{id}")
    public String bookData(@PathVariable("id") int id, Model model){
        Book book = this.bookService.getBookById(id);
        if (!book.isReadAlready()){
            book.setReadAlready(true);
            this.bookService.updateBook(book);
        }
        return "redirect:/books";
    }
}