let nowPic;
let check=0;
let envShowContainCount;

function nextSildeHandler(event) {
            if(check <=0 && check > -(envShowContainCount-1) ) { //check의 최대는 -(showContain갯수 -1)
                check -= 1
                nowPic = check * 1200
                showFrame.style.transform='translateX('+nowPic+'px)';
            }
            else {  //-2...
                check = 0;
                nowPic = check
                showFrame.style.transform='translateX('+nowPic+'px)';
            }
}

function beforeSildeHandler(event) {
    if(check >= 0) {  //젤 처음일때부터 before를 누르면
        if(check == 0) check = -(envShowContainCount-1); {
        nowPic = check * 1200
        showFrame.style.transform='translateX('+nowPic+'px)';
        }
    }
    else {
        if(check < 0) {
            check += 1;
            nowPic = check * 1200
            showFrame.style.transform='translateX('+nowPic+'px)';
        }
    }
}

function macImageHandler() {
	let colors = new Array()
	let arrUnique = new Array()
	//const url = cpath + '/order/' + cate
	const url = cpath + '/mac'
	const opt = {
			method: 'GET'
	}
	fetch(url,opt)
	.then(resp => resp.json())  //db에 있는 값이 알아서 json으로 바뀜
	.then(json => {
				render(showFrame,getMacDom(json))
				const imageOrderBtn = document.querySelectorAll('.imageOrderBtn')
				imageOrderBtn.forEach(arr=>{
					//이미지를 클릭하면
					arr.onclick=function(event) {
						let parent_orderArray=parent_order.childNodes
						if(parent_orderArray.length == 0) imageOrderDom(event)
						else { //상품리스트가 하나라도 있으면
							for(let i = 0; i<parent_orderArray.length; i++) {
								let price = parent_orderArray[i].childNodes[5].innerText.split(' ')[1]
								price = parseInt(price.replace(/,/g,"")) //2300
								
								if(parent_orderArray[i].childNodes[1].innerText == event.target.nextElementSibling.nextElementSibling.innerText){
									let count = parseInt(parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText)
									parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText= count +1
									count = parseInt(parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText)
									parent_orderArray[i].childNodes[5].innerText = '￦ ' + (price + (price / (count -1))).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
									break;
								}
								else {
									if(i==(parent_orderArray.length-1)) {
										imageOrderDom(event)
										break
									}
								}
							}
						}
						totalfunction1(event)
					}
				})

			})
}

function getMacDom(json) {
	let tag = ``
	let i = 0
	showContainTag1 = `<div class="show-contain">`
	showContainTag2= `</div>`
	json.forEach(dto =>{
		if(i==0 || i%8==0) tag += showContainTag1
		tag +=	 `<div class="menu-border">`
		tag +=		`<img class="imageOrderBtn" src="${dto.mcmorning_img}">`
		tag +=		`<div style="color: #44900c; font-size: 14px;">￦ ${dto.mcmorning_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</div>`
		tag +=		`<span style="color: #3d3d3d; font-size: 14px;">${dto.mcmorning_name}</span>`
		tag +=	 `</div>`
		i++
		if(i%8 ==0) tag += showContainTag2
	})
	check = 0
	showFrame.style.transform='translateX('+0+'px)';
	return tag
}

function macSetImageHandler() {
	//const url = cpath + '/order/' + cate
	const url = cpath + '/macSet'
	const opt = {
			method: 'GET'
	}
	fetch(url,opt)
	.then(resp => resp.json())  //db에 있는 값이 알아서 json으로 바뀜
	.then(json => {
				render(showFrame,getMacSetDom(json))
				const imageOrderBtn = document.querySelectorAll('.imageOrderBtn')
				imageOrderBtn.forEach(arr=>{
					arr.onclick=function(event) {
						let parent_orderArray=parent_order.childNodes
						if(parent_orderArray.length == 0) imageOrderDom(event)
						else { //상품리스트가 하나라도 있으면
							for(let i = 0; i<parent_orderArray.length; i++) {
								let price = parent_orderArray[i].childNodes[5].innerText.split(' ')[1]
								price = parseInt(price.replace(/,/g,"")) //2300
								
								if(parent_orderArray[i].childNodes[1].innerText == event.target.nextElementSibling.nextElementSibling.innerText){
									let count = parseInt(parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText)
									parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText= count +1
									count = parseInt(parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText)
									parent_orderArray[i].childNodes[5].innerText = '￦ ' + (price + (price / (count -1))).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
									break;
								}
								else {
									if(i==(parent_orderArray.length-1)) {
										imageOrderDom(event)
										break
									}
								}
							}
						}
						totalfunction1(event)
				}
			})
		})
}

