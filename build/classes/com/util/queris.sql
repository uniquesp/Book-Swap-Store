SELECT * FROM read_swap_store.cart;
SELECT book.title, book.author,book.book_price, book.cover_pic
FROM cart
JOIN book ON cart.book_id = book.id;
SELECT book.title, book.author,book.book_price, book.cover_pic,cart.id,cart.book_id FROM cart JOIN book ON cart.book_id = book.id;
SELECT book.title,book.book_price, book.cover_pic,cart.id,cart.book_id,cart.quantity,cart.total_price,cart.user_id FROM cart JOIN book ON cart.book_id = book.id;

SELECT book.title,book.book_price, book.cover_pic,cart.id,cart.book_id,cart.quantity,cart.total_price,cart.user_id FROM cart JOIN book ON cart.book_id = book.id WHERE cart.user_id='5';
SELECT * FROM read_swap_store.cart;
SELECT book.title,book.book_price, book.cover_pic,cart.id,cart.book_id,cart.quantity,cart.total_price,cart.user_id FROM cart JOIN book ON cart.book_id = book.id WHERE cart.is_deleted=0 AND cart.user_id=3;
SELECT COUNT(*) FROM cart WHERE is_deleted=0 AND user_id=3;
SELECT * FROM read_swap_store.team;
SELECT COUNT('X') AS count FROM cart WHERE is_deleted=0 AND user_id=5;
SELECT book.title, book.book_price, book.cover_pic,book.id FROM book LEFT JOIN wishlist ON book.id = wishlist.book_id WHERE cover_pic IS NULL;
UPDATE cart SET is_ordered=1, is_deleted=1, is_tokenused=1  WHERE user_id=3 AND book_id=5;
SELECT SUM(total_price) FROM cart WHERE user_id=5 AND is_deleted = 0;
SELECT token_amount from user where id = 5 AND is_deleted = 0;
UPDATE cart SET is_ordered=1, is_deleted=1, is_tokenused = 1 WHERE used_id=? AND is_tokenused=?;
SELECT * FROM cart WHERE user_id = 5 AND is_deleted = 0 AND is_ordered = 0;
SELECT COUNT('x') FROM book_sell WHERE is_deleted=0;
SELECT COUNT('x') FROM book  WHERE is_deleted=0;
SELECT COUNT('x') FROM user WHERE is_deleted=0;
SELECT COUNT('x') AS total_orders,SUM(total_price) AS amount FROM cart WHERE is_deleted=1 AND is_ordered=1;
SELECT COUNT('X') AS todays_orders,SUM(total_price) AS total_amount FROM cart WHERE is_deleted=1 AND is_ordered=1 AND DATE(created_at) = CURDATE();
SELECT * FROM book_sell WHERE user_id=3;
SELECT user.user_name,user.user_email,book_sell.id,book_name,book_author,publication_year,book_language,selling_price,original_price,book_image FROM book_sell LEFT JOIN user ON book_sell.user_id = user.id WHERE book_sell.user_id = 5;SELECT user.user_name,user.user_email,book_sell.id,book_name,book_author,publication_year,book_language,selling_price,original_price,book_image FROM book_sell LEFT JOIN user ON book_sell.user_id = user.id;
SELECT COUNT('x') FROM book_sell;
SELECT COUNT('x') FROM book;
SELECT COUNT('x') FROM user;
SELECT COUNT('x') AS total_orders,SUM(total_price) AS amount FROM cart WHERE is_deleted=1 AND is_ordered=1;
SELECT COUNT('X') AS todays_orders,SUM(total_price) AS total_amount FROM cart WHERE is_deleted=1 AND is_ordered=1 AND DATE(created_at) = CURDATE();
UPDATE book_sell SET status="Accepted" WHERE id=1 AND is_deleted=0;
UPDATE book_sell SET status="Rejected" WHERE id=2 AND is_deleted=0;
SELECT  cart.id AS order_id,user.user_name,user.user_mobileno,book.title, book.book_price, book.cover_pic,cart.book_id, cart.quantity, cart.total_price,cart.is_tokenused,user.token_amount AS remaining_token FROM cart LEFT JOIN book ON cart.book_id = book.id LEFT JOIN user ON cart.user_id = user.id WHERE cart.is_deleted = 1 AND cart.is_ordered = 1 ORDER BY cart.created_at DESC;






















