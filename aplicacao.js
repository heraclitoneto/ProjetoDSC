function logarAdvogado() {
	var email = $("#digiteEmail").val();
	var senha = $("#digiteSenha").val();
	var body = $("body");
	body.empty();
	body.append("<header>");
	body.append("<h1>DSC Advogados</h1>")
	body.append("<h2>Você está no seu escritório virtual</h2>");
	body.append("<p>O que deseja fazer?</p>");
	body.append("</header>");
	body.append("<section>");
	body.append("<button id='adicionarCliente'>Adicionar Cliente</button>");
	body.append("<br> <br>");
	body.append("<button>Visualizar Clientes</button>");
	body.append("<br> <br>");
	body.append("<button>Visualizar Processos</button>");
	body.append("<br> <br>");
	body.append("<button>Sair</button>");
	body.append("<br> <br>");
	body.append("</section>");
	body.append("<footer>");
	body.append("</footer>");
}
$(function() {
	$("#adicionarCliente").click(function() { 
		alert('button clicked'); 
	});
});