function getMacSetDom(json) {
	let tag = ``
	let i = 0
	showContainTag1 = `<div class="show-contain">`
	showContainTag2= `</div>`
	json.forEach(dto =>{
		if(i==0 || i%8==0) tag += showContainTag1
		if(dto.mcmorning_set_img != 'null' ) {
			tag +=	 `<div class="menu-border">`
			tag +=		`<img class="imageOrderBtn" src="${dto.mcmorning_set_img}">`
			tag +=		`<div style="color: #44900c; font-size: 14px;">￦ ${dto.mcmorning_set_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</div>`
			tag +=		`<span style="color: #3d3d3d; font-size: 14px;">${dto.mcmorning_set_name}</span>`
			tag +=	 `</div>`
			i++
		}
		if(i%8 ==0) tag += showContainTag2
	})
	check = 0
	showFrame.style.transform='translateX('+0+'px)';
	return tag
}

function burgerImageHandler() {
	let marr
	console.log(check)
	//const url = cpath + '/order/' + cate
	const url = cpath + '/burger'
	const opt = {
			method: 'GET'
	}
	fetch(url,opt)
	.then(resp => resp.json())  //db에 있는 값이 알아서 json으로 바뀜
	.then(json => {
				render(showFrame,getburgerDom(json))
				const imageOrderBtn = document.querySelectorAll('.imageOrderBtn')
				imageOrderBtn.forEach(arr=>{
					arr.onclick=function(event) {
						let parent_orderArray=parent_order.childNodes
						console.log(parent_orderArray)
						if(parent_orderArray.length == 0) imageOrderDom(event)
						else { //상품리스트가 하나라도 있으면
							for(let i = 0; i<parent_orderArray.length; i++) {
								let price = parent_orderArray[i].childNodes[5].innerText.split(' ')[1]
								price = parseInt(price.replace(/,/g,"")) //2300
								
								if(parent_orderArray[i].childNodes[1].innerText == event.target.nextElementSibling.nextElementSibling.innerText){
									let count = parseInt(parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText)
									parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText= count +1
									count = parseInt(parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText)
									parent_orderArray[i].childNodes[5].innerText = '￦ ' + (price + (price / (count -1))).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
									break;
								}
								else {
									if(i==(parent_orderArray.length-1)) {
										imageOrderDom(event)
										break
									}
								}
							}
						}
						totalfunction1(event)
				}
			})
		})
}

function getburgerDom(json) {
	let tag = ``
	let i = 0
	showContainTag1 = `<div class="show-contain">`
	showContainTag2= `</div>`
	json.forEach(dto =>{
		if(i==0 || i%8==0) tag += showContainTag1
			tag +=	 `<div class="menu-border">`
			tag +=		`<img class="imageOrderBtn" src="${dto.burger_img}">`
			tag +=		`<div style="color: #44900c; font-size: 14px;">￦ ${dto.burger_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</div>`
			tag +=		`<span style="color: #3d3d3d; font-size: 14px;">${dto.burger_name}</span>`
			tag +=	 `</div>`
			i++
		if(i%8 ==0) tag += showContainTag2
	})
	check = 0
	showFrame.style.transform='translateX('+0+'px)';
	return tag
}

function burgerSetImageHandler() {
	console.log(check)
	//const url = cpath + '/order/' + cate
	const url = cpath + '/burgerSet'
	const opt = {
			method: 'GET'
	}
	fetch(url,opt)
	.then(resp => resp.json())  //db에 있는 값이 알아서 json으로 바뀜
	.then(json => {
				render(showFrame,getburgerSetDom(json))
				const imageOrderBtn = document.querySelectorAll('.imageOrderBtn')
				imageOrderBtn.forEach(arr=>{
					arr.onclick=function(event) {
						let parent_orderArray=parent_order.childNodes
							modalHandler()
							getsizedom(event)
							totalfunction1(event)
				}
			})
		})
}

