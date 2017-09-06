#!/bin/bash
set -e
set -x

psql -U supersede atos < /supersede/3-schema_atos.sql
psql -U supersede senercon < /supersede/3-schema_senercon.sql
psql -U supersede siemens < /supersede/3-schema_siemens.sql