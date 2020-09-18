observer =
	new MutationObserver (mutations) ->
		u_blanks = document.getElementsByClassName('u-blanks')[0]

		return unless u_blanks?
		return if document.getElementsByClassName('word-breakdown-span').length > 0

		words = [0]
		for char in u_blanks.textContent
			if char == ' '
				words.push(0)
			else
				words[words.length - 1]++

		word_breakdown = words.join('/')
		word_breakdown_span =
			document.createElement(
				'span'
			)
		word_breakdown_span.classList.add('word-breakdown-span')
		word_breakdown_span.textContent = " (#{word_breakdown})"
		u_blanks.parentNode.insertBefore(
			word_breakdown_span
			u_blanks.nextSibling
		)
observer.observe(
	document,
	attributes: false
	childList: true
	characterData: false
	subtree: true
)
