#!/bin/bash
set -e
set -x

mysql -u supersede -p'supersede' feedback_orchestrator < /supersede/docker_supersede_orchestrator_spring_clean.sql
#mysql -u supersede -p'supersede' feedback_orchestrator < /supersede/orchestrator_monitoring_test_dump.sql
mysql -u supersede -p'supersede' feedback_repository < /supersede/docker_supersede_repository_spring_clean.sql
mysql -u supersede -p'supersede' monitoring_orchestrator < /supersede/orchestrator.sql
mysql -u supersede -p'supersede' model_repository_manager < /supersede/model_repository_deployment.sql

#Apply patches

#mysql -u supersede -p'supersede' feedback_orchestrator < /supersede/migrations/orchestrator/0002_active_flag_configuration_20161111.sql
#mysql -u supersede -p'supersede' feedback_orchestrator < /supersede/migrations/orchestrator/0003_timestamp_millisecond_20161123.sql

#mysql -u supersede -p'supersede' feedback_repository < /supersede/migrations/repository/0010_change_table_collations_20161111.sql
#mysql -u supersede -p'supersede' feedback_repository < /supersede/migrations/repository/0011_change_timestamp_precision_20161123.sql

