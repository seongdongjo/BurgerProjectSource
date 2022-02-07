function promotionAjax(){
	const url = cpath + '/ajaxPromotion'
	const opt = {
		method : 'get'
	}
	fetch(url,opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
		let dom = ''
			json.forEach(dto => {
			dom += '<div class="promotion-imagecontainer">'
			dom += '<img class="promotion-image" src="'+ dto.promotion_img +'">'
			dom += '<p class="promotion-sentence">'+ dto.prmotion_content +'</p>'
			dom += '</div>'
	})
	promotionImageList.innerHTML += dom
})
}