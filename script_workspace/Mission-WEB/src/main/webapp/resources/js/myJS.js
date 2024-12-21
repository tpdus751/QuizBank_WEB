/**
 * Mission-WEB 사이트와 관련된 함수 모음
 */

// Form과 관련되어 공백 체크
let checkBlank = function(tag, msg) {
	if (tag.value == '') {
		alert(msg)
		tag.focus()
		return true
	}
	return false
}