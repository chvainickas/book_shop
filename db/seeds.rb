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
Cart.create(user: admin) unless admin.cart
puts "Admin user created: #{admin.email} (password: admin123)"

# Create regular user
puts "Creating regular user..."
regular_user = User.find_or_create_by(email: 'user@bookshop.com') do |user|
  user.password = 'user123'
  user.password_confirmation = 'user123'
  user.admin = false
end
Cart.create(user: regular_user) unless regular_user.cart
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
  },
  {
    title: "Animal Farm",
    author: "George Orwell",
    price: 10.99,
    stock: 22,
    description: "A satirical allegorical novella reflecting events leading up to the Russian Revolution and the Stalin era."
  },
  {
    title: "The Odyssey",
    author: "Homer",
    price: 14.99,
    stock: 9,
    description: "An ancient Greek epic poem attributed to Homer, recounting Odysseus's journey home after the Trojan War."
  },
  {
    title: "Wuthering Heights",
    author: "Emily Brontë",
    price: 12.99,
    stock: 14,
    description: "A tale of passion and revenge on the Yorkshire moors."
  },
  {
    title: "The Divine Comedy",
    author: "Dante Alighieri",
    price: 17.99,
    stock: 7,
    description: "An epic poem describing Dante's journey through Hell, Purgatory, and Paradise."
  },
  {
    title: "Crime and Punishment",
    author: "Fyodor Dostoevsky",
    price: 15.99,
    stock: 10,
    description: "A psychological thriller focusing on the mental anguish of Rodion Raskolnikov."
  },
  {
    title: "The Brothers Karamazov",
    author: "Fyodor Dostoevsky",
    price: 18.99,
    stock: 8,
    description: "A philosophical novel that delves into faith, doubt, and morality."
  },
  {
    title: "War and Peace",
    author: "Leo Tolstoy",
    price: 19.99,
    stock: 6,
    description: "An epic novel chronicling the French invasion of Russia and its impact on society."
  },
  {
    title: "Anna Karenina",
    author: "Leo Tolstoy",
    price: 16.99,
    stock: 9,
    description: "A tragic love story set in Russian high society."
  },
  {
    title: "The Picture of Dorian Gray",
    author: "Oscar Wilde",
    price: 11.99,
    stock: 15,
    description: "A philosophical novel about a man who sells his soul for eternal youth."
  },
  {
    title: "Frankenstein",
    author: "Mary Shelley",
    price: 10.99,
    stock: 18,
    description: "A Gothic novel about a scientist who creates a living being from dead matter."
  },
  {
    title: "Dracula",
    author: "Bram Stoker",
    price: 12.99,
    stock: 16,
    description: "The classic vampire novel that has inspired countless adaptations."
  },
  {
    title: "The Count of Monte Cristo",
    author: "Alexandre Dumas",
    price: 17.99,
    stock: 11,
    description: "An adventure novel about wrongful imprisonment, escape, and revenge."
  },
  {
    title: "Les Misérables",
    author: "Victor Hugo",
    price: 19.99,
    stock: 7,
    description: "A French historical novel covering themes of law, justice, and redemption."
  },
  {
    title: "Don Quixote",
    author: "Miguel de Cervantes",
    price: 18.99,
    stock: 8,
    description: "The adventures of a Spanish nobleman who reads so many chivalric romances he loses his mind."
  },
  {
    title: "One Hundred Years of Solitude",
    author: "Gabriel García Márquez",
    price: 16.99,
    stock: 12,
    description: "A landmark novel chronicling seven generations of the Buendía family."
  },
  {
    title: "The Alchemist",
    author: "Paulo Coelho",
    price: 13.99,
    stock: 25,
    description: "A philosophical book about following one's dreams and listening to one's heart."
  },
  {
    title: "The Little Prince",
    author: "Antoine de Saint-Exupéry",
    price: 9.99,
    stock: 30,
    description: "A poetic tale about a young prince who visits various planets, including Earth."
  },
  {
    title: "Alice's Adventures in Wonderland",
    author: "Lewis Carroll",
    price: 10.99,
    stock: 20,
    description: "A whimsical tale of a girl who falls down a rabbit hole into a fantasy world."
  },
  {
    title: "The Adventures of Huckleberry Finn",
    author: "Mark Twain",
    price: 11.99,
    stock: 13,
    description: "A novel about a boy's journey down the Mississippi River."
  },
  {
    title: "The Adventures of Tom Sawyer",
    author: "Mark Twain",
    price: 10.99,
    stock: 14,
    description: "The story of a mischievous boy growing up along the Mississippi River."
  },
  {
    title: "Lord of the Flies",
    author: "William Golding",
    price: 12.99,
    stock: 17,
    description: "A novel about a group of British boys stranded on an uninhabited island."
  },
  {
    title: "Of Mice and Men",
    author: "John Steinbeck",
    price: 11.99,
    stock: 15,
    description: "A novella about two displaced migrant workers during the Great Depression."
  },
  {
    title: "The Grapes of Wrath",
    author: "John Steinbeck",
    price: 15.99,
    stock: 10,
    description: "A novel about a family's migration from Oklahoma to California during the Dust Bowl."
  },
  {
    title: "Fahrenheit 451",
    author: "Ray Bradbury",
    price: 13.99,
    stock: 18,
    description: "A dystopian novel about a future American society where books are outlawed."
  },
  {
    title: "The Handmaid's Tale",
    author: "Margaret Atwood",
    price: 14.99,
    stock: 16,
    description: "A dystopian novel set in a totalitarian society facing environmental disasters."
  },
  {
    title: "The Road",
    author: "Cormac McCarthy",
    price: 13.99,
    stock: 11,
    description: "A post-apocalyptic tale of a father and son's journey through a destroyed America."
  },
  {
    title: "Slaughterhouse-Five",
    author: "Kurt Vonnegut",
    price: 12.99,
    stock: 14,
    description: "A satirical novel about Billy Pilgrim's experiences during World War II."
  },
  {
    title: "Catch-22",
    author: "Joseph Heller",
    price: 14.99,
    stock: 12,
    description: "A satirical novel set during World War II about the absurdity of war."
  },
  {
    title: "The Stranger",
    author: "Albert Camus",
    price: 11.99,
    stock: 15,
    description: "An existentialist novel about a man who commits murder and is condemned to death."
  },
  {
    title: "The Trial",
    author: "Franz Kafka",
    price: 12.99,
    stock: 13,
    description: "A novel about a man arrested and prosecuted by an inaccessible authority."
  },
  {
    title: "The Metamorphosis",
    author: "Franz Kafka",
    price: 9.99,
    stock: 19,
    description: "A novella about a man who wakes up to find himself transformed into an insect."
  },
  {
    title: "A Tale of Two Cities",
    author: "Charles Dickens",
    price: 14.99,
    stock: 11,
    description: "A historical novel set in London and Paris before and during the French Revolution."
  },
  {
    title: "Great Expectations",
    author: "Charles Dickens",
    price: 13.99,
    stock: 12,
    description: "A coming-of-age novel depicting the growth and personal development of Pip."
  },
  {
    title: "Oliver Twist",
    author: "Charles Dickens",
    price: 12.99,
    stock: 14,
    description: "The story of an orphan boy in Victorian London."
  },
  {
    title: "Emma",
    author: "Jane Austen",
    price: 11.99,
    stock: 13,
    description: "A comedy of manners about a young woman's misguided matchmaking attempts."
  },
  {
    title: "Sense and Sensibility",
    author: "Jane Austen",
    price: 11.99,
    stock: 12,
    description: "A novel about the Dashwood sisters as they come of age."
  },
  {
    title: "The Scarlet Letter",
    author: "Nathaniel Hawthorne",
    price: 10.99,
    stock: 15,
    description: "A novel about a woman forced to wear a scarlet A for adultery in Puritan Massachusetts."
  }
]

books_data.each do |book_data|
  book = Book.create!(book_data)
  puts "Created: #{book.title} by #{book.author}"
end

puts "\n#{Book.count} books created successfully!"
puts "All books will display the placeholder image by default."
