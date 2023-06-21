# Remove all books
Book.destroy_all

# Create sample books
Book.create!(
  [
    { title: 'Philosophers Stone', author: 'J. K. Rowling', genre: 'Fantasy', publication_year: 1997 },
    { title: 'Chamber of Secrets', author: 'J. K. Rowling', genre: 'Fantasy', publication_year: 1998 },
    { title: 'Prisoner Of Azkaban', author: 'J. K. Rowling', genre: 'Fantasy', publication_year: 1999 },
    { title: 'Goblet of Fire', author: 'J. K. Rowling', genre: 'Fantasy', publication_year: 2000 },
    { title: 'Order of the Phoenix', author: 'J. K. Rowling', genre: 'Fantasy', publication_year: 2003 },
    { title: 'Half-Blood Prince', author: 'J. K. Rowling', genre: 'Fantasy', publication_year: 2005 },
    { title: 'Deathly Hallows', author: 'J. K. Rowling', genre: 'Fantasy', publication_year: 2007 }
  ]
)