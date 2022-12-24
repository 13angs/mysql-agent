# Mysql agent

## Backup database

1. copy and rename `.env.sample` file as `.env`
2. fill the env

exp:

```bash
CON_NAME=mysql-agent
USERNAME=root
PASSWORD=P@ssw0rd
ACTION=BACKUP
```

3. make the `run.sh` file executable

```bash
chmod +x run.sh
```

4. run the script

```bash
./run.sh
```

5. check if there any file appear in `backup` folder


## Restore database

1. change the env to

```bash
ACTION=RESTORE
RESTORE_DB=<your_backup_file.sql>
```

2. run the script

```bash
./run.sh
```

