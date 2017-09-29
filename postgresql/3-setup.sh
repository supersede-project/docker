#!/bin/bash
set -e
set -x

# FE tenant schemas

psql -U supersede atos < /supersede/3-schema_atos.sql
psql -U supersede senercon < /supersede/3-schema_senercon.sql
psql -U supersede siemens < /supersede/3-schema_siemens.sql

# DM Game tenant schemas

psql -U supersede game_atos < /supersede/dm-schema.sql
psql -U supersede game_senercon < /supersede/dm-schema.sql
psql -U supersede game_siemens < /supersede/dm-schema.sql

# Adaptation dashboard schemas
psql -U supersede atos < /supersede/adaptation_dashboard_schema.sql
psql -U supersede senercon < /supersede/adaptation_dashboard_schema.sql
psql -U supersede siemens < /supersede/adaptation_dashboard_schema.sql