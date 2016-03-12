<?php
	/**
	 * NeuralPHP Framework
	 * Marco de trabajo para aplicaciones web.
	 * 
	 * @author Zyos (Carlos Parra) <Neural.Framework@gmail.com>
	 * @copyright 2006-2014 NeuralPHP Framework
	 * @license GNU General Public License as published by the Free Software Foundation; either version 2 of the License. 
	 * @license Incluida licencia carpeta de Informacion 
	 * @see http://neuralphp.url.ph/
	 * @version 3.0
	 * 
	 * This program is free software; you can redistribute it and/or
	 * modify it under the terms of the GNU General Public License
	 * as published by the Free Software Foundation; either version 2
	 * of the License, or (at your option) any later version.
	 * 
	 * This program is distributed in the hope that it will be useful,
	 * but WITHOUT ANY WARRANTY; without even the implied warranty of
	 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	 * GNU General Public License for more details.
	 */
	 
	require implode(DIRECTORY_SEPARATOR, array(__DIR__, 'Neural', 'Cargador.php'));
	
	if(version_compare(phpversion(), '5.4.0', '>=') == true AND function_exists('ctype_alpha') == true) {
		
		$Cargar = new Bootstrap;
		$Cargar->AppCargar();
	}
	else {
		echo 'Se Requiere una Versión de PHP 5.4 ó Superior';
	}