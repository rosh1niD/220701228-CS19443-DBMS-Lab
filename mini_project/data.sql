use sql12707743;
show tables;
desc cart_items;
create table restaurants (restaurant_id INT(2) PRIMARY KEY, restaurant_name varchar(30), cuisine varchar(30), category varchar(30));
INSERT INTO restaurants (restaurant_id, restaurant_name, cuisine, category) VALUES (1, 'La Trattoria', 'Italian', 'Casual Dining');
INSERT INTO restaurants (restaurant_id, restaurant_name, cuisine, category) VALUES (2, 'Sushi World', 'Japanese', 'Fine Dining');
INSERT INTO restaurants (restaurant_id, restaurant_name, cuisine, category) VALUES (3, 'Taco Fiesta', 'Mexican', 'Fast Food');
INSERT INTO restaurants (restaurant_id, restaurant_name, cuisine, category) VALUES (4, 'Burger Haven', 'American', 'Fast Food');
INSERT INTO restaurants (restaurant_id, restaurant_name, cuisine, category) VALUES (5, 'Dosa Delight', 'South Indian', 'Casual Dining');
CREATE TABLE customer (
    Customer_id INT AUTO_INCREMENT PRIMARY KEY,
    Customer_name VARCHAR(30),
    Contact_Number VARCHAR(30),
    Address VARCHAR(100),
    Email VARCHAR(50)
);
CREATE TABLE menu_items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    restaurant_id INT,
    Description VARCHAR(255),
    Price DECIMAL(10, 2),
    is_veg BOOLEAN,
    category VARCHAR(50),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    -- Appetizers
    (1, 'Bruschetta', 1, 'Toasted bread topped with diced tomatoes, garlic, basil, and olive oil', 595.00, TRUE, 'Appetizer'),
    (2, 'Garlic Bread', 1, 'Toasted bread slices rubbed with garlic and butter', 447.00, TRUE, 'Appetizer'),
    (3, 'Antipasto Platter', 1, 'Assorted cured meats, cheeses, olives, and roasted vegetables', 1367.50, TRUE, 'Appetizer'),
    (4, 'Garlic Knots', 1, 'Soft bread knots brushed with garlic butter and herbs, served with marinara sauce', 525.00, TRUE, 'Appetizer'),
    
    -- Salads
    (5, 'Caprese Salad', 1, 'Fresh salad made with tomatoes, mozzarella cheese, basil, olive oil, and balsamic glaze', 787.50, TRUE, 'Salad'),
    (6, 'Caesar Salad', 1, 'Classic salad made with romaine lettuce, croutons, Parmesan cheese, and Caesar dressing', 825.00, TRUE, 'Salad'),
    (7, 'Greek Salad', 1, 'Fresh salad made with mixed greens, tomatoes, cucumbers, olives, feta cheese, and Greek dressing', 850.00, TRUE, 'Salad'),
    (8, 'Fruit Salad', 1, 'Fresh fruit salad with seasonal fruits, honey, and lime dressing', 750.00, TRUE, 'Salad'),

    -- Pasta/Risotto
    (9, 'Penne Arrabbiata', 1, 'Pasta tossed in a spicy tomato sauce with garlic and chili flakes', 934.00, TRUE, 'Pasta/Risotto'),
    (10, 'Fettuccine Alfredo', 1, 'Creamy pasta dish made with fettuccine noodles and Alfredo sauce', 897.00, FALSE, 'Pasta/Risotto'),
    (11, 'Mushroom Risotto', 1, 'Creamy risotto rice cooked with mushrooms, onions, white wine, and Parmesan cheese', 975.00, TRUE, 'Pasta/Risotto'),
    (12, 'Spinach Risotto', 1, 'Creamy risotto rice cooked with spinach, garlic, onions, and Parmesan cheese', 925.00, TRUE, 'Pasta/Risotto'),
    (13, 'Carbonara', 1, 'Pasta dish made with spaghetti, eggs, cheese, pancetta, and black pepper', 950.00, FALSE, 'Pasta/Risotto'),

    -- Pizza
    (14, 'Margherita Pizza', 1, 'Classic pizza topped with tomato sauce, mozzarella cheese, and fresh basil leaves', 745.00, TRUE, 'Pizza'),
    (15, 'Vegetarian Pizza', 1, 'Pizza topped with assorted vegetables and mozzarella cheese', 825.00, TRUE, 'Pizza'),
    (16, 'Pepperoni Pizza', 1, 'Pizza topped with pepperoni slices and mozzarella cheese', 875.00, FALSE, 'Pizza'),
    (17, 'BBQ Chicken Pizza', 1, 'Pizza topped with BBQ sauce, grilled chicken, red onions, and mozzarella cheese', 950.00, FALSE, 'Pizza'),

    -- Desserts
    (18, 'Tiramisu', 1, 'Classic Italian dessert made with layers of coffee-soaked ladyfingers and mascarpone cheese', 850.00, FALSE, 'Dessert'),
    (19, 'Cannoli', 1, 'Sicilian pastry filled with sweet ricotta cheese and chocolate chips', 765.00, FALSE, 'Dessert'),
    (20, 'Chocolate Fondant', 1, 'Warm chocolate cake with a molten chocolate center, served with vanilla ice cream', 975.00, FALSE, 'Dessert');
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (26, 'Vegetable Tempura', 2, 'Assorted vegetables coated in a light tempura batter and deep-fried until crispy', 750.00, TRUE, 'Agemono and Yakimono'),
    (27, 'Agedashi Tofu', 2, 'Deep-fried tofu served in a dashi-based sauce with grated daikon radish and green onions', 550.00, TRUE, 'Agemono and Yakimono'),
    (28, 'Chicken Teriyaki', 2, 'Grilled chicken glazed with a sweet and savory teriyaki sauce, served with steamed rice', 900.00, FALSE, 'Agemono and Yakimono'),
    (29, 'Beef Negimaki', 2, 'Thinly sliced beef rolled with scallions (green onions), grilled, and served with teriyaki sauce', 1000.00, FALSE, 'Agemono and Yakimono'),
    (30, 'Ebi Fry', 2, 'Breaded and deep-fried shrimp, served with tonkatsu sauce and shredded cabbage', 950.00, FALSE, 'Agemono and Yakimono');
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (31, 'Vegetable Yakisoba', 2, 'Stir-fried noodles with assorted vegetables, seasoned with yakisoba sauce', 800.00, TRUE, 'Noodles'),
    (32, 'Miso Ramen', 2, 'Ramen noodles served in a miso-based broth with tofu, seaweed, and green onions', 850.00, TRUE, 'Noodles'),
    (33, 'Chicken Udon', 2, 'Udon noodles served in a hot dashi broth with grilled chicken, vegetables, and green onions', 900.00, FALSE, 'Noodles'),
    (34, 'Beef Ramen', 2, 'Ramen noodles served in a rich beef broth with slices of beef, boiled egg, and vegetables', 950.00, FALSE, 'Noodles'),
    (35, 'Seafood Yaki Udon', 2, 'Udon noodles stir-fried with assorted seafood and vegetables', 1000.00, FALSE, 'Noodles');
    
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (36, 'Vegetable Donburi', 2, 'Steamed rice bowl topped with assorted vegetables and teriyaki sauce', 750.00, TRUE, 'Donburi'),
    (37, 'Tofu Donburi', 2, 'Steamed rice bowl topped with grilled tofu and vegetables in a savory sauce', 800.00, TRUE, 'Donburi'),
    (38, 'Chicken Katsu Don', 2, 'Breaded and deep-fried chicken cutlet served over a bowl of steamed rice with egg and onions', 850.00, FALSE, 'Donburi'),
    (39, 'Beef Teriyaki Don', 2, 'Grilled slices of beef glazed with teriyaki sauce, served over a bowl of steamed rice with vegetables', 900.00, FALSE, 'Donburi'),
    (40, 'Spicy Tuna Don', 2, 'Fresh spicy tuna mixed with spicy mayo and served over a bowl of sushi rice', 1000.00, FALSE, 'Donburi');
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (21, 'Ebi Tempura Nigiri', 2, 'Nigiri sushi with tempura-fried shrimp on top of a small bed of sushi rice', 950.00, FALSE, 'Sushi and Sashimi'),
    (22, 'Sashimi Platter', 2, 'Assorted slices of fresh raw fish (tuna, salmon, yellowtail, scallop)', 1600.00, FALSE, 'Sushi and Sashimi'),
    (23, 'Dragon Maki', 2, 'Maki roll filled with eel (unagi), cucumber, and avocado, topped with thinly sliced avocado and eel sauce', 1050.00, FALSE, 'Sushi and Sashimi'),
    (24, 'Salmon Nigiri', 2, 'Nigiri sushi with a slice of fresh salmon on top of a small bed of sushi rice', 700.00, FALSE, 'Sushi and Sashimi'),
    (25, 'Avocado Maki', 2, 'Maki roll filled with avocado, wrapped in nori seaweed and sushi rice', 550.00, TRUE, 'Sushi and Sashimi');
