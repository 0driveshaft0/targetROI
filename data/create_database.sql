CREATE TABLE `user`( 
	`user` TEXT PRIMARY KEY
);
CREATE TABLE `sample` ( 
	`sample` TEXT PRIMARY KEY, 
	`raw_data` BLOB NOT NULL, 
	`raw_path` TEXT NOT NULL, 
	`polarity` TEXT NOT NULL, 
	`path` TEXT, 
	`instrument_model` TEXT, 
	`instrument_manufacturer` TEXT, 
	`software_name` TEXT, 
	`software_version` TEXT, 
	`ion_source` TEXT, 
	`analyzer` TEXT, 
	`detector_type` TEXT, 
	`resolution` TEXT, 
	`agc_target` TEXT, 
	`maximum_it` TEXT, 
	`number_of_scan_range` TEXT, 
	`scan_range` TEXT,
	`mz_min` REAL,
	`mz_max` REAL
);
CREATE TABLE `project_sample` ( 
	`project_sample` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`project` INTEGER NOT NULL, 
	`sample` TEXT NOT NULL, 
	`sample_id` TEXT NOT NULL 
);
CREATE TABLE `project` ( 
	`project` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`name` TEXT NOT NULL, 
	`comments` TEXT, 
	`creation` DATE, 
	`modified` DATE 
);
CREATE TABLE `deconvolution_param` ( 
	`deconvolution_param` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`project` INTEGER NOT NULL, 
	`chemical_type` TEXT NOT NULL,
	`adduct` TEXT NOT NULL, 
	`instrument` TEXT NOT NULL, 
	`resolution` REAL, 
	`resolution_mz` REAL, 
	`resolution_index` INTEGER, 
	`ppm` REAL NOT NULL, 
	`mda` REAL NOT NULL, 
	`peakwidth_min` REAL NOT NULL,  
	`peakwidth_max` REAL NOT NULL,
	`retention_time_min` REAL NOT NULL,
	`retention_time_max` REAL NOT NULL, 
	`missing_scans` INTEGER NOT NULL 
);
CREATE TABLE `feature` (
	`feature` INTEGER PRIMARY KEY AUTOINCREMENT, 
	`mz` REAL NOT NULL, 
	`mzmin` REAL NOT NULL,
	`mzmax` REAL NOT NULL,
	`rt` REAL NOT NULL,
	`rtmin` REAL NOT NULL,
	`rtmax` REAL NOT NULL,
	`into` REAL NOT NULL,
	`intb` REAL NOT NULL,
	`maxo` REAL NOT NULL,
	`sn` REAL NOT NULL,
	`scale` INTEGER, 
	`scpos` INTEGER NOT NULL, 
	`scmin` INTEGER NOT NULL, 
	`scmax` INTEGER NOT NULL, 
	`iso` TEXT NOT NULL, 
	`abundance` REAL NOT NULL,
	`score` REAL NOT NULL, 
	`deviation` REAL NOT NULL, 
	`chemical_ion` INTEGER NOT NULL,
	`intensities` REAL NOT NULL,
	`weighted_deviation` REAL NOT NUL,
	`project_sample` INTEGER NOT NULL
);
CREATE TABLE `deconvolution_infos` (
	`project`	INTEGER NOT NULL UNIQUE,
	`time_start`	TEXT,
	`time_end`	TEXT,
	`time_diff`	TEXT,
	`computer_manufacturer`	TEXT,
	`computer_model`	TEXT,
	`os_info`	TEXT,
	`system_type`	TEXT,
	`cpu_manufacturer`	TEXT,
	`processor_info`	TEXT,
	`cpu_cores`	TEXT,
	`cpu_speed`	TEXT,
	`memory_info`	TEXT,
	`memory_speed`	TEXT,
	FOREIGN KEY(`project`) REFERENCES `project`(`project`),
	PRIMARY KEY(`project`)
);