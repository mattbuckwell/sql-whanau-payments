USE sql_whanau;
DROP PROCEDURE IF EXISTS payments_made;

DELIMITER $$
USE sql_whanau$$

CREATE PROCEDURE payments_made()
BEGIN
	SELECT family_id,
		first_name,
		last_name,
		amount,
		COUNT(*) AS num_of_payments,
		IF(COUNT(*) > 1, COUNT(*) * amount, amount) AS total
	FROM family_members
	JOIN payments USING (family_id)
	GROUP BY family_id, first_name, last_name, amount;
END $$

DELIMITER ;