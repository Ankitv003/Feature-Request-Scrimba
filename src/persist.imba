const localStorageKey = 'features'
# const localStorageCountKey = 'voteCounts'


export def persistData data
	localStorage.setItem(localStorageKey, JSON.stringify(data))

export def loadData
	const dataString =localStorage.getItem(localStorageKey)
	if dataString
			try
				JSON.parse(dataString)
			catch
				return []
		
	else
		return []


export def clearData
	localStorage.removeItem(localStorageKey)



