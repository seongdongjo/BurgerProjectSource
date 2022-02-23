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
		body : JSON.stringify(ob), //ob객체를 보낸다.
		headers : {
			'Content-Type': 'application/json; charset=utf-8'
		}
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		getDetailList(table,json)
	})
	if(btnSeq > 1) {
		btnSeq--  //detail.jsp에 있는 변수
	}
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

//drink, mccafe, side는 영양정보에 // 가 포함되있어서 함수를 nutritionSplit함수로 보냄
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
			let kArr = key.split('_') //burger_name,mcmoring_name 등에서 _name 앞부분만 계속 바뀌니까 자른다
			if(key == (kArr[0]+'_NAME')){ //BURGER_NAME 이면
				let nArr = dto[key].split(' // ')
				name.innerHTML = (nArr.length == 1) ?  nArr[0] : nArr[1]						
			}
			else if(key == (kArr[0]+'_IMG')){ //BURGER_IMG 이면
				let iArr = dto[key].split(' // ')
				img.innerHTML = '<img src ="'+((iArr.length == 1) ?  iArr[0] : iArr[1])+'">'						
			}
			else if(key == (kArr[0]+'_DESCRIPTION')){
 				desc.innerHTML = dto[key]						
			}
			else if(key == 'SALES_TIME'){ //맥모닝만 해당
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

//여기는(사이즈나 개수가 없는 카테고리 ex: mcmorning, burger 등등) 데이터에 ' // ' 가 없다. -> 배열을쓰지않는다
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
							
			con.innerHTML = nutrition //con은 detail.jsp에 변수정의
			//drink, mccafe, side테이블뺴고는 nutrient_standards_? 컬럼에는 null이 없다(사이즈,개수없음). 하나의 값만있다
			//그래서 바로 length비교하지않고 0을 비교한다
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
		
			thres.innerHTML = baseline //thres는 detail.jsp에 변수정의
		}
	})
}
function nutritionSplit(json){
	json.forEach(dto =>{
		//console.log(dto) 바닐라쉐이크에대한 allergy, img, kcal 등등
		for(key in dto){
			let nutrition = ''
			nutrition += '<th>함량</th>'
			let wg = dto['WEIGHT_G'].split(' // ')
			//console.log(wg)-> ['0'](length: 1) 같은값을 총 18번 출력된다. why? dto안의 key개수만큼 반복하니까
			//여기서 key는 weight_ml, kcal, weight,g 등등 -> 그래서 같은값 18번 출력
			nutrition += (wg.length == 1) ? //length비교하는이유는 // 로 자르면 길이가 최소1이상이니까 2이상이면 두번째 weight_g를 출력
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
			baseline += (ssrr.length == 1) ? //[null // 112 // 133]이렇게 null이 들어가도 length가 2이상이니까 ssrr[1]을 출력
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