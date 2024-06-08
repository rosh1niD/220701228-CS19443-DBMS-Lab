DELIMITER //

CREATE PROCEDURE calculate_gst(
	IN total_price DECIMAL(10, 2),
	IN bill_id_q INT
)
BEGIN
	DECLARE cgst DECIMAL(5, 2);
	DECLARE sgst DECIMAL(5, 2);

	SET cgst = total_price * 0.025;
	SET sgst = total_price * 0.025;

	UPDATE bill
	SET cgst = cgst,
		sgst = sgst
	WHERE bill_id = bill_id_q;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE calculate_service_charge(
    IN total_price DECIMAL(10, 2),
    IN bill_id_q INT
)
BEGIN
	DECLARE service_charge DECIMAL(5, 2);
    SET service_charge = total_price * 0.10;
    UPDATE bill
	SET service_charge = service_charge
	WHERE bill_id = bill_id_q;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE calculate_final_amount(
    IN amount DECIMAL(10, 2),
    IN cgst DECIMAL(5, 2),
    IN sgst DECIMAL(5, 2),
    IN service_charge DECIMAL(5, 2),
    IN bill_id_q INT
)
BEGIN
    DECLARE final_amount DECIMAL(10, 2);
    select service_charge;
    SET final_amount = amount + cgst + sgst + service_charge;

    UPDATE bill
    SET final_amount = final_amount
    WHERE bill_id = bill_id_q;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE calculate_total_quantity(IN p_cart_id INT)
BEGIN
	DECLARE total_quantity INT;
    
    SELECT SUM(quantity) INTO total_quantity
    FROM cart_items
    WHERE cart_id = p_cart_id;
    
    update bill
    set total_quantity = total_quantity
    where cart_id = p_cart_id;
END //

DELIMITER ;