function getburgerSetDom(json) {
	let tag = ``
	let i = 0
	showContainTag1 = `<div class="show-contain">`
	showContainTag2= `</div>`
	json.forEach(dto =>{
		flag = dto.burger_set_img != 'null'
		if(i==0 || i%8==0 && flag) tag += showContainTag1 
		if(dto.burger_set_img != 'null' ) {
			tag +=	 `<div class="menu-border">`
			tag +=		`<img class="imageOrderBtn" src="${dto.burger_set_img}">`
			tag +=		`<div style="color: #44900c; font-size: 14px;">￦ ${dto.burger_set_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</div>`
			tag +=		`<span style="color: #3d3d3d; font-size: 14px;">${dto.burger_set_name}</span>`
			tag +=	 `</div>`
			i++
		}
		if(i==0 || i%8==0 && flag) tag += showContainTag2
	})
	check = 0
	showFrame.style.transform='translateX('+0+'px)';
	return tag
}


function sideImageHandler() {
	const url = cpath + '/side'
	const opt = {
			method: 'GET'
	}
	fetch(url,opt)
	.then(resp=>resp.json())
	.then(json => {
				render(showFrame,getsideSetDom(json))
				const imageOrderBtn = document.querySelectorAll('.imageOrderBtn')
				imageOrderBtn.forEach(arr=>{
					arr.onclick=function(event) {
						let parent_orderArray=parent_order.childNodes
						if(parent_orderArray.length == 0) imageOrderDom(event)
						else { //상품리스트가 하나라도 있으면
							for(let i = 0; i<parent_orderArray.length; i++) {
								let price = parent_orderArray[i].childNodes[5].innerText.split(' ')[1]
								price = parseInt(price.replace(/,/g,"")) //2300
								
								if(parent_orderArray[i].childNodes[1].innerText == event.target.nextElementSibling.nextElementSibling.innerText){
									let count = parseInt(parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText)
									parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText= count +1
									count = parseInt(parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText)
									parent_orderArray[i].childNodes[5].innerText = '￦ ' + (price + (price / (count -1))).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
									break;
								}
								else {
									if(i==(parent_orderArray.length-1)) {
										imageOrderDom(event)
										break
									}
								}
							}
						}
						totalfunction1(event)
				}
			})
		})
}

function getsideSetDom(json) {
	let tag = ``
	let i = 0
	let namearr
	let imgarr
	let priarr
	showContainTag1 = `<div class="show-contain">`
	showContainTag2= `</div>`
	let naar = new Array();
	let iaar = new Array();
	let paar = new Array();
	json.forEach(dto =>{
		if(dto.side_name.includes(" // ")) {
			narr = dto.side_name.split(" // ")
			narr.forEach(e=>{
				if(e != 'null') {
					naar.push(e)
			    }
			})
		}
		else {
			naar.push(dto.side_name)
		}
		if(dto.side_img.includes(" // ")) {
			iarr = dto.side_img.split(" // ")
			iarr.forEach(e=>{
				if(e != 'null') {
					iaar.push(e)
			    }
			})
		}
		else {
			iaar.push(dto.side_img)
		}
		if(dto.side_price.includes(" // ")) {
			parr = dto.side_price.split(" // ")
			parr.forEach(e=>{
				if(e != 'null') {
					paar.push(e)
			    }
			})
		}
		else {
			paar.push(dto.side_price)
		}
	})
	
	for(let j = 0; j<naar.length; j++) {
		if(i==0 || i%8==0) tag += showContainTag1 
			tag +=	 `<div class="menu-border">`
			tag +=		`<img class="imageOrderBtn" src="${iaar[j]}">`
			tag +=		`<div style="color: #44900c; font-size: 14px;">￦ ${paar[j].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</div>`
			tag +=		`<span style="color: #3d3d3d; font-size: 14px;">${naar[j]}</span>`
			tag +=	 `</div>`
			i++
		if(i==0 || i%8==0) tag += showContainTag2
	}
	check = 0
	showFrame.style.transform='translateX('+0+'px)';
	return tag
}


