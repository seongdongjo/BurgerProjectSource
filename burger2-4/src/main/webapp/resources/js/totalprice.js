function totalfunction1(event) {  //counter에는 가격이들어간다. 2300, -2300 등
	let priceArr = []
	let total = 0
	console.log(event.target.nextElementSibling.innerHTML.split(' ')[1])
	let oneprice = event.target.nextElementSibling
	oneprice = parseInt(oneprice.innerHTML.split(' ')[1].replace(/,/g,"")) //2300
	console.log(oneprice)
	parent_order.childNodes.forEach(dto=> {
		let count = dto.childNodes[3].innerText
		let getprice = dto.childNodes[5].innerHTML.split(' ')[1]
		getprice = parseInt(getprice.replace(/,/g,""))
		total += getprice
	})
	getTotalPriceDom(total)
	selectproductcount()
}

function totalfunction2() {
	let total = 0
	parent_order.childNodes.forEach(dto=> {
		let count = dto.childNodes[3].innerText
		let getprice = dto.childNodes[5].innerHTML.split(' ')[1]
		getprice = parseInt(getprice.replace(/,/g,""))
		total += getprice
	})
	getTotalPriceDom(total)
	console.log('총합: ' + total)
	selectproductcount()
}

function totalfunction3(total) {  // '-' 를 클릭했을 때 음수가격을 받는다 
	console.log('alltotal: ' + total)
	getTotalPriceDom(total)
	selectproductcount(total)
}

function getTotalPriceDom(total) {
	console.log(total+'원')
	if(total <= 0) {
		 payment.innerHTML = ''
		 payment.innerHTML = "결제하기"
	}
	else {
		payment.innerHTML = ''
		payment.innerHTML = total + ' 원 결제하기'
	}
}

function deleteallHandler(event) {  //전체삭제 버튼
	productcount1.innerHTML = ''
	productcount1.innerHTML = 0	
	
	parent_order.innerHTML = ''
		
	payment.innerHTML = ''
	payment.innerHTML = "결제하기"
}

function selectproductcount(total) {  //totalfunction에서 넘어온 total
	let counthap = 0
	console.log('selectproduect: ' + total)
	if(parent_order.childNodes.length == 0) {
		 selectproductcount0()
	}
	parent_order.childNodes.forEach(dto=> {
		let count = parseInt(dto.childNodes[3].innerText)
		counthap += count
		let getprice = dto.childNodes[5].innerHTML.split(' ')[1]
		getprice = getprice.replace(/,/g,"")
		productcount1.innerHTML = ''   //선택한 상품 개수 넣기
		productcount1.innerHTML = counthap
	})
}

function selectproductcount0(total) {
	productcount1.innerHTML = ''
	productcount1.innerHTML = 0
}


