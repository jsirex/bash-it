cite about-plugin
about-plugin 'Provides backup-my-pc() method to backups root to tar at specified destination'

function backup-my-pc() {
    TARGET_DIR="$1"
    BACKUP_FILE_NAME="`hostname -s`-backup-`date +%F`.tar.bz2"
    FULL_BACKUP_FILE_NAME=$TARGET_DIR/$BACKUP_FILE_NAME

    EXCLUDE_DIRECTORIES="/dev /lost+found /media /mnt /proc /run /sys /tmp /home/sirex/.steam/steam/steamapps /usr/local/games/itg \
/home/sirex/.m2 /home/sirex/.berkshelf /home/sirex/.cache"

    if [ -z "$TARGET_DIR" ]; then
        echo "Specify target backup directory"
        return 1
    fi

    if [ ! -d "$TARGET_DIR" ]; then
        echo "Target directory: $TARGET_DIR not found"
        return 1
    fi

    echo "Performing backup. This may take long time. Started at: `date`"
    echo "Target directory: $TARGET_DIR"
    echo "Target file: $FULL_BACKUP_FILE_NAME"

    echo "Excluding from backup:"
    for d in $EXCLUDE_DIRECTORIES; do
        echo "dir: $d"
    done

    EXCLUDE_STR=$(for d in $EXCLUDE_DIRECTORIES; do echo -n "--exclude=$d "; done)
    sudo ionice tar -cvpjf $FULL_BACKUP_FILE_NAME --one-file-system --exclude=$FULL_BACKUP_FILE_NAME $EXCLUDE_STR /

    echo "Ended at `date`"
}
