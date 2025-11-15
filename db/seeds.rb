# Clear existing data
puts "Clearing existing books..."
Book.destroy_all

# Create admin user
puts "Creating admin user..."
admin = User.find_or_create_by(email: 'admin@bookshop.com') do |user|
  user.password = 'admin123'
  user.password_confirmation = 'admin123'
  user.admin = true
end
puts "Admin user created: #{admin.email} (password: admin123)"

# Create regular user
puts "Creating regular user..."
regular_user = User.find_or_create_by(email: 'user@bookshop.com') do |user|
  user.password = 'user123'
  user.password_confirmation = 'user123'
  user.admin = false
end
puts "Regular user created: #{regular_user.email} (password: user123)"

# Create sample books
puts "\nCreating sample books..."

books_data = [
  {
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
    price: 12.99,
    stock: 15,
    description: "A gripping, heart-wrenching, and wholly remarkable tale of coming-of-age in a South poisoned by virulent prejudice."
  },
  {
    title: "1984",
    author: "George Orwell",
    price: 14.99,
    stock: 20,
    description: "A dystopian social science fiction novel and cautionary tale about the dangers of totalitarianism."
  },
  {
    title: "Pride and Prejudice",
    author: "Jane Austen",
    price: 11.99,
    stock: 12,
    description: "A romantic novel of manners that follows the character development of Elizabeth Bennet."
  },
  {
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    price: 13.99,
    stock: 18,
    description: "A novel set in the Jazz Age that explores themes of decadence, idealism, and social upheaval."
  },
  {
    title: "Moby-Dick",
    author: "Herman Melville",
    price: 15.99,
    stock: 10,
    description: "The narrative of Captain Ahab's obsessive quest to seek revenge on Moby Dick, the giant white whale."
  },
  {
    title: "The Catcher in the Rye",
    author: "J.D. Salinger",
    price: 12.49,
    stock: 14,
    description: "A story about teenage rebellion and alienation narrated by Holden Caulfield."
  },
  {
    title: "Jane Eyre",
    author: "Charlotte Brontë",
    price: 13.49,
    stock: 16,
    description: "A coming-of-age story following the emotions and experiences of its eponymous heroine."
  },
  {
    title: "The Hobbit",
    author: "J.R.R. Tolkien",
    price: 16.99,
    stock: 25,
    description: "A fantasy novel about the quest of home-loving hobbit Bilbo Baggins to win a share of treasure guarded by a dragon."
  },
  {
    title: "Brave New World",
    author: "Aldous Huxley",
    price: 14.49,
    stock: 13,
    description: "A dystopian novel set in a futuristic World State of genetically modified citizens."
  },
  {
    title: "The Lord of the Rings",
    author: "J.R.R. Tolkien",
    price: 24.99,
    stock: 8,
    description: "An epic high-fantasy novel about the quest to destroy the One Ring and defeat the Dark Lord Sauron."
  },
  {
    title: "Harry Potter and the Sorcerer's Stone",
    author: "J.K. Rowling",
    price: 18.99,
    stock: 30,
    description: "The first novel in the Harry Potter series, following a young wizard's journey at Hogwarts School."
  },
  {
    title: "The Chronicles of Narnia",
    author: "C.S. Lewis",
    price: 22.99,
    stock: 11,
    description: "A series of seven fantasy novels set in the magical land of Narnia."
  }
]

books_data.each do |book_data|
  book = Book.create!(book_data)
  puts "Created: #{book.title} by #{book.author}"
end

puts "\n#{Book.count} books created successfully!"
puts "All books will display the placeholder image by default."
