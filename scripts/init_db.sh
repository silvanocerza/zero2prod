#!/bin/bash
set -e

sqlx database create
sqlx migrate run
