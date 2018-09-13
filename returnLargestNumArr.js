function largestOfFour(arr) {
    var largestArr = [];
    for (var i = 0 ; i < arr.length; i++) {
        largestArr.push(arr[i].sort(function(a, b){return a - b})[arr[i].length - 1]);
    }
    return largestArr;
}
console.log(largestOfFour([[13, 27, 18, 26], [4, 5, 1, 3], [32, 35, 37, 39], [1000, 1001, 857, 1]]));