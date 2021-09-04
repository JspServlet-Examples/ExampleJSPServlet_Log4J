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
<h1>Registra Alumno</h1>

<%
	//Scriptlet: Insertar código java
	
	String mensaje = (String)request.getSession().getAttribute("MENSAJE");
	if(mensaje != null){
%>

<div class="alert alert-warning">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong>Warning!</strong> <%= mensaje %>
</div>

<%} 
	request.getSession().removeAttribute("MENSAJE");
%>




	<form action="registraAlumno" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombres</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_apellido">Apellido</label>
				<input class="form-control" type="text" id="id_apellido" name="apellido" placeholder="Ingrese el apellido">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_edad">Edad</label>
				<input class="form-control" type="text" id="id_edad" name="edad" placeholder="Ingrese la edad">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Alumno</button>
			</div>
	</form>
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
        	nombre: {
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 5 a 120 caracteres',
                    	min : 5,
                    	max : 120
                    }
                }
            }, 
        	apellido: {
                validators: {
                    notEmpty: {
                        message: 'El apellido es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El apellido es de 5 a 120 caracteres',
                    	min : 5,
                    	max : 120
                    }
                }
            },            
            edad: {
                validators: {
                    notEmpty: {
                        message: 'La edad es un campo obligatorio'
                    },
		            lessThan: {
		                value: 50,
		                inclusive: true,
		                message: 'La edad es menor a 50'
		            },
		            greaterThan: {
		                value: 18,
		                inclusive: true,
		                message: 'La edad es mayor a 18'
		            }
                }
            },                     
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




