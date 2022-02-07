function storeAjax(ob){
	const url = cpath + '/storeCate'
	const opt = {
		method : 'post',
		body : JSON.stringify(ob),
		headers : {
			'Content-Type': 'application/json; charset=utf-8'
		}
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
		console.log(json.list)
		
//		let dom1 = ''
//		let dom2 = ''
//		let dom3 = ''
//		let dom4 = ''
//		
//		let pagingDom1 = ''
//		let pagingDom2 = ''
//		let pagingDom3 = ''
		
//		var geocoder = new kakao.maps.services.Geocoder();
	
//		json.list.forEach(dto => {
		
//			// 주소로 좌표를 검색합니다
//			geocoder.addressSearch(dto.STORE_ADDRESS, function(result, status) {
//
//			    // 정상적으로 검색이 완료됐으면 
//			     if (status === kakao.maps.services.Status.OK) {
//
//			        let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
//					
//			        // 추출한 좌표를 통해 도로면 주소 추출
//			        
//			        let lat = result[0].y;
//			        let lng = result[0].x;
//			        
//			        console.log(lat)
//			        console.log(lng)
//			        getAddr(lat, lng);
//			        
//			        function getAddr(lat, lng){
//			        	let geocoder = new kakao.maps.services.Geocoder();
//			        	
//			        	let coord = new kakao.maps.LatLng(lat, lng);
//			        	let callback = function(result,status){
//			        		if(status === kakao.maps.services.Status.OK){
//			        			// 추출한 도로명 주소를 해당 input의 value값으로 적용
////		 	        			addressValue(result[0].road_address.address_name);
//// 			        			$('#address').val(result[0].road_address.address_name)
//			        		}
//			        	}
//			        	geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
//			        }
//			        
//			        
//			        // 결과값으로 받은 위치를 마커로 표시합니다
//			        let marker = new kakao.maps.Marker({
//			            map: map,
//			            position: coords
//			        })
//
//			        // 인포윈도우로 장소에 대한 설명을 표시합니다
//			        let infowindow = new kakao.maps.InfoWindow({
//			            content: '<div style="width:150px;text-align:center;padding:6px 0;"> ' + dto.STORE_NAME +'</div>'
//			        })
//			        infowindow.open(map, marker);
//
//			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
//			        map.setCenter(coords)
//			    } 
//			})
//			
			
			
//			dom1 += '<div>' + dto.STORE_NAME + ' / ' + dto.STORE_ADDRESS +'</div>'
//			dom2 += '<div>' + dto.STORE_TEL + '</div>'
//			dom3 += '<div>' + dto.STORE_OPENING_HOURS + '</div>'
//			dom4 += '<div>'
//			dom4 +=  dto.DECAFFEINE == 'y' ? '디카페인 커피<br>' : '' 
//			dom4 +=  dto.HOURS24 == 'y' ? '24시간<br>' : ''
//			dom4 +=  dto.MCDELIVERY == 'y' ? '맥딜리버리<br>' : ''
//			dom4 +=  dto.MCMORNING == 'y' ? '맥모닝<br>' : ''
//			dom4 +=  dto.PARKING == 'y' ? '주차<br>' : ''
//			dom4 +=  dto.MCDRIVE == 'y' ? '맥드라이브<br> ' : ''
//			dom4 += '</div>'
//			
//			
//		})
//		
//		
//		if(json.prev == true){
//			pagingDom1 += '<button>' + '이전' + '</button>'
//		}
//		else{
//			pagingDom1 += ''
//		}
//		
//		for(let i = json.begin; i <= json.end; i++){
//			pagingDom2 += '<button class="c-Btn" data-page="'+ i +'">' + i + '</button>'
//		}
//		
//		if(json.next == true){
//			pagingDom3 += '<button>' + '다음' + '</button>'
//		}
//		else{
//			pagingDom3 += ''
//		}
//		
//		addressName.innerHTML = ''
//		addressName.innerHTML += dom1
//		
//		storeTel.innerHTML = ''
//		storeTel.innerHTML += dom2
//	
//		storeOpen.innerHTML = ''
//		storeOpen.innerHTML += dom3
//		
//		storeService.innerHTML = ''
//		storeService.innerHTML += dom4
////			storeResult.innerHTML += dom
//		
//		storePaging.innerHTML = ''
//		storePaging.innerHTML += pagingDom1
//		storePaging.innerHTML += pagingDom2
//		storePaging.innerHTML += pagingDom3
//		
	})
}