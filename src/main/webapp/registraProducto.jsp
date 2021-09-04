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

<title>Registra Producto</title>
</head>

<body>
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

<div class="container">
<h1>Registra Producto</h1>
	<form action="insertaProducto" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombres</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_precio">Precio</label>
				<input class="form-control" type="text" id="id_precio" name="precio" placeholder="Ingrese el precio">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_stock">Stock</label>
				<input class="form-control" type="text" id="id_stock" name="stock" placeholder="Ingrese el stock">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Producto</button>
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
                    	message:'El nombre es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
        	precio: {
                validators: {
                    notEmpty: {
                        message: 'El precio es un campo obligatorio'
                    },
                    regexp: {
                        regexp: /^[0-9]*\.?[0-9]+$/,
                        message: 'El precio es real'
                    }
                }
            },
            stock: {
                validators: {
                    notEmpty: {
                        message: 'El stock es un campo obligatorio'
                    },
                    digits: {
		                message: 'El stock es entero'
		            },
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




