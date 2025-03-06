#!/bin/bash

# Set variables
BACKUP_DIR="/backup"
SONARQUBE_DIR="/opt/sonarqube"
DB_USER="sonar"
DB_NAME="sonarqube"
DB_BACKUP_FILE="$BACKUP_DIR/sonarqube_db_latest.backup"
FILES_BACKUP_FILE="$BACKUP_DIR/sonarqube_files_latest.tar.gz"

echo "Starting SonarQube restore process..."

# Step 1: Stop SonarQube service
echo "Stopping SonarQube..."
systemctl stop sonarqube

# Step 2: Restore Database (PostgreSQL)
echo "Restoring the SonarQube database..."
pg_restore -U $DB_USER -h localhost -p 5432 -d $DB_NAME -c $DB_BACKUP_FILE

# Step 3: Restore Configuration & Plugins
echo "Restoring SonarQube configuration and plugins..."
tar -xzvf $FILES_BACKUP_FILE -C $SONARQUBE_DIR

# Step 4: Restore Full SonarQube Directory (if needed)
echo "Restoring full SonarQube directory using rsync..."
rsync -av $BACKUP_DIR/sonarqube_full/ $SONARQUBE_DIR/

# Step 5: Set Permissions (if needed)
echo "Setting correct permissions..."
chown -R sonar:sonar $SONARQUBE_DIR

# Step 6: Start SonarQube service
echo "Starting SonarQube..."
systemctl start sonarqube

# Step 7: Verify Recovery
echo "Checking SonarQube status..."
systemctl status sonarqube

echo "SonarQube restore process completed!"
