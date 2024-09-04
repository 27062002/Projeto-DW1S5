"use strict"

window.onload = initPage;

function initPage(){
	
	let form = document.getElementById('form1');

cpfMascara();
rgMascara();
mascaraTelefone();

form.noValidate = true;
form.addEventListener('submit', function(e){
let valid = processValidity(this);
if(!valid){
e.preventDefault();
}
});
}

function rgMascara(){
let rg = document.getElementById('rg')

rg.addEventListener('keypress', () =>{
let rgLength = rg.value.length

if(rgLength === 2 || rgLength === 6){
rg.value += '.'
}
if(rgLength === 10){
rg.value += '-'
}
})
}

function cpfMascara(){
let cpf = document.getElementById('cpf')

cpf.addEventListener('keypress', () =>{
let cpfLength = cpf.value.length

if(cpfLength === 3 || cpfLength === 7){
cpf.value += '.'
}
if(cpfLength === 11){
cpf.value += '-'
}
})
}

function telefoneMascara(){
let telefone = document.getElementById('telefone')

telefone.addEventListener('keypress', () =>{
let telefoneLength = telefone.value.length

if(telefoneLength === 0){
telefone.value += '('
}

if(telefoneLength === 3){
telefone.value += ')'
}

if(telefoneLength === 9){
telefone.value += '-'
}
})
}

function mascaraTelefone(){
var telefone = document.getElementById('telefone');

telefone.addEventListener("input", () => {
var limparValor = telefone.value.replace(/\D/g, "").substring(0, 11);

var numerosArray = limparValor.split("");

var numeroFormatado = "";

if(numerosArray.length > 0){
numeroFormatado += '('+ numerosArray.slice(0,2).join("") +')';
}

if(numerosArray.length > 2){
numeroFormatado += numerosArray.slice(2, 7).join("");
}

if(numerosArray.length > 7){
numeroFormatado += '-' + numerosArray.slice(7, 11).join("");
}

telefone.value = numeroFormatado;
});

}

function processValidity(form){
	let valid;
	validatePassword(form);
	valid = applyValidity(form);
	return valid;
}

function validatePassword(form){
	let password = form.elements['password'];
	let confirmPassword = form.elements['confirmPassword'];
	
	if(password.value != confirmPassword.value){
		password.setCustomValidity('Valores de senha e confirmação de senha diferentes.');
	}else{
		password.setCustomValidity('');
	}
}

function applyValidity(form){
	let valid = true;
	let count = 0;
	let elements = form.elements;
	for(let i = 0; i < elements.length - 1; i++){
		let element = elements[i];
		let span = document.getElementById(i);
		if(!element.validity.valid){
			span.innerHTML = element.validationMessage;
			count++;
		}else{
			span.innerHTML = ' ';
		}
	}
	if(count > 0){
		valid = false;
	}
	return valid;
}































