#!/bin/bash
set -e
set -x

# FG ORCHESTRATOR schema
mysql -u supersede -p'supersede' feedback_orchestrator < /supersede/orchestrator/v2_table_structure.sql
mysql -u supersede -p'supersede' feedback_orchestrator < /supersede/orchestrator/orchestrator_user_data.sql
#Apply patches
mysql -u supersede -p'supersede' feedback_orchestrator < /supersede/orchestrator/0001_add_order_to_parameter.sql

# FG REPOSITORY schema
mysql -u supersede -p'supersede' feedback_repository < /supersede/repository/v2_table_structure.sql
mysql -u supersede -p'supersede' feedback_repository < /supersede/repository/repository_user_data.sql

# MONITORING ORCHESTRATOR schema
mysql -u supersede -p'supersede' monitoring_orchestrator < /supersede/monitoring/orchestrator.sql

# MODEL REPOSITORY schema
mysql -u supersede -p'supersede' model_repository_manager < /supersede/model_manager/model_repository_deployment.sql




