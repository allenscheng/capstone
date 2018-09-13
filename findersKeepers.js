function findElement(arr, func) {
    let num;
    for (var i = 0; i < arr.length; i++) {
        if (func(arr[i])) {
            num = arr[i];
            break;
        }
    }
    return num;
}
console.log(findElement([1, 2, 3, 4], num => num % 2 === 0));