function step1Address() {
	 //카카오 지도 발생
    new daum.Postcode({
        oncomplete: function(data) { //선택시 입력값 세팅
            document.getElementById("addressInput").value = data.address; // 주소 넣기
            
            resultAddress.innerText = document.getElementById("addressInput").value
            
            document.getElementById("detailAddressInput").focus(); //상세입력 포커싱
        }
    }).open();
}

function resultAddress() {
	resultAddress.innerText +=  (' ' + $('#detailAddressInput').val())
}