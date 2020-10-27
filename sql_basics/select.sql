SELECT  `person`.`first_name`, 
    	`person`.`last_name`,
        COUNT(DISTINCT `order_item`.`order_id`) as total_orders, 
    	SUM(`order_item`.`quantity`) as  total_items_bought,
        SUM((`item`.`price` - `order_item`.`discount`)*`order_item`.`quantity`) as total_money_spent
  FROM `person`
  LEFT JOIN `order`
  	ON `person`.`id` = `order`.`person_id`
  LEFT JOIN `order_item`
  	ON `order`.`id`=`order_item`.`order_id` 
  LEFT JOIN `item`
  	ON `order_item`.`item_id` = `item`.`id`  
  GROUP by `person`.`id`;
