function repeatStringNumTimes(str, num) {
    var repeatStr = '';
    for (var i = 0; i < num; i++) {
        repeatStr += str;
    }
    return repeatStr;
}
console.log(repeatStringNumTimes("abc", 3));
