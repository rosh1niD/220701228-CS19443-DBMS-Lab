DELIMITER //

CREATE TRIGGER update_total_price_after_insert
AFTER INSERT ON cart_items
FOR EACH ROW
BEGIN
    DECLARE new_total_price DECIMAL(10, 2);

    SELECT SUM(total_price) INTO new_total_price
    FROM cart_items
    WHERE cart_id = NEW.cart_id;

    UPDATE cart_info
    SET total_price = new_total_price
    WHERE cart_id = NEW.cart_id;
END //

CREATE TRIGGER update_total_price_after_update
AFTER UPDATE ON cart_items
FOR EACH ROW
BEGIN
    DECLARE new_total_price DECIMAL(10, 2);
    
    SELECT SUM(total_price) INTO new_total_price
    FROM cart_items
    WHERE cart_id = NEW.cart_id;
    
    UPDATE cart_info
    SET total_price = new_total_price
    WHERE cart_id = NEW.cart_id;
END //

CREATE TRIGGER update_total_price_after_delete
AFTER DELETE ON cart_items
FOR EACH ROW
BEGIN
    DECLARE new_total_price DECIMAL(10, 2);
    
    SELECT SUM(total_price) INTO new_total_price
    FROM cart_items
    WHERE cart_id = OLD.cart_id;
    
    UPDATE cart_info
    SET total_price = new_total_price
    WHERE cart_id = OLD.cart_id;
END //

DELIMITER ;