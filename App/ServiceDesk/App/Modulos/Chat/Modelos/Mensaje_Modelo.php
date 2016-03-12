<?php
	
	require_once implode(DIRECTORY_SEPARATOR, array(__DIR__, 'Listado_Modelo.php'));
	
	class Mensaje_Modelo extends Modelo {
		
		function __Construct() {
			parent::__Construct();
			$this->conexion = NeuralConexionDB::DoctrineDBAL(APPBD);
		}
		
		/**
		 * Mensaje_Modelo::guardar()
		 * 
		 * genera el proceso de guardar el mensaje en la base de datos
		 * @param string $Mensaje
		 * @param string $Usuario
		 * @return bool
		 */
		public function guardar($Mensaje = false, $Usuario = false, $sala = false) {
			$SQL = new NeuralBDGab($this->conexion, 'chat_mensaje');
			$SQL->Sentencia('FECHA', date("Y-m-d H:i:s"));
			$SQL->Sentencia('ID_USUARIO', $this->consultarIDUsuario($Usuario));
			$SQL->Sentencia('IP', $_SERVER['REMOTE_ADDR']);
			$SQL->Sentencia('MENSAJE', strip_tags($Mensaje, '<br><br/><h3><p><b><ol><ul><li>'));
			$SQL->Sentencia('TIPO', 1);
			$SQL->Sentencia('ID_SALA', $sala);
			return $SQL->Insertar();
		}
		
		/**
		 * Mensaje_Modelo::consultarIDUsuario()
		 * 
		 * genera la consulta del id del usuario
		 * @param string $id
		 * @return int
		 */
		private function consultarIDUsuario($id = false) {
			$consulta = $this->conexion->prepare('SELECT ID FROM usuarios WHERE USUARIO_RR = ?');
			$consulta->bindValue(1, $id);
			$consulta->execute();
			$array = $consulta->fetch(PDO::FETCH_ASSOC);
			return $array['ID'];
		}
		
		/**
		 * Mensaje_Modelo::listadoMensajes()
		 * 
		 * genera la consulta del listado de mensajes directamente de Listado_Modelo 
		 * @return array
		 */
		public function listadoMensajes($sala = false) {
			$SQL = new Listado_Modelo;
			return $SQL->consultarMensajeSala($sala);
		}
	}