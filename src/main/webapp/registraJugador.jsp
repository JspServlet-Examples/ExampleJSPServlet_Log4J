<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/bootstrapValidator.css">

<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrapValidator.js"></script>

<title>Registra Alumno</title>
</head>

<body>

<div class="container">
<h1>Registra Jugador</h1>
	<form action="alumno" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombres</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_alias">Alias</label>
				<input class="form-control" type="text" id="id_alias" name="alias" placeholder="Ingrese el alias">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_pais">País</label>
				<select class="form-control" id="id_pais" name="pais" >
						<option value=""></option>
						<option value="Perú">Perú</option>
						<option value="Brasil">Brasil</option>
				</select>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_juego">Juego</label>
				<select class="form-control" id="id_juego" name="juego" >
						<option value=""></option>
						<option value="Dota I">Dota I</option>
						<option value="WoW">WoW</option>
				</select>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_experiencia">Experiencia</label>
				<input class="form-control" type="text" id="id_experiencia" name="experiencia" placeholder="Ingrese la experiencia">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Jugador</button>
			</div>
	</form>
	<a href="index.jsp">Principal</a>
</div>


<script type="text/javascript">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        
        }   
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#id_form').bootstrapValidator('validate');
    });
});
</script>

</body>
</html>




