clientes = []

$(function() {
	$("#btLogin").click(function() {
		gerarTelaOpcoes();
	});
});

function gerarTelaOpcoes() {
	$("#conteudo").empty();
	$("#conteudo").append(
		'<h1>DSC Advogados</h1>' +
		'<h2>Você está no seu escritório virtual</h2>' +
		'<p>O que deseja fazer?</p>');
	$("<button>").attr({type: "button"})
	.text("Adicionar Cliente")
	.click(function(){
		gerarTelaAdicionarCliente();
	}).appendTo("#conteudo")
	$("#conteudo").append("<br><br>");
	$("<button>").attr({type: "button"})
	.text("Visualizar Clientes")
	.click(function(){
		// Função
		gerarTelaVisualizarClientes();
	}).appendTo("#conteudo")
	$("#conteudo").append("<br><br>");
	$("<button>").attr({type: "button"})
	.text("Visualizar Processos")
	.click(function(){
		// Função
		gerarTelaVisualizarProcessos()
	}).appendTo("#conteudo")
	$("#conteudo").append("<br><br>");
	$("<button>").attr({type: "button"})
	.text("Sair")
	.click(function(){
		// Função
		gerarTelaLogin();
	}).appendTo("#conteudo")
}

function gerarTelaAdicionarCliente() {
	$("#conteudo").empty();
	$("#conteudo").append(
		'<h1>DSC Advogados<h1>' +
		'<h2>Cadastro de advogados</h2>' +
		'<p>Preencha seus dados corretamente</p>' +
		'<br>');
	
	formCadastrar = $("<form>");
	formCadastrar.append(
		'<h4>Dados Pessoais</h4>' +
		'<label for="nome">Nome</label>' +
		'<br>' +
		'<input id="nome" type="text" placeholder="Nome" />' +
		'<label for="sobrenome"></label>' +
		'<input id = "sobrenome" type = "text"placeholder="sobrenome" />' +
		'<br>' +
		'<br>' +
		'<label for="nascimento">Data de Nascimento</label>' +
		'<br>' +
		'<input id = "nascimento" type = "text"placeholder="mm/dd/aaaa" />' +
		'<br>' +
		'<br>' +
		'<label for="sexo">Sexo</label>' +
		'<br>' +
		'<input id = "sexo" type = "text"placeholder="M/F" />' +
		'<br>' +
		'<br>' +
		'<h4>Endereço</h4>' +
		'<label for="rua"></label>' +
		'<input id = "rua" type = "text"placeholder="rua" />' +
		'<label for="numero"></label>' +
		'<input id = "numero" type = "text"placeholder="numero" />' +
		'<label for="bairro"></label>' +
		'<input id = "bairro" type = "text"placeholder="bairro" />' +
		'<br>' +
		'<label for="cidade"></label>' +
		'<input id = "cidade" type = "text"placeholder="cidade" />' +
		'<label for="estado"></label>' +
		'<input id = "estado" type = "text"placeholder="estado" />' +
		'<br>' +
		'<br>' +
		'<h4>Contato</h4>' +
		'<label for="telefone">Telefones</label>' +
		'<br>' +
		'<input id = "telefone" type = "text"placeholder="(DDD)_ _ _ _ _ _ _ _" />' +
		'<label for="celular"></label>' +
		'<input id = "celular" type = "text"placeholder="(DDD)_ _ _ _ _ _ _ _" />' +
		'<br>' +
		'<label for="email">Email</label>' +
		'<br>' +
		'<input id = "email" type = "text"placeholder="email para contato" />' +
		'<br>' +
		'<br>' +
		'<h4>Dados da conta</h4>' +
		'<label for="login">login</label>' +
		'<input id = "login" type = "text"placeholder="login" />' +
		'<br>' +
		'<label for="senha">Senha</label>' +
		'<input id = "senha" type = "text"placeholder="senha" />' +
		'<br>' +
		'<label for="email2">Email</label>' +
		'<input id = "email2" type = "text"placeholder="email para acesso" />' +
		'<br>' +
		'<br>');
	
	$("<input>").attr({type: "button", value: "Criar Cadastro"})
	.click(function(){
		// Função
		cadastrarCliente($("#nome").val(), $("#sobrenome").val(), $("#nascimento").val());
	}).appendTo(formCadastrar);
	
	$("#conteudo").append(formCadastrar);
}

function gerarTelaVisualizarClientes() {
	$("#conteudo").empty();
	var table = $("<table>");
	table.append("<tr><th>Nome</th><th>Sobrenome</th><th>Data de Nascimento</th></tr>");
	for (var i=0; i < clientes.length; i++) {
		cliente = clientes[i];
		var tr = $("<tr>");
		tr.append($("<td>").text(cliente.nome));
		tr.append($("<td>").text(cliente.sobrenome));
		tr.append($("<td>").text(cliente.nascimento));
		table.append(tr);
	}
	$("#conteudo").append(table);
}

function gerarTelaVisualizarProcessos() {
	alert("visualizar processos");
}

function gerarTelaLogin() {
	alert("login");
}

function cadastrarCliente(nome, sobrenome, nascimento) {
	var cliente = new Object();
	cliente.nome = nome;
	cliente.sobrenome = sobrenome;
	cliente.nascimento = nascimento;
	
	clientes.push(cliente);
	
	gerarTelaOpcoes();
}