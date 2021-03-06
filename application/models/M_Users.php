<?php 
/**
* 
*/
class M_Users extends CI_Model
{
	public function cekLogin($input){
		$hasil=$this->db->where('username',$input->username)
						->where('password',md5($input->password))
						->limit(1)
						->get('pengguna')
						->row();

		if(count($hasil)){
			$dataSession=['login'=>true,'id_pengguna'=>$hasil->id_pengguna,'username'=>$hasil->username,
							'nama_pengguna'=>$hasil->nama_pengguna,'status_pengguna'=>$hasil->status_pengguna,'id_wilayah'=>$hasil->id_wilayah
						];
			$this->session->set_userdata($dataSession);
			return true;
		}else{
			return false;
		}
	}
	public function logout(){
		$data=['username'=>null, 'id_pengguna'=>null, 'login'=>null, 'nama_pengguna'=>null,'status_pengguna'=>null];
			$this->session->unset_userdata($data);
			$this->session->sess_destroy();
	}
	public function insertNewUser($input){
		$this->db->insert('pengguna',$input);
		return $this->db->insert_id();
	}	
	public function getAllUsers(){
		$hasil=$this->db->get('pengguna');
		if($hasil->num_rows()>0){
			return $hasil->result();
		}else{
			return array();
		}
	}

	public function getSpesifikPelapr($id_pelapor){
		$hasil=$this->db->where('id_pengguna',$id_pelapor)
						->limit('1')
						->get('pengguna');
		if($hasil->num_rows()>0){
			return $hasil->row();
		}else{
			return array();
		}

	}
	public function UpdateDataPelapor($input){
		$this->db->where('id_pengguna',$input['id_pengguna'])
				->update('pengguna',$input);
		
	}

	public function hapusPelapor ($input) {
		/*$this->db->where('id_pengguna',$input)
				->delete('laporan');*/

		$this->db->where('id_pengguna', $input)
				 ->delete('pengguna');
	}
}

 ?>