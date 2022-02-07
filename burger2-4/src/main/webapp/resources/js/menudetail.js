function getDetailJson(table,seq){
	const url = cpath + '/ajaxMenu/' + table + '/' +seq
	const opt = {
		method : 'GET'
	}
	fetch(url,opt)
	.then(resp =>resp.json())
	.then(json =>{
		getDetailList(table,json)
	})
}
function getPrev(table,seq){
	let ob = {
		'seq' : (seq - 1),
		'table' : table
	}	
	const url = cpath + '/menuDetail'
	const opt = {
		method : 'POST',
		body : JSON.stringify(ob),
		headers : {
			'Content-Type': 'application/json; charset=utf-8'
		}
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		getDetailList(table,json)
	})
	btnSeq--
}
function getNext(table,seq){
	let ob = {
		'seq' : (seq + 1),
		'table' : table
	}
	const url = cpath + '/menuDetail'
	const opt = {
		method : 'POST',
		body : JSON.stringify(ob),
		headers : {
			'Content-Type': 'application/json; charset=utf-8'
		}
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		getDetailList(table,json)
	})
	btnSeq++
}
function getDetailList(table,json){
	switch(table){
		case 'mcmorning':
			getDeMcmorning(json)
			break
		case 'burger':
			getDeBurger(json)
			break
		case 'side':
			getDeSide(json)
			break
		case 'mccafe':
			getDeMccafe(json)
			break
		case 'drink':
			getDeDrink(json)
			break
		case 'dessert':
			getDeDessert(json)
			break
	}
}
function getDeMcmorning(json){
	detailTop(json)
	nutrition(json)
}
function getDeBurger(json){
	detailTop(json)
	nutrition(json)
}
function getDeSide(json){
	detailTop(json)
	nutritionSplit(json)
}
function getDeMccafe(json){
	detailTop(json)
	nutritionSplit(json)
}
function getDeDrink(json){
	detailTop(json)
	nutritionSplit(json)
}
function getDeDessert(json){
	detailTop(json)
	nutrition(json)
}
function detailTop(json){
	console.log(json)
	json.forEach(dto =>{
		for(key in dto){
			let kArr = key.split('_')
			if(key == (kArr[0]+'_NAME')){
				let nArr = dto[key].split(' // ')
				name.innerHTML = (nArr.length == 1) ?  nArr[0] : nArr[1]						
			}
			else if(key == (kArr[0]+'_IMG')){
				let iArr = dto[key].split(' // ')
				img.innerHTML = '<img src ="'+((iArr.length == 1) ?  iArr[0] : iArr[1])+'">'						
			}
			else if(key == (kArr[0]+'_DESCRIPTION')){
 				desc.innerHTML = dto[key]						
			}
			else if(key == 'SALES_TIME'){
 				time.innerHTML = (dto[key] != 0) ? '*판매시간:'+dto[key] : ''					
 			}
			else if(dto['ALLERGY_INFO'] != 'null'){
				let allergy = ''
				allergy += '<p>'+dto['ALLERGY_INFO']+'</p>'
				aller.innerHTML = allergy
			}
		}
	})
}
function nutrition(json){
	json.forEach(dto =>{
		for(key in dto){
			let nutrition = ''
		 	nutrition += '<th>함량</th>'
		 	nutrition += '<td>'+((dto['WEIGHT_G'] != 0) ? dto['WEIGHT_G']+'g' : '-')+'</td>'
  			nutrition += dto['WEIGHT_ML'] != undefined ? '<td>'+(dto['WEIGHT_ML'] != 0 ? dto['WEIGHT_ML']+'ml' : '-')+'</td>' : '<td>-</td>'
			nutrition += '<td>'+((dto['KCAL'] != 0) ? dto['KCAL']+'kcal' : '-')+'</td>'
			nutrition += '<td>'+((dto['SUGAR'] != 0) ? dto['SUGAR']+'g' : '-')+'</td>'
			nutrition += '<td>'+((dto['PROTEIN'] != 0) ? dto['PROTEIN']+'g' : '-')+'</td>'
			nutrition += '<td>'+((dto['FAT'] != 0) ? dto['FAT']+'g' : '-')+'</td>'
			nutrition += '<td>'+((dto['NATRIUM'] != 0) ? dto['NATRIUM']+'mg' : '-')+'</td>'
  			nutrition += dto['CAFFEINE'] != undefined ? '<td>'+(dto['CAFFEINE'] != 0 ? dto['CAFFEINE']+'mg' : '-')+'</td>' : '<td>-</td>'
							
			con.innerHTML = nutrition
			
			let baseline = ''
			baseline += '<th>영양소기준치</th>'
			baseline += '<td>-</td>'
			baseline += '<td>-</td>'
			baseline += '<td>-</td>'
			baseline += '<td>'+((dto['NUTRIENT_STANDARDS_SUGAR'] != 0) ? dto['NUTRIENT_STANDARDS_SUGAR']+'%' : '-')+'</td>'
			baseline += '<td>'+((dto['NUTRIENT_STANDARDS_PROTEIN'] != 0) ? dto['NUTRIENT_STANDARDS_PROTEIN']+'%' : '-')+'</td>'
			baseline += '<td>'+((dto['NUTRIENT_STANDARDS_FAT'] != 0) ? dto['NUTRIENT_STANDARDS_FAT']+'%' : '-')+'</td>'
			baseline += '<td>'+((dto['NUTRIENT_STANDARDS_NATRIUM'] != 0) ? dto['NUTRIENT_STANDARDS_NATRIUM']+'%' : '-')+'</td>'
			baseline += '<td>-</td>'
		
			thres.innerHTML = baseline
		}
	})
}
function nutritionSplit(json){
	json.forEach(dto =>{
		for(key in dto){
			let nutrition = ''
			nutrition += '<th>함량</th>'
			let wg = dto['WEIGHT_G'].split(' // ')
			nutrition += (wg.length == 1) ? 
  					 '<td>'+((wg[0] != 0) ? wg[0]+'g' : '-')+'</td>' :
  						 '<td>'+((wg[1] != 0) ? wg[1]+'g' : '-')+'</td>'
  			let wml = dto['WEIGHT_ML'].split(' // ')
  			nutrition += (wml.length == 1) ? 
						 '<td>'+((wml[0] != 0) ? wml[0]+'ml' : '-')+'</td>' :
						 '<td>'+((wml[1] != 0) ? wml[1]+'ml' : '-')+'</td>'
			let krr = dto['KCAL'].split(' // ')
			nutrition += (krr.length == 1) ? 
					 	 '<td>'+((krr[0] != 0) ? krr[0]+'kcal' : '-')+'</td>' :
					 	 '<td>'+((krr[1] != 0) ? krr[1]+'kcal' : '-')+'</td>'
			let srr = dto['SUGAR'].split(' // ')
			nutrition += (srr.length == 1) ? 
					 	 '<td>'+((srr[0] != 0) ? srr[0]+'g' : '-')+'</td>' :
					 	 '<td>'+((srr[1] != 0) ? srr[1]+'g' : '-')+'</td>'
			let prr = dto['PROTEIN'].split(' // ')
			nutrition += (prr.length == 1) ? 
					 	 '<td>'+((prr[0] != 0) ? prr[0]+'g' : '-')+'</td>' :
					 	 '<td>'+((prr[1] != 0) ? prr[1]+'g' : '-')+'</td>'
			let frr = dto['FAT'].split(' // ')
			nutrition += (frr.length == 1) ? 
						 '<td>'+((frr[0] != 0) ? frr[0]+'g' : '-')+'</td>' :
						 '<td>'+((frr[1] != 0) ? frr[1]+'g' : '-')+'</td>'
			let nrr = dto['NATRIUM'].split(' // ')
			nutrition += (nrr.length == 1) ? 
					 	 '<td>'+((nrr[0] != 0) ? nrr[0]+'mg' : '-')+'</td>' :
					 	 '<td>'+((nrr[1] != 0) ? nrr[1]+'mg' : '-')+'</td>'
			let crr = dto['CAFFEINE'].split(' // ')
			nutrition += (crr.length == 1) ? 
						 '<td>'+((crr[0] != 0) ? crr[0]+'mg' : '-')+'</td>' :
						 '<td>'+((crr[1] != 0) ? crr[1]+'mg' : '-')+'</td>'
					 	 
			con.innerHTML = nutrition
			
			let baseline = ''
			baseline += '<th>영양소기준치</th>'
			baseline += '<td>-</td>'
			baseline += '<td>-</td>'
			baseline += '<td>-</td>'
			let ssrr = dto['NUTRIENT_STANDARDS_SUGAR'].split(' // ')
			baseline += (ssrr.length == 1) ?
						'<td>'+((ssrr[0] != 0) ? ssrr[0]+'%' : '-')+'</td>' :
					 	'<td>'+((ssrr[1] != 0) ? ssrr[1]+'%' : '-')+'</td>'
			let sprr = dto['NUTRIENT_STANDARDS_PROTEIN'].split(' // ')
			baseline += (sprr.length == 1) ?
						'<td>'+((sprr[0] != 0) ? sprr[0]+'%' : '-')+'</td>' :
					 	'<td>'+((sprr[1] != 0) ? sprr[1]+'%' : '-')+'</td>'
			let sfrr = dto['NUTRIENT_STANDARDS_FAT'].split(' // ')
			baseline += (sfrr.length == 1) ?
						'<td>'+((sfrr[0] != 0) ? sfrr[0]+'%' : '-')+'</td>' :
					 	'<td>'+((sfrr[1] != 0) ? sfrr[1]+'%' : '-')+'</td>'
			let snrr = dto['NUTRIENT_STANDARDS_NATRIUM'].split(' // ')
			baseline += (snrr.length == 1) ?
						'<td>'+((snrr[0] != 0) ? snrr[0]+'%' : '-')+'</td>' :
						'<td>'+((snrr[1] != 0) ? snrr[1]+'%' : '-')+'</td>'
			baseline += '<td>-</td>'
			
			thres.innerHTML = baseline

		}
		
	})
}