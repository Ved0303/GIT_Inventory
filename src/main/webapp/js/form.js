
		function validateValue(fieldObj, fieldName) {
			let x = fieldObj.value;
			if (x == "") {
				alert(fieldName + " must be filled out");
				fieldObj.focus();
				return -1;
			}
			return 1;
		};

		function validateDecimalNumber(fieldObj, fieldName) {

			var decimal = fieldObj.value;

			var isValidated = ((decimal - 0) == decimal && (('' + decimal).trim().length > 0) && decimal > 0);

			if (isValidated) {
				return 1;
			} else {
				alert(fieldName + " must be a Decimal number");
				fieldObj.focus();
				return -1;
			}
		};
		
		function validateNumber(n) {

			var isValidated = ((n - 0) == n && ((n).trim().length > 0) && n > 0);
			//alert("validateNumber :" +isValidated);
			return isValidated;
		};


		function isCommon(arr1, arr2) {
			for (let i = 0; i < arr1.length; i++) {
				for (let j = 0; j < arr2.length; j++) {
					if (arr1[i] == arr2[j] && arr1[i] != " ") {
						return true;
					}
				}
			}
			return false;
		};
		

		function isInRange(arr1, start,end) {
			var nStart=parseInt(start);
			var nEnd=parseInt(end);

			for (let i = 0; i < arr1.length; i++) {
			//alert( arr1[i]);
			if( ! validateNumber(arr1[i]) ){
				alert("Not a Number :" +arr1[i]);
						return false;					
			}
			var n=parseInt(arr1[i]);
			
			if (n <nStart || n > nEnd) {
						alert("out of Range :" +n);
						return false;					
				}
			}
			return true;		
		};

