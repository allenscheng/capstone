function titleCase(str) {
    var lowStr = str.toLowerCase().split(' ');
    for (var i = 0; i < lowStr.length; i++) {
        lowStr[i] = lowStr[i].slice(0,1).toUpperCase() + lowStr[i].slice(1);
    }
    return lowStr.join(' ');
} 
console.log(titleCase("I'm a little tea pot"));
