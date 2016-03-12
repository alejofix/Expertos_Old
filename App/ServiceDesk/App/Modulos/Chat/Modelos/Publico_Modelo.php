<?php
	
	class Publico_Modelo extends Modelo {
		
		private $conexion = false;
		
		/**
		 * Publico_Modelo::__Construct()
		 * 
		 * Genera la conexion a la base de datos
		 * @return void
		 */
		function __Construct() {
			parent::__Construct();
			$this->conexion = NeuralConexionDB::DoctrineDBAL(APPBD);
		}
		
		/**
		 * Publico_Modelo::consultarSalas()
		 * 
		 * Consulta los datos de las salas permitidas
		 * @param string $Permiso
		 * @return array
		 */
		public function consultarSalas($usuario = false) {
			$consulta = $this->conexion->prepare('
SELECT 
	chat_salas_has_chat_perfil.chat_salas_ID AS salas,
	chat_salas.NOMBRE AS nombre
FROM 
	expertos.chat_salas_has_chat_perfil 
INNER JOIN 
	chat_perfil 
ON 
	chat_perfil.ID = chat_salas_has_chat_perfil.chat_perfil_ID 
INNER JOIN 
	usuarios 
ON 
	usuarios.PERMISO = chat_perfil.PERMISO_NOMBRE 
INNER JOIN 
	chat_salas 
ON 
	chat_salas.ID = chat_salas_has_chat_perfil.chat_salas_ID 
WHERE 
	usuarios.USUARIO_RR = ?');
			$consulta->bindValue(1, $usuario);
			$consulta->execute();
			return $consulta->fetchAll(PDO::FETCH_ASSOC);
		}
	}