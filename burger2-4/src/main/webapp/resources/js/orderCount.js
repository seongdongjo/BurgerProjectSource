function countHandler(event) {  // event는  + , - 버튼
            const getOperation = event.target.innerHTML
            const child_orders=event.target.parentElement
            let getCount;
            
            //가격계산을 위한 변수
            let children = child_orders.childNodes
            let vargetprice = children[5].innerText.split(' ')[1]  //2,300
            vargetprice = parseInt(vargetprice.replace(/,/g,"")) 
            let total

            // 2 , 2300 + 2300    2-1 
            // 3 , 4600 + 2300    3-1
            // 4 , 6900 + 2300    4-1
            // 5 , 9200 + 2300    5-1
            
            //const spanmenupriceList = document.querySelectorAll('.spanmenuprice')
            
            if(getOperation == '+') {
                getCount = event.target.nextElementSibling.innerHTML
                getCount = parseInt(getCount) + 1;
                event.target.nextElementSibling.innerHTML = getCount
                for(let i=getCount-1; i<getCount; i++) {
                	if(i == 1) {
                		
                		total = vargetprice + vargetprice
                		
                	}
                	else {
                		total = vargetprice + (vargetprice / i)
                	}
                }
                if(getCount >= 1) {
                	children[5].innerHTML = '￦ ' + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                	totalfunction2()
                }
                
            }
            
            
            //1이되면 4600 - 2300  1+1
            //2가되면 6900 - 2300  2+1
            
            else {  // '-'를 클릭할 때
            	let total = 0
                getCount = event.target.previousElementSibling.innerHTML
                getCount = parseInt(getCount) - 1;
               	const minusprice = -(vargetprice/(getCount+1)) // -하나가격
                
                	event.target.previousElementSibling.innerHTML = getCount
                	let alltotal = 0
                	if(getCount <= 0 && parent_order.childNodes.length == 0) {
                		 deleteHandler(event)
                		 selectproductcount0()
                	}
               		//getCount <= 0인경우 (주문목록은 있는상태면서)
                	else if(getCount <= 0 && parent_order.childNodes.length != 0) {
                		console.log('이거는되지')
                		total = vargetprice - (vargetprice / (getCount + 1))
                		parent_order.childNodes.forEach(dto=> {
	                		let getprice = dto.childNodes[5].innerHTML.split(' ')[1]
	                		getprice = parseInt(getprice.replace(/,/g,""))
	                		alltotal += getprice
                		})
                		deleteHandler(event)
                		selectproductcount0()
                		totalfunction2()
                	}
                	else{
                     	total = vargetprice - (vargetprice / (getCount + 1)) //minusprice대입가능
                     	children[5].innerHTML = '￦ ' + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                     	let alltotal = 0
                     	parent_order.childNodes.forEach(dto=> {
                     		let getprice = dto.childNodes[5].innerHTML.split(' ')[1]
                     		getprice = parseInt(getprice.replace(/,/g,""))
                     		alltotal += getprice
                     	})
                     	console.log('제발: ' + alltotal)
                     	totalfunction3(alltotal)
                }
                
            }
}
            //console.log(total)

function imageOrderDom(event) {
	const imageOrderBtn = document.querySelectorAll('.imageOrderBtn')
    const div = document.createElement('div')
    div.classList.add('child_order')

    const menuname = document.createElement('div')
    menuname.classList.add('menuname')
    menuname.innerText= event.target.nextElementSibling.nextElementSibling.innerText

    const deleteButton = document.createElement('button')
    deleteButton.innerHTML="x"
    deleteButton.classList.add('deleteBtn')

    const plusButton = document.createElement('button')
    plusButton.classList.add('addminusBtn')
    //plusButton.classList.add('plusBtn')
    plusButton.innerHTML="+"

    const span = document.createElement('span')
    span.classList.add('orderCount')
    span.innerHTML="1"

    const minusButton = document.createElement('button')
    minusButton.classList.add('addminusBtn')
    //minusButton.classList.add('minusBtn')
    minusButton.innerHTML="-"
    
    const spanmenuprice = document.createElement('span')
    spanmenuprice.classList.add('spanmenuprice')
    spanmenuprice.innerText= event.target.nextElementSibling.innerText
    
    	
    	
    div.appendChild(deleteButton)
    div.appendChild(menuname)
    div.appendChild(plusButton)
    div.appendChild(span)
    div.appendChild(minusButton)
    div.appendChild(spanmenuprice)
    
    parent_order.appendChild(div)
    
    //console.log(parent_order.scrollHeight)
	parent_order.scroll({top: parent_order.scrollHeight, behavior: `smooth`})
}

function modalImageOrderDom(price,count,name) {
	const imageOrderBtn = document.querySelectorAll('.imageOrderBtn')
    const div = document.createElement('div')
    div.classList.add('child_order')

    const menuname = document.createElement('div')
    menuname.classList.add('menuname')
    menuname.innerText= name

    const deleteButton = document.createElement('button')
    deleteButton.innerHTML="x"
    deleteButton.classList.add('deleteBtn')

    const plusButton = document.createElement('button')
    plusButton.classList.add('addminusBtn')
    //plusButton.classList.add('plusBtn')
    plusButton.innerHTML="+"

    const span = document.createElement('span')
    span.classList.add('orderCount')
    span.innerHTML=count

    const minusButton = document.createElement('button')
    minusButton.classList.add('addminusBtn')
    //minusButton.classList.add('minusBtn')
    minusButton.innerHTML="-"
    
    const spanmenuprice = document.createElement('span')
    spanmenuprice.classList.add('spanmenuprice')
    spanmenuprice.innerText= price
    
    	
    	
    div.appendChild(deleteButton)
    div.appendChild(menuname)
    div.appendChild(plusButton)
    div.appendChild(span)
    div.appendChild(minusButton)
    div.appendChild(spanmenuprice)
    
    parent_order.appendChild(div)
    
    //console.log(parent_order.scrollHeight)
	parent_order.scroll({top: parent_order.scrollHeight, behavior: `smooth`})
}
function deleteHandler(event) {  //주문목록에서 x 버튼을 눌렀을 때
        const parent_order = event.target.parentElement.parentElement
        const child_orders = event.target.parentElement
        let children = child_orders.childNodes
        let vargetprice = children[5].innerText.split(' ')[1]  //2,300
        vargetprice = parseInt(vargetprice.replace(/,/g,""))
        totalfunction3(-vargetprice)   //지우기전에 -2300을 해준다.
        parent_order.removeChild(child_orders)
        
       
        totalfunction2()  //결제 가격과, 선택한상품 호출
}
