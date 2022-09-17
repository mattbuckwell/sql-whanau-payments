DROP VIEW family_payment;

CREATE VIEW family_payment AS
    SELECT 
		fm.family_id,
        fm.first_name,
        fm.last_name,
        SUM(pb.amount) AS whanau_fee
    FROM family_members fm
	JOIN payment_brackets pb ON fm.fee = pb.payment_bracket_id
    GROUP BY fm.payee