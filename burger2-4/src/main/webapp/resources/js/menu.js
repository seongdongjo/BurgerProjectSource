function getJson(table){
	const url = cpath + '/ajaxMenu/' + table
	const opt = {
			method : 'GET',
	}
	fetch(url,opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
		getMenuList(table,json)
	})
}
function getMenuList(table,json){
	if(table.includes('mcmorning'))
		getMcmorning(json)
	else if(table.includes('burger'))
		getBurger(json)
	else if(table.includes('side'))
		getSide(json)
	else if(table.includes('mccafe'))
		getMccafe(json)
	else if(table.includes('drink'))
		getDrink(json)
	else
		getDessert(json)
}
function getMcmorning(json){
	let menu = ``
	let top = ``
	json.tlist.forEach(dto =>{
		top += `<div class="menu-top-background" style="background-image: url(`+dto.MCMORNING_TABLE_BACKGROUND+`);">`
		top += 		`<h1 class="menu-title">맥모닝</h1>`
		top += 		`<p class="menu-text">`+dto.MCMORNING_TABLE_DESCRIPTION+`</p>`
		top += 		`<ul class="menu-ul">`
		top += 			`<li><a href="${cpath}">Home</a></li>`
		top +=			`<li>•</li>`
		top += 			`<li>Menu</li>`
		top += 			`<li>•</li>`
		top +=			`<li>맥모닝</li>`
		top += 		`</ul>`
		top += `</div>`
	})
	topList.innerHTML = top
	json.mlist.forEach(dto =>{
		menu += `<div class="menu-product-item" data-table="mcmorning" data-seq="`+dto.MCMORNING_SEQ+`">`
		menu += `	<div class="menu-product-img"><img src="`+dto.MCMORNING_IMG+`"></div>`
		menu += `	<div class="menu-product-name">`+dto.MCMORNING_NAME+`</div>`
		menu += `</div>`
	})
	menuList.innerHTML = menu
	
	detailClick()
}
function getBurger(json){
	let menu = ``
	let top = ``
	json.tlist.forEach(dto =>{
		top += `<div class="menu-top-background" style="background-image: url(`+dto.BURGER_TABLE_BACKGROUND+`);">`
		top += 		`<h1 class="menu-title">버거</h1>`
		top += 		`<p class="menu-text">`+dto.BURGER_TABLE_DESCRIPTION+`</p>`
		top += 		`<ul class="menu-ul">`
		top += 			`<li><a href="${cpath}">Home</a></li>`
	    top +=			`<li>•</li>`
	    top += 			`<li>Menu</li>`
	    top += 			`<li>•</li>`
	    top +=			`<li>버거</li>`
	    top += 		`</ul>`
		top += `</div>`

	})
	topList.innerHTML = top
	json.mlist.forEach(dto =>{
		menu += `<div class="menu-product-item" data-table="burger" data-seq="`+dto.BURGER_SEQ+`">`
		menu += `<div class="menu-product-img"><img src="`+dto.BURGER_IMG+`"></div>`
		menu += `<div class="menu-product-name">`+dto.BURGER_NAME+`</div>`
		menu += `</div>`
	})
	menuList.innerHTML = menu
	
	detailClick()
}
function getSide(json){
	let menu = ``
	let top = ``
	json.tlist.forEach(dto =>{
		top += `<div class="menu-top-background" style="background-image: url(`+dto.SIDE_TABLE_BACKGROUND+`);">`
		top += 		`<h1 class="menu-title">사이드</h1>`
		top += 		`<p class="menu-text">`+dto.SIDE_TABLE_DESCRIPTION+`</p>`
		top += 		`<ul class="menu-ul">`
		top += 			`<li><a href="${cpath}">Home</a></li>`
	    top +=			`<li>•</li>`	
	    top += 			`<li>Menu</li>`
	    top += 			`<li>•</li>`
	    top +=			`<li>사이드</li>`
	    top +=		`</ul>`
		top += `</div>`
	})
	topList.innerHTML = top
	json.mlist.forEach(dto =>{
		menu += `<div class="menu-product-item" data-table="side" data-seq="`+dto.SIDE_SEQ+`">`
		let iArr = dto.SIDE_IMG.split(' // ')
		if(iArr.length == 1){
			menu += `<div class="menu-product-img"><img src="`+iArr[0]+`"></div>`			
		}
		else{			
			menu += `<div class="menu-product-img"><img src="`+iArr[1]+`"></div>`			
		}
		let nArr = dto.SIDE_NAME.split(' // ')
		if(nArr.length == 1){
			menu += `<div class="menu-product-name">`+nArr[0]+`</div>`								
		}
		else{
			let nsArr = nArr[1].split(' ')
			nsArr.pop()
			menu += `<div class="menu-product-name">`+nsArr.join(' ')+`</div>`						
		}
		menu += `</div>`
	})
	menuList.innerHTML = menu
	
	detailClick()
}
function getMccafe(json){
	let menu = ``
	let top = ``
	json.tlist.forEach(dto =>{
		top += `<div class="menu-top-background" style="background-image: url(`+dto.MCCAFE_TABLE_BACKGROUND+`);">`
		top += 		`<h1 class="menu-title">맥카페</h1>`
		top += 		`<p class="menu-text">`+dto.MCCAFE_TABLE_DESCRIPTION+`</p>`
		top += 		`<ul class="menu-ul">`
		top += 			`<li><a href="${cpath}">Home</a></li>`
	    top +=			`<li>•</li>`	
	    top += 			`<li>Menu</li>`
	    top += 			`<li>•</li>`
	    top +=			`<li>맥카페</li>`
	    top += 		`</ul>`
	    top += `</div>`
	})
	topList.innerHTML = top
	json.mlist.forEach(dto =>{
		menu += `<div class="menu-product-item" data-table="mccafe" data-seq="`+dto.MCCAFE_SEQ+`">`
		let iArr = dto.MCCAFE_IMG.split(' // ')
		if(iArr.length == 1){
			menu += `<div class="menu-product-img"><img src="`+iArr[0]+`"></div>`			
		}
		else{			
			menu += `<div class="menu-product-img"><img src="`+iArr[1]+`"></div>`			
		}
		let nArr = dto.MCCAFE_NAME.split(' // ')
		if(nArr.length == 1){
			menu += `<div class="menu-product-name">`+nArr[0]+`</div>`								
		}
		else{
			let nsArr = nArr[1].split(' ')
			nsArr.pop()
			menu += `<div class="menu-product-name">`+nsArr.join(' ')+`</div>`				
		}
		menu += `</div>`
	})
	menuList.innerHTML = menu
	
	detailClick()
}
function getDrink(json){
	let menu = ``
	let top = ``
	json.tlist.forEach(dto =>{
		top += `<div class="menu-top-background" style="background-image: url(`+dto.DRINK_TABLE_BACKGROUND+`);">`
		top += 		`<h1 class="menu-title">음료</h1>`
		top += 		`<p class="menu-text">`+dto.DRINK_TABLE_DESCRIPTION+`</p>`
		top += 		`<ul class="menu-ul">`
		top += 			`<li><a href="${cpath}">Home</a></li>`
	    top +=			`<li>•</li>`	
	    top += 			`<li>Menu</li>`
	    top += 			`<li>•</li>`
	    top +=			`<li>음료</li>`
	    top += 		`</ul>`
	    top += `</div>`
	})
	topList.innerHTML = top
	json.mlist.forEach(dto =>{
		menu += `<div class="menu-product-item" data-table="drink" data-seq="`+dto.DRINK_SEQ+`">`
		let iArr = dto.DRINK_IMG.split(' // ')
		if(iArr.length == 1){
			menu += `<div class="menu-product-img"><img src="`+iArr[0]+`"></div>`			
		}
		else{			
			menu += `<div class="menu-product-img"><img src="`+iArr[1]+`"></div>`			
		}
		let nArr = dto.DRINK_NAME.split(' // ')
		if(nArr.length == 1){
			let nsArr = nArr[0].split('M')
			menu += `<div class="menu-product-name">`+nsArr[0]+`</div>`						
		}
		else{
			nsArr = nArr[1].split(' ')
			nsArr.pop()
			menu += `<div class="menu-product-name">`+nsArr.join(' ')+`</div>`				
		}
		menu += `</div>`
	})
	menuList.innerHTML = menu
	
	detailClick()
}
function getDessert(json){
	let menu = ``
	let top = ``
	json.tlist.forEach(dto =>{
		top += `<div class="menu-top-background" style="background-image: url(`+dto.DESSERT_TABLE_BACKGROUND+`);">`
		top += 		`<h1 class="menu-title">디저트</h1>`
		top += 		`<p class="menu-text">`+dto.DESSERT_TABLE_DESCRIPTION+`</p>`
		top += 		`<ul class="menu-ul">`
		top += 			`<li><a href="${cpath}">Home</a></li>`
	    top +=			`<li>•</li>`	
	    top += 			`<li>Menu</li>`
	    top += 			`<li>•</li>`
	    top +=			`<li>디저트</li>`
	    top += 		`</ul>`
    	top += `</div>`
	    })
	topList.innerHTML = top
	json.mlist.forEach(dto =>{
		menu += `<div class="menu-product-item" data-table="dessert" data-seq="`+dto.DESSERT_SEQ+`">`
		menu += `<div class="menu-product-img"><img src="`+dto.DESSERT_IMG+`"></div>`
		menu += `<div class="menu-product-name">`+dto.DESSERT_NAME+`</div>`
		menu += `</div>`
		})
	menuList.innerHTML = menu
	
	detailClick()
}
function detailClick(){
	const detail = document.querySelectorAll('.menu-product-item')
	detail.forEach(d =>{
		d.onclick = (event) =>{
			event.stopPropagation();
			let target = event.target
			while(target.classList.contains('menu-product-item') == false) {
				target = target.parentNode
			}
			
			let table = target.dataset.table
			let seq = target.dataset.seq
			
			detailForm(table, seq)
		}
	})
}
function detailForm(tableValue, seqValue){
	const form = document.createElement('form')
	form.method = 'POST'
	form.action = cpath + '/menu/detail'

	const table = document.createElement('input')
	const seq = document.createElement('input')

	table.type = 'hidden'
	table.name = 'table'
	table.value = tableValue

	seq.type = 'hidden'
	seq.name = 'seq'
	seq.value = seqValue
	
	form.appendChild(table)
	form.appendChild(seq)
	
	document.body.appendChild(form)

	form.submit()
}