USE sql_whanau;
DROP PROCEDURE IF EXISTS outstanding_fees;

DELIMITER $$
USE sql_whanau$$

CREATE PROCEDURE outstanding_fees()
BEGIN
	SELECT 
		family_id,
		fp.first_name,
		fp.last_name,
		whanau_fee,
		IF(num_of_payments IS NULL, '0', num_of_payments) AS num_of_payments,
		IF(total IS NULL, '0.00', total) AS total,
		IF(total IS NOT NULL, whanau_fee - total, whanau_fee) AS balance
	FROM family_payment fp
	LEFT JOIN payment_made pm USING (family_id);
END $$

DELIMITER ;