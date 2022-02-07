<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	//모달
	const searchIcon = document.querySelector('.search-icon')
	const closeModal = document.getElementById('closeModal')
	const overlay = document.querySelector('.overlay')
	const modal = document.querySelector('.modal')
	
	
	// 모달 함수
	searchIcon.addEventListener('click', function(){
		modalOpen()
	})
	
	closeModal.addEventListener('click', function(){
		modalClose()
	})
</script>
