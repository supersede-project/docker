ALTER TABLE `feedback_orchestrator`.`parameter` ADD COLUMN `order` int(10) NOT NULL DEFAULT 0 AFTER `parent_parameter_id`;
