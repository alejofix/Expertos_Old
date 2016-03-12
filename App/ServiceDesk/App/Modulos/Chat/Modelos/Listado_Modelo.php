<?php
	
	class Listado_Modelo extends Modelo {
		
		/**
		 * Listado_Modelo::__Construct()
		 * 
		 * Genera la conexion a la base de datos correspondiente
		 * @return void
		 */
		function __Construct() {
			parent::__Construct();
			$this->conexion = NeuralConexionDB::DoctrineDBAL(APPBD);
		}
		
		/**
		 * Listado_Modelo::consultarMensajes()
		 * 
		 * genera la consulta de los mensajes generados en el chat
		 * @return array
		 */
		public function consultarMensajes() {
			$consulta = $this->conexion->prepare('SELECT chat_mensaje.ID, chat_mensaje.FECHA, usuarios.NOMBRE AS ID_USUARIO, usuarios.USUARIO_RR AS USUARIO, chat_mensaje.ID_INVITADO, chat_mensaje.MENSAJE FROM chat_mensaje INNER JOIN usuarios ON chat_mensaje.ID_USUARIO = usuarios.ID WHERE FECHA BETWEEN ? AND ? ORDER BY FECHA DESC');
			$consulta->bindValue(1, implode(' ', array(date("Y-m-d"), '00:00:00')));
			$consulta->bindValue(2, implode(' ', array(date("Y-m-d"), '23:59:59')));
			$consulta->execute();
			return $consulta->fetchAll(PDO::FETCH_ASSOC);
		}
		
		public function consultarMensajeSala($sala = false) {
			$consulta = $this->conexion->prepare('
SELECT 
	chat_mensaje.ID, 
	chat_mensaje.FECHA, 
	usuarios.NOMBRE AS ID_USUARIO, 
	usuarios.USUARIO_RR AS USUARIO, 
	chat_mensaje.MENSAJE 
FROM 
	chat_mensaje 
INNER JOIN 
	usuarios 
ON 
	chat_mensaje.ID_USUARIO = usuarios.ID 
WHERE
	chat_mensaje.TIPO = ? 
AND 
	chat_mensaje.ID_SALA = ? 
AND 
	FECHA BETWEEN ? AND ? 
ORDER BY FECHA DESC');
			$consulta->bindValue(1, 1);
			$consulta->bindValue(2, $sala);
			$consulta->bindValue(3, implode(' ', array(date("Y-m-d"), '00:00:00')));
			$consulta->bindValue(4, implode(' ', array(date("Y-m-d"), '23:59:59')));
			$consulta->execute();
			return $consulta->fetchAll(PDO::FETCH_ASSOC);
		}
	}