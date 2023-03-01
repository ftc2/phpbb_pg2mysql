# ppbb2discourse_pg2mysql
Convert phpBB 3.2 PostgreSQL db to MySQL for migration to Discourse

## Why
The [current phpBB import script](https://github.com/discourse/discourse/tree/main/script/import_scripts/phpbb3) does not support postgres. It will eventually be deprecated in favor of the much faster [bulk importer](https://github.com/discourse/discourse/blob/main/script/bulk_import/phpbb_postgresql.rb), but it's not ready yet (maybe in 6-12mo?).

## How
Here is my janky solution. Basically any migration is jank, though, right?

First, dump your existing postgres db:
```
sudo -u postgres pg_dumpall -c > phpbb_pg_dump.sql
```

Clone this repo to your discourse host. Put `phpbb_pg_dump.sql` in this repo's root.
```
git clone https://github.com/ftc2/ppbb2discourse_pg2mysql.git
```

Perform the following actions:
```
# start this compose file to create new postgres and mysql dbs for migration
sudo docker compose up -d

# restore postgres dump
sudo docker exec -it phpbb-postgres psql -U postgres -f /restore/restorefile
# set postgres pw to asdf123
sudo docker exec -it phpbb-postgres psql -U postgres -c '\password'

# generate dumps for mysql
sudo docker exec -it phpbb-postgres apt update
sudo docker exec -it phpbb-postgres apt install -y zip
sudo docker exec -it phpbb-postgres /dumptools/dump_phpbb_3.2.sh
sudo docker exec -it phpbb-postgres unzip /dumptools/dump_phpbb.zip -d /dumptools

# create phpbb schema in mysql
sudo docker exec -it phpbb-mariadb sh -c 'mysql -h127.0.0.1 -P3306 -uroot -pasdf123 < /dumptools/mariadb_phpbb_3.2_create_schema.sql'
# import phpbb tables in mysql
sudo docker exec -it phpbb-mariadb /dumptools/dump_phpbb/import_phpbb.sh
```

Finally, follow the [import steps](https://meta.discourse.org/t/migrate-a-phpbb3-forum-to-discourse/30810) and **move on with your life...**

I **strongly** suggest having the importer connect directly to the `phpbb-mariadb` container instead of doing yet another intermediary dump.

You can connect your discourse import container like this:
```
sudo docker network connect ppbb2discourse_pg2mysql_default import
```

Then, the import script's `settings.yml` should look like this:
```
database:
  type: MySQL # currently only MySQL is supported
  host: phpbb-mariadb
  port: 3306
  username: root
  password: asdf123
  schema: phpbb
  table_prefix: phpbb_ # Change this, if your forum is using a different prefix. Usually all table names start with phpbb_
  batch_size: 1000 # Don't change this unless you know what you're doing. The default (1000) should work just fine.
```
