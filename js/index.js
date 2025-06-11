

/*
loteria

8*/

function createLottery() {
    let numbersArray = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    let lotteryArray = [...numbersArray];

    for (let index = lotteryArray.length - 1; index > 0; index--) {
        const j = Math.floor(Math.random() * (index + 1));
        [lotteryArray[index], lotteryArray[j]] = [lotteryArray[j], lotteryArray[index]];
    }
    return function makeArrayArrangement() {
        let array = [];
        for (let i = 0; i < lotteryArray.length - 1; i++) {
            array.push(lotteryArray[i])
        }
        return array;
    }
}




let lottery = createLottery();
// console.log(lottery());

function setDivsTextContent() {
    for (let i = 0; i < lottery().length; i++) {
        const div = document.querySelector(`.number${i+1}`);
        div.textContent = lottery()[i];
    }

};
setDivsTextContent();