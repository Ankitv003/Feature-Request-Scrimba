import {persistData, loadData, clearData} from './persist.imba'

tag feature-input

	prop done= false
	prop inputValue=''
	prop areaValue=''
	prop features = loadData()
	prop currentMonthFeaturesCount= 0
	prop currentMonth= new Date().getMonth()
	prop maxFeaturesReachedMessage = ''
	
	css	
		.container-input  bgc:$tiger6 p:40px m:30px rd:15px pr:30em pt:3em pb:1em
		.button-input bgc:$tiger2 bgc@hover:$tiger2 p:10px m:10px rd:15px c:$tok-bool scale@hover:115%  bd:none ml:1em fs:1.2rem pos:relative left:36em mt:1em
		.feature-request-button width:80% m:2em ml:12em p:2em bgc:$tiger5 bgc@hover:orange5 scale@hover:110% color:$tok-bool rd:15px fw:700 bd:none
		# display:flex jc:center ai
		&.done d:none
		.input-change width:100% height:50px ta:center fs:1.75rem bd:none rd:15px d:flex jac:center pos:relative left:7em
		.input-change-area width:100%  ta:center fs:1.2rem bd:none mt:1em pt:1em rd:15px d:flex jac:center pos:relative left:10.2em
		.max-features-reached color:red mt:1em ta:center ml:25em

	css .container-feature bgc:$tiger4 p:50px m:30px rd:20px c:$tok-bool fw:600 width:85%
		shadow:0 5px 15px black/50 
		scale@hover:105%
		button float:right  m:12px mx:8px w:5em h:2em fs:1em d:flex jac:center pt:0.17em rd:1em bgc:warm3 bgc@hover:cool5 c@hover:white bd:none
		.vote-buttons pb:1em 

	def persist
		persistData(features)
	def handleClick
		done=!done
	
	def resetFeatures
		features = []
		currentMonthFeaturesCount = 0
		currentMonth = new Date().getMonth()
		maxFeaturesReachedMessage= ''
		persist()


	def handleSubmit
		done= !done
		if currentMonth != new Date().getMonth()
			resetFeatures()
		if currentMonthFeaturesCount < 5
			features.push({inputValue, areaValue, countLike: 0, countDislike: 0})
			inputValue=''
			areaValue=''
			currentMonthFeaturesCount++
			persist()
		else
			maxFeaturesReachedMessage="Maximum features for this month reached."
		console.log(features)
		
		

	def handleTextChange e
		inputValue = e.target.value

	def handleAreaTextChange e
		areaValue = e.target.value
		
	def handleClearData
		clearData()
		features=[]
		persist()

	
	def sortByCountLike
		features.sort do |a, b|
			b.countLike - a.countLike
		end
	end

	def countLikeIncrease feature
		feature.countLike++
		persist()
	def countDislikeIncrease feature
		feature.countDislike++
		persist()


	<self>
		<button.feature-request-button @click=handleClick> done ? "Close❌" : "Request a Feature"
		if done
			<div.container-input>
				<form @submit.prevent=handleSubmit>
					<input.input-change type="text" maxLength="50" @change=handleTextChange value=inputValue required placeholder="Enter the feature in 50 characters..">
					<textarea.input-change-area required maxLength="100" @change=handleAreaTextChange value=areaValue placeholder="Enter the details in 100 characters..">
					<button.button-input> "Submit"
					<div.max-features-reached> maxFeaturesReachedMessage
		else 
			null
		sortByCountLike()
		for feature in features
			<div.container-feature>
				<details>
					<summary> feature.inputValue
					<p> feature.areaValue
				<div.vote-buttons>
						<button  @click=countDislikeIncrease(feature)> "{feature.countDislike} ⛔"
						<button  @click=countLikeIncrease(feature)> "{feature.countLike} 👍"
		<button.button-input @click=clearData> "Clear Data"