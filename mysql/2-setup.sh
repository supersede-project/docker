#!/bin/bash
set -e
set -x

mysql -u supersede -p'supersede' feedback_orchestrator < /supersede/orchestrator.sql
mysql -u supersede -p'supersede' feedback_repository < /supersede/repository.sql
mysql -u supersede -p'supersede' monitoring_orchestrator < /supersede/orchestrator.sql
mysql -u supersede -p'supersede' model_repository_manager < /supersede/model_repository_deployment.sql