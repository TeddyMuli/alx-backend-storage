-- Create the items table

CREATE TABLE IF NOT EXISTS items (
  item_id INT AUTO_INCREMENT PRIMARY KEY,
  item_name VARCHAR(255) NOT NULL,
  quantity INT NOT NULL
);

-- Create the orders table

CREATE TABLE IF NOT EXISTS orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  item_id INT NOT NULL,
  order_quantity INT NOT NULL,
  FOREIGN KEY (item_id) REFERENCES items(item_id)
);

-- Create the trigger to decrease quantity after adding a new order
DELIMITER //

CREATE TRIGGER decrease_quantity_after_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
  UPDATE items
  SET quantity = quantity - NEW.order_quantity
  WHERE item_id = NEW.item_id;
END //

DELIMITER ;