select * from menu_items;
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (41, 'Nachos', 3, 'Crispy tortilla chips topped with melted cheese, jalapeños, and sour cream', 200.00, TRUE, 'Appetizers'),
    (42, 'Guacamole', 3, 'Fresh avocado dip served with tortilla chips', 150.00, TRUE, 'Appetizers'),
    (43, 'Chicken Quesadilla', 3, 'Grilled tortilla filled with cheese and chicken', 250.00, FALSE, 'Appetizers'),
    (44, 'Stuffed Jalapeños', 3, 'Jalapeños stuffed with cream cheese and deep-fried', 180.00, TRUE, 'Appetizers');
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (45, 'Vegetable Tacos', 3, 'Soft tacos filled with grilled vegetables, lettuce, and salsa', 150.00, TRUE, 'Tacos'),
    (46, 'Chicken Tacos', 3, 'Soft tacos filled with marinated chicken, lettuce, and salsa', 200.00, FALSE, 'Tacos'),
    (47, 'Beef Tacos', 3, 'Soft tacos filled with seasoned ground beef, cheese, and salsa', 250.00, FALSE, 'Tacos'),
    (48, 'Fish Tacos', 3, 'Soft tacos filled with battered fish, cabbage slaw, and creamy sauce', 300.00, FALSE, 'Tacos');
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (49, 'Vegetable Burrito', 3, 'Flour tortilla filled with rice, beans, grilled vegetables, and cheese', 250.00, TRUE, 'Burritos'),
    (50, 'Chicken Burrito', 3, 'Flour tortilla filled with rice, beans, chicken, and cheese', 300.00, FALSE, 'Burritos'),
    (51, 'Beef Burrito', 3, 'Flour tortilla filled with rice, beans, beef, and cheese', 350.00, FALSE, 'Burritos'),
    (52, 'Pork Burrito', 3, 'Flour tortilla filled with rice, beans, pulled pork, and cheese', 350.00, FALSE, 'Burritos');
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (53, 'Churros', 3, 'Fried dough pastries rolled in cinnamon sugar', 150.00, TRUE, 'Desserts'),
    (54, 'Tres Leches Cake', 3, 'Moist cake made with three types of milk', 200.00, TRUE, 'Desserts'),
    (55, 'Flan', 3, 'Creamy caramel custard', 180.00, TRUE, 'Desserts'),
    (56, 'Sopapillas', 3, 'Puffy, fried pastries drizzled with honey', 150.00, TRUE, 'Desserts');
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (57, 'Horchata', 3, 'Traditional Mexican rice drink with cinnamon and vanilla', 120.00, TRUE, 'Beverages'),
    (58, 'Agua Fresca', 3, 'Refreshing fruit water with natural flavors', 100.00, TRUE, 'Beverages'),
    (59, 'Mexican Soda', 3, 'Sweet and fruity carbonated drink', 80.00, TRUE, 'Beverages'),
    (60, 'Michelada', 3, 'Spicy beer cocktail with lime juice and assorted sauces', 150.00, TRUE, 'Beverages');
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES
  (61, 'The Classic Burger', 4, 'A juicy all-beef patty with lettuce, tomato, onion, pickles, ketchup, and mustard on a toasted sesame seed bun.', 8.99, FALSE, 'Burgers'),
  (62, 'Cheeseburger', 4, 'The Classic Burger topped with a slice of melted cheddar cheese.', 9.49, FALSE, 'Burgers'),
  (63, 'Bacon Cheeseburger', 4, 'The Cheeseburger loaded with crispy bacon.', 10.49, FALSE, 'Burgers'),
  (64, 'BBQ Bacon Burger', 4, 'The Bacon Cheeseburger smothered in our sweet and smoky BBQ sauce.', 10.99, FALSE, 'Burgers'),
  (65, 'Mushroom Swiss Burger', 4, 'The Classic Burger topped with sauteed mushrooms and melted Swiss cheese.', 9.99, FALSE, 'Burgers'),
  (66, 'Veggie Burger', 4, 'A delicious black bean patty topped with lettuce, tomato, onion, pickles, ketchup, and mustard on a toasted sesame seed bun.', 8.49, TRUE, 'Burgers'),
  (67, 'Crispy Chicken Sandwich', 4, 'A juicy, crispy chicken breast filet on a toasted brioche bun with lettuce, tomato, mayo, and pickles.', 8.99, FALSE, 'Sandwiches'),
  (68, 'Buffalo Chicken Sandwich', 4, 'Crispy Chicken Sandwich tossed in our spicy buffalo sauce with crumbled blue cheese dressing.', 9.49, FALSE, 'Sandwiches'),
  (69, 'Grilled Chicken Sandwich', 4, 'A marinated and grilled chicken breast on a toasted wheat bun with lettuce, tomato, and mayo.', 8.49, FALSE, 'Sandwiches'),
  (70, 'Fish Sandwich', 4, 'A golden-fried fish fillet on a toasted brioche bun with tartar sauce and lettuce.', 9.49, FALSE, 'Sandwiches'),
  (71, 'French Fries', 4, 'A large portion of crispy golden french fries.', 2.49, TRUE, 'Sides'),
  (72, 'Onion Rings', 4, 'Hand-battered onion rings fried to a golden crisp.', 3.49, TRUE, 'Sides'),
  (73, 'Mozzarella Sticks', 4, 'Gooey mozzarella cheese sticks served with marinara sauce.', 4.49, TRUE, 'Sides'),
  (74, 'Chicken Tenders', 4, 'Crispy golden chicken tenders served with your choice of dipping sauce.', 5.99, FALSE, 'Starters'),
  (75, 'Boneless Wings', 4, 'Choose your favorite flavor of boneless wings tossed in our signature sauces.', 6.49, FALSE, 'Starters'),
  (76, 'Loaded Nachos', 4, 'Crispy tortilla chips piled high with seasoned ground beef, melted cheese, pico de gallo, and jalapenos.', 7.99, FALSE, 'Starters'),
  (77, 'Chocolate Milkshake', 4, 'A rich and creamy chocolate milkshake made with real ice cream.', 3.99, TRUE, 'Drinks'),
  (78,' Vanilla Milkshake', 4, 'A classic vanilla milkshake made with real ice cream.', 3.99, TRUE, 'Drinks'),
  (79, 'Strawberry Milkshake', 4, 'A refreshing strawberry milkshake made with real ice cream.', 3.99, TRUE, 'Drinks'),
  (80, 'Soft Drinks', 4, 'A variety of soft drinks available (specify choice during order).', 2.49, TRUE, 'Drinks');
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (81, 'Masala Dosa', 5, 'Thin rice crepe filled with spiced potato masala', 120.00, TRUE, 'Dosas'),
    (82, 'Onion Dosa', 5, 'Thin rice crepe filled with chopped onions and spices', 100.00, TRUE, 'Dosas'),
    (83, 'Mysore Masala Dosa', 5, 'Thin rice crepe spread with spicy chutney and filled with potato masala', 140.00, TRUE, 'Dosas'),
    (84, 'Podi Dosa', 5, 'Thin rice crepe sprinkled with flavorful podi (spice mix)', 130.00, TRUE, 'Dosas');
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (85, 'Ghee Roast Dosa', 5, 'Thin rice crepe roasted in ghee (clarified butter) until crispy', 160.00, TRUE, 'Dosas'),
    (86, 'Kal Dosa', 5, 'Thick rice pancake cooked until golden brown and crispy', 140.00, TRUE, 'Dosas'),
    (87, 'Egg Dosa', 5, 'Thin rice crepe topped with a fluffy omelette and spices', 150.00, FALSE, 'Dosas'),
    (88, 'Rava Dosa', 5, 'Thin rice and semolina crepe with a crispy texture', 130.00, TRUE, 'Dosas');
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (89, 'Idli Sambar', 5, 'Steamed rice cakes served with sambar and chutneys', 100.00, TRUE, 'Idlis'),
    (90, 'Poori Masala', 5, 'Deep-fried Indian bread served with spiced potato masala', 120.00, TRUE, 'Poori'),
    (91, 'Rava Kesari', 5, 'Semolina pudding flavored with saffron, cardamom, and nuts', 80.00, TRUE, 'Desserts'),
    (92, 'Rava Kichadi', 5, 'Semolina (rava) cooked with vegetables and spices', 90.00, TRUE, 'Breakfast');
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (93, 'Vegetable Biryani', 5, 'Fragrant basmati rice cooked with mixed vegetables and aromatic spices', 180.00, TRUE, 'Rices'),
    (94, 'Jeera Rice', 5, 'Basmati rice tempered with cumin seeds and cooked to perfection', 100.00, TRUE, 'Rices'),
    (95, 'Lemon Rice', 5, 'Rice flavored with lemon juice, tempered with mustard seeds, and garnished with peanuts and curry leaves', 120.00, TRUE, 'Rices'),
    (96, 'Coconut Rice', 5, 'Rice cooked with grated coconut, tempered with mustard seeds, and garnished with cashews and curry leaves', 130.00, TRUE, 'Rices');
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (97, 'Vegetable Pulao', 5, 'Fragrant basmati rice cooked with mixed vegetables and aromatic spices', 160.00, TRUE, 'Rices'),
    (98, 'Paneer Pulao', 5, 'Fragrant basmati rice cooked with paneer (cottage cheese) cubes and aromatic spices', 180.00, TRUE, 'Rices');
