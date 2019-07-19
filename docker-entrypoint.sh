#!/bin/bash
if [[ ! -f "./config.inc.php" ]]; then # first run
	cp -rf /defaults/* .;
	chown -R www-data:www-data ./gamedata;
	chown -R www-data:www-data ./include;
	chown -R www-data:www-data ./templates;
	echo "<?php \$dbhost = '$DTS_DB_HOST'; \$dbuser = '$DTS_DB_USER'; \$dbpw = '$DTS_DB_PASSWORD'; \$dbname = '$DTS_DB_NAME'; \$dbreport = $DTS_DB_REPORT; \$cookiedomain = '$DTS_COOKIE_DOMAIN'; \$cookiepath = '$DTS_COOKIE_PATH'; \$headercharset = $DTS_HEADER_CHARSET; \$onlinehold = $DTS_ONLINE_HOLD; \$pconnect = $DTS_PCONNECT; \$gamefounder = '$DTS_GAME_FOUNDER'; \$postinterval = $DTS_POST_INTERVAL; \$moveut = $DTS_MOVE_UT; \$moveutmin = $DTS_MOVE_UT_MINUTE; \$tablepre = '$DTS_TABLE_PRE'; \$authkey = '$DTS_AUTH_KEY'; \$database = 'mysql'; \$charset = 'utf-8'; \$dbcharset = 'utf8' \$attackevasive = 0; \$tplrefresh = 1; \$bbsurl = '$DTS_BBS_URL'; \$gameurl = '$DTS_GAME_URL'; \$homepage = '$DTS_HOME_PAGE'; \$title = '$DTS_TITLE'; \$errorinfo = $DTS_ERROR_INFO; ?>" > ./config.inc.php;
fi
# ./acdts-daemonctl.sh &
apache2-foreground
