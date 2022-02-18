/*function btnOpenHandler(){
	let classList = document.querySelector('.detailinfo').classList; 
	
	if(classList.contains('main-inner')){
		classList.remove('main-inner')
		classList.add('main-inner1')
		menuOpen.classList.add('hidden')
		menuClose.classList.remove('hidden')
	}
}

function btn1Handler(){
	let classList = document.querySelector('.detailinfo').classList;
	
	if(classList.contains('main-inner1')){
		classList.remove('main-inner1')
		classList.add('main-inner')
		menuOpen.classList.remove('hidden')
		menuClose.classList.add('hidden')
	}
}
*/
function modalOpen(){
	modal.classList.remove('hidden')
	searchIcon.classList.add('hidden')
}

function modalClose(){
	modal.classList.add('hidden')
	searchIcon.classList.remove('hidden')
}

/*function move() {
	const slide = document.querySelector('.slide')
	value -= unit

	if (value <= -11900) {
		value = 0
	}
	slide.style.marginLeft = value + 'px'
}*/

//function setMoveInterval(){
//	setInterval(move, 7000)
//}

/*function ajaxPromotion(){
	const url = cpath + '/ajaxPromotion'
	const opt = {
		method : 'get'
	}
	fetch(url,opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
	
	mainInner.innerHTML += getPromDom(json)
})
}

function getPromDom(json){
	let dom = ''
			json.forEach(dto => {
				dom += '<div class="main-inner-event">'
				dom += '<img src="'+ dto.promotion_img +'">'
				dom += '</div>'
		})
	return dom
}
*/
// 버튼을 누르면 이동
function btnSlider(){ //page-btns밑에 div들 클릭 시 발동하는 함수
	const $this = $(this)
    let index = $this.index()
    
    $this.addClass('active')
    $this.siblings('.active').removeClass('active') //형제노드에서 클래스가 active인것을 가져와서 active를 제거
    
    let slider = $this.parent().parent() //main-slide로(section)
    
    let current = slider.find('.slide > div.active')
    
    let post = slider.find('.slide > div').eq(index)
    
    current.removeClass('active')
    post.addClass('active')
}

// 계속 오른쪽 버튼을 클릭하는거랑 동일하게 진행
function slider(){ //side-btns밑에 div(left,right)클릭 시 발동하는 함수
	const $this = $(this)
    let slider = $this.closest('.main-slide') //부모인 .main-slide하나만 찾는다.
    
    let index = $this.index()
    let isLeft = index == 0
    
    let current = slider.find('.page-btns > div.active')
    let post
    
    if ( isLeft ){
        post = current.prev() //이전요소(div class="active"의 이전요소)
    }
    else {
        post = current.next() //다음요소
    }
    
    if ( post.length == 0 ){
        if ( isLeft ){
            post = slider.find('.page-btns > div:last-child')
        }
        else {
            post = slider.find('.page-btns > div:first-child')
        }
    }
    
    post.click()
}

// interval로 움직이는 함수
function setMoveInterval(){
	setInterval(function(){
	    $('.main-slide > .side-btns > div').eq(1).click(); 
	}, 6000)
}