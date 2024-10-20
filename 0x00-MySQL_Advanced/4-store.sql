-- An sql script that triggers recalculations if an order is placed

CREATE TRIGGER decrease_items_quantity AFTER INSERT ON orders FOR EACH ROW
UPDATE items SET quantity = quantity - NEW.number WHERE name=NEW.item_name;
