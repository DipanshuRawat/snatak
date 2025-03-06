#!/bin/bash

# Set variables
BACKUP_DIR="/backup"
SONARQUBE_DIR="/opt/sonarqube"
DB_USER="sonar"
DB_NAME="sonarqube"
DB_BACKUP_FILE="$BACKUP_DIR/sonarqube_db_$(date +%F).backup"
FILES_BACKUP_FILE="$BACKUP_DIR/sonarqube_files_$(date +%F).tar.gz"

# Ensure backup directory exists
mkdir -p $BACKUP_DIR

echo "Starting SonarQube backup..."

# Step 1: Backup the Database (PostgreSQL)
echo "Backing up the SonarQube database..."
pg_dump -U $DB_USER -h localhost -p 5432 -Fc $DB_NAME > $DB_BACKUP_FILE

# Step 2: Backup Configuration & Plugins
echo "Creating compressed backup of SonarQube files..."
tar -czvf $FILES_BACKUP_FILE $SONARQUBE_DIR/conf $SONARQUBE_DIR/extensions/plugins

# Step 3: Sync full SonarQube directory (incremental backup)
echo "Performing incremental backup using rsync..."
rsync -av --delete $SONARQUBE_DIR/ $BACKUP_DIR/sonarqube_full/

# Step 4: Cleanup old backups (older than 7 days)
find $BACKUP_DIR -type f -name "*.backup" -mtime +7 -exec rm {} \;
find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

echo "SonarQube backup completed successfully!"