INSERT INTO menu_items (item_id, item_name, restaurant_id, Description, Price, is_veg, category) 
VALUES 
    (99, 'Masala Chai', 5, 'Indian spiced tea made with milk, tea leaves, and aromatic spices', 50.00, TRUE, 'Beverages'),
    (100, 'Filter Coffee', 5, 'South Indian coffee brewed with dark roast coffee beans and served with milk and sugar', 60.00, TRUE, 'Beverages'),
    (101, 'Mango Lassi', 5, 'Refreshing yogurt-based drink flavored with ripe mango pulp', 70.00, TRUE, 'Beverages'),
    (102, 'Water', 5, 'Bottled drinking water', 20.00, TRUE, 'Beverages');
CREATE TABLE cart_info (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
CREATE TABLE cart_items (
    cart_item_id INT auto_increment PRIMARY KEY,
    cart_id INT,
    item_id INT,
    quantity INT,
    total_price DECIMAL(10,2),
    FOREIGN KEY (cart_id) REFERENCES cart_info(cart_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);
desc bill;
CREATE TABLE bill (
    bill_id INT auto_increment PRIMARY KEY,
    cart_id INT,
    customer_id INT,
    amount DECIMAL(10, 2),
    cgst DECIMAL(5, 2),
    sgst DECIMAL(5, 2),
    service_charge DECIMAL(5, 2),
    total_quantity INT,
    final_amount decimal(10,2),
    FOREIGN KEY (cart_id) REFERENCES cart_info(cart_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
select * from customer;
drop table bill;
drop table cart_items;
drop table cart_info;
drop table customer;

ALTER TABLE menu_items
ADD COLUMN images VARCHAR(255);

UPDATE restaurants
SET images = 'images\La_Trattoria.jpeg'
WHERE restaurant_id = 1;
UPDATE restaurants
SET images = 'images\Sushi_World.jpeg'
WHERE restaurant_id = 2;
UPDATE restaurants
SET images = 'images\Tacos_Fiesta.jpeg'
WHERE restaurant_id = 3;
UPDATE restaurants
SET images = 'images\Burger_Haven.jpeg'
WHERE restaurant_id = 4;
UPDATE restaurants
SET images = 'images\Dosa Delight.jpeg'
WHERE restaurant_id = 5;