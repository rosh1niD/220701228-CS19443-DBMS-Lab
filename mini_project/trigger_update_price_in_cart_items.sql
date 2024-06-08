use sql12707743;

CREATE TABLE cart_items_temp (
    cart_item_id INT PRIMARY KEY,
    total_price DECIMAL(10,2)
);

DELIMITER //

CREATE TRIGGER update_total_price
BEFORE UPDATE ON cart_items
FOR EACH ROW
BEGIN
    DECLARE itemPrice DECIMAL(10,2);

    SELECT price INTO itemPrice FROM menu_items WHERE menu_items.item_id = NEW.item_id;

    SET NEW.total_price = itemPrice * NEW.quantity;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_update_total_price
AFTER INSERT ON cart_items_temp
FOR EACH ROW
BEGIN

    UPDATE cart_items
    SET total_price = NEW.total_price
    WHERE cart_item_id = NEW.cart_item_id;
    
    DELETE FROM cart_items_temp WHERE cart_item_id = NEW.cart_item_id;
END //

DELIMITER ;
show triggers;