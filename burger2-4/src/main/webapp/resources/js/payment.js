
function paymentHandler(event) {
//	const clientcomment = clientrqform.value
	let menuArr = []
	let ob = {}
	let dbob = {}
	let paymenuname = ''
	let paycount
	let menuname = ''
	let price = ''
	let gubun = ' // '
	let total = payment.innerHTML.split(" ")[0]
	let parent_orderArray = parent_order.childNodes
	let count = parseInt(parent_orderArray[0].childNodes[3].innerText) //상품개수
	//몇개 외 몇개 주문을 위한 조건문
	let totalcount = parseInt(productcount1.innerText)
	console.log(count)
	if(count == 1) {  //1개 외 ~
		paycount = totalcount - 1
	}
	else {  // x개 외 totalcount - x 개
		paycount = totalcount - count
	}
//	console.log(clientcomment)
	//주문목록의 메뉴이름, 가격을  ' // ' 구분자로 가져와서 문자열에 저장
	for(let i = 0; i<parent_orderArray.length; i++) {
		if(i == parent_orderArray.length-1) {
			menuname += parent_orderArray[i].childNodes[1].innerText
			price += parent_orderArray[i].childNodes[5].innerText
		}
		else { 
			menuname += parent_orderArray[i].childNodes[1].innerText + gubun
			price += parent_orderArray[i].childNodes[5].innerText + gubun
		}
	}
	
	//위에서 저장한 메뉴가 1개냐 2개이상이냐
	menuArr = menuname.split(" // ") 
	if(menuArr.length == 1) { //menuname이 1개 일때는
		paymenuname = menuArr[0] + count + ' 개'
	}
	else {
		paymenuname = menuArr[0] + count + ' 개 외 ' + paycount + ' 개'
	}
	ob = {
			'menuname' : paymenuname,
			'total' : total,
	}
	
	dbob = {
			'menus' : menuname,
			'price' : price,
			'count' : totalcount,
			'total' : total,
			'orderstatus' : 'y',
			'paystatus' : 'n',
			'userid' : userid,
			'orderaddress' : address,
			'phone' : phone,
			'requirement' : $('.clientrqform').val()
	}
	
	console.log(dbob)
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp39136694'); 
	
	IMP.request_pay({
		pg: 'kakao',
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime(),
		/* 
		 *  merchant_uid에 경우 
		 *  https://docs.iamport.kr/implementation/payment
		 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		 */
		name: ob.menuname,
		// 결제창에서 보여질 이름
		// name: '주문명 : ${auction.a_title}',
		// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
		amount: ob.total,
		// amount: ${bid.b_bid},
		// 가격 
		buyer_name: '판매자',
		// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
		// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
		buyer_postcode: '123-456',
		}, function (rsp) {		// callback함수
			console.log(rsp);
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '결제 금액 : ' + rsp.paid_amount;
			// success.submit();
			// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
			// 자세한 설명은 구글링으로 보시는게 좋습니다.
			const url = cpath + '/payment'
			dbob.paystatus = 'y'
			const opt = {
					method: 'POST',
					body: JSON.stringify(dbob),
					headers: {
						'Content-Type': 'application/json; charset=utf-8'
					}
			}
			fetch(url,opt)
			.then(resp=>resp.text())
			.then(text=> {
				alert(msg)
			})
			location.href = cpath + '/myPage'
			
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			const url = cpath + '/payment'
			const opt = {
					method: 'POST',
					body: JSON.stringify(dbob),
					headers: {
						'Content-Type': 'application/json; charset=utf-8'
					}
			}
			fetch(url,opt)
			.then(resp=>resp.text())
			.then(text=> {
				console.log(text)
			})
		}
		alert(msg);
	});
}

function clientcomment(event) {
	console.log('dd')
}
