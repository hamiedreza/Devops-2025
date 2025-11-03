#!/bin/bash
# ============================================================
# Script Name : auto_docker_backup.sh
# Author      : Hamiedreza Asosheh
# Description : Creates hourly backups of all running Docker containers
#               - Exports .tar backups
#               - Commits images and pushes to registry
#               - Keeps only backups from the last 24 hours
# ============================================================

# ===== Settings =====
BACKUP_DIR="/home/hamiedreza/docker_backups"
REGISTRY="docker.io/hamiedreza"
DATE=$(date +"%Y%m%d-%H%M")

# ===== Ensure backup directory exists =====
mkdir -p "$BACKUP_DIR"

# ===== Get all running containers =====
containers=$(docker ps -q)

if [ -z "$containers" ]; then
    echo "⚠️ No running containers found."
    exit 0
fi

# ===== Backup each running container =====
for c in $containers; do
    name=$(docker inspect --format='{{.Name}}' "$c" | cut -d'/' -f2)
    tar_file="${BACKUP_DIR}/${name}_${DATE}.tar"
    image_name="${REGISTRY}/${name}_backup:${DATE}"

    echo "🔹 Backing up container: $name"

    # Export container filesystem as .tar
    docker export "$c" > "$tar_file"

    # Commit container as image
    docker commit "$c" "$image_name"

    # Push image to registry
    docker push "$image_name"

    echo "✅ Backup for $name completed successfully."
done

# ===== Remove .tar backups older than 24 hours =====
echo "🧹 Removing .tar backups older than 24 hours..."
find "$BACKUP_DIR" -type f -name "*.tar" -mmin +1440 -exec rm -f {} \;

echo "⏰ $(date): Backup operation completed successfully."