function drinkImageHandler() {
	const url = cpath + '/drink'
	const opt = {
			method: 'GET'
	}
	fetch(url,opt)
	.then(resp=>resp.json())
	.then(json => {
				render(showFrame,getdrinkDom(json))
				const imageOrderBtn = document.querySelectorAll('.imageOrderBtn')
				imageOrderBtn.forEach(arr=>{
					arr.onclick=function(event) {
						let parent_orderArray=parent_order.childNodes
						if(parent_orderArray.length == 0) imageOrderDom(event)
						else { //상품리스트가 하나라도 있으면
							for(let i = 0; i<parent_orderArray.length; i++) {
								let price = parent_orderArray[i].childNodes[5].innerText.split(' ')[1]
								price = parseInt(price.replace(/,/g,"")) //2300
								
								if(parent_orderArray[i].childNodes[1].innerText == event.target.nextElementSibling.nextElementSibling.innerText){
									let count = parseInt(parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText)
									parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText= count +1
									count = parseInt(parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText)
									parent_orderArray[i].childNodes[5].innerText = '￦ ' + (price + (price / (count -1))).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
									break;
								}
								else {
									if(i==(parent_orderArray.length-1)) {
										imageOrderDom(event)
										break
									}
								}
							}
						}
						totalfunction1(event)
				}
			})
		})
}

function getdrinkDom(json) {
	let tag = ``
	let i = 0
	let namearr
	let imgarr
	let priarr
	showContainTag1 = `<div class="show-contain">`
	showContainTag2= `</div>`
	let naar = new Array();
	let iaar = new Array();
	let paar = new Array();
	json.forEach(dto =>{
		if(dto.drink_name.includes(" // ")) {
			narr = dto.drink_name.split(" // ")
			narr.forEach(e=>{
				if(e != 'null') {
					naar.push(e)
			    }
			})
		}
		else {
			naar.push(dto.drink_name)
		}
		if(dto.drink_img.includes(" // ")) {
			iarr = dto.drink_img.split(" // ")
			iarr.forEach(e=>{
				if(e != 'null') {
					iaar.push(e)
			    }
			})
		}
		else {
			iaar.push(dto.drink_img)
		}
		if(dto.drink_price.includes(" // ")) {
			parr = dto.drink_price.split(" // ")
			parr.forEach(e=>{
				if(e != 'null') {
					paar.push(e)
			    }
			})
		}
		else {
			paar.push(dto.drink_price)
		}
	})
	
	for(let j = 0; j<naar.length; j++) {
		if(i==0 || i%8==0) tag += showContainTag1 
			tag +=	 `<div class="menu-border">`
			tag +=		`<img class="imageOrderBtn" src="${iaar[j]}">`
			tag +=		`<div style="color: #44900c; font-size: 14px;">￦ ${paar[j].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</div>`
			tag +=		`<span style="color: #3d3d3d; font-size: 14px;">${naar[j]}</span>`
			tag +=	 `</div>`
			i++
		if(i==0 || i%8==0) tag += showContainTag2
	}
	check = 0
	showFrame.style.transform='translateX('+0+'px)';
	return tag
}

function dessertImageHandler() {
	const url = cpath + '/dessert'
	const opt = {
			method: 'GET'
	}
	fetch(url,opt)
	.then(resp=>resp.json())
	.then(json => {
				render(showFrame,getdessertDom(json))
				const imageOrderBtn = document.querySelectorAll('.imageOrderBtn')
				imageOrderBtn.forEach(arr=>{
					arr.onclick=function(event) {
						let parent_orderArray=parent_order.childNodes
						if(parent_orderArray.length == 0) imageOrderDom(event)
						else { //상품리스트가 하나라도 있으면
							for(let i = 0; i<parent_orderArray.length; i++) {
								let price = parent_orderArray[i].childNodes[5].innerText.split(' ')[1]
								price = parseInt(price.replace(/,/g,"")) //2300
								
								if(parent_orderArray[i].childNodes[1].innerText == event.target.nextElementSibling.nextElementSibling.innerText){
									let count = parseInt(parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText)
									parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText= count +1
									count = parseInt(parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText)
									parent_orderArray[i].childNodes[5].innerText = '￦ ' + (price + (price / (count -1))).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
									break;
								}
								else {
									if(i==(parent_orderArray.length-1)) {
										imageOrderDom(event)
										break
									}
								}
							}
						}
						totalfunction1(event)
				}
			})
		})
}

