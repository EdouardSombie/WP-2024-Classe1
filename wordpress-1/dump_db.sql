<!DOCTYPE html>
<html lang="fr" dir="ltr">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="robots" content="noindex">
<title>Exporter: wordpress - db - Adminer</title>
<link rel="stylesheet" type="text/css" href="?file=default.css&amp;version=4.8.1">
<script src='?file=functions.js&amp;version=4.8.1' nonce="Zjg4OTFlZjliZTBhNDczOGE4NjRiYTEzM2U3NWQ0YzU="></script>
<link rel="shortcut icon" type="image/x-icon" href="?file=favicon.ico&amp;version=4.8.1">
<link rel="apple-touch-icon" href="?file=favicon.ico&amp;version=4.8.1">

<body class="ltr nojs">
<script nonce="Zjg4OTFlZjliZTBhNDczOGE4NjRiYTEzM2U3NWQ0YzU=">
mixin(document.body, {onkeydown: bodyKeydown, onclick: bodyClick});
document.body.className = document.body.className.replace(/ nojs/, ' js');
var offlineMessage = 'Vous êtes hors ligne.';
var thousandsSeparator = ',';
</script>

<div id="help" class="jush-sql jsonly hidden"></div>
<script nonce="Zjg4OTFlZjliZTBhNDczOGE4NjRiYTEzM2U3NWQ0YzU=">mixin(qs('#help'), {onmouseover: function () { helpOpen = 1; }, onmouseout: helpMouseout});</script>

<div id="content">
<p id="breadcrumb"><a href="?server=db">MySQL</a> &raquo; <a href='?server=db&amp;username=wordpress' accesskey='1' title='Alt+Shift+1'>db</a> &raquo; <a href="?server=db&amp;username=wordpress&amp;db=wordpress">wordpress</a> &raquo; Exporter
<h2>Exporter: wordpress</h2>
<div id='ajaxstatus' class='jsonly hidden'></div>

<form action="" method="post">
<table cellspacing="0" class="layout">
<tr><th>Sortie<td><label><input type='radio' name='output' value='text' checked>ouvrir</label><label><input type='radio' name='output' value='file'>enregistrer</label><label><input type='radio' name='output' value='gz'>gzip</label>
<tr><th>Format<td><label><input type='radio' name='format' value='sql' checked>SQL</label><label><input type='radio' name='format' value='csv'>CSV,</label><label><input type='radio' name='format' value='csv;'>CSV;</label><label><input type='radio' name='format' value='tsv'>TSV</label>
<tr><th>Base de données<td><select name='db_style'><option selected><option>USE<option>DROP+CREATE<option>CREATE</select><label><input type='checkbox' name='routines' value='1'>Routines</label><label><input type='checkbox' name='events' value='1'>Évènements</label><tr><th>Tables<td><select name='table_style'><option><option selected>DROP+CREATE<option>CREATE</select><label><input type='checkbox' name='auto_increment' value='1'>Incrément automatique</label><label><input type='checkbox' name='triggers' value='1' checked>Déclencheurs</label><tr><th>Données<td><select name='data_style'><option><option>TRUNCATE+INSERT<option selected>INSERT<option>INSERT+UPDATE</select></table>
<p><input type="submit" value="Exporter">
<input type="hidden" name="token" value="762038:164179">

