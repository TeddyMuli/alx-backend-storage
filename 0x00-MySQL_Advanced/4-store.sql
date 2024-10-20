-- An sql script that triggers recalculations if an order is placed

CREATE TRIGGER decrease_items_quantity
BEFORE INSERT ON ORDERS
FOR EACH ROW
BEGIN
  UPDATE ITEMS
  SET quantity = quantity - NEW.number
  WHERE name = NEW.item_name;
END;