function getdessertDom(json) {
	let tag = ``
	let i = 0
	showContainTag1 = `<div class="show-contain">`
	showContainTag2= `</div>`
	json.forEach(dto =>{
		flag = dto.dessert_image != 'null'
		if(i==0 || i%8==0 && flag) tag += showContainTag1 
		if(dto.dessert_image != 'null' ) {
			tag +=	 `<div class="menu-border">`
			tag +=		`<img class="imageOrderBtn" src="${dto.dessert_img}">`
			tag +=		`<div style="color: #44900c; font-size: 14px;">￦ ${dto.dessert_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</div>`
			tag +=		`<span style="color: #3d3d3d; font-size: 14px;">${dto.dessert_name}</span>`
			tag +=	 `</div>`
			i++
		}
		if(i==0 || i%8==0 && flag) tag += showContainTag2
	})
	check = 0
	showFrame.style.transform='translateX('+0+'px)';
	return tag
}

//맥카페
function mcafeImageHandler() {
	const url = cpath + '/mcafe'
	const opt = {
			method: 'GET'
	}
	fetch(url,opt)
	.then(resp=>resp.json())
	.then(json => {
				render(showFrame,getmcafeDom(json))
				const imageOrderBtn = document.querySelectorAll('.imageOrderBtn')
				imageOrderBtn.forEach(arr=>{
					arr.onclick=function(event) {
						let parent_orderArray=parent_order.childNodes
						if(parent_orderArray.length == 0) imageOrderDom(event)
						else { //상품리스트가 하나라도 있으면
							for(let i = 0; i<parent_orderArray.length; i++) {
								let price = parent_orderArray[i].childNodes[5].innerText.split(' ')[1]
								price = parseInt(price.replace(/,/g,"")) //2300
								
								if(parent_orderArray[i].childNodes[1].innerText == event.target.nextElementSibling.nextElementSibling.innerText){
									let count = parseInt(parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText)
									parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText= count +1
									count = parseInt(parent_orderArray[i].childNodes[1].nextElementSibling.nextElementSibling.innerText)
									parent_orderArray[i].childNodes[5].innerText = '￦ ' + (price + (price / (count -1))).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
									break;
								}
								else {
									if(i==(parent_orderArray.length-1)) {
										imageOrderDom(event)
										break
									}
								}
							}
						}
						totalfunction1(event)
				}
			})
		})
}

function getmcafeDom(json) {
	let tag = ``
	let i = 0
	let namearr
	let imgarr
	let priarr
	showContainTag1 = `<div class="show-contain">`
	showContainTag2= `</div>`
	let naar = new Array();
	let iaar = new Array();
	let paar = new Array();
	json.forEach(dto =>{
		if(dto.mccafe_name.includes(" // ")) {
			narr = dto.mccafe_name.split(" // ")
			narr.forEach(e=>{
				if(e != 'null') {
					naar.push(e)
			    }
			})
		}
		else {
			naar.push(dto.mccafe_name)
		}
		if(dto.mccafe_img.includes(" // ")) {
			iarr = dto.mccafe_img.split(" // ")
			iarr.forEach(e=>{
				if(e != 'null') {
					iaar.push(e)
			    }
			})
		}
		else {
			iaar.push(dto.mccafe_img)
		}
		if(dto.mccafe_price.includes(" // ")) {
			parr = dto.mccafe_price.split(" // ")
			parr.forEach(e=>{
				if(e != 'null') {
					paar.push(e)
			    }
			})
		}
		else {
			paar.push(dto.mccafe_price)
		}
	})
	console.log(naar)
	console.log(paar)
	for(let j = 0; j<naar.length; j++) {
		if(i==0 || i%8==0) tag += showContainTag1 
			tag +=	 `<div class="menu-border">`
			tag +=		`<img class="imageOrderBtn" src="${iaar[j]}">`
			tag +=		`<div style="color: #44900c; font-size: 14px;">￦ ${paar[j].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</div>`
			tag +=		`<span style="color: #3d3d3d; font-size: 14px;">${naar[j]}</span>`
			tag +=	 `</div>`
			i++
		if(i==0 || i%8==0) tag += showContainTag2
	}
	check = 0
	showFrame.style.transform='translateX('+0+'px)';
	return tag
}


function render(target, dom) {
	target.innerHTML = dom
	const showContainCount = document.getElementsByClassName('show-contain').length
	showFrame.style.width=showContainCount*1200+'px'
	envShowContainCount = showContainCount //전역변수화
	
}