<table cellspacing="0">
<script nonce="Zjg4OTFlZjliZTBhNDczOGE4NjRiYTEzM2U3NWQ0YzU=">qsl('table').onclick = dumpClick;</script>
<thead><tr><th style='text-align: left;'><label class='block'><input type='checkbox' id='check-tables'>Tables</label><script nonce="Zjg4OTFlZjliZTBhNDczOGE4NjRiYTEzM2U3NWQ0YzU=">qs('#check-tables').onclick = partial(formCheck, /^tables\[/);</script><th style='text-align: right;'><label class='block'>Données<input type='checkbox' id='check-data'></label><script nonce="Zjg4OTFlZjliZTBhNDczOGE4NjRiYTEzM2U3NWQ0YzU=">qs('#check-data').onclick = partial(formCheck, /^data\[/);</script></thead>
<tr><td><label class='block'><input type='checkbox' name='tables[]' value='wp_commentmeta'>wp_commentmeta</label><td align='right'><label class='block'><span id='Rows-wp_commentmeta'></span><input type='checkbox' name='data[]' value='wp_commentmeta'></label>
<tr><td><label class='block'><input type='checkbox' name='tables[]' value='wp_comments'>wp_comments</label><td align='right'><label class='block'><span id='Rows-wp_comments'></span><input type='checkbox' name='data[]' value='wp_comments'></label>
<tr><td><label class='block'><input type='checkbox' name='tables[]' value='wp_links'>wp_links</label><td align='right'><label class='block'><span id='Rows-wp_links'></span><input type='checkbox' name='data[]' value='wp_links'></label>
<tr><td><label class='block'><input type='checkbox' name='tables[]' value='wp_options'>wp_options</label><td align='right'><label class='block'><span id='Rows-wp_options'></span><input type='checkbox' name='data[]' value='wp_options'></label>
<tr><td><label class='block'><input type='checkbox' name='tables[]' value='wp_postmeta'>wp_postmeta</label><td align='right'><label class='block'><span id='Rows-wp_postmeta'></span><input type='checkbox' name='data[]' value='wp_postmeta'></label>
<tr><td><label class='block'><input type='checkbox' name='tables[]' value='wp_posts'>wp_posts</label><td align='right'><label class='block'><span id='Rows-wp_posts'></span><input type='checkbox' name='data[]' value='wp_posts'></label>
<tr><td><label class='block'><input type='checkbox' name='tables[]' value='wp_termmeta'>wp_termmeta</label><td align='right'><label class='block'><span id='Rows-wp_termmeta'></span><input type='checkbox' name='data[]' value='wp_termmeta'></label>
<tr><td><label class='block'><input type='checkbox' name='tables[]' value='wp_terms'>wp_terms</label><td align='right'><label class='block'><span id='Rows-wp_terms'></span><input type='checkbox' name='data[]' value='wp_terms'></label>
<tr><td><label class='block'><input type='checkbox' name='tables[]' value='wp_term_relationships'>wp_term_relationships</label><td align='right'><label class='block'><span id='Rows-wp_term_relationships'></span><input type='checkbox' name='data[]' value='wp_term_relationships'></label>
<tr><td><label class='block'><input type='checkbox' name='tables[]' value='wp_term_taxonomy'>wp_term_taxonomy</label><td align='right'><label class='block'><span id='Rows-wp_term_taxonomy'></span><input type='checkbox' name='data[]' value='wp_term_taxonomy'></label>
<tr><td><label class='block'><input type='checkbox' name='tables[]' value='wp_usermeta'>wp_usermeta</label><td align='right'><label class='block'><span id='Rows-wp_usermeta'></span><input type='checkbox' name='data[]' value='wp_usermeta'></label>
<tr><td><label class='block'><input type='checkbox' name='tables[]' value='wp_users' checked>wp_users</label><td align='right'><label class='block'><span id='Rows-wp_users'></span><input type='checkbox' name='data[]' value='wp_users' checked></label>
<script nonce="Zjg4OTFlZjliZTBhNDczOGE4NjRiYTEzM2U3NWQ0YzU=">ajaxSetHtml('?server=db&username=wordpress&db=wordpress&script=db');</script>
</table>
</form>
<p><a href='?server=db&amp;username=wordpress&amp;db=wordpress&amp;dump=wp%25'>wp</a></div>

<form action='' method='post'>
<div id='lang'>Langue: <select name='lang'><option value="en">English<option value="ar">العربية<option value="bg">Български<option value="bn">বাংলা<option value="bs">Bosanski<option value="ca">Català<option value="cs">Čeština<option value="da">Dansk<option value="de">Deutsch<option value="el">Ελληνικά<option value="es">Español<option value="et">Eesti<option value="fa">فارسی<option value="fi">Suomi<option value="fr" selected>Français<option value="gl">Galego<option value="he">עברית<option value="hu">Magyar<option value="id">Bahasa Indonesia<option value="it">Italiano<option value="ja">日本語<option value="ka">ქართული<option value="ko">한국어<option value="lt">Lietuvių<option value="ms">Bahasa Melayu<option value="nl">Nederlands<option value="no">Norsk<option value="pl">Polski<option value="pt">Português<option value="pt-br">Português (Brazil)<option value="ro">Limba Română<option value="ru">Русский<option value="sk">Slovenčina<option value="sl">Slovenski<option value="sr">Српски<option value="sv">Svenska<option value="ta">த‌மிழ்<option value="th">ภาษาไทย<option value="tr">Türkçe<option value="uk">Українська<option value="vi">Tiếng Việt<option value="zh">简体中文<option value="zh-tw">繁體中文</select><script nonce="Zjg4OTFlZjliZTBhNDczOGE4NjRiYTEzM2U3NWQ0YzU=">qsl('select').onchange = function () { this.form.submit(); };</script> <input type='submit' value='Utiliser' class='hidden'>
<input type='hidden' name='token' value='913250:315015'>
</div>
</form>
<form action="" method="post">
<p class="logout">
<input type="submit" name="logout" value="Déconnexion" id="logout">
<input type="hidden" name="token" value="762038:164179">
</p>
</form>
<div id="menu">
<h1>
<a href='https://www.adminer.org/' target="_blank" rel="noreferrer noopener" id='h1'>Adminer</a> <span class="version">4.8.1</span>
<a href="https://www.adminer.org/#download" target="_blank" rel="noreferrer noopener" id="version"></a>
</h1>
<script src='?file=jush.js&amp;version=4.8.1' nonce="Zjg4OTFlZjliZTBhNDczOGE4NjRiYTEzM2U3NWQ0YzU="></script>
<script nonce="Zjg4OTFlZjliZTBhNDczOGE4NjRiYTEzM2U3NWQ0YzU=">
var jushLinks = { sql: [ '?server=db&username=wordpress&db=wordpress&table=$&', /\b(wp_commentmeta|wp_comments|wp_links|wp_options|wp_postmeta|wp_posts|wp_termmeta|wp_terms|wp_term_relationships|wp_term_taxonomy|wp_usermeta|wp_users)\b/g ] };
jushLinks.bac = jushLinks.sql;
jushLinks.bra = jushLinks.sql;
jushLinks.sqlite_quo = jushLinks.sql;
jushLinks.mssql_bra = jushLinks.sql;
bodyLoad('5.5', true);
</script>
<form action="">
<p id="dbs">
<input type="hidden" name="server" value="db"><input type="hidden" name="username" value="wordpress"><span title='base de données'>DB</span>: <select name='db'><option value=""><option>information_schema<option selected>wordpress</select><script nonce="Zjg4OTFlZjliZTBhNDczOGE4NjRiYTEzM2U3NWQ0YzU=">mixin(qsl('select'), {onmousedown: dbMouseDown, onchange: dbChange});</script>
<input type='submit' value='Utiliser' class='hidden'>
<input type='hidden' name='dump' value=''></p></form>
<p class='links'><a href='?server=db&amp;username=wordpress&amp;db=wordpress&amp;sql='>Requête SQL</a>
<a href='?server=db&amp;username=wordpress&amp;db=wordpress&amp;import='>Importer</a>
<a href='?server=db&amp;username=wordpress&amp;db=wordpress&amp;dump=' id='dump' class='active '>Exporter</a>
<a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;create=">Créer une table</a>
<ul id='tables'><script nonce="Zjg4OTFlZjliZTBhNDczOGE4NjRiYTEzM2U3NWQ0YzU=">mixin(qs('#tables'), {onmouseover: menuOver, onmouseout: menuOut});</script>
<li><a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;select=wp_commentmeta" class='select' title='Afficher les données'>select</a> <a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;table=wp_commentmeta" class='structure' title='Afficher la structure'>wp_commentmeta</a>
<li><a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;select=wp_comments" class='select' title='Afficher les données'>select</a> <a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;table=wp_comments" class='structure' title='Afficher la structure'>wp_comments</a>
<li><a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;select=wp_links" class='select' title='Afficher les données'>select</a> <a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;table=wp_links" class='structure' title='Afficher la structure'>wp_links</a>
<li><a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;select=wp_options" class='select' title='Afficher les données'>select</a> <a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;table=wp_options" class='structure' title='Afficher la structure'>wp_options</a>
<li><a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;select=wp_postmeta" class='select' title='Afficher les données'>select</a> <a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;table=wp_postmeta" class='structure' title='Afficher la structure'>wp_postmeta</a>
<li><a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;select=wp_posts" class='select' title='Afficher les données'>select</a> <a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;table=wp_posts" class='structure' title='Afficher la structure'>wp_posts</a>
<li><a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;select=wp_termmeta" class='select' title='Afficher les données'>select</a> <a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;table=wp_termmeta" class='structure' title='Afficher la structure'>wp_termmeta</a>
<li><a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;select=wp_terms" class='select' title='Afficher les données'>select</a> <a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;table=wp_terms" class='structure' title='Afficher la structure'>wp_terms</a>
<li><a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;select=wp_term_relationships" class='select' title='Afficher les données'>select</a> <a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;table=wp_term_relationships" class='structure' title='Afficher la structure'>wp_term_relationships</a>
<li><a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;select=wp_term_taxonomy" class='select' title='Afficher les données'>select</a> <a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;table=wp_term_taxonomy" class='structure' title='Afficher la structure'>wp_term_taxonomy</a>
<li><a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;select=wp_usermeta" class='select' title='Afficher les données'>select</a> <a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;table=wp_usermeta" class='structure' title='Afficher la structure'>wp_usermeta</a>
<li><a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;select=wp_users" class='select' title='Afficher les données'>select</a> <a href="?server=db&amp;username=wordpress&amp;db=wordpress&amp;table=wp_users" class='structure' title='Afficher la structure'>wp_users</a>
</ul>
</div>
<script nonce="Zjg4OTFlZjliZTBhNDczOGE4NjRiYTEzM2U3NWQ0YzU=">setupSubmitHighlight(document);</script>
