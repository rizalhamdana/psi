<!DOCTYPE html>
<html>
<?php $this->load->view('user/header');?>
<body>
<nav class="navbar navbar-default navbar-static-top col-md-12 col-sm-12">
			<div class="container-fluid">
				<div class="navbar-header">
					<a href="#" class="navbar-brand">CrashReport</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href=""></a></li>
						<li><a href=""></a></li>
						<li><a href=""></a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span></a></li>
						<li><a href="<?= base_url('C_Users/logout');?>"><span class="glyphicon glyphicon-log-out"></span></a></li>
					</ul>
				</div>
			</div>
		</nav>
<div class="container">
	<h1><?php echo $this->session->userdata('username'); ?></h1>
	<div class="row">
		<?php foreach ($result as $bencana) {?>
			<div class="col-md-4 thumbnail card" style="margin: 10px 10px;">
			<h3 class="text-center"><a href="<?php 	echo base_url('C_PelaporBencana/viewBencanaPelapor?id_bencana=').$bencana->id_bencana; ?>" style="text-decoration: none;"><?php echo $bencana->nama_bencana; ?></a></h3>
			<div class="col-md-4 col-md-offset-8">
				<p><?php echo $bencana->tanggal_bencana; ?></p>
			</div>
		</div>
		<?php } ?>
		
	</div>
</div>
</body>
</html>