#
#  Config for sellme.ru
#  which contains redirects from old URLs to sellme.biz.
#

server {
	listen 	80;
	server_name	sellme.ru;
	server_tokens	off;

	# Turn off access logging for privacy.
	access_log	off;

	#
	# Cool URIs Don't Change.
	# (But when they change, we redirect.)
	# ------------------------------------
	#
	set $new_url "https://sellme.biz";


	# Sellme ran on multiple CMS since 2005. We'd like to keep links working.

	# WordPress
	#
	# Links were in the form of /YYYY/MM/DD/post_name/
	#
	# To get the current scheme, we remove day, append .html and replace
	# underscore with dashes: /YYYY/MM/post-name.html
	# But first we try .html.
	rewrite "^/([0-9]{4})/([0-9]{2})/([0-9]{2})/([^/]+)\.html$"	$new_url/$1/$2/$4.html	permanent;
	rewrite "^/([0-9]{4})/([0-9]{2})/([0-9]{2})/([^/]+)/?$"	$new_url/$1/$2/$4.html	permanent;
	# replace underscores with dashes (it will continue replacing until all done):
	rewrite "^/([0-9]{4})/([0-9]{2})/(.*)\_(.*)$" 		$new_url/$1/$2/$3-$4	permanent;
	# upload
	rewrite "^/wp-content/uploads/(.*)$"	$new_url/pics/$1	permanent;

	# Old
	rewrite "^/old/(.*)$"	$new_url/$1 permanent;

	# Webby
	#
	# Published only a few articles with Webby, redirect them.
	#
	rewrite ^/articles/essense.html$                 $new_url/2009/08/essense.html                  permanent;
	rewrite ^/articles/tableview-browsing.html$      $new_url/2009/04/tableview-browsing.html       permanent;
	rewrite ^/articles/ellipticlicense-preview.html$ $new_url/2009/03/ellipticlicense-preview.html  permanent;
	rewrite ^/articles/mosso-cloud-servers.html$     $new_url/2009/03/mosso-cloud-servers.html      permanent;
	rewrite ^/articles/change.html$	                 $new_url/2009/03/change.html                   permanent;

	# /article/
	rewrite ^/article/parallelnoe-zhulyo$		$new_url/2007/09/parallelnoe-zhulyo.html	permanent;
	rewrite ^/article/rugayu-sebya$			$new_url/2007/09/rugayu-sebya.html		permanent;
	rewrite ^/article/eshche-raz-posypayu-golovu-peplom$	$new_url/2007/09/eshche-raz-posypayu-golovu-peplom.html permanent;
	rewrite ^/article/pro-proshloe-i-budushchee-sellmeru$	$new_url/2007/10/pro-proshloe-i-budushchee-sellmeru.html permanent;
	rewrite ^/article/o-poleznosti-memoires$	$new_url/2007/11/o-poleznosti-memoires.html	permanent;
	rewrite ^/article/keln$				$new_url/2007/08/keln.html			permanent;
	rewrite ^/article/linus-torvalds-on-git$		$new_url/2007/12/linus-torvalds-on-git.html	permanent;
	rewrite ^/article/makedoniya$			$new_url/2007/10/makedoniya.html		permanent;
	rewrite ^/article/parallels-protiv-vmware-fusion$	$new_url/2007/08/parallels-protiv-vmware-fusion.html permanent;
	rewrite ^/article/sankt-peterburg$		$new_url/2007/06/sankt-peterburg.html	permanent;
	rewrite ^/article/zametka-o-programme-translateit-dlya-mac$	$new_url/2007/05/zametka-o-programme-translateit-dlya-mac.html	permanent;


	# /post/
	rewrite ^/post/12$	$new_url/2008/02/kak-ya-programmiroval-robota.html permanent;
	rewrite ^/post/15$	$new_url/2008/03/kak-organizovyvat-fajly.html permanent;

	rewrite ^/productive_email/$	$new_url/2005/03/kak-uvelichit-produktivnost-raboty-s-pochtoi.html permanent;
	rewrite ^/testimonials/$	$new_url/2005/03/otzyvy-polzovatelei.html permanent;

	# Site pages.
	rewrite ^/about/$		$new_url/about.html	permanent;
	rewrite ^/archives/$		$new_url/archive/	permanent;
	rewrite ^/contacts/$		$new_url/about.html	permanent;
	rewrite ^/contacts.html$	$new_url/about.html	permanent;

	# Password page. (Not recommended for use anymore).
	rewrite ^/p/?$	$new_url/password/password.html	  permanent;
	rewrite ^/p2/?$ $new_url/password2/password2.html permanent;
	rewrite ^/pi/?$ $new_url/password2/ios.html	  permanent;

	# Removed posts.
	#
	# Sometimes the information contained in posts becomes obsolete
	# and it's better addressed by some third-party website.
	#
	rewrite ^/2005/07/kak-poluchit-inn-fizicheskomu-litsu.html$ http://nalog.ru permanent;


	# -------------
	# Redirect sellme.ru to https://sellme.biz.

	## Some bots don't like the modern secure Web, so we used to
	## redirect them to HTTP version. We don't care anymore, so
	## commenting it out.
	#if ($http_user_agent ~* (FeedBurner|YandexBot|bingbot)) {
	#	return 301 http://sellme.biz$request_uri;
	#}

	return 301 https://sellme.biz$request_uri;
}
