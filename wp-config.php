<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
//define('DB_NAME', 'gatewayofbollywoodwp');
define('DB_NAME', 'gatewaytobollywood');

/** MySQL database username */
//define('DB_USER', 'root');
define('DB_USER', 'root');

/** MySQL database password */
//define('DB_PASSWORD', '');
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '.GpV{Uq{X)s$&%>HH_:hmh2pL-X/yIz+77ROoTw}-`*5t50TuDR!vvK{9|Kk8M9s');
define('SECURE_AUTH_KEY',  '%)gS)9/S=5+2R,&Y6;cB<)?~3T(-!7$D;OP3]0bveTUij.50|* kfP_Ooc%XB_> ');
define('LOGGED_IN_KEY',    'box_Jau(^:9bSDv*.(1|Quby,;(6o?~!Aqj6f~CSu=W{9l}N9U|3M6fv|{!cW%C$');
define('NONCE_KEY',        'sXU! TP0#s3ZIs2[nOSJi9NoJN4zc7p{[<r]bz)<)NX4Wc`-_<9x*k2@n|) 7P%=');
define('AUTH_SALT',        'BQCW{yxz/tTyqG^ AaXIe=UC8XP}3y5`t07]e)1YDn,@zMh!PQ)0+Lu{tL?IDVNc');
define('SECURE_AUTH_SALT', '^WT^=l2Gt;_9pw<Fn3? !~pK,@TXb7dY3Zj@<z-ZbyXBU+YS{pZ{UZ4BIS@lG+3x');
define('LOGGED_IN_SALT',   '2Li03)AcU*#iUSi+y91|.kh7-^reYUtC%)hE~AZrwK*/R?LSbX&,xA$C[3F~lo#4');
define('NONCE_SALT',       'j!@-&HjHET,0P:J+Xw&K*0~,*`.Z_A.ZQE-;cj?q-3DI)kE}*G Zw:1lfc54k#84');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

define('WP_HOME','http://localhost/wordpress/gatewaytobollywood/');
define('WP_SITEURL','http://localhost/wordpress/gatewaytobollywood/');
define('RELOCATE',true);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
