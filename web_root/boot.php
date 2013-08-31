
<?php

class Boot {
	
	public static function ensureMongoLoaded() {
		// Check mongo connection
		echo '<html><body><pre>' . PHP_EOL;
		echo 'StudioLive Boot Loader' . PHP_EOL;
		echo '----------------------' . PHP_EOL;
		echo 'Checking MongoDB ...' . PHP_EOL;
		$isMongoLoaded = self::isMongoLoaded();
		if (!$isMongoLoaded) {
			echo '[FAIL] Mongo is not loaded.' . PHP_EOL;
			self::startMongo();
			sleep(1);
			$isMongoLoaded = self::isMongoLoaded();
			if (!$isMongoLoaded) {
				echo '[FAIL] Could not load MongoDB' . PHP_EOL;
				exit;
			} else {
				echo '[OK] Mongo loaded. Redirecting to StudioLive' . PHP_EOL;
			}
		}
		echo '</pre>' . PHP_EOL;
		?>
<script type="text/javascript">
		window.location = "http://localhost:8080?skipboot";
</script>'
		<?php 
		echo '</body></html>';
	}
	
	/**
	 * @return bool
	 */
	private static function isMongoLoaded() {
		try {
			$m = new Mongo();
			return true;
		} catch (MongoConnectionException $e) {
			return false;
		}
	}
	
	private static function startMongo() {
		echo 'Starting MongoDB ...' . PHP_EOL;
		$path = realpath(dirname(__FILE__) . '/..');
 		$cmd = "mongod.exe --config mongodb.conf";
		$descriptorspec = array(
			0 => array("pipe", "r"), // stdin
			1 => array("pipe", "w"), // stdout
			2 => array("pipe", "w")  // stderr
		);
		$pipes = array();
		$handle = proc_open(sprintf("start /B %s", $cmd), $descriptorspec, $pipes, $path);
 		proc_close($handle);
	}
	
}

//Boot::ensureMongoLoaded();

?>