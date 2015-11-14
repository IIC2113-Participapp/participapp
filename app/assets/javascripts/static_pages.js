(function () {

function homeEffects(){
	$('.img-responsive').fadeTo("slow",1);
	$('.name').fadeTo("slow",1);
	$('.star-decoration').fadeTo("slow",1);
	$('.sub-title').delay(500).fadeTo("slow",1);
}

$(document).on('page:change', homeEffects);
})();