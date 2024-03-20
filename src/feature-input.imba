import {persistData, loadData, clearData} from './persist.imba'

tag feature-input

	prop done= false
	prop inputValue=''
	prop areaValue=''
	prop features = loadData()
	prop currentMonthFeaturesCount= 0
	prop currentMonth= new Date().getMonth()
	prop maxFeaturesReachedMessage = ''
	
	# input-request
	css	
		.container-input bgc: $tiger6 p: 40px m:30px rd:15px d:flex fld:column jac:center ai:center
		.button-input bgc: $tiger2 bgc@hover: $tiger2 p:10px m:10px rd:15px c:$tok-bool scale@hover:1.15 bd:none ml:1em fs:1.2rem mt:1em
		.input-change w: 80% h: 50px ta: center fs: 1.75rem bd: none rd: 15px d: flex jac:center 
		.input-change-area w: 80% min-width:80% max-width: 80% ta: center fs: 1.2rem bd: none mt: 1em pt: 1em rd: 15px d: flex jac: center	
		.feature-request-button width:80% m:2em ml:12em p:2em bgc:$tiger5 bgc@hover:orange5 scale@hover:110% color:$tok-bool rd:15px fw:700 bd:none fs@hover:.87rem
		.max-features-reached color:red mt:1em ta:center
		
		.clear-btn-div ta:center m:0 auto
		.clear-btn bgc:$tiger2 bgc@hover:$tiger2 p:10px m:10px rd:15px c:$tok-bool scale@hover:115%  bd:none ml:1em fs:1.2rem

	# feature-container
	css .container-feature bgc:$tiger4 p:50px m:30px rd:20px c:$tok-bool fw:600 width:85%
		shadow:0 5px 15px black/50 scale@hover:105% transition:transform 0.25s ease-in-out
		button float:right  m:12px mx:8px w:5em h:2em fs:1em d:flex jac:center pt:0.17em rd:1em bgc:warm3 bgc@hover:cool5 c@hover:white bd:none
		.vote-buttons pb:1em 
		.vote-btn-like, .vote-btn-dislike pt:5px
		.feature-input-value fs:1.25em
		.feature-area-value c: $indigo-color

	# media-queries	
	css 
		body@!500 of:scroll
		.input-change@!500 p:5px fs:0.9em
		.input-change-area@!500 pb:1em fs:1.2em
		.feature-request-button@!500 ml:3em fs:0.9em
		.container-feature@!500 w:65% lh:1.6 ml:1.1em

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
		# console.log(features)
		
		

	def handleTextChange e
		inputValue = e.target.value

	def handleAreaTextChange e
		areaValue = e.target.value
		
	def handleClearData
		if window.confirm("Are you sure you want to clear local storage data? This action cannot be undone.")
			clearData()
			features=[]
			persist()
		else
			return


	
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
		<div.div-frt-btn>
			<button.feature-request-button @click=handleClick> done ? "Close❌" : "Request a Feature"
		if done
				<form.container-input @submit.prevent=handleSubmit>
					<input.input-change type="text" required maxLength="50" @change=handleTextChange bind=inputValue value=inputValue  placeholder="Enter the feature in 50 characters..">
					<textarea.input-change-area required maxLength="150" @change=handleAreaTextChange bind=areaValue value=areaValue placeholder="Enter the details in 150 characters..">
					<div.submit-btn-div>
						<button.button-input> "Submit"
					<div.max-features-reached> maxFeaturesReachedMessage
		else 
			null
		sortByCountLike()
		for feature in features
			<div.container-feature>
				<details>
					<summary.feature-input-value> feature.inputValue
					<p.feature-area-value> feature.areaValue
				<div.vote-buttons>
						<button.vote-btn-like  @click=countDislikeIncrease(feature)> "{feature.countDislike} ⛔"
						<button.vote-btn-dislike  @click=countLikeIncrease(feature)> "{feature.countLike} 👍"
		<div.clear-btn-div>
			<button.clear-btn @click=handleClearData> "Clear Local Storage Data"